package upo.gaborgalazzo.mweb.marketplace.domain;

import de.ailis.pherialize.MixedArray;
import de.ailis.pherialize.Pherialize;

import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class Product
{

	private int id;
	private String code;
	private String name;
	private String photoUrl;
	private String description;
	private String smallDescription;
	private MixedArray categoryInfo;
	private float unitPrice;
	private int category;
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
		product.setUnitPrice(resultSet.getFloat("unit_price"));
		product.setCategory(resultSet.getInt("category"));
		product.setDateAdded(resultSet.getDate("date_added"));
		product.setQta(resultSet.getInt("qta"));
		product.setCategoryInfo(Pherialize.unserialize(resultSet.getString("category_info")).toArray());
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


	public float getUnitPrice()
	{
		return unitPrice;
	}

	public void setUnitPrice(float unitPrice)
	{
		this.unitPrice = unitPrice;
	}

	public int getCategory()
	{
		return category;
	}

	public void setCategory(int category)
	{
		this.category = category;
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


	public MixedArray getCategoryInfo()
	{
		return categoryInfo;
	}

	public void setCategoryInfo(MixedArray categoryInfo)
	{
		this.categoryInfo = categoryInfo;
	}

	public Map<String, String> validate()
	{
		Map<String, String> errors = new HashMap<>();
		try
		{
			if (code.length() < 4)
				errors.put("code", "Code required (3 characters at least)");
			if (name.length() < 4)
				errors.put("name", "Code required (3 characters at least)");
			try{
				new URL(photoUrl);
			}catch (MalformedURLException e){
				errors.put("photo_url", e.getMessage());
			}
			if(unitPrice<1)
				errors.put("unit_price", "Unit price must be greater than €1");

			if(smallDescription.length() < 10)
				errors.put("small_description", "Small Description required (10 characters at least)");

			if(description.length() < 10)
				errors.put("description", "Small Description required (10 characters at least)");

			if(category < 1 || category > 6)
				errors.put("category", "Category Required");

		}catch (Exception e){
			errors.put("exception", e.getMessage());
		}
		return errors;
	}
}
