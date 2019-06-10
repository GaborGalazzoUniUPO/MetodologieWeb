package upo.gaborgalazzo.mweb.marketplace.controller;

import upo.gaborgalazzo.mweb.marketplace.controller.util.PathParam;
import upo.gaborgalazzo.mweb.marketplace.controller.util.RequestMapping;
import upo.gaborgalazzo.mweb.marketplace.controller.util.RouteHttpServlet;
import upo.gaborgalazzo.mweb.marketplace.domain.Order;
import upo.gaborgalazzo.mweb.marketplace.repository.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
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

	@RequestMapping(pattern = "/manage/{id}")
	public void manage(HttpServletRequest request, HttpServletResponse response, @PathParam(name = "id") int id) throws ServletException, IOException
	{

		OrderDAO orderDAO = new OrderDAO();

		Order order = orderDAO.findById(id);

		if(order == null) {
			request.getRequestDispatcher("/WEB-INF/template/page/error/not-found.jsp").forward(request, response);
			return;
		}


		Map<String, String> errors = new HashMap<String, String>();

		request.setAttribute("order", order);
		request.setAttribute("errors", errors);


		request.getRequestDispatcher("/WEB-INF/template/page/order/manage.jsp").forward(request, response);

	}

	@RequestMapping(pattern = "/manage/{id}", method = "POST")
	public void edit(HttpServletRequest request, HttpServletResponse response, @PathParam(name = "id") int id) throws ServletException, IOException
	{

		OrderDAO orderDAO = new OrderDAO();

		Order order = orderDAO.findById(id);


		if(order == null) {
			request.getRequestDispatcher("/WEB-INF/template/page/error/not-found.jsp").forward(request, response);
			return;
		}

		int status = Integer.parseInt(request.getParameter("status"));
		if(order.getStatus() != 2 && status == 2){
			order.setDeliveredAt(new Date(Calendar.getInstance().getTime().getTime()));
		}
		order.setStatus(status);
		order.setTrackingCode(request.getParameter("tracking_code"));

		Map<String, String> errors = new HashMap<String, String>();
		try {
			order = orderDAO.update(order);
			errors.put("success", "Order updated");
		} catch (SQLException e) {
			e.printStackTrace();
			errors.put("exception", e.getMessage());
		}

		request.setAttribute("order", order);
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("/WEB-INF/template/page/order/manage.jsp").forward(request, response);

	}


}
