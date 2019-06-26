package upo.gaborgalazzo.mweb.marketplace.domain;

import upo.gaborgalazzo.mweb.marketplace.functiolanities.StringConverter;

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
		user.setEmail(StringConverter.toUtf8(resultSet,"email"));
		user.setName(StringConverter.toUtf8(resultSet,"name"));
		user.setSurname(StringConverter.toUtf8(resultSet,"surname"));
		user.setId(resultSet.getInt("id"));
		return user;
	}
}
