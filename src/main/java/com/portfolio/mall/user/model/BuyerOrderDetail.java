package com.portfolio.mall.user.model;

import java.util.Date;
import java.util.List;

import com.portfolio.mall.cart.model.CartDecisionDetail;

public class BuyerOrderDetail {
	private int id;
	private int buyerId;
	private String buyerOrderId;
	private String buyerName;
	private String buyerPhoneNumber;
	private String receiverName;
	private String receiverPhoneNumber;
	private String receiverAddress;
	private String depositorName;
	private int sum;
	private List<CartDecisionDetail> cartDecisionDetailList;
	private String status;
	private Date createdAt;
	private Date updatedAt;
	
	
	public List<CartDecisionDetail> getCartDecisionDetailList() {
		return cartDecisionDetailList;
	}
	public void setCartDecisionDetailList(List<CartDecisionDetail> cartDecisionDetailList) {
		this.cartDecisionDetailList = cartDecisionDetailList;
	}
	public String getBuyerOrderId() {
		return buyerOrderId;
	}
	public void setBuyerOrderId(String buyerOrderId) {
		this.buyerOrderId = buyerOrderId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getBuyerPhoneNumber() {
		return buyerPhoneNumber;
	}
	public void setBuyerPhoneNumber(String buyerPhoneNumber) {
		this.buyerPhoneNumber = buyerPhoneNumber;
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
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverPhoneNumber() {
		return receiverPhoneNumber;
	}
	public void setReceiverPhoneNumber(String receiverPhoneNumber) {
		this.receiverPhoneNumber = receiverPhoneNumber;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public String getDepositorName() {
		return depositorName;
	}
	public void setDepositorName(String depositorName) {
		this.depositorName = depositorName;
	}

	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
	
}
