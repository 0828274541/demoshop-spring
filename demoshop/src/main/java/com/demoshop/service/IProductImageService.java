package com.demoshop.service;

import java.util.List;

import com.demoshop.dto.ProductImageDTO;

public interface IProductImageService {

	List<ProductImageDTO> findAll();

	ProductImageDTO add(ProductImageDTO productImageDTO);

	ProductImageDTO update(ProductImageDTO updateProductImage);

	ProductImageDTO delete(long[] ids);

	ProductImageDTO add();

	List<ProductImageDTO> findProductOneImage();

}
