package com.demoshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demoshop.service.ICategoryService;
import com.demoshop.service.IOrderService;
import com.demoshop.service.IProductService;
import com.demoshop.service.IUserService;
import com.demoshop.util.SecurityUtils;

@Controller
public class AdminIndexController {
	@Autowired
	ICategoryService categoryService;
	@Autowired
	IProductService productService;
	@Autowired
	IUserService userService;
	@Autowired
	IOrderService orderService;

	@RequestMapping(value = "/quan-tri/trang-chu", method = RequestMethod.GET)
	public String viewAdminIndex(Model model) {

		List<String> roles = SecurityUtils.getAuthorities();
		if (roles.contains("ROLE_USER")) {
			return "redirect:/quan-tri/tai-khoan/list";
		}
		model.addAttribute("countCategory", categoryService.getTotalItem());
		model.addAttribute("countProduct", productService.getTotalItem());
		model.addAttribute("countUser", userService.getTotalItem());
		model.addAttribute("countOrder", orderService.getTotalItem());
		return "admin/index";
	}

}
