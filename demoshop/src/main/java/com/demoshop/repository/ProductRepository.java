package com.demoshop.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.demoshop.entities.CategoryEntity;
import com.demoshop.entities.ProductEntity;

public interface ProductRepository extends JpaRepository<ProductEntity, Long>{

	List<ProductEntity> findByStatus(int status);

	int countByStatus(int status);

	ProductEntity findOneByIdAndStatus(Long productId, int status);

	List<ProductEntity> findByStatusOrderByIdDesc(int status, Pageable pageable);

	List<ProductEntity> findByNameContainingAndCategoriesAndStatusOrderByIdDesc(String searchKey, CategoryEntity cat,
			int status);

	List<ProductEntity> findByNameContainingAndStatusOrderByIdDesc(String searchKey, int status, Pageable pageable);

	List<ProductEntity> findByNameContainingAndStatusOrderByIdDesc(String searchKey, int status);

	List<ProductEntity> findByNameContainingAndCategoriesAndStatusOrderByIdDesc(String searchKey, CategoryEntity cat,
			int status, Pageable pageable);

	List<ProductEntity> findByCategoriesAndStatusOrderByIdDesc(CategoryEntity category, int status, Pageable pageable);

	List<ProductEntity> findByCategoriesAndStatus(CategoryEntity category, int status);

}
