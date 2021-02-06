package com.demoshop.dto;

import java.util.List;

public class OrderDetailDTO extends AbstractDTO<OrderDetailDTO> {

	private Long orderId;

	private OrderDTO orders;

	private ProductDTO products;

	private String productName;

	private int quantity;

	private String cartMini;

	private String cartMiniDetail;

	private String priceShow;

	private String totalMoney;

	private String image;

	private String paymentMethod;

	private UserDTO user;

	private int price;

	private List<OrderDetailDTO> orderDetailList;

	private float discount;

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public UserDTO getUser() {
		return user;
	}

	public void setUser(UserDTO user) {
		this.user = user;
	}

	public List<OrderDetailDTO> getOrderDetailList() {
		return orderDetailList;
	}

	public void setOrderDetailList(List<OrderDetailDTO> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(String totalMoney) {
		this.totalMoney = totalMoney;
	}

	public String getPriceShow() {
		return priceShow;
	}

	public void setPriceShow(String string) {
		this.priceShow = string;
	}

	public OrderDTO getOrders() {
		return orders;
	}

	public void setOrders(OrderDTO orders) {
		this.orders = orders;
	}

	public ProductDTO getProducts() {
		return products;
	}

	public void setProducts(ProductDTO products) {
		this.products = products;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getCartMini() {
		return cartMini;
	}

	public void setCartMini(String cartMini) {
		this.cartMini = cartMini;
	}

	public String getCartMiniDetail() {
		return cartMiniDetail;
	}

	public void setCartMiniDetail(String cartMiniDetail) {
		this.cartMiniDetail = cartMiniDetail;
	}

}
