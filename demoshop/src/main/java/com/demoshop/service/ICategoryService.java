package com.demoshop.service;

import java.util.List;

import com.demoshop.dto.CategoryDTO;

public interface ICategoryService {

	CategoryDTO findByIdAndStatus(long id, int status);

	CategoryDTO add(CategoryDTO dto);

	CategoryDTO delete(long[] ids);

	List<CategoryDTO> findAll();

	List<CategoryDTO> findByParentIdAndStatus(long id, int status);

	List<CategoryDTO> findChildrenList(List<CategoryDTO> listShow, long id, int level, int status);

	CategoryDTO update(CategoryDTO dto);

	List<CategoryDTO> findRecursionList();

	List<CategoryDTO> findAvailabilityList();

	String loadSidebar();

	List<CategoryDTO> findById(long id);

	CategoryDTO findOne(long id);

	int getTotalItem();

	CategoryDTO delete(CategoryDTO cat);

}
