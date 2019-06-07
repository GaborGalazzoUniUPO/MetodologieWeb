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
import java.util.*;

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
	public void editForm(HttpServletRequest request,  HttpServletResponse response, @PathParam(name="id") int id) throws IOException, ServletException {

        ProductDAO productDAO = new ProductDAO();

        Product product = productDAO.get(id);


		Map<String, String> errors = product.validate();

        request.setAttribute("product", product);
        request.setAttribute("errors", errors);
        request.getRequestDispatcher("/WEB-INF/template/page/product/form.jsp").forward(request, response);


	}

	@RequestMapping(pattern = "/edit/{id}", method = "POST")
	public void edit(HttpServletRequest request,  HttpServletResponse response, @PathParam(name="id") int id) throws IOException, ServletException {

		ProductDAO productDAO = new ProductDAO();

		Product product = productDAO.get(id);

		Map<String, String> errors = parseProductRequest(product, request);

		if(errors.size() ==  0){
			try
			{
				productDAO.update(product);
				errors.put("success", "Product Updated");
			}catch (Exception e){
				errors.put("exception", e.getMessage());
			}
		}

		request.setAttribute("product", product);
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("/WEB-INF/template/page/product/form.jsp").forward(request, response);


	}

	@RequestMapping(pattern = "/add")
	public void addForm(HttpServletRequest request,  HttpServletResponse response) throws IOException, ServletException
	{


	    Product product = new Product();
	    product.setCategory(Integer.parseInt(request.getParameter("category")));
		request.setAttribute("product", product);
		request.setAttribute("errors", new HashMap<>());
		request.getRequestDispatcher("/WEB-INF/template/page/product/form.jsp").forward(request, response);
	}

	@RequestMapping(pattern = "/add", method = "POST")
	public void add(HttpServletRequest request,  HttpServletResponse response) throws IOException, ServletException
	{

		Product product = new Product();

		Map<String, String> errors = parseProductRequest(product, request);

		if(errors.size() ==  0){

			ProductDAO productDAO = new ProductDAO();
			try
			{
				productDAO.save(product);
				errors.put("success", "Product Added");
			}catch (Exception e){
				errors.put("exception", e.getMessage());
			}
		}

		request.setAttribute("product", product);
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("/WEB-INF/template/page/product/form.jsp").forward(request, response);
	}

	private MixedArray parseVideoGame(HttpServletRequest request)
	{
		MixedArray mixedArray = new MixedArray();
		mixedArray.put("Platform", request.getParameter("platform"));
		mixedArray.put("Publisher", request.getParameter("publisher"));
		mixedArray.put("Publication year", request.getParameter("pub_year"));
		return mixedArray;
	}

	private MixedArray parseDVD(HttpServletRequest request)
	{

		MixedArray mixedArray = new MixedArray();
		mixedArray.put("Director", request.getParameter("director"));
		mixedArray.put("Genre", request.getParameter("genre"));
		mixedArray.put("Publication year", request.getParameter("pub_year"));
		String[] list = request.getParameterValues("actors");
		mixedArray.put("Actors", list!=null?Arrays.asList(list):new ArrayList<>());
		return mixedArray;
	}

	private MixedArray parseCD(HttpServletRequest request)
	{
		MixedArray mixedArray = new MixedArray();
		mixedArray.put("Author", request.getParameter("author"));
		mixedArray.put("Publication year", request.getParameter("pub_year"));
		String[] list = request.getParameterValues("tracks");
		mixedArray.put("Tracks", list!=null?Arrays.asList(list):new ArrayList<>());
		return mixedArray;
	}

	private MixedArray parseBook(HttpServletRequest request)
	{

		MixedArray mixedArray = new MixedArray();
		mixedArray.put("Author", request.getParameter("author"));
		mixedArray.put("Editor", request.getParameter("editor"));
		mixedArray.put("ISBN", request.getParameter("isbn"));
		mixedArray.put("Print length", request.getParameter("length"));
		mixedArray.put("Publication year", request.getParameter("pub_year"));
		return mixedArray;
	}

	private Map<String, String> parseProductRequest(Product product, HttpServletRequest request){
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

		return product.validate();
	}

}
