package com.demoshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demoshop.converter.OrderDetailConverter;
import com.demoshop.dto.OrderDetailDTO;
import com.demoshop.entities.OrderDetailEntity;
import com.demoshop.repository.OrderDetailRepository;
import com.demoshop.service.IOrderDetailService;
@Service
public class OrderDetailService implements IOrderDetailService{
	@Autowired
	OrderDetailRepository orderDetailRepository;
	@Autowired
	OrderDetailConverter orderDetailConverter;


	public List<OrderDetailDTO> findAll() {
		List<OrderDetailEntity> entity = orderDetailRepository.findAll();
		List<OrderDetailDTO> dtoList = new ArrayList<>();
		for (OrderDetailEntity orderDetailEntity : entity) {
			dtoList.add(orderDetailConverter.toDTO(orderDetailEntity));
		}
		return dtoList;
	}


}
