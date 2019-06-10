package upo.gaborgalazzo.mweb.marketplace.repository;

import upo.gaborgalazzo.mweb.marketplace.domain.Message;
import upo.gaborgalazzo.mweb.marketplace.functiolanities.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReportMessageDAO
{
	public List<Message> findByOrderId(int orderId)
	{
		Connection connection = DatabaseConnection.initializeDatabase();
		List<Message> result = new ArrayList<>();

		try
		{
			PreparedStatement query = connection.prepareStatement(
					"select id, order_id, type, text, created_at from report_messages " +
							"where order_id = ? order by created_at"
			);
			query.setInt(1, orderId);
			ResultSet resultSet = query.executeQuery();
			while (resultSet.next())
			{
				result.add(Message.fromResultSet(resultSet));

			}
			query.close();
			connection.close();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return result;
	}

	public void setRead(int orderId) throws SQLException
	{
		Connection connection = DatabaseConnection.initializeDatabase();
		PreparedStatement preparedStatement
				= connection.prepareStatement(
				"update report_messages set `read` = 1 where order_id = ? and type = 0;"
		);
		preparedStatement.setInt(1, orderId);

		preparedStatement.executeUpdate();

		preparedStatement.close();
		connection.close();

	}

	public Message save(Message message) throws SQLException
	{
		Connection connection = DatabaseConnection.initializeDatabase();
		PreparedStatement preparedStatement
				= connection.prepareStatement(
				"insert into report_messages (order_id, type, text) values (?,?,?);"
		);
		preparedStatement.setInt(1, message.getOrderId());
		preparedStatement.setInt(2, 1);
		preparedStatement.setString(3, message.getText());

		if (preparedStatement.executeUpdate() == 0)
		{
			throw new SQLException("Creating message failed, no rows affected.");
		}

		preparedStatement.close();
		connection.close();

		return message;
	}
}
