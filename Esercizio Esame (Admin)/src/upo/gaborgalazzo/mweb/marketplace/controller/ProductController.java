package upo.gaborgalazzo.mweb.marketplace.controller;

import upo.gaborgalazzo.mweb.marketplace.domain.Product;
import upo.gaborgalazzo.mweb.marketplace.repository.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ProductController", urlPatterns = {"/products"})
public class ProductController extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{


		ProductDAO productDAO = new ProductDAO();

		ArrayList<Product> products = productDAO.getAll();

		request.setAttribute("products", products);

		request.getRequestDispatcher("WEB-INF/template/page-product-list.jsp").forward(request, response);
	}
}
