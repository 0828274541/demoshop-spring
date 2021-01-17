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

import com.demoshop.dto.OrderDTO;
import com.demoshop.dto.OrderDetailDTO;
import com.demoshop.dto.ProductImageDTO;
import com.demoshop.dto.UserDTO;
import com.demoshop.service.IOrderService;
import com.demoshop.service.IProductImageService;
import com.demoshop.service.IUserService;

@Controller
public class CartController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IProductImageService productImageService;
	@Autowired
	private IOrderService orderService;
	@RequestMapping(value = "/gio-hang", method = RequestMethod.GET)
	public String viewCart(HttpServletRequest request, Model model) {
		int totalMoney = 0;
		List<OrderDetailDTO> cart = new ArrayList<>();
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			cart = (List<OrderDetailDTO>) session.getAttribute("cart");
		}

		if (cart.size() > 0) {
			for (OrderDetailDTO od : cart) {

				if (od.getProducts().getSalePrice() != 0) {
					totalMoney += od.getProducts().getSalePrice() * od.getQuantity();
				} else {
					totalMoney += od.getProducts().getPrice() * od.getQuantity();
				}

			}
		}

		List<ProductImageDTO> imageList = productImageService.findProductOneImage();
		model.addAttribute("imageList", imageList);
		model.addAttribute("cart", cart);
		model.addAttribute("totalMoney", totalMoney);
		return "/public/cart";
	}

	@RequestMapping(value = "/dat-hang", method = RequestMethod.GET)
	public String viewOrder(HttpServletRequest request, Model model) {
		int totalMoney = 0;
		List<OrderDetailDTO> cartList = new ArrayList<>();
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			cartList = (List<OrderDetailDTO>) session.getAttribute("cart");
		}

		if (cartList.size() > 0) {
			for (OrderDetailDTO od : cartList) {

				if (od.getProducts().getSalePrice() != 0) {
					totalMoney += od.getProducts().getSalePrice() * od.getQuantity();
				} else {
					totalMoney += od.getProducts().getPrice() * od.getQuantity();
				}

			}
		}

		String name = (String) session.getAttribute("username");
		UserDTO user = new UserDTO();
		if(!StringUtils.isEmpty(name)) {
			user = userService.findByName(name);
		}
		OrderDTO order = new OrderDTO();
		order.setUser(user);
		order.setDiscount(0);
		order.setPaymentMethod("Thanh toán tại nhà");
		order.setTotalMoney(totalMoney);
		model.addAttribute("order", order);
		model.addAttribute("cartList", cartList);
		return "/public/check-out";
	}

	@RequestMapping(value = "/dat-hang", method = RequestMethod.POST)
	public String submitOrder(HttpServletRequest request,@ModelAttribute(value= "order")OrderDTO order, BindingResult bindingResult,Model model) {
		
		try {
			OrderDTO result = new OrderDTO();
			HttpSession session = request.getSession();
			 List<OrderDetailDTO> list = (List<OrderDetailDTO>) session.getAttribute("cart");	 
			 for (OrderDetailDTO orderDetailDTO : list) {
				 if(orderDetailDTO.getProducts().getSalePrice() !=0) {
					 orderDetailDTO.setPrice(orderDetailDTO.getProducts().getSalePrice());
				 }else {
					 orderDetailDTO.setPrice(orderDetailDTO.getProducts().getPrice());
				 }
			}
			 order.setOrderDetails(list);
			 result = orderService.add(order);
			 session.removeAttribute("productId");
			session.removeAttribute("quantity");
			session.removeAttribute("cart");
			model.addAttribute("message", "Đặt hàng thành công. Mã đơn hàng là: "+result.getId());
		}catch(Exception e) {
			model.addAttribute("message", "Lỗi !! Vui lòng thử lại sau nhé!!");
			System.out.println(e);
		}
		return "/public/check-out";
	}
	
	@RequestMapping(value = "/xem-don-hang", method = RequestMethod.GET)
	public String checkOrder(HttpServletRequest request, Model model) {
		try {
			HttpSession session = request.getSession();
			String name = (String) session.getAttribute("username");
			UserDTO user = new UserDTO();
			List<OrderDTO> orderList = new ArrayList<OrderDTO>();
			if(!StringUtils.isEmpty(name)) {
				orderList = orderService.findByUser(name);			
			}	
			List<OrderDetailDTO> orderDetailList = new ArrayList<OrderDetailDTO>();
			for (OrderDTO orderDTO : orderList) {
				for (OrderDetailDTO orderDetailDTO2 : orderDTO.getOrderDetails()) {
					orderDetailList.add(orderDetailDTO2);
				}
			}
			
			model.addAttribute("orderDetailList", orderDetailList);
			model.addAttribute("orderList", orderList);
		}catch(Exception e) {
			model.addAttribute("message", "Lỗi vui lòng thử lại sau!!");
			System.out.println(e);
		}
		return "public/check-order";
	}
}
