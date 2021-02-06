package com.demoshop.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.demoshop.entities.CommentEntity;
import com.demoshop.entities.OrderDetailEntity;

public class ProductDTO extends AbstractDTO<ProductDTO> {

	private String name;

	private int price;

	private int salePrice;

	private String preview;

	private String storage;

	private String ram;

	private String cameraFeature;

	private String batteryCapacity;

	private Integer count;

	private String producer;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date releaseDate;

	private Long categoryId;

	private String categoryName;

	private List<ProductImageDTO> proImgList = new ArrayList<>();

	private List<OrderDetailEntity> orderDetailses = new ArrayList<>();

	private List<MultipartFile> productImageses = new ArrayList<>();

	private List<CommentEntity> commentses = new ArrayList<>();
	
	private ProductImageDTO productImage;

	public ProductImageDTO getProductImage() {
		return productImage;
	}

	public void setProductImage(ProductImageDTO productImage) {
		this.productImage = productImage;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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

	public List<MultipartFile> getProductImageses() {
		return productImageses;
	}

	public void setProductImageses(List<MultipartFile> productImageses) {
		this.productImageses = productImageses;
	}

	public List<CommentEntity> getCommentses() {
		return commentses;
	}

	public void setCommentses(List<CommentEntity> commentses) {
		this.commentses = commentses;
	}

	public List<ProductImageDTO> getProImgList() {
		return proImgList;
	}

	public void setProImgList(List<ProductImageDTO> proImgList) {
		this.proImgList = proImgList;
	}

}
