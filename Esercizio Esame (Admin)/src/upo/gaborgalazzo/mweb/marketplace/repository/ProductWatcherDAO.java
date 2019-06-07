package upo.gaborgalazzo.mweb.marketplace.repository;

import upo.gaborgalazzo.mweb.marketplace.domain.Product;
import upo.gaborgalazzo.mweb.marketplace.domain.User;
import upo.gaborgalazzo.mweb.marketplace.functiolanities.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductWatcherDAO
{

	public List<User> findByProductId(int productId)
	{
		Connection connection = DatabaseConnection.initializeDatabase();

		ArrayList<User> result = new ArrayList<User>();
		try
		{
			PreparedStatement query = connection.prepareStatement(
					"select users.*" +
							"from product_watchers inner join users on users.id = product_watchers.user_id " +
							"where product_id = ?"
			);
			query.setInt(1, productId);
			ResultSet resultSet = query.executeQuery();
			while (resultSet.next())
			{
				result.add(User.fromResultSet(resultSet));

			}
			query.close();
			connection.close();

		} catch (SQLException ignored)
		{
		}


		return result;
	}

	public void removeWatcher(int productId, int userId) throws SQLException
	{
		Connection connection = DatabaseConnection.initializeDatabase();
		PreparedStatement preparedStatement
				= connection.prepareStatement(
				"delete from product_watchers where product_id = ? and user_id = ?"
		);

		preparedStatement.setInt(1,productId);
		preparedStatement.setInt(2,userId);

		preparedStatement.executeUpdate();

		preparedStatement.close();
		connection.close();
	}
}
