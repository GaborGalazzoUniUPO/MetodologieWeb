package upo.gaborgalazzo.mweb.marketplace.repository;

import upo.gaborgalazzo.mweb.marketplace.functiolanities.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StockDAO
{
	public int add(int id) throws SQLException
	{
		Connection connection = DatabaseConnection.initializeDatabase();

		PreparedStatement preparedStatement = connection.prepareStatement(
				"insert into stock_units (product_id) values (?);"
		);

		preparedStatement.setInt(1, id);
		preparedStatement.executeUpdate();

		preparedStatement.close();
		connection.close();

		return 1;

	}
}
