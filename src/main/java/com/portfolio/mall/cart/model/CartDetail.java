package com.portfolio.mall.cart.model;

import java.util.Date;

public class CartDetail {
	private int id;
	private int buyerId;
	private int sellerId;
	private int productId;
	private int productOriginPrice;
	private String productImgPath;
	private String productOriginName;
	private int productPrice;
	private int productAmount;
	private int productDeliveryPrice;
	private int productSumPrice;
	private int productTotalPrice;
	private Date createdAt;
	private Date updatedAt;
	
	
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getProductTotalPrice() {
		return productTotalPrice;
	}
	public void setProductTotalPrice(int productTotalPrice) {
		this.productTotalPrice = productTotalPrice;
	}
	public String getProductImgPath() {
		return productImgPath;
	}
	public void setProductImgPath(String productImgPath) {
		this.productImgPath = productImgPath;
	}
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
	public int getProductOriginPrice() {
		return productOriginPrice;
	}
	public void setProductOriginPrice(int productOriginPrice) {
		this.productOriginPrice = productOriginPrice;
	}
	public String getProductOriginName() {
		return productOriginName;
	}
	public void setProductOriginName(String productOriginName) {
		this.productOriginName = productOriginName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}
	public int getProductDeliveryPrice() {
		return productDeliveryPrice;
	}
	public void setProductDeliveryPrice(int productDeliveryPrice) {
		this.productDeliveryPrice = productDeliveryPrice;
	}
	public int getProductSumPrice() {
		return productSumPrice;
	}
	public void setProductSumPrice(int productSumPrice) {
		this.productSumPrice = productSumPrice;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
