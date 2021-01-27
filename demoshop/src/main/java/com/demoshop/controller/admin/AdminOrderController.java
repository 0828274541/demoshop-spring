package com.demoshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demoshop.dto.OrderDTO;
import com.demoshop.dto.OrderDetailDTO;
import com.demoshop.service.IOrderDetailService;
import com.demoshop.service.IOrderService;

@Controller
@RequestMapping("/quan-tri/don-hang")
public class AdminOrderController {
	@Autowired
	IOrderService orderService;
	@Autowired
	IOrderDetailService orderDetailService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView viewOrder(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "limit", required = false, defaultValue = "5") int limit, Model model) {
		ModelAndView mav = new ModelAndView("/admin/order/list");
		List<OrderDetailDTO> orderDetailList = orderDetailService.findAll();
		Pageable pageable = new PageRequest(page - 1, limit);
		List<OrderDTO> orderList = orderService.findAll(pageable);
		if (orderList.isEmpty()) {
			mav.addObject("messageError", "Ko co ket qua nao duoc tim thay");
		}

		int totalItem = orderService.getTotalItem();
		int totalPage = (int) Math.ceil((double) totalItem / limit);
		model.addAttribute("page", page);
		model.addAttribute("totalItem", totalItem);
		model.addAttribute("totalPage", totalPage);
		mav.addObject("orderList", orderList);
		mav.addObject("orderDetailList", orderDetailList);
		return mav;
	}
}
