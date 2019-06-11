package upo.gaborgalazzo.mweb.marketplace.controller;

import upo.gaborgalazzo.mweb.marketplace.controller.util.RequestMapping;
import upo.gaborgalazzo.mweb.marketplace.controller.util.RouteHttpServlet;
import upo.gaborgalazzo.mweb.marketplace.domain.Customer;
import upo.gaborgalazzo.mweb.marketplace.repository.CustomerDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerController", urlPatterns = {"/customers/*"})
public class CustomerController extends RouteHttpServlet
{
	@RequestMapping(pattern = "/")
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		CustomerDAO customerDAO = new CustomerDAO();
		List<Customer> customers = customerDAO.findAll();

		request.setAttribute("customers", customers);

		request.getRequestDispatcher("/WEB-INF/template/page/customer/list.jsp").forward(request, response);
	}
}
