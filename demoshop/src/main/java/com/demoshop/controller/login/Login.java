package com.demoshop.controller.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demoshop.dto.UserDTO;
import com.demoshop.service.IUserService;

@Controller
public class Login {
	@Autowired
	IUserService userService;
	
	@RequestMapping(value ="/dang-nhap", method = RequestMethod.GET)
	public ModelAndView viewLogin() {
		ModelAndView mav = new ModelAndView("login/login");
		return mav;
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("login/error-403");
	}
	
	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView register(@ModelAttribute(value = "user") UserDTO user) {
		ModelAndView mav = new ModelAndView("login/register");
			mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
	public String Submitregister(@ModelAttribute(value = "user") UserDTO user, final RedirectAttributes redirectAttributes,Model model1) {
		
		UserDTO model = new UserDTO();
		try {
			model = userService.add(user);
			if (model.isBooReturn() == false) {
				model1.addAttribute("messageError", model.getMessage());
				
			} else {
				redirectAttributes.addFlashAttribute("messageSuccess", "Đăng ký Thành công !!!");
				return "redirect:/dang-nhap";
			}
		} catch (Exception e) {
			model1.addAttribute("messageError", "Lỗi. Xin thử lại");
			System.out.println(e);
			
		}
		return "login/register";
	}
}
