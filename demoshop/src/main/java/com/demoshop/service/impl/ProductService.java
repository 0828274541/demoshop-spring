package com.demoshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.demoshop.converter.ProductConverter;
import com.demoshop.converter.ProductImageConverter;
import com.demoshop.dto.ProductDTO;
import com.demoshop.dto.ProductImageDTO;
import com.demoshop.entities.CategoryEntity;
import com.demoshop.entities.ProductEntity;
import com.demoshop.entities.ProductImageEntity;
import com.demoshop.repository.CategoryRepository;
import com.demoshop.repository.ProductImageRepository;
import com.demoshop.repository.ProductRepository;
import com.demoshop.service.IProductService;
import com.demoshop.util.FileUtils;

@Service
public class ProductService implements IProductService {

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private ProductConverter productConverter;

	@Autowired
	private ProductImageConverter productImageConverter;

	@Autowired
	private ProductImageRepository productImageRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private ProductImageService productImageService;

	@Override
	public List<ProductDTO> findAll(Pageable pageable) {
		List<ProductDTO> list = new ArrayList<>();
		List<ProductEntity> entities = productRepository.findByStatusOrderByIdDesc(1, pageable);

		for (ProductEntity item : entities) {
			ProductDTO productDTO = productConverter.toDto(item);
			productDTO.setProductImage(productImageService.findAvatarProduct(productDTO.getId()));
			list.add(productDTO);
		}
		return list;
	}

	@Override
	public int getTotalItem() {
		return (int) productRepository.countByStatus(1);
	}

	@Override
	public ProductDTO add(ProductDTO dto) {
		ProductDTO model = new ProductDTO();
		if (StringUtils.isBlank(dto.getName())) {
			dto.setMessage("Tên sản phẩm ko được trống");
			return dto;
		}

		List<ProductDTO> list = findByStatus(1);
		for (ProductDTO productDTO : list) {
			if (dto.getName().equals(productDTO.getName())) {
				dto.setMessage("Tên sản phẩm đã tồn tại");
				return dto;
			}

		}
		ProductEntity newProduct = productConverter.toEntity(dto);
		newProduct.setStatus(1);
		CategoryEntity category = categoryRepository.findOne(dto.getCategoryId());
		newProduct.setCategories(category);
		newProduct.setCount(0);
		model = productConverter.toDto(productRepository.save(newProduct));
		List<MultipartFile> files = dto.getProductImageses();
		List<ProductImageDTO> imageList = FileUtils.addFile(files, model.getId());
		for (ProductImageDTO productImageDTO : imageList) {
			productImageService.add(productImageDTO);
		}
		model.setBooReturn(true);
		return model;
	}

	@Override
	public ProductDTO update(ProductDTO dto) {
		ProductDTO model = new ProductDTO();
		if (StringUtils.isBlank(dto.getName())) {
			dto.setMessage("Tên sản phẩm ko được trống");
			return dto;
		}

		List<ProductDTO> list = findByStatus(1);
		for (ProductDTO productDTO : list) {
			if (dto.getId() != productDTO.getId()) {
				if (dto.getName().equals(productDTO.getName())) {
					dto.setMessage("Tên sản phẩm đã tồn tại");
					return dto;
				}
			}
		}
		ProductEntity editProduct = productRepository.findOne(dto.getId());

		CategoryEntity category = categoryRepository.findOne(dto.getCategoryId());
		editProduct.setCategories(category);
		editProduct = productConverter.toEntity(editProduct, dto);

		model = productConverter.toDto(productRepository.save(editProduct));
		if (!dto.getProductImageses().get(0).isEmpty()) {
			List<ProductImageEntity> proImgList = productImageRepository.findAllByProducts(editProduct);
			for (ProductImageEntity productImageEntity : proImgList) {
				FileUtils.deleteFile(productImageEntity.getName());
				productImageRepository.delete(productImageEntity);
				System.out.println("Xoa thanh cong img : " + productImageEntity.getName());
			}

			List<MultipartFile> files = dto.getProductImageses();
			List<ProductImageDTO> imageList = FileUtils.addFile(files, dto.getId());
			for (ProductImageDTO productImageDTO : imageList) {

				productImageService.add(productImageDTO);
				System.out.println("Them thanh cong img : " + productImageDTO.getName());
			}
		} else {
			if (dto.isBooImage() == true) {
				List<ProductImageEntity> proImgList = productImageRepository.findAllByProducts(editProduct);
				for (ProductImageEntity productImageEntity : proImgList) {
					FileUtils.deleteFile(productImageEntity.getName());
					System.out.println("Xoa thanh cong img : " + productImageEntity.getName());
					productImageRepository.delete(productImageEntity);
				}

			}
		}
		model.setMessage("Chinh sua Thành công !!");
		model.setBooReturn(true);
		return model;

	}

	private List<ProductDTO> findByStatus(int status) {
		List<ProductDTO> models = new ArrayList<>();
		List<ProductEntity> entities = productRepository.findByStatus(status);
		for (ProductEntity item : entities) {
			ProductDTO productDTO = productConverter.toDto(item);
			models.add(productDTO);
		}

		return models;
	}

	@Override
	public ProductDTO findOneByIdAndStatus(Long productId, int status) {
		ProductEntity productEntity = productRepository.findOneByIdAndStatus(productId, status);
		CategoryEntity category = categoryRepository.findOne(productEntity.getCategories().getId());
		productEntity.setCategories(category);
		List<ProductImageEntity> imageEntityList = productImageRepository.findAllByProducts(productEntity);
		List<ProductImageDTO> imageProductDTOList = new ArrayList<ProductImageDTO>();

		for (ProductImageEntity productImageEntity : imageEntityList) {
			imageProductDTOList.add(productImageConverter.toDto(productImageEntity));
		}

		ProductDTO model = productConverter.toDto(productEntity);
		model.setProImgList(imageProductDTOList);
		return model;
	}

	@Override
	public ProductDTO delete(ProductDTO pro) {
		ProductEntity newProduct = productRepository.findOne(pro.getId());
		newProduct.setStatus(0);
		productRepository.save(newProduct);
		pro.setMessage("Xoa Thành công !!");
		return pro;
	}

	@Override
	public ProductDTO getListResultAndTotalItemWithName(String searchKey, Pageable pageable) {
		ProductDTO proDTO = new ProductDTO();
		List<ProductDTO> list = new ArrayList<>();
		List<ProductEntity> entities = productRepository.findByNameContainingAndStatusOrderByIdDesc(searchKey, 1,
				pageable);
		for (ProductEntity item : entities) {
			ProductDTO productDTO = productConverter.toDto(item);
			list.add(productDTO);
		}
		proDTO.setListResult(list);
		List<ProductEntity> entities1 = productRepository.findByNameContainingAndStatusOrderByIdDesc(searchKey, 1);
		proDTO.setTotalItem(entities1.size());
		return proDTO;
	}

	@Override
	public ProductDTO getListResultAndTotalItemWithNameAndCategory(String searchKey, Long catId, Pageable pageable) {
		ProductDTO proDTO = new ProductDTO();
		List<ProductDTO> list = new ArrayList<>();
		CategoryEntity cat = categoryRepository.findOne(catId);
		List<ProductEntity> entities = productRepository
				.findByNameContainingAndCategoriesAndStatusOrderByIdDesc(searchKey, cat, 1, pageable);

		for (ProductEntity item : entities) {
			ProductDTO productDTO = productConverter.toDto(item);
			list.add(productDTO);
		}
		proDTO.setListResult(list);
		List<ProductEntity> entities1 = productRepository
				.findByNameContainingAndCategoriesAndStatusOrderByIdDesc(searchKey, cat, 1);
		proDTO.setTotalItem(entities1.size());
		return proDTO;
	}

	@Override
	public ProductDTO findByCategory(long id, Pageable pageable) {
		ProductDTO  product = new ProductDTO();
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		CategoryEntity category = categoryRepository.findOne(id);
		List<ProductEntity> entity = productRepository.findByCategoriesAndStatusOrderByIdDesc(category, 1, pageable);
		for (ProductEntity productEntity : entity) {
			productList.add(productConverter.toDto(productEntity));
		}
		product.setListResult(productList);
		List<ProductEntity> entities1 = productRepository
				.findByCategoriesAndStatus(category, 1);
		product.setTotalItem(entities1.size());
		return product;
	}

	@Override
	public void updateCount(ProductDTO dto) {
		ProductEntity editProduct = productRepository.findOne(dto.getId());
		editProduct.setCount(dto.getCount());
		productRepository.save(editProduct);
	}
}