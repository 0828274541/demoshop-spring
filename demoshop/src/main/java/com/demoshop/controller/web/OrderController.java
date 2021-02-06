package com.demoshop.controller.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demoshop.dto.OrderDTO;
import com.demoshop.dto.UserDTO;
import com.demoshop.service.IOrderService;
import com.demoshop.service.IUserService;

@Controller
public class OrderController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IOrderService orderService;

	@RequestMapping(value = "/gio-hang", method = RequestMethod.GET)
	public String viewCart() {
		return "/public/cart";
	}

	@RequestMapping(value = "/dat-hang", method = RequestMethod.GET)
	public String viewOrder(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		OrderDTO order = (OrderDTO) session.getAttribute("order");
		String name = (String) session.getAttribute("username");
		if (name == null) {
			return "redirect:dang-nhap";
		} else {
			if (order != null) {
				UserDTO user = userService.findByName(name);
				order.setUser(user);
				order.setDiscount(0);
				order.setPaymentMethod("Thanh toán tại nhà");

			}
		}
		model.addAttribute("order", order);
		return "/public/check-out";
	}

	@RequestMapping(value = "/dat-hang", method = RequestMethod.POST)
	public String submitOrder(HttpServletRequest request, @ModelAttribute(value = "order") OrderDTO order,
			BindingResult bindingResult, Model model, final RedirectAttributes redirectAttributes) {
		try {
			HttpSession session = request.getSession();
			OrderDTO order1 = (OrderDTO) session.getAttribute("order");
			order.setOrderDetails(order1.getOrderDetails());
			Long idOrder = orderService.add(order);
			session.removeAttribute("productId");
			session.removeAttribute("order");
			redirectAttributes.addFlashAttribute("message", "Đặt hàng thành công. Mã đơn hàng là: " + idOrder);
		} catch (Exception e) {
			model.addAttribute("message", "Lỗi !! Vui lòng thử lại sau nhé!!");
			System.out.println(e);
		}
		return "redirect:xem-don-hang";
	}

	@RequestMapping(value = "/xem-don-hang", method = RequestMethod.GET)
	public String checkOrder(HttpServletRequest request, Model model) {
		try {
			String name = (String) request.getSession().getAttribute("username");
			List<OrderDTO> orderList = new ArrayList<OrderDTO>();
			if (!StringUtils.isEmpty(name)) {
				orderList = orderService.findByUser(name);
			}
			model.addAttribute("orderList", orderList);
		} catch (Exception e) {
			model.addAttribute("message", "Lỗi vui lòng thử lại sau!!");
			System.out.println(e);
		}
		return "public/check-order";
	}
}
