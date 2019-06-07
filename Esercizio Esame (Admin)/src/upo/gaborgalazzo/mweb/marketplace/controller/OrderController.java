package upo.gaborgalazzo.mweb.marketplace.controller;

import upo.gaborgalazzo.mweb.marketplace.controller.util.RequestMapping;
import upo.gaborgalazzo.mweb.marketplace.controller.util.RouteHttpServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductController", urlPatterns = {"/orders/*"})
public class OrderController extends RouteHttpServlet
{

	@RequestMapping(pattern = "/")
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

	}
}
