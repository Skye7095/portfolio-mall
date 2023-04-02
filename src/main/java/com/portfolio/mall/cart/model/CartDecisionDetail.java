package com.portfolio.mall.cart.model;

public class CartDecisionDetail {
	
	private int id;
	private int buyerId;
	private int productId;
	private String productImgPath;
	private String productName;
	private int productCount;
	private int productPrice;
	private int productDeliveryPrice;
	private int productCountPrice;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductImgPath() {
		return productImgPath;
	}
	public void setProductImgPath(String productImgPath) {
		this.productImgPath = productImgPath;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductDeliveryPrice() {
		return productDeliveryPrice;
	}
	public void setProductDeliveryPrice(int productDeliveryPrice) {
		this.productDeliveryPrice = productDeliveryPrice;
	}
	public int getProductCountPrice() {
		return productCountPrice;
	}
	public void setProductCountPrice(int productCountPrice) {
		this.productCountPrice = productCountPrice;
	}
	
	
}
