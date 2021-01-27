package com.demoshop.controller.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demoshop.dto.CategoryDTO;
import com.demoshop.dto.ProductDTO;
import com.demoshop.dto.ProductImageDTO;
import com.demoshop.service.ICategoryService;
import com.demoshop.service.IProductImageService;
import com.demoshop.service.IProductService;

@Controller
public class HomeController {
	@Autowired
	private IProductService productService;

	@Autowired
	private ICategoryService categoryService;

	@Autowired
	private IProductImageService productImageService;

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "searchCatId") Optional<Long> searchCatId, @RequestParam Optional<String> searchKey,
			final RedirectAttributes redirectAttributes) {
		ModelAndView mav = new ModelAndView("/public/home-page");
		ProductDTO model = new ProductDTO();
		model.setPage(page);
		model.setLimit(limit);
		Pageable pageable = new PageRequest(page - 1, limit);

		model.setListResult(productService.findAll(pageable));
		model.setTotalItem(productService.getTotalItem());

		if (model.getListResult().isEmpty()) {
			mav.addObject("messageError", "Ko co ket qua nao duoc tim thay");
		}

		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));

		List<ProductImageDTO> imageList = productImageService.findProductOneImage();

		mav.addObject("imageList", imageList);
		List<ProductImageDTO> imageBanner = new ArrayList<ProductImageDTO>();
		if (!imageList.isEmpty()) {
			for (int i = 0; i < imageList.size(); i++) {
				imageBanner.add(imageList.get(i));
				if (i == 2) {
					break;
				}
			}
		}
		mav.addObject("imageBanner", imageBanner);
		mav.addObject("model", model);
		return mav;

	}

	@RequestMapping(value = "/chi-tiet", method = RequestMethod.GET)
	public String detailPage(@RequestParam(value = "id") long id, final RedirectAttributes redirectAttributes,
			Model model) {
		try {
			ProductDTO product = productService.findOneByIdAndStatus(id, 1);
			model.addAttribute("product", product);
			int newCount = product.getCount() + 1;
			product.setCount(newCount);
			productService.updateCount(product);
			model.addAttribute("error", 0);
		} catch (Exception e) {
			return "/error-404";
		}
		return "/public/detail";
	}

	@RequestMapping(value = "/danh-muc", method = RequestMethod.GET)
	public String categoryPage(@RequestParam(value = "id") long id,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "5") int limit,
			final RedirectAttributes redirectAttributes, Model model) {
		ProductDTO product = new ProductDTO();
		try {
			List<CategoryDTO> catList = new ArrayList<CategoryDTO>();
			CategoryDTO cat = categoryService.findOne(id);
			if (cat.getStatus() != 1) {
				model.addAttribute("error", "Ko tìm thấy danh muc nay");
				return "/public/category";
			}
			catList = categoryService.findById(id);
			Collections.sort(catList, new Comparator<CategoryDTO>() {
				@Override
				public int compare(CategoryDTO cat1, CategoryDTO cat2) {
					if (cat1.getParentId() < cat2.getParentId()) {
						return -1;
					} else {
						if (cat1.getParentId() == cat2.getParentId()) {
							return 0;
						} else {
							return 1;
						}
					}
				}
			});
			product.setCategoryId(cat.getId());
			product.setPage(page);
			product.setLimit(limit);
			Pageable pageable = new PageRequest(page - 1, limit);
			ProductDTO model1 = productService.findByCategory(id, pageable);
			product.setTotalItem(model1.getTotalItem());
			product.setListResult(model1.getListResult());

			product.setTotalPage((int) Math.ceil((double) product.getTotalItem() / product.getLimit()));
			List<ProductImageDTO> imageList = productImageService.findProductOneImage();
			model.addAttribute("imageList", imageList);
			model.addAttribute("product", product);
			model.addAttribute("error", 0);
			model.addAttribute("catList", catList);
			if (product.getListResult().isEmpty()) {
				model.addAttribute("product", product);
				model.addAttribute("error", "Ko tìm thấy sản phẩm nao");
			}

		} catch (Exception e) {
			product.setPage(0);
			product.setTotalPage(0);
			model.addAttribute("product", product);
			model.addAttribute("error", "Ko tìm thấy sản phẩm hoặc danh mục");
			redirectAttributes.addFlashAttribute("messageError", "Lỗi!! Vui lòng thử lại sau");
		}
		return "/public/category";
	}

	@RequestMapping(value = "/tim-kiem", method = RequestMethod.GET)
	public String searchPage(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "5") int limit,
			@RequestParam Optional<String> searchKey, Model model) {
		ProductDTO product = new ProductDTO();
		try {
			product.setPage(page);
			product.setLimit(limit);
			Pageable pageable = new PageRequest(page - 1, limit);
			if (searchKey.isPresent() && StringUtils.isNotBlank(searchKey.get())) {
				ProductDTO model1 = new ProductDTO();

				model1 = productService.getListResultAndTotalItemWithName(searchKey.get(), pageable);
				product.setTotalItem(model1.getTotalItem());
				product.setListResult(model1.getListResult());
				product.setSearchKey(searchKey.get());
			}

			product.setTotalPage((int) Math.ceil((double) product.getTotalItem() / product.getLimit()));

			List<ProductImageDTO> imageList = productImageService.findProductOneImage();
			product.setProImgList(imageList);
			if (product.getListResult().isEmpty()) {
				product.setMessage("Ko có kết quả cần tìm");
			}
			model.addAttribute("product", product);
		} catch (Exception e) {
			product.setMessage("Lỗi !! Vui lòng thử lại sau");
			product.setSearchKey(searchKey.get());
			model.addAttribute("product", product);
		}
		return "/public/search";
	}
}
