package upo.gaborgalazzo.mweb.marketplace.controller;

import upo.gaborgalazzo.mweb.marketplace.domain.Product;
import upo.gaborgalazzo.mweb.marketplace.repository.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;

@WebServlet(name = "ProductController", urlPatterns = {"/products/*"})
public class ProductController extends RouteHttpServlet
{

	@RequestMapping(pattern = "/")
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ProductDAO productDAO = new ProductDAO();

		ArrayList<Product> products = productDAO.getAll();

		request.setAttribute("products", products);


		request.getRequestDispatcher("/WEB-INF/template/page-product-list.jsp").forward(request, response);
	}

	@RequestMapping(pattern = "/{id}")
	public void get(HttpServletRequest request,  HttpServletResponse response, int id) throws IOException
	{

		response.getOutputStream().println(id);
	}
}
