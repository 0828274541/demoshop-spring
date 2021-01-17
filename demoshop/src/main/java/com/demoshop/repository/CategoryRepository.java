package com.demoshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demoshop.entities.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {

	List<CategoryEntity> findByParentIdAndStatus(long id, int status);

	CategoryEntity findByIdAndStatus(long id, int status);

	List<CategoryEntity> findByStatus(int status);

	CategoryEntity findById(Long parentId);

	int countByStatus( int status);
	
}
