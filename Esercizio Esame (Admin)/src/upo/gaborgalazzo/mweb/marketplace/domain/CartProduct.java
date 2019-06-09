package upo.gaborgalazzo.mweb.marketplace.domain;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CartProduct
{
	private int id;
	private String name;
	private String photoUrl;
	private float unitPrice;
	private int qta;

	public static CartProduct fromResultSet(ResultSet resultSet) throws SQLException
	{
		CartProduct cartProduct = new CartProduct();
		cartProduct.setId(resultSet.getInt("id"));
		cartProduct.setQta(resultSet.getInt("qta"));
		cartProduct.setUnitPrice(resultSet.getFloat("unit_price"));
		cartProduct.setPhotoUrl(resultSet.getString("photo_url"));
		cartProduct.setName(resultSet.getString("name"));
		return cartProduct;
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

	public String getPhotoUrl()
	{
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl)
	{
		this.photoUrl = photoUrl;
	}

	public float getUnitPrice()
	{
		return unitPrice;
	}

	public void setUnitPrice(float unitPrice)
	{
		this.unitPrice = unitPrice;
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
