package upo.gaborgalazzo.mweb.marketplace.repository;


import de.ailis.pherialize.Pherialize;
import upo.gaborgalazzo.mweb.marketplace.domain.CartProduct;
import upo.gaborgalazzo.mweb.marketplace.domain.Order;
import upo.gaborgalazzo.mweb.marketplace.functiolanities.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO
{

	public List<Order> findAll()
	{

		Connection connection = DatabaseConnection.initializeDatabase();

		ArrayList<Order> result = new ArrayList<Order>();
		try
		{
			PreparedStatement query = connection.prepareStatement(
					"select o.id," +
							"                o.code," +
							"                o.created_at," +
							"                o.status," +
							"                o.shipment_type," +
							"                o.transaction," +
							"                o.shipping_address_id," +
							"                o.payment_method_id," +
							"                o.owner_id," +
							"                o.tracking_code," +
							"                o.delivered_at," +
							"                concat(pm.card_type, ' - **** **** **** ', pm.last_digits, ' (',pm.expiry,') - ', UPPER(pm.full_name)) as pm_info," +
							"                concat(sa.street,', ',sa.zip_code,' ',sa.city,' ',sa.region, ' ', sa.country) as sa_info," +
							"                o.delivered_at," +
							"                concat(u.name, ' ', u.surname, ' (', u.email,')') as owner_info," +
							"               count(s.id)       as item_count," +
							"               (select count(*) from report_messages rm where rm.order_id = o.id and type = 0 and `read` = 0)  as messages_count," +
							"               sum(p.unit_price) as total" +
							"        from orders o" +
							"                 inner join order_products op on o.id = op.order_id" +
							"                 inner join stock s on s.id = op.stock_unit" +
							"                 inner join products p on p.id = s.product_id" +
							"                 inner join users u on o.owner_id = u.id" +
							"                 inner join payment_methods pm on pm.id = o.payment_method_id" +
							"                 inner join shipping_addresses sa on sa.id = o.shipping_address_id" +
							"        group by o.id"
			);
			ResultSet resultSet = query.executeQuery();
			while (resultSet.next())
			{
				result.add(Order.fromResultSet(resultSet));

			}
			query.close();
			connection.close();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}

		return result;
	}

	public Order findById(int id)
	{

		Order result = null;
		try
		{
			Connection connection = DatabaseConnection.initializeDatabase();
			PreparedStatement query = connection.prepareStatement(
					"select o.id," +
							"                o.code," +
							"                o.created_at," +
							"                o.status," +
							"                o.shipment_type," +
							"                o.transaction," +
							"                o.shipping_address_id," +
							"                o.payment_method_id," +
							"                o.owner_id," +
							"                o.tracking_code," +
							"                o.delivered_at," +
							"                concat(pm.card_type, ' - **** **** **** ', pm.last_digits, ' (',pm.expiry,') - ', UPPER(pm.full_name)) as pm_info," +
							"                concat(sa.street,', ',sa.zip_code,' ',sa.city,' ',sa.region, ' ', sa.country) as sa_info," +
							"                o.delivered_at," +
							"                concat(u.name, ' ', u.surname, ' (', u.email,')') as owner_info," +
							"               (select count(*) from report_messages rm where rm.order_id = o.id and type = 0 and `read` = 0)  as messages_count," +
							"               count(s.id)       as item_count," +

							"               sum(p.unit_price) as total" +
							"        from orders o" +
							"                 inner join order_products op on o.id = op.order_id" +
							"                 inner join stock s on s.id = op.stock_unit" +
							"                 inner join products p on p.id = s.product_id" +
							"                 inner join users u on o.owner_id = u.id" +
							"                 inner join payment_methods pm on pm.id = o.payment_method_id" +
							"                 inner join shipping_addresses sa on sa.id = o.shipping_address_id" +
							"        where o.id = ? " +
							"        group by o.id"
			);
			query.setInt(1, id);
			ResultSet resultSet = query.executeQuery();
			if (resultSet.first())
			{
				result = Order.fromResultSet(resultSet);
				refreshOrderProduct(result);

			}

			query.close();
			connection.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}

	private void refreshOrderProduct(Order order) throws SQLException
	{
		String q_string = "select p.name," +
				"            p.photo_url," +
				"            p.unit_price," +
				"            count(s.id) as qta," +
				"        p.id" +
				"        from order_products op" +
				"        inner join stock s on s.id = op.stock_unit" +
				"        inner join products p on s.product_id = p.id" +
				"        where op.order_id = ?" +
				"        group by p.id";

		Connection connection = DatabaseConnection.initializeDatabase();
		PreparedStatement query = connection.prepareStatement(q_string);
		query.setInt(1, order.getId());
		ResultSet resultSet = query.executeQuery();
		while (resultSet.next())
		{
			order.getProducts().add(CartProduct.fromResultSet(resultSet));

		}
		query.close();
		connection.close();

	}

	public Order update(Order order) throws SQLException {
		Connection connection = DatabaseConnection.initializeDatabase();
		PreparedStatement preparedStatement
				= connection.prepareStatement(
				"UPDATE orders SET transaction = ?, status = ?, owner_id = ?, created_at = ?, shipment_type = ?, payment_method_id = ?, shipping_address_id = ?, code = ?, delivered_at = ?, tracking_code = ?" +
						" WHERE id = ?;"
		);
		bindParameters(order, preparedStatement);
		preparedStatement.setInt(11, order.getId());

		if (preparedStatement.executeUpdate() == 0)
		{
			throw new SQLException("Creating order failed, no rows affected.");
		}

		preparedStatement.close();
		connection.close();

		return order;
	}

	private void bindParameters(Order order, PreparedStatement preparedStatement) throws SQLException {
		preparedStatement.setString(1, order.getTransaction());
		preparedStatement.setInt(2, order.getStatus());
		preparedStatement.setInt(3, order.getOwnerId());
		preparedStatement.setDate(4, order.getCreatedAt());
		preparedStatement.setInt(5, order.getShipmentType());
		preparedStatement.setInt(6, order.getPaymentMethodId());
		preparedStatement.setInt(7, order.getShippingAddressId());
		preparedStatement.setString(8, order.getCode());
		preparedStatement.setDate(9, order.getDeliveredAt());
		preparedStatement.setString(10, order.getTrackingCode());
	}
}

