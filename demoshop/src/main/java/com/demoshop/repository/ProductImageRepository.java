package com.demoshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.demoshop.entities.ProductEntity;
import com.demoshop.entities.ProductImageEntity;

public interface ProductImageRepository extends JpaRepository<ProductImageEntity, Long> {

	List<ProductImageEntity> findAllByProducts(ProductEntity productEntity);

	void deleteByProducts(ProductEntity newProduct);

	@Query(value = "SELECT * FROM product_images u GROUP BY u.product_id", nativeQuery = true)
	List<ProductImageEntity> findProductImage();

}
