package upo.gaborgalazzo.mweb.marketplace.domain;

import upo.gaborgalazzo.mweb.marketplace.functiolanities.StringConverter;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Message
{
	private int type;
	private String text;
	private int orderId;

	public static Message fromResultSet(ResultSet resultSet) throws SQLException
	{
		Message message = new Message();
		message.setOrderId(resultSet.getInt("order_id"));
		message.setType(resultSet.getInt("type"));
		message.setText(StringConverter.toUtf8(resultSet,"text"));
		return message;
	}

	public int getType()
	{

		return type;
	}

	public void setType(int type)
	{
		this.type = type;
	}

	public String getText()
	{

		return text;
	}

	public void setText(String text)
	{
		this.text = text;
	}

	public void setOrderId(int orderId)
	{
		this.orderId = orderId;
	}

	public int getOrderId()
	{
		return orderId;
	}
}
