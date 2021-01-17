package com.demoshop.converter.admin;

import org.springframework.stereotype.Component;

import com.demoshop.dto.ProductDTO;
import com.demoshop.entities.ProductEntity;

@Component
public class ProductConverter {


	public ProductDTO toDto(ProductEntity entity) {
		ProductDTO result = new ProductDTO();
		result.setId(entity.getId());
		result.setName(entity.getName());
		result.setPrice(entity.getPrice());
		result.setSalePrice(entity.getSalePrice());
		result.setPreview(entity.getPreview());
		result.setStorage(entity.getStorage());
		result.setRam(entity.getRam());
		result.setCameraFeature(entity.getCameraFeature());
		result.setBatteryCapacity(entity.getBatteryCapacity());
		result.setCount(entity.getCount());
		result.setProducer(entity.getProducer());
		result.setReleaseDate(entity.getReleaseDate());
		result.setCategoryId(entity.getCategories().getId());
		result.setCategoryName(entity.getCategories().getName());
		return result;
	}
	
	public ProductEntity toEntity(ProductDTO dto) {
		ProductEntity result = new ProductEntity();

		result.setName(dto.getName());
		result.setPrice(dto.getPrice());
		result.setSalePrice(dto.getSalePrice());
		result.setPreview(dto.getPreview());
		result.setStorage(dto.getStorage());
		result.setRam(dto.getRam());
		result.setCameraFeature(dto.getCameraFeature());
		result.setBatteryCapacity(dto.getBatteryCapacity());
		result.setCount(dto.getCount());
		result.setProducer(dto.getProducer());
		result.setReleaseDate(dto.getReleaseDate());
		return result;
	}

	public ProductEntity toEntity(ProductEntity result, ProductDTO dto) {
		result.setName(dto.getName());
		result.setPrice(dto.getPrice());
		result.setSalePrice(dto.getSalePrice());
		result.setPreview(dto.getPreview());
		result.setStorage(dto.getStorage());
		result.setRam(dto.getRam());
		result.setCameraFeature(dto.getCameraFeature());
		result.setBatteryCapacity(dto.getBatteryCapacity());
		result.setCount(dto.getCount());
		result.setProducer(dto.getProducer());
		result.setReleaseDate(dto.getReleaseDate());
		return result;
	}




}
