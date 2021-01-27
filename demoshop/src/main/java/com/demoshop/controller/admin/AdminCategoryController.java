package com.demoshop.controller.admin;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demoshop.dto.CategoryDTO;
import com.demoshop.service.ICategoryService;

@Controller
@RequestMapping(value = "/quan-tri/danh-muc")
public class AdminCategoryController {

	@Autowired
	ICategoryService categoryService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView viewCategory(@RequestParam(value = "message", required = false) String message) {
		ModelAndView mav = new ModelAndView("/admin/category/list");
		CategoryDTO categoryDTO = new CategoryDTO();
		List<CategoryDTO> recursionList = categoryService.findRecursionList();
		if (StringUtils.isNotEmpty(message)) {
			mav.addObject("message", message);
		}
		categoryDTO.setListResult(recursionList);
		mav.addObject("categoryDTO", categoryDTO);
		return mav;
	}

	@RequestMapping(value = "/chinh-sua", method = RequestMethod.GET)
	public ModelAndView viewEditCategory(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("/admin/category/edit");
		CategoryDTO categoryDTO = new CategoryDTO();
		categoryDTO = categoryService.findByIdAndStatus(id, 1);
		List<CategoryDTO> recursionList = categoryService.findRecursionList();
		categoryDTO.setListResult(recursionList);
		mav.addObject("categoryDTO", categoryDTO);
		return mav;
	}

	@RequestMapping(value = "/them", method = RequestMethod.GET)
	public ModelAndView viewAddCategory() {
		ModelAndView mav = new ModelAndView("/admin/category/add");
		CategoryDTO categoryDTO = new CategoryDTO();
		List<CategoryDTO> recursionList = categoryService.findRecursionList();
		categoryDTO.setListResult(recursionList);
		mav.addObject("categoryDTO", categoryDTO);
		return mav;
	}

	@RequestMapping(value = "/them", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("categoryDTO") CategoryDTO cat,
			final RedirectAttributes redirectAttributes, Model model12) {

		CategoryDTO model = new CategoryDTO();
		try {
			model = categoryService.add(cat);
			if (!model.getMessage().equals("Thêm mới Thành công !!")) {
				model12.addAttribute("messageError", model.getMessage());
				model.setListResult(categoryService.findRecursionList());
				model12.addAttribute("categoryDTO", model);
				return "/admin/category/add";
			} else {
				redirectAttributes.addFlashAttribute("messageSuccess", "Thanh cong !!!");
				return "redirect:/quan-tri/danh-muc/list";
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("messageError", "Lỗi. Xin thử lại");
			return "redirect:/quan-tri/danh-muc/list";
		}

	}

	@RequestMapping(value = "/chinh-sua", method = RequestMethod.POST)
	public String editCategory(@ModelAttribute("categoryDTO") CategoryDTO cat,
			final RedirectAttributes redirectAttributes, Model model12) {
		CategoryDTO model = new CategoryDTO();
		try {
			model = categoryService.update(cat);
			if (model.getMessage().equals("Cập nhật Thành công !!")) {
				redirectAttributes.addFlashAttribute("messageSuccess", model.getMessage());
				return "redirect:/quan-tri/danh-muc/list";
			} else {
				model12.addAttribute("messageError", model.getMessage());
				model.setListResult(categoryService.findRecursionList());
				model12.addAttribute("categoryDTO", model);
				return "/admin/category/edit";
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("messageError", "Lỗi. Xin thử lại");
			return "redirect:/quan-tri/danh-muc/chinh-sua";
		}

	}

	@RequestMapping(value = "/xoa", method = RequestMethod.GET)
	public String deleteCategory(@ModelAttribute("category") CategoryDTO cat,
			final RedirectAttributes redirectAttributes) {
		try {
			categoryService.delete(cat);
			if (!StringUtils.isEmpty(cat.getMessage())) {
				redirectAttributes.addFlashAttribute("messageError", cat.getMessage());
			} else {
				redirectAttributes.addFlashAttribute("messageSuccess", "Xóa thành công..");
			}

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("messageError", "Lỗi. Xin thử lại");
		}
		return "redirect:/quan-tri/danh-muc/list";
	}
}
