package com.demoshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.demoshop.converter.OrderConverter;
import com.demoshop.converter.OrderDetailConverter;
import com.demoshop.converter.ProductConverter;
import com.demoshop.converter.UserConverter;
import com.demoshop.dto.OrderDTO;
import com.demoshop.dto.OrderDetailDTO;
import com.demoshop.entities.OrderDetailEntity;
import com.demoshop.entities.OrderEntity;
import com.demoshop.entities.ProductEntity;
import com.demoshop.repository.OrderDetailRepository;
import com.demoshop.repository.OrderRepository;
import com.demoshop.repository.ProductRepository;
import com.demoshop.repository.UserRepository;
import com.demoshop.service.IOrderDetailService;
import com.demoshop.service.IOrderService;
import com.demoshop.service.IUserService;

@Service
public class OrderService implements IOrderService {
	@Autowired
	OrderRepository orderRepository;
	@Autowired
	OrderDetailRepository orderDetailRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	UserConverter userConverter;
	@Autowired
	OrderConverter orderConverter;
	@Autowired
	OrderDetailConverter orderDetailConverter;
	@Autowired
	ProductRepository productRepository;
	@Autowired
	ProductConverter productConverter;
	@Autowired
	IUserService userService;
	@Autowired
	IOrderDetailService orderDetailService;
	@Override
	public Long add(OrderDTO order) {
		// Update user
		userService.update(order.getUser());
		
		// Add don hang
		OrderEntity orderEntity = orderConverter.toEntity(order);
		OrderEntity result = orderRepository.save(orderEntity);

		// Add chi tiet don hang
		List<OrderDetailDTO> list = order.getOrderDetails();
		for (OrderDetailDTO orderDetailDTO : list) {
			OrderDTO orderDTO = new OrderDTO();
			orderDTO.setId(result.getId());
			orderDetailDTO.setOrders(orderDTO);
			orderDetailService.add(orderDetailDTO);		
		}
		return result.getId();
	}

	@Override
	public List<OrderDTO> findByUser(String name) {
		List<OrderEntity> orderEntityList = orderRepository.findByCreateBy(name);
		List<OrderDTO> orderDTOList = new ArrayList<OrderDTO>();
		for (OrderEntity orderEntity : orderEntityList) {
			List<OrderDetailEntity> orderDetailEntityList = orderDetailRepository.findByOrders(orderEntity);
			OrderDTO orderDTO = new OrderDTO();
			orderDTO = orderConverter.toDTO(orderEntity);
			List<OrderDetailDTO> list = new ArrayList<OrderDetailDTO>();
			for (OrderDetailEntity orderDetailEntity : orderDetailEntityList) {
				ProductEntity productEntity = productRepository.findOne(orderDetailEntity.getProducts().getId());
				OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
				orderDetailDTO = orderDetailConverter.toDTO(orderDetailEntity);
				orderDetailDTO.setProducts(productConverter.toDto(productEntity));
				list.add(orderDetailDTO);
			}
			orderDTO.setOrderDetails(list);
			orderDTOList.add(orderDTO);

		}
		return orderDTOList;
	}

	public List<OrderDTO> findAll() {
		List<OrderEntity> entity = orderRepository.findAll();
		List<OrderDTO> dtoList = new ArrayList<OrderDTO>();
		for (OrderEntity orderEntity : entity) {
			dtoList.add(orderConverter.toDTO(orderEntity));
		}
		return dtoList;
	}

	@Override
	public List<OrderDTO> findAll(Pageable pageable) {
		List<OrderDTO> models = new ArrayList<>();
		List<OrderEntity> entities = orderRepository.findAllByOrderByIdDesc(pageable);

		for (OrderEntity item : entities) {
			OrderDTO orderDTO = orderConverter.toDTO(item);
			models.add(orderDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) orderRepository.countByStatus(1);
	}

}
