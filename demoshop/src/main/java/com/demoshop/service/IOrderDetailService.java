package com.demoshop.service;

import java.util.List;

import com.demoshop.dto.OrderDetailDTO;

public interface IOrderDetailService {

	List<OrderDetailDTO> findAll();

}
