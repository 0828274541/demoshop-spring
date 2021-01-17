package com.demoshop.entities;
// Generated Dec 18, 2020 1:41:53 PM by Hibernate Tools 5.1.10.Final

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "orders")
public class OrderEntity extends BaseEntity {
	
	@Column(name = "total_money", nullable = false)
	private int totalMoney;
	
	@Column(name = "payment_method", nullable = false)
	private String paymentMethod;
	
	@Column(name = "discount", nullable = false, precision = 12, scale = 0)
	private float discount;
	
	@OneToMany(mappedBy = "orders", fetch = FetchType.LAZY)
	private List<OrderDetailEntity> orderDetailses = new ArrayList<OrderDetailEntity>();

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



	public List<OrderDetailEntity> getOrderDetailses() {
		return orderDetailses;
	}

	public void setOrderDetailses(List<OrderDetailEntity> orderDetailses) {
		this.orderDetailses = orderDetailses;
	}

	
}
