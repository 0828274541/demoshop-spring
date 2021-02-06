package com.demoshop.controller.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demoshop.dto.OrderDTO;
import com.demoshop.dto.OrderDetailDTO;
import com.demoshop.util.CartUtils;

@Controller
public class CartController {
	@Autowired
	private CartUtils cartUtils;

	@RequestMapping(value = "/them-vao-gio", method = RequestMethod.GET)
	@ResponseBody
	public String addToCart(HttpServletRequest request) {
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		Long productId = Long.valueOf(request.getParameter("productId"));

		String ajaxResponse = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("username") == null) {
			session.setAttribute("productId", productId);
			return ajaxResponse;
		}

		if (session.getAttribute("order") == null) {
			OrderDTO order = new OrderDTO();
			// Thêm sản phẩm cần mua vào danh sách giỏ hàng
			List<OrderDetailDTO> list = cartUtils.orderDetailList(productId, quantity);
			order.setOrderDetails(list);
			order.setTotalMoney(cartUtils.setTotalMoney(order));
			session.setAttribute("order", order);
			
		} else {
			OrderDTO order = (OrderDTO) session.getAttribute("order");
			boolean boo = false;
			
			// Kiểm tra sản phẩm đã tồn tại hay chưa
			for (OrderDetailDTO orderDetail : order.getOrderDetails()) {
				if (orderDetail.getProducts().getId() == productId) {
					boo = true;
				}
			}
			// Cap nhat so luong, gia tien giỏ hàng
			if (boo == true) {
				for (OrderDetailDTO orderDetail : order.getOrderDetails()) {
					if (orderDetail.getProducts().getId() == productId) {
						orderDetail.setQuantity(quantity + orderDetail.getQuantity());
						order.setTotalMoney(cartUtils.setTotalMoney(order));
					}
				}
			// Thêm sản phẩm cần mua vào danh sách giỏ hàng	
			} else {
				List<OrderDetailDTO> list = cartUtils.orderDetailList(productId, quantity);
				order.getOrderDetails().addAll(list);
				order.setTotalMoney(cartUtils.setTotalMoney(order));
			}
		}
		return ajaxResponse = cartUtils.returnViewCart((OrderDTO) session.getAttribute("order"));
	}
	
	@RequestMapping(value = "/xoa-san-pham", method = RequestMethod.GET)
	@ResponseBody
	public String dellItemOnCart(HttpServletRequest request) {
		Long productId = Long.valueOf(request.getParameter("productId"));
		HttpSession session = request.getSession();
		OrderDTO order = (OrderDTO) session.getAttribute("order");
		order.getOrderDetails().removeIf(item -> item.getProducts().getId() == productId);
		order.setTotalMoney(cartUtils.setTotalMoney(order));
		String ajaxResponse = cartUtils.returnViewCart(order);
		return ajaxResponse;
	}

	@RequestMapping(value = "/thay-doi-so-luong", method = RequestMethod.GET)
	@ResponseBody
	public String changeQuantityItem(HttpServletRequest request) {
		int quantity1 = Integer.parseInt(request.getParameter("quantity1"));
		Long productId = Long.valueOf(request.getParameter("productId"));
		
		List<OrderDetailDTO> list1 = new ArrayList<OrderDetailDTO>(1);
		HttpSession session = request.getSession();
		OrderDTO order = (OrderDTO) session.getAttribute("order");
		for (OrderDetailDTO orderDetail : order.getOrderDetails()) {
			if (orderDetail.getProducts().getId() == productId) {
				orderDetail.setQuantity(quantity1);
				list1.add(orderDetail);
			}
		}
		order.setTotalMoney(cartUtils.setTotalMoney(order));

		OrderDTO order1 = new OrderDTO();
		order1.setTotalMoney(order.getTotalMoney());
		order1.setOrderDetails(list1);
		
		String ajaxResponse = cartUtils.returnViewCart(order1);
		return ajaxResponse;
	}

}
