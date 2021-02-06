package com.demoshop.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.demoshop.dto.OrderDTO;
import com.demoshop.dto.OrderDetailDTO;
import com.demoshop.dto.ProductDTO;
import com.demoshop.service.IProductImageService;
import com.demoshop.service.IProductService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
@Component
public class CartUtils {
	@Autowired
	private IProductService productService;
	@Autowired
	private IProductImageService productImageService;
	
	public  int setTotalMoney(OrderDTO order) {
		int sum = 0;
		for (OrderDetailDTO item : order.getOrderDetails()) {
			sum += item.getPrice() * item.getQuantity();
		}
		return sum;
	}

	public  List<OrderDetailDTO> orderDetailList(Long productId, int quantity) {
		List<OrderDetailDTO> list = new ArrayList<OrderDetailDTO>();
		// Lấy ra thông tin sản phẩm cần cho vào giỏ
		ProductDTO productDetail = productService.findOneByIdAndStatus(productId, 1);
		// Thêm vào chi tiết đơn hàng số lượng, sản phẩm, giá tiền hiện tại, ảnh đại
		// diện của sản
		// phẩm
		OrderDetailDTO orderDetail = new OrderDetailDTO();
		orderDetail.setProducts(productDetail);
		orderDetail.setQuantity(quantity);
		if (productDetail.getSalePrice() != 0) {
			orderDetail.setPrice(productDetail.getSalePrice());
		} else {
			orderDetail.setPrice(productDetail.getPrice());
		}
		orderDetail.setImage(productImageService.findAvatarProduct(productId).getName());
		list.add(orderDetail);
		return list;
	}
	public String returnViewCart(OrderDTO order) {
		String ajaxResponse = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			ajaxResponse = mapper.writeValueAsString(order);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;

	}

}
