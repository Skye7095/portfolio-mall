package com.portfolio.mall.user.model;

import java.util.Date;

public class NonMember {
	private int id;
	private String name;
	private String phoneNumber;
	private String orderPassword;
	private String address;
	private Date createdAt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getOrderPassword() {
		return orderPassword;
	}
	public void setOrderPassword(String orderPassword) {
		this.orderPassword = orderPassword;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
}
