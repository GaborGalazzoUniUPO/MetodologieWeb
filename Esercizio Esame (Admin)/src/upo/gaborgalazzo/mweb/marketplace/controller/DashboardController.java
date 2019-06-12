package upo.gaborgalazzo.mweb.marketplace.controller;

import upo.gaborgalazzo.mweb.marketplace.controller.util.RequestMapping;
import upo.gaborgalazzo.mweb.marketplace.controller.util.RouteHttpServlet;
import upo.gaborgalazzo.mweb.marketplace.domain.Order;
import upo.gaborgalazzo.mweb.marketplace.functiolanities.NotificationService;
import upo.gaborgalazzo.mweb.marketplace.repository.DashboardDAO;
import upo.gaborgalazzo.mweb.marketplace.repository.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DashboardController", urlPatterns = {"/dashboard/*"})
public class DashboardController extends RouteHttpServlet
{

	@RequestMapping(pattern = "/")
	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		OrderDAO orderDAO = new OrderDAO();

		List<Order> toProcess = orderDAO.findAllToPtocess();
		request.setAttribute("toProcess", toProcess);

		List<Order> newReport = orderDAO.findAllNewReport();
		request.setAttribute("newReport", newReport);

		DashboardDAO dashboardDAO = new DashboardDAO();
		request.setAttribute("new_users", dashboardDAO.countNewCutomers());
		request.setAttribute("new_orders", dashboardDAO.countNewOrders());
		request.setAttribute("total_income", dashboardDAO.countTotalRecentIncome());

		request.getRequestDispatcher("/WEB-INF/template/page/dashboard/index.jsp").forward(request, response);
	}

	@RequestMapping(pattern = "/testMail")
	public void testMail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		NotificationService.testMail();
	}

}
