package com.demoshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demoshop.entities.OrderDetailEntity;
import com.demoshop.entities.OrderEntity;

public interface OrderDetailRepository extends JpaRepository<OrderDetailEntity, Long> {

	List<OrderDetailEntity> findByOrders(OrderEntity orderEntity);

}
