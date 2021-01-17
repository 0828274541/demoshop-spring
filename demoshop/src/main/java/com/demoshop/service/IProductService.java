package com.demoshop.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.demoshop.dto.ProductDTO;

public interface IProductService {

	List<ProductDTO> findAll(Pageable pageable);

	int getTotalItem();

	ProductDTO add(ProductDTO productDTO);

	ProductDTO update(ProductDTO updateProduct);

	ProductDTO findOneByIdAndStatus(Long productId, int status);

	ProductDTO delete(ProductDTO pro);	

	ProductDTO getListResultAndTotalItemWithName(String string, Pageable pageable);

	ProductDTO getListResultAndTotalItemWithNameAndCategory(String string, Long long1, Pageable pageable);

	ProductDTO findByCategory(long id, Pageable pageable);

	void updateCount(ProductDTO product);


}
