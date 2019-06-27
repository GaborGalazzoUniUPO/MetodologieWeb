package upo.gaborgalazzo.mweb.marketplace.domain;

import de.ailis.pherialize.MixedArray;
import de.ailis.pherialize.Pherialize;
import upo.gaborgalazzo.mweb.marketplace.functiolanities.StringConverter;

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
		product.setName(StringConverter.toUtf8(resultSet,"name"));
		product.setCode(StringConverter.toUtf8(resultSet,"code"));
		product.setPhotoUrl(StringConverter.toUtf8(resultSet,"photo_url"));
		product.setDescription(StringConverter.toUtf8(resultSet,"description"));
		product.setSmallDescription(StringConverter.toUtf8(resultSet,"small_description"));
		product.setUnitPrice(resultSet.getFloat("unit_price"));
		product.setCategory(resultSet.getInt("category"));
		product.setDateAdded(resultSet.getDate("date_added"));
		product.setQta(resultSet.getInt("qta"));
		product.setCategoryInfo(Pherialize.unserialize(StringConverter.toUtf8(resultSet,"category_info")).toArray());
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

	public String getCategoryString(){
		switch (category){
			case 1: return "Book";
			case 2: return "Comic";
			case 3: return "Cd";
			case 4: return "Vinyl";
			case 5: return "Dvd";
			case 6: return "Video game";
			default: return null;
		}
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
			if (!code.matches("^[\\u00C0-\\u00D6\\u00D8-\\u00f6\\u00f8-\\u00ff\\w]{3,}$"))
				errors.put("code", "Code required (3 characters at least)");
			if (!name.matches("[a-zA-Z\\u00C0-\\u00D6\\u00D8-\\u00f6\\u00f8-\\u00ff ]+"))
				errors.put("name", "Code required (3 characters at least)");
			try{
				new URL(photoUrl);
			}catch (MalformedURLException e){
				errors.put("photo_url", e.getMessage());
			}
			if(unitPrice<0.01)
				errors.put("unit_price", "Unit price must be greater than €1");

			if(smallDescription.length() < 10  || smallDescription.length() > 300)
				errors.put("small_description", "Small Description required (minimum 30 chars maximum 300)");

			if(description.length() < 10)
				errors.put("description", "Small Description required (10 characters at least)");

			if(category < 1 || category > 6)
				errors.put("category", "Category Required");

			switch (category){
				case 1:
				case 2:
					if(categoryInfo.get("Author") == null ||  !categoryInfo.getString("Author").matches("^[\\u00C0-\\u00D6\\u00D8-\\u00f6\\u00f8-\u00ff\\w\\s]{3,}$"))
						errors.put("author", "Author required (3 characters at least)");
					if(categoryInfo.get("Editor") == null ||  !categoryInfo.getString("Editor").matches("^[\\u00C0-\\u00D6\\u00D8-\\u00f6\\u00f8-\u00ff\\w\\s]{3,}$"))
						errors.put("editor", "Editor required (3 characters at least)");
					if(categoryInfo.get("ISBN") == null ||  !categoryInfo.getString("ISBN").matches("^[\\u00C0-\\u00D6\\u00D8-\\u00f6\\u00f8-\u00ff\\w]{10,}$"))
						errors.put("isbn", "ISBN required (10 characters at least)");
					if(categoryInfo.get("Print length") == null || categoryInfo.getInt("Print length") < 1)
						errors.put("length", "Print Length required (must be greater than 1)");
					if(categoryInfo.get("Publication year") == null ||  !categoryInfo.getString("Publication year").matches("^[0-9]{4,}$") )
						errors.put("pub_year", "Publication year required (4 digits at least)");
					break;
				case 3:
				case 4:
					if(categoryInfo.get("Author") == null ||  !categoryInfo.getString("Author").matches("^[\\u00C0-\\u00D6\\u00D8-\\u00f6\\u00f8-\u00ff\\w\\s]{3,}$"))
						errors.put("author", "Author required (3 characters at least)");
					if(categoryInfo.get("Publication year") == null ||  !categoryInfo.getString("Publication year").matches("^[0-9]{4,}$"))
						errors.put("pub_year", "Publication year required (4 digits at least)");
					if(categoryInfo.get("Tracks") == null ||  categoryInfo.getArray("Tracks").size() < 1)
						errors.put("tracks", "Tracks required (1 actors at least)");
					break;
				case 5:
					if(categoryInfo.get("Director") == null ||  !categoryInfo.getString("Director").matches("^[\\u00C0-\\u00D6\\u00D8-\\u00f6\\u00f8-\u00ff\\w\\s]{3,}$"))
						errors.put("director", "Director required (3 characters at least)");
					if(categoryInfo.get("Publication year") == null ||  !categoryInfo.getString("Publication year").matches("^[0-9]{4,}$"))
						errors.put("pub_year", "Publication year required (4 digits at least)");
					if(categoryInfo.get("Genre") == null ||  categoryInfo.getString("Genre").length() < 5)
						errors.put("genre", "Genre required (5 characters at least)");
					if(categoryInfo.get("Actors") == null ||  categoryInfo.getArray("Actors").size() < 3 || categoryInfo.getArray("Actors").size() > 6)
						errors.put("actors", "Actors required (3 actors at least, maximum 6)");
					break;
				case 6:
					if(categoryInfo.get("Platform") == null ||  !categoryInfo.getString("Platform").matches("^[\\u00C0-\\u00D6\\u00D8-\\u00f6\\u00f8-\u00ff\\w\\s]{4,}$"))
						errors.put("platform", "Platform year required (4 digits at least)");
					if(categoryInfo.get("Publisher") == null ||  !categoryInfo.getString("Publisher").matches("^[\\u00C0-\\u00D6\\u00D8-\\u00f6\\u00f8-\u00ff\\w\\s]{3,}$"))
						errors.put("publisher", "Publisher year required (4 digits at least)");
					if(categoryInfo.get("Publication year") == null ||  !categoryInfo.getString("Publication year").matches("^[0-9]{4,}$"))
						errors.put("pub_year", "Publication year required (4 digits at least)");
			}

		}catch (Exception e){
			errors.put("exception", e.getMessage());
		}
		return errors;
	}
}
