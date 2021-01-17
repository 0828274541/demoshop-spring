package com.demoshop.dto;

import java.util.ArrayList;
import java.util.List;

public class OrderDTO extends AbstractDTO<OrderDTO>{

	private float discount;
	private int totalMoney;
	private String paymentMethod;
	
	
	
	private UserDTO user;
	public List<OrderDetailDTO> orderDetails = new ArrayList<OrderDetailDTO>();



	public UserDTO getUser() {
		return user;
	}

	public void setUser(UserDTO user) {
		this.user = user;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public List<OrderDetailDTO> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetailDTO> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	
}
