package upo.gaborgalazzo.mweb.marketplace.repository;

import de.ailis.pherialize.Pherialize;
import upo.gaborgalazzo.mweb.marketplace.DatabaseConnection;
import upo.gaborgalazzo.mweb.marketplace.domain.Product;

import java.sql.*;
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
							"(select count(*) from stock s where s.product_id = products.id and s.status = 0) as qta " +
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

	public Product save(Product product) throws SQLException
	{
		Connection connection = DatabaseConnection.initializeDatabase();
		PreparedStatement preparedStatement
				= connection.prepareStatement(
				"insert into products (code, photo_url, description, name, unit_price, category, small_description, category_info) values "
						+ "(?, ?, ?, ?, ?, ?, ?, ?);",
				Statement.RETURN_GENERATED_KEYS
		);
		bindParameters(product, preparedStatement);

		if (preparedStatement.executeUpdate() == 0)
		{
			throw new SQLException("Creating user failed, no rows affected.");
		}

		try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys())
		{
			if (generatedKeys.next())
			{
				product.setId(generatedKeys.getInt(1));
			} else
			{
				throw new SQLException("Creating user failed, no ID obtained.");
			}
		}

		return product;
	}

	public Product update(Product product) throws SQLException
	{

		Connection connection = DatabaseConnection.initializeDatabase();
		PreparedStatement preparedStatement
				= connection.prepareStatement(
				"update products set code = ?, photo_url = ?, description = ?, name = ?, unit_price = ?, category = ?, small_description = ?, category_info = ?" +
						"where id = ?"
		);
		bindParameters(product, preparedStatement);
		preparedStatement.setInt(9, product.getId());

		if (preparedStatement.executeUpdate() == 0)
		{
			throw new SQLException("Creating user failed, no rows affected.");
		}

		return product;
	}

	private void bindParameters(Product product, PreparedStatement preparedStatement) throws SQLException
	{
		preparedStatement.setString(1, product.getCode());
		preparedStatement.setString(2, product.getPhotoUrl());
		preparedStatement.setString(3, product.getDescription());
		preparedStatement.setString(4, product.getName());
		preparedStatement.setFloat(5, product.getUnitPrice());
		preparedStatement.setInt(6, product.getCategory());
		preparedStatement.setString(7, product.getSmallDescription());
		preparedStatement.setString(8, Pherialize.serialize(product.getCategoryInfo()));
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
							"(select count(*) from stock s where s.product_id = products.id and s.status = 0) as qta " +
							"from products"
			);
			ResultSet resultSet = query.executeQuery();
			while (resultSet.next())
			{
				result.add(Product.fromResultSet(resultSet));

			}
			query.close();
			connection.close();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}

		return result;
	}


}
