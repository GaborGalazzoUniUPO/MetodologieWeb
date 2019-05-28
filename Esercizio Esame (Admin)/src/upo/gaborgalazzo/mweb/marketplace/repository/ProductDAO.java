package upo.gaborgalazzo.mweb.marketplace.repository;

import upo.gaborgalazzo.mweb.marketplace.DatabaseConnection;
import upo.gaborgalazzo.mweb.marketplace.domain.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO
{
	public Product get(int id)
	{
		Connection connection = DatabaseConnection.initializeDatabase();

		Product result = null;
		try
		{
			PreparedStatement query = connection.prepareStatement(
					"select *, " +
							"(select count(*) from stock s where s.product_id = id and s.status = 0) as qta " +
							"from products " +
							"where id = ?"
			);
			query.setInt(1, id);
			ResultSet resultSet = query.executeQuery();
			if (resultSet.first())
			{
				result = Product.fromResultSet(resultSet);

			}

			query.close();
			connection.close();
		} catch (SQLException ignored)
		{
		}

		return result;
	}

	public Product save(Product product)
	{
		return null;
	}

	public Product update(Product product)
	{
		return null;
	}

	public Product delete(int id)
	{
		return null;
	}

	public ArrayList<Product> getAll()
	{
		Connection connection = DatabaseConnection.initializeDatabase();

		ArrayList<Product> result = new ArrayList<Product>();
		try
		{
			PreparedStatement query = connection.prepareStatement(
					"select *, " +
							"(select count(*) from stock s where s.product_id = id and s.status = 0) as qta " +
							"from products"
			);
			ResultSet resultSet = query.executeQuery();
			while (resultSet.next())
			{
				result.add(Product.fromResultSet(resultSet));

			}
			query.close();
			connection.close();
		} catch (SQLException ignored)
		{
		}

		return result;
	}
}
