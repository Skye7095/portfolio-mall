package com.portfolio.mall.cart.model;

import java.util.Date;

public class CartDecision {
	
	private int id;
	private int buyerId;
	private int buyerOrderId;
	private int productId;
	private int productAmount;
	private int productSumPrice;
	private int productTotalPrice;
	private Date createdAt;
	private Date updatedAt;
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
	public int getBuyerOrderId() {
		return buyerOrderId;
	}
	public void setBuyerOrderId(int buyerOrderId) {
		this.buyerOrderId = buyerOrderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}
	public int getProductSumPrice() {
		return productSumPrice;
	}
	public void setProductSumPrice(int productSumPrice) {
		this.productSumPrice = productSumPrice;
	}
	public int getProductTotalPrice() {
		return productTotalPrice;
	}
	public void setProductTotalPrice(int productTotalPrice) {
		this.productTotalPrice = productTotalPrice;
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
