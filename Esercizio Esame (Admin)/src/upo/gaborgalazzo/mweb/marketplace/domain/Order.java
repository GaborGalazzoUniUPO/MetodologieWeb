package upo.gaborgalazzo.mweb.marketplace.domain;

import upo.gaborgalazzo.mweb.marketplace.functiolanities.StringConverter;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Order
{
	private int id;
	private String transaction;
	private int status;
	private int ownerId;
	private Date createdAt;
	private int shipmentType;
	private int paymentMethodId;
	private int shippingAddressId;
	private String code;
	private int itemCount;
	private float total;
	private Date deliveredAt;
	private String trackingCode;
	private String ownerInfo;
	private String pmInfo;
	private String saInfo;

	private List<CartProduct> products = new ArrayList<>();
	private int messagesCount;

	public static Order fromResultSet(ResultSet resultSet) throws SQLException
	{
		Order order = new Order();
		order.setId(resultSet.getInt("id"));
		order.setStatus(resultSet.getInt("status"));
		order.setOwnerId(resultSet.getInt("owner_id"));
		order.setShipmentType(resultSet.getInt("shipment_type"));
		order.setPaymentMethodId(resultSet.getInt("payment_method_id"));
		order.setShippingAddressId(resultSet.getInt("shipping_address_id"));
		order.setItemCount(resultSet.getInt("item_count"));
		order.setMessagesCount(resultSet.getInt("messages_count"));
		order.setTransaction(StringConverter.toUtf8(resultSet,"transaction"));
		order.setCode(StringConverter.toUtf8(resultSet,"code"));
		order.setTrackingCode(StringConverter.toUtf8(resultSet,"tracking_code"));
		order.setCreatedAt(resultSet.getDate("created_at"));
		order.setDeliveredAt(resultSet.getDate("delivered_at"));
		order.setTotal(resultSet.getFloat("total"));
		order.setOwnerInfo(StringConverter.toUtf8(resultSet,"owner_info"));
		order.setPmInfo(StringConverter.toUtf8(resultSet,"pm_info"));
		order.setSaInfo(StringConverter.toUtf8(resultSet,"sa_info"));
		return order;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getTransaction()
	{
		return transaction;
	}

	public void setTransaction(String transaction)
	{
		this.transaction = transaction;
	}

	public int getStatus()
	{
		return status;
	}

	public void setStatus(int status)
	{
		this.status = status;
	}

	public int getOwnerId()
	{
		return ownerId;
	}

	public void setOwnerId(int ownerId)
	{
		this.ownerId = ownerId;
	}

	public Date getCreatedAt()
	{
		return createdAt;
	}

	public void setCreatedAt(Date createdAt)
	{
		this.createdAt = createdAt;
	}

	public int getShipmentType()
	{
		return shipmentType;
	}

	public void setShipmentType(int shipmentType)
	{
		this.shipmentType = shipmentType;
	}

	public int getPaymentMethodId()
	{
		return paymentMethodId;
	}

	public void setPaymentMethodId(int paymentMethodId)
	{
		this.paymentMethodId = paymentMethodId;
	}

	public int getShippingAddressId()
	{
		return shippingAddressId;
	}

	public void setShippingAddressId(int shippingAddressId)
	{
		this.shippingAddressId = shippingAddressId;
	}

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public int getItemCount()
	{
		return itemCount;
	}

	public void setItemCount(int itemCount)
	{
		this.itemCount = itemCount;
	}

	public float getTotal()
	{
		return total;
	}

	public void setTotal(float total)
	{
		this.total = total;
	}

	public Date getDeliveredAt()
	{
		return deliveredAt;
	}

	public void setDeliveredAt(Date deliveredAt)
	{
		this.deliveredAt = deliveredAt;
	}

	public String getTrackingCode()
	{
		return trackingCode;
	}

	public void setTrackingCode(String trackingCode)
	{
		this.trackingCode = trackingCode;
	}

	public String getOwnerInfo()
	{
		return ownerInfo;
	}

	public void setOwnerInfo(String ownerInfo)
	{
		this.ownerInfo = ownerInfo;
	}

	public String getPmInfo()
	{
		return pmInfo;
	}

	public void setPmInfo(String pmInfo)
	{
		this.pmInfo = pmInfo;
	}

	public String getSaInfo()
	{
		return saInfo;
	}

	public void setSaInfo(String saInfo)
	{
		this.saInfo = saInfo;
	}

	public String getStatusString(){
		switch (status){
			case 0:
				return "<span class='text-warning'>To process</span>";
			case 1:
				return "<span class='text-primary'>Sent</span>";
			case 2:
				return "<span class='text-success'>Delivered</span>";

		}
		return "<span class='text-danger'>Error</span>";
	}

	public List<CartProduct> getProducts()
	{
		return products;
	}

	public void setProducts(List<CartProduct> products)
	{
		this.products = products;
	}

	public void setMessagesCount(int messagesCount)
	{
		this.messagesCount = messagesCount;
	}

	public int getMessagesCount()
	{
		return messagesCount;
	}
}
