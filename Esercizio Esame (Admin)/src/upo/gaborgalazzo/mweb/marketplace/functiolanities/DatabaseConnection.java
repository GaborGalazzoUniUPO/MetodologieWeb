package upo.gaborgalazzo.mweb.marketplace.functiolanities;

import upo.gaborgalazzo.mweb.marketplace.Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	public static Connection initializeDatabase()
	{
		// Initialize all the information regarding
		// Database Connection
		String dbDriver = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://"+ Config.DB_HOST +":"+Config.DB_PORT+"/";
		// Database name to access
		String dbName = Config.DB_NAME;
		String dbUsername = Config.DB_USER;
		String dbPassword = Config.DB_PASSWORD;

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