package com.demoshop.converter;

import org.springframework.stereotype.Component;

import com.demoshop.dto.ProductImageDTO;
import com.demoshop.entities.ProductImageEntity;

@Component
public class ProductImageConverter {

	public ProductImageDTO toDto(ProductImageEntity entity) {
		ProductImageDTO result = new ProductImageDTO();
		result.setId(entity.getId());
		result.setName(entity.getName());
		result.setProductId(entity.getProducts().getId());
		return result;
	}

	public ProductImageEntity toEntity(ProductImageDTO dto) {
		ProductImageEntity result = new ProductImageEntity();
		result.setName(dto.getName());
		return result;
	}

	public ProductImageEntity toEntity(ProductImageEntity result, ProductImageDTO dto) {
		result.setName(dto.getName());

		return result;
	}
}
