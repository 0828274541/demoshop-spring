package com.demoshop.entities;
// Generated Dec 18, 2020 1:41:53 PM by Hibernate Tools 5.1.10.Final

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "products")
public class ProductEntity extends BaseEntity {

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id", nullable = false)
	private CategoryEntity categories;

	@Column(name = "name", nullable = false)
	private String name;

	@Column(name = "price")
	private int price;

	@Column(name = "sale_price")
	private int salePrice;

	@Column(name = "preview", length = 65535)
	private String preview;

	@Column(name = "storage")
	private String storage;

	@Column(name = "ram")
	private String ram;

	@Column(name = "camera_feature")
	private String cameraFeature;

	@Column(name = "battery_capacity")
	private String batteryCapacity;

	@Column(name = "count", nullable = false)
	private Integer count ;

	@Column(name = "producer", nullable = false)
	private String producer;
	
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@Column(name = "release_date", length = 10)
	private Date releaseDate;


	@OneToMany(fetch = FetchType.LAZY, mappedBy = "products")
	private List<OrderDetailEntity> orderDetailses = new ArrayList<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "products")
	private List<ProductImageEntity> productImageses = new ArrayList<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productComment")
	private List<CommentEntity> commentses = new ArrayList<>();

	public CategoryEntity getCategories() {
		return categories;
	}

	public void setCategories(CategoryEntity categories) {
		this.categories = categories;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}

	public String getStorage() {
		return storage;
	}

	public void setStorage(String storage) {
		this.storage = storage;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getCameraFeature() {
		return cameraFeature;
	}

	public void setCameraFeature(String cameraFeature) {
		this.cameraFeature = cameraFeature;
	}

	public String getBatteryCapacity() {
		return batteryCapacity;
	}

	public void setBatteryCapacity(String batteryCapacity) {
		this.batteryCapacity = batteryCapacity;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public List<OrderDetailEntity> getOrderDetailses() {
		return orderDetailses;
	}

	public void setOrderDetailses(List<OrderDetailEntity> orderDetailses) {
		this.orderDetailses = orderDetailses;
	}

	public List<ProductImageEntity> getProductImageses() {
		return productImageses;
	}

	public void setProductImageses(List<ProductImageEntity> productImageses) {
		this.productImageses = productImageses;
	}

	public List<CommentEntity> getCommentses() {
		return commentses;
	}

	public void setCommentses(List<CommentEntity> commentses) {
		this.commentses = commentses;
	}

	

}