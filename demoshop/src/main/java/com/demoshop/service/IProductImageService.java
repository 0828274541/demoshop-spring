package com.demoshop.service;

import java.util.List;

import com.demoshop.dto.ProductImageDTO;

public interface IProductImageService {

	List<ProductImageDTO> findAll();

	ProductImageDTO add(ProductImageDTO productImageDTO);

	List<ProductImageDTO> findProductOneImage();

	ProductImageDTO findAvatarProduct(Long productId);

}
