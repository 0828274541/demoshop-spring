package com.demoshop.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.demoshop.entities.OrderEntity;

public interface OrderRepository extends JpaRepository<OrderEntity, Long> {

	List<OrderEntity> findByCreateBy(String name);

	List<OrderEntity> findAllByOrderByIdDesc(Pageable pageable);

	int countByStatus(int status);

}
