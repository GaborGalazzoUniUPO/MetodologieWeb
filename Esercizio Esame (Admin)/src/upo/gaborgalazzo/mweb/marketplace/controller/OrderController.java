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

		if(order == null)
			request.getRequestDispatcher("/WEB-INF/template/page/error/not-found.jsp").forward(request, response);
		request.setAttribute("order", order);


		request.getRequestDispatcher("/WEB-INF/template/page/order/manage.jsp").forward(request, response);

	}


}
