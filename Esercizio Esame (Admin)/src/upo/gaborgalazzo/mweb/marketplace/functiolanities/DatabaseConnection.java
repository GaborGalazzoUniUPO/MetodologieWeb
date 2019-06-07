package upo.gaborgalazzo.mweb.marketplace.functiolanities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	public static Connection initializeDatabase()
	{
		// Initialize all the information regarding
		// Database Connection
		String dbDriver = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/";
		// Database name to access
		String dbName = "mweb-digital_store";
		String dbUsername = "root";
		String dbPassword = "";

		try
		{
			Class.forName(dbDriver);
			return DriverManager.getConnection(dbURL + dbName,
					dbUsername,
					dbPassword);
		} catch (ClassNotFoundException | SQLException e)
		{
			throw new RuntimeException(e);
		}

	}
}