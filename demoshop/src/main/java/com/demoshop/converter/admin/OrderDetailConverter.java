package com.demoshop.converter.admin;

import org.springframework.stereotype.Component;

import com.demoshop.dto.OrderDetailDTO;
import com.demoshop.entities.OrderDetailEntity;
import com.demoshop.entities.OrderEntity;
import com.demoshop.entities.ProductEntity;
@Component
public class OrderDetailConverter {
	public OrderDetailEntity toEntity(OrderDetailDTO dto) {
		OrderDetailEntity entity = new OrderDetailEntity();
		OrderEntity orderEntity = new OrderEntity();
		orderEntity.setId(dto.getOrders().getId());
		ProductEntity productEntity = new ProductEntity();
		productEntity.setId(dto.getProducts().getId());
		entity.setQuantity(dto.getQuantity());
		entity.setOrders(orderEntity);
		entity.setProducts(productEntity);
		entity.setPrice(dto.getPrice());
		entity.setStatus(1);
		return entity;
	}

	public OrderDetailDTO toDTO(OrderDetailEntity orderDetailEntity) {
		OrderDetailDTO dto = new OrderDetailDTO();
		dto.setOrderId(orderDetailEntity.getOrders().getId());
		dto.setProductName(orderDetailEntity.getProducts().getName());
		dto.setQuantity(orderDetailEntity.getQuantity());
		dto.setPrice(orderDetailEntity.getPrice());
		return dto;
	}
}
