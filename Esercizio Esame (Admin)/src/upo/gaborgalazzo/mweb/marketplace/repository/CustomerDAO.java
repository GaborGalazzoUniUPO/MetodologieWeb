package upo.gaborgalazzo.mweb.marketplace.repository;

import upo.gaborgalazzo.mweb.marketplace.domain.Customer;
import upo.gaborgalazzo.mweb.marketplace.domain.Product;
import upo.gaborgalazzo.mweb.marketplace.functiolanities.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO
{
	public List<Customer> findAll()
	{


		Connection connection = DatabaseConnection.initializeDatabase();

		ArrayList<Customer> result = new ArrayList<Customer>();
		try
		{
			PreparedStatement query = connection.prepareStatement(
					"select * from users"
			);
			ResultSet resultSet = query.executeQuery();
			while (resultSet.next())
			{
				result.add(Customer.fromResultSet(resultSet));

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
