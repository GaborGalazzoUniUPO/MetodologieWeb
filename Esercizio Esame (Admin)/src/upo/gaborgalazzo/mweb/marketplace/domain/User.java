package upo.gaborgalazzo.mweb.marketplace.domain;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User
{
	private int id;
	private String name;
	private String surname;
	private String email;

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

	public static User fromResultSet(ResultSet resultSet) throws SQLException
	{
		User user = new User();
		user.setEmail(resultSet.getString("email"));
		user.setName(resultSet.getString("name"));
		user.setSurname(resultSet.getString("surname"));
		user.setId(resultSet.getInt("id"));
		return user;
	}
}
