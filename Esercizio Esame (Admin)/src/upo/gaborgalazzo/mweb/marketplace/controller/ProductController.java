package upo.gaborgalazzo.mweb.marketplace.controller;

import upo.gaborgalazzo.mweb.marketplace.controller.util.RequestMapping;
import upo.gaborgalazzo.mweb.marketplace.controller.util.RouteHttpServlet;
import upo.gaborgalazzo.mweb.marketplace.domain.Product;
import upo.gaborgalazzo.mweb.marketplace.repository.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ProductController", urlPatterns = {"/product/*"})
public class ProductController extends RouteHttpServlet
{

	@RequestMapping(pattern = "/list")
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ProductDAO productDAO = new ProductDAO();

		ArrayList<Product> products = productDAO.getAll();

		request.setAttribute("products", products);


		request.getRequestDispatcher("/WEB-INF/template/page/product/list.jsp").forward(request, response);
	}

	@RequestMapping(pattern = "/get/{id}")
	public void get(HttpServletRequest request,  HttpServletResponse response, int id) throws IOException
	{

		response.getOutputStream().println(id);
	}

	@RequestMapping(pattern = "/add")
	public void add(HttpServletRequest request,  HttpServletResponse response) throws IOException, ServletException
	{
		request.setAttribute("product", new Product());
		request.getRequestDispatcher("/WEB-INF/template/page/product/add.jsp").forward(request, response);
	}

}
