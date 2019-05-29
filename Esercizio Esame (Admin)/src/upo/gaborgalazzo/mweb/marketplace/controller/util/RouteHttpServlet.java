package upo.gaborgalazzo.mweb.marketplace.controller.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public abstract class RouteHttpServlet extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String pathInfo = req.getPathInfo();
		if (pathInfo == null)
			pathInfo = "/";

		Object o = this.getClass().getDeclaredMethods();

		for (Method method : this.getClass().getDeclaredMethods())
		{
			RequestMapping mapping = method.getAnnotation(RequestMapping.class);
			if (mapping == null)
				continue;
			Object[] params = patternMatch(req, resp, mapping, pathInfo, method);
			if (params == null)
				continue;
			try
			{
				method.invoke(this, params);
				return;
			} catch (IllegalAccessException | InvocationTargetException ignored)
			{
			}
		}
		super.service(req, resp);
	}

	private Object[] patternMatch(HttpServletRequest request, HttpServletResponse response, RequestMapping requestMapping, String pathInfo, Method method)
	{
		if (!request.getMethod().equals(requestMapping.method()))
			return null;

		String regexPattern = requestMapping.pattern().replaceAll("\\{([^}]+)\\}", "([^/]+)");

		if (!pathInfo.matches(regexPattern))
			return null;

		Pattern pm = Pattern.compile("([^/]+)");
		Matcher m = pm.matcher(pathInfo);
		ArrayList<Object> params = new ArrayList<>();
		for (Parameter p : method.getParameters())
		{
			if (p.getType() == HttpServletResponse.class)
				params.add(response);
			else if (p.getType() == HttpServletRequest.class)
				params.add(request);
			else if ( m.find() && (p.getType() == Integer.class || p.getType() == int.class))
				params.add((Integer.parseInt(m.group(1))));
			else
				params.add(m.group(1));
		}


		return params.toArray();
	}
}
