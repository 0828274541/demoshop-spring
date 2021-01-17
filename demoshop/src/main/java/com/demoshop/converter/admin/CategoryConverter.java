package com.demoshop.converter.admin;

import org.springframework.stereotype.Component;

import com.demoshop.dto.CategoryDTO;
import com.demoshop.entities.CategoryEntity;

@Component
public class CategoryConverter {
	
	public CategoryDTO toDto(CategoryEntity entity) {
		CategoryDTO result = new CategoryDTO();
		result.setId(entity.getId());
		result.setName(entity.getName());
		result.setParentId(entity.getParentId());
		result.setStatus(entity.getStatus());
		return result;
	}
	
	public CategoryEntity toEntity(CategoryDTO dto) {
		CategoryEntity result = new CategoryEntity();
		result.setName(dto.getName());
		result.setParentId(dto.getParentId());
		return result;
	}

	public CategoryEntity toEntity(CategoryEntity result, CategoryDTO dto) {
		result.setName(dto.getName());
		result.setParentId(dto.getParentId());
		return result;
	}
}
