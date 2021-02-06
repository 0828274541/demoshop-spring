package com.demoshop.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.demoshop.dto.OrderDTO;

public interface IOrderService {

	Long add(OrderDTO order);
	
	List<OrderDTO> findByUser(String name);

	List<OrderDTO> findAll(Pageable pageable);

	int getTotalItem();

}
