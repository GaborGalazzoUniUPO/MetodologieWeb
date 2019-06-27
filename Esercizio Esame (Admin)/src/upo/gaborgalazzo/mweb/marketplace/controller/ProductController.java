package upo.gaborgalazzo.mweb.marketplace.controller;

import de.ailis.pherialize.MixedArray;
import upo.gaborgalazzo.mweb.marketplace.controller.util.PathParam;
import upo.gaborgalazzo.mweb.marketplace.controller.util.RequestMapping;
import upo.gaborgalazzo.mweb.marketplace.controller.util.RouteHttpServlet;
import upo.gaborgalazzo.mweb.marketplace.domain.Product;
import upo.gaborgalazzo.mweb.marketplace.domain.User;
import upo.gaborgalazzo.mweb.marketplace.functiolanities.NotificationService;
import upo.gaborgalazzo.mweb.marketplace.repository.ProductDAO;
import upo.gaborgalazzo.mweb.marketplace.repository.ProductWatcherDAO;
import upo.gaborgalazzo.mweb.marketplace.repository.StockDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.attribute.UserPrincipal;
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
	public void editForm(HttpServletRequest request, HttpServletResponse response, @PathParam(name = "id") int id) throws IOException, ServletException
	{

		ProductDAO productDAO = new ProductDAO();

		Product product = productDAO.get(id);

		if (product == null)
		{
			request.getRequestDispatcher("/WEB-INF/template/page/error/not-found.jsp").forward(request, response);
			return;
		}


		Map<String, String> errors = product.validate();

		request.setAttribute("product", product);
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("/WEB-INF/template/page/product/form.jsp").forward(request, response);


	}

	@RequestMapping(pattern = "/edit/{id}", method = "POST")
	public void edit(HttpServletRequest request, HttpServletResponse response, @PathParam(name = "id") int id) throws IOException, ServletException
	{

		ProductDAO productDAO = new ProductDAO();

		Product product = productDAO.get(id);

		if (product == null)
		{
			request.getRequestDispatcher("/WEB-INF/template/page/error/not-found.jsp").forward(request, response);
			return;
		}


		Map<String, String> errors = parseProductRequest(product, request);

		if (errors.size() == 0)
		{
			try
			{
				productDAO.update(product);
				addStockUnits(request, product);
				errors.put("success", "Product Updated");
			} catch (Exception e)
			{
				errors.put("exception", e.getMessage());
			}
		}



		request.setAttribute("product", product);
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("/WEB-INF/template/page/product/form.jsp").forward(request, response);


	}

	@RequestMapping(pattern = "/add")
	public void addForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{


		Product product = new Product();
		product.setCategory(Integer.parseInt(getParameter(request,"category")));
		request.setAttribute("product", product);
		request.setAttribute("errors", new HashMap<>());
		request.getRequestDispatcher("/WEB-INF/template/page/product/form.jsp").forward(request, response);
	}

	@RequestMapping(pattern = "/add", method = "POST")
	public void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{

		Product product = new Product();

		Map<String, String> errors = parseProductRequest(product, request);

		if (errors.size() == 0)
		{

			ProductDAO productDAO = new ProductDAO();
			try
			{
				productDAO.save(product);

				addStockUnits(request, product);

				errors.put("success", "Product Added");
			} catch (Exception e)
			{
				errors.put("exception", e.getMessage());
			}
		}

		request.setAttribute("product", product);
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("/WEB-INF/template/page/product/form.jsp").forward(request, response);
	}

	private void addStockUnits(HttpServletRequest request, Product product)
	{
		try
		{
			int stockCount = Integer.parseInt(getParameter(request,"stock_increment"));
			StockDAO stockDAO = new StockDAO();
			for (int i = 0; i < stockCount; i++)
			{
				stockDAO.add(product.getId());
			}
			if(product.getQta() == 0 && stockCount > 0)
			{
				ProductWatcherDAO productWatcherDAO = new ProductWatcherDAO();
				List<User> users = productWatcherDAO.findByProductId(product.getId());
				for(User user: users){
					productWatcherDAO.removeWatcher(product.getId(), user.getId());
					NotificationService.productReturnedAvailable(product, user);

				}

			}

			product.setQta(product.getQta()+stockCount);

		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	private MixedArray parseVideoGame(HttpServletRequest request)
	{
		MixedArray mixedArray = new MixedArray();
		mixedArray.put("Platform", getParameter(request,"platform"));
		mixedArray.put("Publisher", getParameter(request,"publisher"));
		mixedArray.put("Publication year", getParameter(request,"pub_year"));
		return mixedArray;
	}

	private MixedArray parseDVD(HttpServletRequest request)
	{

		MixedArray mixedArray = new MixedArray();
		mixedArray.put("Director", getParameter(request,"director"));
		mixedArray.put("Genre", getParameter(request,"genre"));
		mixedArray.put("Publication year", getParameter(request,"pub_year"));
		String[] list = request.getParameterValues("actors");
		mixedArray.put("Actors", list != null ? Arrays.asList(list) : new ArrayList<>());
		return mixedArray;
	}

	private MixedArray parseCD(HttpServletRequest request)
	{
		MixedArray mixedArray = new MixedArray();
		mixedArray.put("Author", getParameter(request,"author"));
		mixedArray.put("Publication year", getParameter(request,"pub_year"));
		String[] list = request.getParameterValues("tracks");
		mixedArray.put("Tracks", list != null ? Arrays.asList(list) : new ArrayList<>());
		return mixedArray;
	}

	private MixedArray parseBook(HttpServletRequest request)
	{

		MixedArray mixedArray = new MixedArray();
		mixedArray.put("Author", getParameter(request,"author"));
		mixedArray.put("Editor", getParameter(request,"editor"));
		mixedArray.put("ISBN", getParameter(request,"isbn"));
		mixedArray.put("Print length", getParameter(request,"length"));
		mixedArray.put("Publication year", getParameter(request,"pub_year"));
		return mixedArray;
	}

    private Map<String, String> parseProductRequest(Product product, HttpServletRequest request)
	{
		product.setCode(getParameter(request,"code"));
		product.setDescription(getParameter(request,"description"));
		product.setSmallDescription(getParameter(request,"small_description"));
		product.setName(getParameter(request,"name"));
		product.setUnitPrice(Float.parseFloat(getParameter(request,"unit_price")));
		product.setCategory(Integer.parseInt(getParameter(request,"category")));
		product.setPhotoUrl(getParameter(request,"photo_url"));

		switch (getParameter(request,"category"))
		{
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
