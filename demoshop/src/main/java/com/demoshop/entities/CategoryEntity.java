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
@Table(name = "categories")
public class CategoryEntity extends BaseEntity {

	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name = "parent_id", nullable = false)
	private Long parentId;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "categories")
	private List<ProductEntity> productses = new ArrayList<>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public List<ProductEntity> getProductses() {
		return productses;
	}

	public void setProductses(List<ProductEntity> productses) {
		this.productses = productses;
	}

	
	

}
