package upo.gaborgalazzo.mweb.marketplace.controller;

import de.ailis.pherialize.MixedArray;
import upo.gaborgalazzo.mweb.marketplace.controller.util.PathParam;
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
import java.util.HashMap;
import java.util.Map;

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

	@RequestMapping(pattern = "/edit/{id}")
	public void edit(HttpServletRequest request,  HttpServletResponse response, @PathParam(name="id") int id) throws IOException, ServletException {

        ProductDAO productDAO = new ProductDAO();

        Product product = productDAO.get(id);

        request.setAttribute("product", product);
        request.setAttribute("errors", product.validate());
        request.getRequestDispatcher("/WEB-INF/template/page/product/add.jsp").forward(request, response);


	}

	@RequestMapping(pattern = "/add")
	public void addForm(HttpServletRequest request,  HttpServletResponse response) throws IOException, ServletException
	{


		request.setAttribute("product", new Product());
		request.setAttribute("errors", new HashMap<>());
		request.getRequestDispatcher("/WEB-INF/template/page/product/add.jsp").forward(request, response);
	}

	@RequestMapping(pattern = "/add", method = "POST")
	public void add(HttpServletRequest request,  HttpServletResponse response) throws IOException, ServletException
	{

		Map<String, String[]> params = request.getParameterMap();

		Product product = new Product();

		product.setCode(request.getParameter("code"));
		product.setDescription(request.getParameter("description"));
		product.setSmallDescription(request.getParameter("small_description"));
		product.setName(request.getParameter("name"));
		product.setUnitPrice(Float.parseFloat(request.getParameter("unit_price")));
		product.setCategory(Integer.parseInt(request.getParameter("category")));
		product.setPhotoUrl(request.getParameter("photo_url"));

		switch (request.getParameter("category")){
			case "1":
			case "2":
				product.setCategoryInfo(parseBook(request));
				break;
			case "3":
			case "4":
				product.setCategoryInfo(parseCD(request));
				break;
			case "5":
				product.setCategoryInfo(parseDVD(request));
				break;
			case "6":
				product.setCategoryInfo(parseVideoGame(request));
				break;
		}

		Map<String, String> errors = product.validate();

		if(errors.size() > 0){

			request.setAttribute("product", product);
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("/WEB-INF/template/page/product/add.jsp").forward(request, response);
		}

		/*
		request.setAttribute("product", new Product());
		request.getRequestDispatcher("/WEB-INF/template/page/product/add.jsp").forward(request, response);
		*/
	}

	private MixedArray parseVideoGame(HttpServletRequest request)
	{
		return null;
	}

	private MixedArray parseDVD(HttpServletRequest request)
	{

		return null;
	}

	private MixedArray parseCD(HttpServletRequest request)
	{
		return null;
	}

	private MixedArray parseBook(HttpServletRequest request)
	{

		MixedArray mixedArray = new MixedArray();
		mixedArray.put("Author", request.getParameter("author"));
		mixedArray.put("Editor", request.getParameter("editor"));
		mixedArray.put("ISBN", request.getParameter("ISBN"));
		mixedArray.put("Print Length", request.getParameter("length"));
		mixedArray.put("Publication year", request.getParameter("pub_year"));
		return mixedArray;
	}

}
