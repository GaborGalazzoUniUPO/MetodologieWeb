package upo.gaborgalazzo.mweb.marketplace.controller;

import upo.gaborgalazzo.mweb.marketplace.controller.util.PathParam;
import upo.gaborgalazzo.mweb.marketplace.controller.util.RequestMapping;
import upo.gaborgalazzo.mweb.marketplace.controller.util.RouteHttpServlet;
import upo.gaborgalazzo.mweb.marketplace.domain.Message;
import upo.gaborgalazzo.mweb.marketplace.domain.Order;
import upo.gaborgalazzo.mweb.marketplace.functiolanities.NotificationService;
import upo.gaborgalazzo.mweb.marketplace.repository.OrderDAO;
import upo.gaborgalazzo.mweb.marketplace.repository.ReportMessageDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "OrderController", urlPatterns = {"/orders/*"})
public class OrderController extends RouteHttpServlet
{

	@RequestMapping(pattern = "/")
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		OrderDAO orderDAO = new OrderDAO();

		request.setAttribute("orders", orderDAO.findAll());


		request.getRequestDispatcher("/WEB-INF/template/page/order/list.jsp").forward(request, response);

	}

	@RequestMapping(pattern = "/{id}/manage/")
	public void manage(HttpServletRequest request, HttpServletResponse response, @PathParam(name = "id") int id) throws ServletException, IOException
	{

		OrderDAO orderDAO = new OrderDAO();

		Order order = orderDAO.findById(id);

		if (order == null)
		{
			request.getRequestDispatcher("/WEB-INF/template/page/error/not-found.jsp").forward(request, response);
			return;
		}


		Map<String, String> errors = new HashMap<String, String>();

		request.setAttribute("order", order);
		request.setAttribute("errors", errors);


		request.getRequestDispatcher("/WEB-INF/template/page/order/manage.jsp").forward(request, response);

	}

	@RequestMapping(pattern = "/{id}/manage/", method = "POST")
	public void edit(HttpServletRequest request, HttpServletResponse response, @PathParam(name = "id") int id) throws ServletException, IOException
	{

		OrderDAO orderDAO = new OrderDAO();

		Order order = orderDAO.findById(id);


		if (order == null)
		{
			request.getRequestDispatcher("/WEB-INF/template/page/error/not-found.jsp").forward(request, response);
			return;
		}

		int oldStatus = order.getStatus();
		int status = Integer.parseInt(request.getParameter("status"));
		if (order.getStatus() != 2 && status == 2)
		{
			order.setDeliveredAt(new Date(Calendar.getInstance().getTime().getTime()));
		}
		order.setStatus(status);
		order.setTrackingCode(request.getParameter("tracking_code"));

		Map<String, String> errors = new HashMap<String, String>();
		try
		{
			order = orderDAO.update(order);
			errors.put("success", "Order updated");
			if(oldStatus == 0 && status == 1){
				NotificationService.orderSent(order);
			} else if (oldStatus == 1 && status == 2){
				NotificationService.orderDelivered(order);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
			errors.put("exception", e.getMessage());
		}

		request.setAttribute("order", order);
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("/WEB-INF/template/page/order/manage.jsp").forward(request, response);

	}

	@RequestMapping(pattern = "/{id}/report/")
	public void report(HttpServletRequest request, HttpServletResponse response, @PathParam(name = "id") int id) throws ServletException, IOException
	{
		OrderDAO orderDAO = new OrderDAO();

		Order order = orderDAO.findById(id);

		if (order == null)
		{
			request.getRequestDispatcher("/WEB-INF/template/page/error/not-found.jsp").forward(request, response);
			return;
		}

		ReportMessageDAO reportMessageDAO = new ReportMessageDAO();
		List<Message> messages = reportMessageDAO.findByOrderId(order.getId());


		request.setAttribute("order", order);
		request.setAttribute("msgs", messages);
		request.getRequestDispatcher("/WEB-INF/template/page/order/report.jsp").forward(request, response);
	}

	@RequestMapping(pattern = "/{id}/report/", method = "POST")
	public void respodeReport(HttpServletRequest request, HttpServletResponse response, @PathParam(name = "id") int id) throws ServletException, IOException
	{
		OrderDAO orderDAO = new OrderDAO();

		Order order = orderDAO.findById(id);

		if (order == null)
		{
			request.getRequestDispatcher("/WEB-INF/template/page/error/not-found.jsp").forward(request, response);
			return;
		}

		Message message = new Message();
		message.setOrderId(order.getId());
		message.setText(request.getParameter("text"));
		ReportMessageDAO reportMessageDAO = new ReportMessageDAO();
		try
		{
			reportMessageDAO.save(message);
			reportMessageDAO.setRead(order.getId());
			NotificationService.reportResponse(order, message);
		} catch (SQLException e)
		{
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/orders/" + order.getId() + "/report/");
	}


}
