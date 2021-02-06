package com.demoshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demoshop.converter.ProductImageConverter;
import com.demoshop.dto.ProductImageDTO;
import com.demoshop.entities.ProductEntity;
import com.demoshop.entities.ProductImageEntity;
import com.demoshop.repository.ProductImageRepository;
import com.demoshop.repository.ProductRepository;
import com.demoshop.service.IProductImageService;

@Service
public class ProductImageService implements IProductImageService{
	
	@Autowired
	private ProductImageRepository productImageRepository;

	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private ProductImageConverter productImageConverter;
	@Override
	public List<ProductImageDTO> findAll() {
		List<ProductImageDTO> models = new ArrayList<>();
		List<ProductImageEntity> entities = productImageRepository.findAll();
		for (ProductImageEntity item : entities) {
			ProductImageDTO productImageDTO = productImageConverter.toDto(item);
			models.add(productImageDTO);
		}

		return models;
	}

	@Override
	public ProductImageDTO add(ProductImageDTO dto) {
		ProductImageDTO model = new ProductImageDTO();
		ProductImageEntity newProductImage = productImageConverter.toEntity(dto);
		newProductImage.setStatus(1);
		ProductEntity product = productRepository.findOne(dto.getProductId());
		newProductImage.setProducts(product);
		model = productImageConverter.toDto(productImageRepository.save(newProductImage));
		model.setMessage("Thêm mới Thành công !!");
		return model;
	}

	@Override
	public List<ProductImageDTO> findProductOneImage() {
		List<ProductImageDTO> list = new ArrayList<ProductImageDTO>();
		List<ProductImageEntity> entityList = productImageRepository.findProductImage();
		for (ProductImageEntity productImageEntity : entityList) {
			list.add(productImageConverter.toDto(productImageEntity));
		}
		return list;
	}

	@Override
	public ProductImageDTO findAvatarProduct(Long productId) {
		ProductImageEntity item = productImageRepository.findOneByProductId(productId);
		ProductImageDTO itemDTO = new ProductImageDTO();
		if(item!= null) {
			itemDTO = productImageConverter.toDto(item);
		}
		return itemDTO;
	}
	




}
