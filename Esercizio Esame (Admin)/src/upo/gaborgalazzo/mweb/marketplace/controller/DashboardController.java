package upo.gaborgalazzo.mweb.marketplace.controller;

import upo.gaborgalazzo.mweb.marketplace.controller.util.RequestMapping;
import upo.gaborgalazzo.mweb.marketplace.controller.util.RouteHttpServlet;
import upo.gaborgalazzo.mweb.marketplace.functiolanities.NotificationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DashboardController", urlPatterns = {"/dashboard/*"})
public class DashboardController extends RouteHttpServlet
{

	@RequestMapping(pattern = "/")
	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		request.getRequestDispatcher("/WEB-INF/template/page/dashboard/index.jsp").forward(request, response);
	}

	@RequestMapping(pattern = "/testMail")
	public void testMail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		NotificationService.testMail();
	}

}
