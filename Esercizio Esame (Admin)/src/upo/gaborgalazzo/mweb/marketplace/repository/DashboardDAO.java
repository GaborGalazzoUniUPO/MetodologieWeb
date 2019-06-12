package upo.gaborgalazzo.mweb.marketplace.repository;

import upo.gaborgalazzo.mweb.marketplace.domain.Customer;
import upo.gaborgalazzo.mweb.marketplace.functiolanities.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DashboardDAO
{

	public Integer countNewCutomers()
	{

		Connection connection = DatabaseConnection.initializeDatabase();
		int result = 0;
		try
		{
			PreparedStatement query = connection.prepareStatement(
					"select count(*) from users where created_at > CURRENT_DATE - INTERVAL 7 DAY "
			);
			ResultSet resultSet = query.executeQuery();
			result = resultSet.getInt(1);
			query.close();
			connection.close();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}

		return result;

	}

	public Integer countNewOrders()
	{

		Connection connection = DatabaseConnection.initializeDatabase();
		int result = 0;
		try
		{
			PreparedStatement query = connection.prepareStatement(
					"select count(*) from orders where created_at > CURRENT_DATE - INTERVAL 7 DAY "
			);
			ResultSet resultSet = query.executeQuery();
			resultSet.next();
			result = resultSet.getInt(1);
			query.close();
			connection.close();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}

		return result;

	}

	public float countTotalRecentIncome()
	{

		Connection connection = DatabaseConnection.initializeDatabase();
		float result = 0;
		try
		{
			PreparedStatement query = connection.prepareStatement(
					"select sum(p.unit_price) from orders o " +
							"inner join order_products op on op.order_id = o.id " +
							"inner join stock s on s.id = op.stock_unit inner join products p on s.product_id = p.id " +
							"where o.created_at > CURRENT_DATE - INTERVAL 7 DAY "
			);
			ResultSet resultSet = query.executeQuery();
			resultSet.next();
			result = resultSet.getFloat(1);
			query.close();
			connection.close();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}

		return result;

	}
}
