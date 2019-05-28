package upo.gaborgalazzo.mweb.marketplace.domain;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Product
{

	private int id;
	private String code;
	private String name;
	private String photoUrl;
	private String description;
	private String smallDescription;
	private String categoryInfo;
	private float unitPrice;
	private int type;
	private Date dateAdded;
	private int qta;

	public static Product fromResultSet(ResultSet resultSet) throws SQLException
	{
		Product product = new Product();
		product.setId(resultSet.getInt("id"));
		product.setName(resultSet.getString("name"));
		product.setCode(resultSet.getString("code"));
		product.setPhotoUrl(resultSet.getString("photo_url"));
		product.setDescription(resultSet.getString("description"));
		product.setSmallDescription(resultSet.getString("small_description"));
		product.setCategoryInfo(resultSet.getString("category_info"));
		product.setUnitPrice(resultSet.getFloat("unit_price"));
		product.setType(resultSet.getInt("type"));
		product.setDateAdded(resultSet.getDate("date_added"));
		product.setQta(resultSet.getInt("qta"));
		return product;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getPhotoUrl()
	{
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl)
	{
		this.photoUrl = photoUrl;
	}

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public String getSmallDescription()
	{
		return smallDescription;
	}

	public void setSmallDescription(String smallDescription)
	{
		this.smallDescription = smallDescription;
	}

	public String getCategoryInfo()
	{
		return categoryInfo;
	}

	public void setCategoryInfo(String categoryInfo)
	{
		this.categoryInfo = categoryInfo;
	}

	public float getUnitPrice()
	{
		return unitPrice;
	}

	public void setUnitPrice(float unitPrice)
	{
		this.unitPrice = unitPrice;
	}

	public int getType()
	{
		return type;
	}

	public void setType(int type)
	{
		this.type = type;
	}

	public Date getDateAdded()
	{
		return dateAdded;
	}

	public void setDateAdded(Date dateAdded)
	{
		this.dateAdded = dateAdded;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public int getQta()
	{
		return qta;
	}

	public void setQta(int qta)
	{
		this.qta = qta;
	}
}
