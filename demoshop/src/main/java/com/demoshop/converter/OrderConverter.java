package com.demoshop.converter;

import org.springframework.stereotype.Component;

import com.demoshop.dto.OrderDTO;
import com.demoshop.entities.OrderEntity;

@Component
public class OrderConverter {

	public OrderEntity toEntity(OrderDTO dto) {
		OrderEntity entity = new OrderEntity();
		entity.setTotalMoney(dto.getTotalMoney());
		entity.setDiscount(dto.getDiscount());
		entity.setPaymentMethod(dto.getPaymentMethod());
		entity.setStatus(1);
		return entity;
	}

	public OrderDTO toDTO(OrderEntity entity) {
		OrderDTO result = new OrderDTO();
		result.setId(entity.getId());
		result.setTotalMoney(entity.getTotalMoney());
		result.setDiscount(entity.getDiscount());
		result.setPaymentMethod(entity.getPaymentMethod());
		result.setCreatedDate(entity.getCreateDate());
		result.setCreatedBy(entity.getCreateBy());
		return result;
	}

}
