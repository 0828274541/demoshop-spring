package com.demoshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demoshop.converter.CategoryConverter;
import com.demoshop.dto.CategoryDTO;
import com.demoshop.entities.CategoryEntity;
import com.demoshop.repository.CategoryRepository;
import com.demoshop.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService {

	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private CategoryConverter categoryConverter;
	@Autowired
	private ServletContext context;

	@Override
	public CategoryDTO findByIdAndStatus(long id, int status) {
		CategoryEntity entity = categoryRepository.findByIdAndStatus(id, status);
		return categoryConverter.toDto(entity);
	}

	@Override
	@Transactional
	public CategoryDTO add(CategoryDTO dto) {
		List<CategoryDTO> list = findByStatus(1);
		for (CategoryDTO categoryDTO : list) {
			if (dto.getName().equals(categoryDTO.getName())) {
				dto.setMessage("Tên danh mục đã tồn tại");
				return dto;
			}
		}
		CategoryEntity newCategory = categoryConverter.toEntity(dto);
		newCategory.setStatus(1);
		categoryConverter.toDto(categoryRepository.save(newCategory));
		dto.setMessage("Thêm mới Thành công !!");
		return dto;
	}

	private List<CategoryDTO> findByStatus(int status) {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entities = categoryRepository.findByStatus(status);
		for (CategoryEntity item : entities) {
			CategoryDTO categoryDTO = categoryConverter.toDto(item);
			models.add(categoryDTO);
		}
		return models;
	}

	@Override
	@Transactional
	public CategoryDTO delete(long[] ids) {
		CategoryDTO catReturn = new CategoryDTO();
		for (long id1 : ids) {
			if (findByParentIdAndStatus(id1, 1).size() > 0) {
				catReturn.setMessage("Xoa Thất bại. Danh mục " + categoryRepository.findOne(id1).getName()
						+ " đang có các danh mục con !!");
				return catReturn;
			}
		}
		for (long id2 : ids) {
			CategoryEntity newCategory = categoryRepository.findOne(id2);
			newCategory.setStatus(0);
			categoryRepository.save(newCategory);
		}
		catReturn.setMessage("Xoa Thành công !!");
		return catReturn;
	}

	@Override
	public List<CategoryDTO> findAll() {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for (CategoryEntity item : entities) {
			CategoryDTO categoryDTO = categoryConverter.toDto(item);
			models.add(categoryDTO);
		}
		return models;
	}

	@Override
	public List<CategoryDTO> findByParentIdAndStatus(long id, int status) {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entities = categoryRepository.findByParentIdAndStatus(id, status);
		for (CategoryEntity item : entities) {
			CategoryDTO categoryDTO = categoryConverter.toDto(item);
			models.add(categoryDTO);
		}
		return models;
	}

	public List<CategoryDTO> findChildrenList(List<CategoryDTO> listShow, long id, int level, int status) {
		List<CategoryDTO> showCategory = findByParentIdAndStatus(id, status);
		if (showCategory.size() > 0) {
			for (CategoryDTO parent : showCategory) {
				parent.setLevel(level + 1);
				listShow.add(parent);
				findChildrenList(listShow, parent.getId(), parent.getLevel(), status);
			}
		}
		return null;
	}

	@Override
	@Transactional
	public CategoryDTO update(CategoryDTO dto) {
		List<CategoryDTO> list = findByStatus(1);
		for (CategoryDTO categoryDTO : list) {
			if (dto.getId() != categoryDTO.getId()) {
				if (dto.getName().equals(categoryDTO.getName())) {
					dto.setMessage("Tên danh mục đã tồn tại");
					return dto;
				}
			}
		}

		CategoryEntity oldCategory = categoryRepository.findOne(dto.getId());
		CategoryEntity newCategory = categoryConverter.toEntity(oldCategory, dto);
		categoryConverter.toDto(categoryRepository.save(newCategory));
		dto.setMessage("Cập nhật Thành công !!");
		return dto;

	}

	@Override
	public List<CategoryDTO> findRecursionList() {
		List<CategoryDTO> recursionList = new ArrayList<CategoryDTO>();
		List<CategoryDTO> categoryParentList = findByParentIdAndStatus(0, 1);
		if (categoryParentList.size() > 0) {
			for (CategoryDTO categoryDTO1 : categoryParentList) {
				categoryDTO1.setLevel(0);
				categoryDTO1.setStatus(1);
				recursionList.add(categoryDTO1);
				findChildrenList(recursionList, categoryDTO1.getId(), categoryDTO1.getLevel(),
						categoryDTO1.getStatus());
			}
		}
		for (CategoryDTO categoryDTO2 : recursionList) {
			categoryDTO2.setName(StringUtils.repeat("|----", categoryDTO2.getLevel()) + categoryDTO2.getName());
		}
		return recursionList;
	}

	@Override
	public List<CategoryDTO> findAvailabilityList() {
		List<CategoryDTO> availabilityList = new ArrayList<CategoryDTO>();
		List<CategoryDTO> list = findAll();
		for (CategoryDTO categoryDTO : list) {
			boolean boo = true;
			for (CategoryDTO categoryDTO2 : list) {
				if (categoryDTO.getId() == categoryDTO2.getParentId()) {
					boo = false;

				}
			}
			if (boo == true) {
				if (categoryDTO.getStatus() != 0) {
					availabilityList.add(categoryDTO);
				}
			}
		}
		return availabilityList;
	}

	// load sidebar web trang chu
	@Override
	public String loadSidebar() {
		String result = "";
		List<CategoryDTO> parentList = findByParentIdAndStatus(0, 1);
		if (parentList.size() > 0) {
			for (CategoryDTO category : parentList) {
				result += "<div class='accordion-group'>";
				result += "<div class='accordion-heading'>";
				result += "<a class='accordion-toggle collapsed' data-toggle='collapse' href='#" + category.getId()
						+ "'>" + category.getName() + "</a>";
				result += "</div>";
				result += "<div id='" + category.getId() + "' class='accordion-body collapse'>";
				result += " <div class='accordion-inner'>";
				result += showCatChild(category.getId());
				result += "</div><!-- /.accordion-inner -->";
				result += " </div>";

				result += "</div><!-- /.accordion-inner -->";

			}

		}
		return result;
	}

	private String showCatChild(Long parentId) {
		String link = "";
		String collapse = "";
		String result = "";
		List<CategoryDTO> catList = findByParentIdAndStatus(parentId, 1);
		if (catList.size() > 0) {
			for (CategoryDTO category : catList) {
				List<CategoryDTO> catListChild = findByParentIdAndStatus(category.getId(), 1);
				if (catListChild.size() > 0) {
					link = "#" + category.getId();
					collapse = "collapse";
				} else {
					link = context.getContextPath() + "/danh-muc?id=" + category.getId();
					collapse = "";
				}
				result += "<ul>";
				result += "<li>";
				result += "<div class='accordion-heading' id='showCat" + category.getId() + "'>";
				result += "<a href='" + link + "' data-toggle='" + collapse + "'>" + category.getName() + "</a>";
				result += "</div>";
				result += "<div id=" + category.getId() + " class='accordion-body collapse in'>";

				result +=showCatChild(category.getId());
				result += "</div>";
				result += "</li>";
				result += "</ul>";
			}

		}
		return result;
	}

	@Override
	public List<CategoryDTO> findById(long id) {
		List<CategoryDTO> catList = new ArrayList<CategoryDTO>();
		CategoryEntity catEntity = categoryRepository.findOne(id);
		catList.add(categoryConverter.toDto(catEntity));
		long parentId = catEntity.getParentId();
		while(parentId!=0) {
			CategoryEntity catEntity1 = categoryRepository.findById(parentId);
			catList.add(categoryConverter.toDto(catEntity1));
			parentId = catEntity1.getParentId();
		}
	
		return catList;
	}

	@Override
	public CategoryDTO findOne(long id) {
		CategoryEntity catEntity = categoryRepository.findOne(id);
		return categoryConverter.toDto(catEntity);
	}

	@Override
	public int getTotalItem() {
		return (int)categoryRepository.countByStatus(1);
	}

	@Override
	public CategoryDTO delete(CategoryDTO cat) {
		
		if (findByParentIdAndStatus(cat.getId(), 1).size() > 0) {
			cat.setMessage("Xoa Thất bại. Danh mục " + categoryRepository.findOne(cat.getId()).getName()
					+ " đang có các danh mục con !!");
			return cat;
		}
		CategoryEntity newCategory = categoryRepository.findOne(cat.getId());
		newCategory.setStatus(0);
		categoryRepository.save(newCategory);
		return cat;
		
	}

}
