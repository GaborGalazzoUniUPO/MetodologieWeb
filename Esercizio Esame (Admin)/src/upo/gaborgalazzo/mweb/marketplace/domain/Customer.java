package upo.gaborgalazzo.mweb.marketplace.domain;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Customer
{
	private int id;
	private String name;
	private String surname;
	private String email;

	public static Customer fromResultSet(ResultSet resultSet) throws SQLException
	{
		Customer customer = new Customer();
		customer.setId(resultSet.getInt("id"));
		customer.setName(resultSet.getString("name"));
		customer.setEmail(resultSet.getString("email"));
		customer.setSurname(resultSet.getString("surname"));
		return customer;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getSurname()
	{
		return surname;
	}

	public void setSurname(String surname)
	{
		this.surname = surname;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}
}
