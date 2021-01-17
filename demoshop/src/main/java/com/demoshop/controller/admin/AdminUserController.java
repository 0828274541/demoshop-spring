package com.demoshop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demoshop.converter.admin.UserConverter;
import com.demoshop.dto.UserDTO;
import com.demoshop.service.IUserService;
import com.demoshop.util.SecurityUtils;

@Controller
@RequestMapping("/quan-tri/tai-khoan")
public class AdminUserController {

	@Autowired
	IUserService userService;
	
	@Autowired
	UserConverter userConverter;
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public ModelAndView viewUsers() {
		ModelAndView mav = new ModelAndView("/admin/user/list");
		UserDTO model = new UserDTO();
		long idUser = SecurityUtils.getPrincipal().getId();
		model = userService.findOne(idUser);
		model.setRoleUserLoginList(SecurityUtils.getAuthorities());	
		mav.addObject("model", model);

		if(model.getRoleUserLoginList().contains("ROLE_ADMIN")) {
			model.setListResult(userService.findByIdNotLike(model.getId()));
			
		}
		return mav;
	}
	@RequestMapping(value ="/chinh-sua", method = RequestMethod.POST)
	public ModelAndView editUsers(@ModelAttribute("model")UserDTO modelUser, BindingResult bindingResult, final RedirectAttributes redirectAttributes
			) {
		UserDTO model = new UserDTO();
		try {
			model = userService.update(modelUser);
			redirectAttributes.addFlashAttribute("messageSuccess", "Cập nhật tài khoản "+model.getUsername()+" thành công !!");
		}catch(Exception e) {
			System.out.print(e);
			redirectAttributes.addFlashAttribute("messageError", "Lỗi. Vui lòng thử lại!!");
		}
		return new ModelAndView("redirect:/quan-tri/tai-khoan/list");
	}
}
