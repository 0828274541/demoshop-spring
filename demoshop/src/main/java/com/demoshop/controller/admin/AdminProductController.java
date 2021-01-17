package com.demoshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
@RequestMapping(value = "/quan-tri/san-pham")
public class AdminProductController {

	@Autowired
	private IProductService productService;

	@Autowired
	private ICategoryService categoryService;

	@Autowired
	private IProductImageService productImageService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView viewProduct(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "5") int limit,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "searchCatId") Optional<Long> searchCatId,
			@RequestParam Optional<String> searchKey,
			final RedirectAttributes redirectAttributes) {
		ModelAndView mav = new ModelAndView("/admin/product/list");
		ProductDTO model = new ProductDTO();
		model.setPage(page);
		model.setLimit(limit);
		Pageable pageable = new PageRequest(page - 1, limit);
	    if(searchKey.isPresent() && StringUtils.isNotBlank(searchKey.get())){
	    	if(searchCatId.isPresent() && searchCatId.get() != 0) {
	    		ProductDTO model1 = new ProductDTO();
	    		model1 = productService.getListResultAndTotalItemWithNameAndCategory(searchKey.get(), searchCatId.get(), pageable);
	    		model.setTotalItem(model1.getTotalItem());
	    		model.setListResult(model1.getListResult());
	    		model.setSearchKey(searchKey.get());
	    		model.setSearchCatId(searchCatId.get());
	    	}else {
	    		ProductDTO model1 = new ProductDTO();

	    		model1 = productService.getListResultAndTotalItemWithName(searchKey.get(), pageable);
	    		model.setTotalItem(model1.getTotalItem());
	    		model.setListResult(model1.getListResult());
	    		model.setSearchKey(searchKey.get());
	    	}
	    	
	    } else {
	    	model.setListResult(productService.findAll(pageable));
	    	model.setTotalItem(productService.getTotalItem());
	    	model.setSearchCatId((long) 0);
	    }
		
		if(model.getListResult().isEmpty()) {
			mav.addObject("messageError", "Ko co ket qua nao duoc tim thay");
		}
		
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		List<ProductImageDTO> imageList = productImageService.findAll();
		List<CategoryDTO> availabilityList = categoryService.findAvailabilityList();
		mav.addObject("categoryList", availabilityList);
		mav.addObject("imageList", imageList);
		mav.addObject("model", model);
		return mav;
	}

	@RequestMapping(value = "/them", method = RequestMethod.GET)
	public ModelAndView viewAddProduct(@ModelAttribute(value = "productDTO") ProductDTO productDTO) {
		ModelAndView mav = new ModelAndView("/admin/product/add");

		List<CategoryDTO> availabilityList = categoryService.findAvailabilityList();

		mav.addObject("categoryList", availabilityList);
		mav.addObject("productDTO", productDTO);

		return mav;
	}

	@RequestMapping(value = "/them", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("productDTO") ProductDTO pro, BindingResult bindingResult,
			final RedirectAttributes redirectAttributes) {
		/*
		 * SimpleDateFormat formaDate = new SimpleDateFormat("yyyy-MM-dd"); String
		 * releaseDate = formaDate.format(pro.getReleaseDate());
		 * pro.setReleaseDate(formaDate.parse(releaseDate));
		 */
		ProductDTO model = new ProductDTO();
		try {
			model = productService.add(pro);
			if (model.isBooReturn()) {
				redirectAttributes.addFlashAttribute("messageError", model.getMessage());
				redirectAttributes.addFlashAttribute("productDTO", model);
				return "redirect:/quan-tri/san-pham/list";
			} else {
				redirectAttributes.addFlashAttribute("messageSuccess", "Thanh cong !!!");
				return "redirect:/quan-tri/san-pham/them";
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("messageError", "Lỗi. Xin thử lại");
			return "redirect:/quan-tri/san-pham/list";
		}

	}

	@RequestMapping(value = "/chinh-sua", method = RequestMethod.GET)
	public ModelAndView viewEditProduct(@ModelAttribute("productDTO") ProductDTO pro) {
		ModelAndView mav = new ModelAndView("/admin/product/edit");
		List<CategoryDTO> availabilityList = categoryService.findAvailabilityList();
		mav.addObject("categoryList", availabilityList);
		ProductDTO model = new ProductDTO();
		model = productService.findOneByIdAndStatus(pro.getId(), 1);
		model.setPage(pro.getPage());
		mav.addObject("product", model);
		return mav;

	}

	@RequestMapping(value = "/chinh-sua", method = RequestMethod.POST)
	public String editProduct(@ModelAttribute("product") ProductDTO pro, BindingResult bindingResult, final RedirectAttributes redirectAttributes) {
		ProductDTO model = new ProductDTO();
		try {
			model = productService.update(pro);
			if (model.isBooReturn()) {
				redirectAttributes.addAttribute("page", pro.getPage()).addFlashAttribute("messageSuccess", model.getMessage());
				return "redirect:/quan-tri/san-pham/list";
			} else {
				redirectAttributes.addFlashAttribute("messageError", model.getMessage());
				redirectAttributes.addFlashAttribute("productDTO", model);
				/* redirectAttributes.addAttribute("id", model.getId()); */
				return "redirect:/quan-tri/san-pham/chinh-sua";
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("messageError", "Lỗi. Xin thử lại");
			return "redirect:/quan-tri/san-pham/chinh-sua";
		}
		
	}

	@RequestMapping(value = "/xoa", method = RequestMethod.GET)
	public String deleteProduct(@ModelAttribute("product") ProductDTO pro,
			final RedirectAttributes redirectAttributes) {
		try {
			productService.delete(pro);
			redirectAttributes.addAttribute("page", pro.getPage()).addFlashAttribute("messageSuccess", "Xóa thành công..");

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("messageError", "Lỗi. Xin thử lại");
		}
		return "redirect:/quan-tri/san-pham/list";
	}
}
