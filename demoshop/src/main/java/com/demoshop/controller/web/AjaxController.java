package com.demoshop.controller.web;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demoshop.dto.OrderDetailDTO;
import com.demoshop.dto.ProductDTO;
import com.demoshop.dto.ProductImageDTO;
import com.demoshop.service.IProductImageService;
import com.demoshop.service.IProductService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AjaxController {
	@Autowired
	private IProductService productService;
	@Autowired
	private IProductImageService productImageService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/them-vao-gio", method = RequestMethod.POST)
	public @ResponseBody String addToCart(HttpServletRequest request) {
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		Long productId = Long.valueOf(request.getParameter("productId"));

		String ajaxResponse = "";
		List<OrderDetailDTO> cart = new ArrayList<>();
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			cart = (ArrayList<OrderDetailDTO>) session.getAttribute("cart");

		}

		ProductDTO productDetail = productService.findOneByIdAndStatus(productId, 1);

		if (session.getAttribute("username") == null) {
			ajaxResponse = "1";
			session.setAttribute("productId", productId);
			session.setAttribute("quantity", quantity);
			return ajaxResponse;
		}

		boolean boo = false;
		for (OrderDetailDTO orderDetail : cart) {
			if (orderDetail.getProducts().getId() == productId) {
				boo = true;
			}
		}
		if (boo == true) {
			for (OrderDetailDTO orderDetail : cart) {
				if (orderDetail.getProducts().getId() == productId) {
					orderDetail.setQuantity(quantity + orderDetail.getQuantity());
					ajaxResponse = "2";
				}
			}
		} else {
			OrderDetailDTO od = new OrderDetailDTO();
			od.setProducts(productDetail);
			od.setQuantity(quantity);

			List<ProductImageDTO> imgList = productImageService.findProductOneImage();
			for (ProductImageDTO productImageDTO : imgList) {
				if (od.getProducts().getId() == productImageDTO.getProductId()) {
					od.setImage(productImageDTO.getName());
				}
			}
			cart.add(od);
			session.setAttribute("cart", cart);
			ajaxResponse = "2";
		}
		return ajaxResponse;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gio-hang-mini", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String viewCartMini(HttpServletRequest request) {
		OrderDetailDTO od = new OrderDetailDTO();
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		String cartMini = "";
		int totalMoney = 0;
		Locale locale = new Locale("vi", "VN");
		NumberFormat format = NumberFormat.getCurrencyInstance(locale);
		List<OrderDetailDTO> cart = new ArrayList<>();
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			cart = (ArrayList<OrderDetailDTO>) session.getAttribute("cart");
		}

		cartMini += "<div class='basket-item-count'>";
		cartMini += "<span class='count'>" + cart.size() + "</span>";

		cartMini += "<img src='" + request.getContextPath() + "/template/public/assets/images/icon-cart.png' alt='' />";
		cartMini += "</div>";
		cartMini += " <div class='total-price-basket'>";
		cartMini += "<span class='lbl'>your cart:</span>";
		cartMini += "<span class='total-price'>";

		if (cart.size() > 0) {
			for (OrderDetailDTO od1 : cart) {

				if (od1.getProducts().getSalePrice() != 0) {
					totalMoney += od1.getProducts().getSalePrice() * od1.getQuantity();
				} else {
					totalMoney += od1.getProducts().getPrice() * od1.getQuantity();
				}

			}
		}
		cartMini += "<span class='value'>" + format.format(totalMoney) + "</span>";
		cartMini += "</span>";
		cartMini += " </div>";
		od.setCartMini(cartMini);

		String cartMiniDetail = "";
		for (OrderDetailDTO orderDetail : cart) {
			cartMiniDetail += "<li id=" + orderDetail.getProducts().getId() + ">";
			cartMiniDetail += "<div class='basket-item'>";
			cartMiniDetail += "<div class='row'>";
			cartMiniDetail += "<div class='col-xs-4 col-sm-4 no-margin text-center'>";

			cartMiniDetail += "<div class='thumb'>";
			cartMiniDetail += "<a href='" + request.getContextPath() + "/chi-tiet?id="
					+ orderDetail.getProducts().getId() + "'>";

			List<ProductImageDTO> imgList = productImageService.findProductOneImage();
			if (imgList.size() > 0) {
				for (ProductImageDTO productImageDTO : imgList) {
					if (productImageDTO.getProductId() == orderDetail.getProducts().getId()) {
						cartMiniDetail += "<img  height='50px' width='50px' src='${pageContext.request.contextPath}/uploads/"
								+ productImageDTO.getName() + "' />";

					}
				}
			}
			cartMiniDetail += "</a>";
			cartMiniDetail += "</div>";

			cartMiniDetail += "</div>";
			cartMiniDetail += "<div class='col-xs-8 col-sm-8 no-margin'>";
			cartMiniDetail += "<div class='title'>";
			cartMiniDetail += "<a href='" + request.getContextPath() + "/chi-tiet?id="
					+ orderDetail.getProducts().getId() + "'>";
			cartMiniDetail += orderDetail.getProducts().getName() + "</a>";
			cartMiniDetail += "</div>";
			if (orderDetail.getProducts().getSalePrice() != 0) {
				cartMiniDetail += "<div class='price'>" + format.format(orderDetail.getProducts().getSalePrice())
						+ " x " + orderDetail.getQuantity() + "</div>";
			} else {
				cartMiniDetail += "<div class='price'>" + format.format(orderDetail.getProducts().getPrice()) + " x "
						+ orderDetail.getQuantity() + "</div>";
			}
			cartMiniDetail += "</div>";
			cartMiniDetail += "</div>";
			cartMiniDetail += "<a class='close-btn xoa' id='" + orderDetail.getProducts().getId()
					+ "' onclick='dellItem(this)' href='#'>Xoa</a>";
			cartMiniDetail += "</div>";
			cartMiniDetail += "</li>";
			od.setCartMiniDetail(cartMiniDetail);
		}

		try

		{
			ajaxResponse = mapper.writeValueAsString(od);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/xoa-san-pham", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String dellItemOnCart(HttpServletRequest request) {
		Long productId = Long.valueOf(request.getParameter("productId"));

		HttpSession session = request.getSession();
		List<OrderDetailDTO> cart = new ArrayList<>();
		if (session.getAttribute("cart") != null) {
			cart = (ArrayList<OrderDetailDTO>) session.getAttribute("cart");
		}
		if (cart.size() > 0) {
			for (int i = 0; i < cart.size(); i++) {

				if (cart.get(i).getProducts().getId() == productId) {

					cart.remove(i);
				}
			}
		}

		session.setAttribute("cart", cart);
		int totalMoney = 0;

		for (OrderDetailDTO od : cart) {

			if (od.getProducts().getSalePrice() != 0) {
				totalMoney += od.getProducts().getSalePrice() * od.getQuantity();
			} else {
				totalMoney += od.getProducts().getPrice() * od.getQuantity();
			}

		}

		Locale locale = new Locale("vi", "VN");
		NumberFormat format = NumberFormat.getCurrencyInstance(locale);

		String AjaxResponse = format.format(totalMoney);
		return AjaxResponse;

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/thay-doi-so-luong", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String changeQuantityItem(HttpServletRequest request) {
		OrderDetailDTO od = new OrderDetailDTO();
		ObjectMapper mapper = new ObjectMapper();

		int price = 0;
		Locale locale = new Locale("vi", "VN");
		NumberFormat format = NumberFormat.getCurrencyInstance(locale);

		int quantity1 = Integer.parseInt(request.getParameter("quantity1"));
		Long productId = Long.valueOf(request.getParameter("productId"));

		List<OrderDetailDTO> cart = new ArrayList<>();
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			cart = (ArrayList<OrderDetailDTO>) session.getAttribute("cart");
		}
		if (cart.size() > 0) {
			for (OrderDetailDTO orderDetail : cart) {
				if (orderDetail.getProducts().getId() == productId) {
					orderDetail.setQuantity(quantity1);

				}
				if (orderDetail.getProducts().getSalePrice() != 0) {
					price = orderDetail.getProducts().getSalePrice();
				} else {
					price = orderDetail.getProducts().getPrice();
				}
			}
		}
		session.setAttribute("cart", cart);
		od.setPriceShow(format.format(price) + " x " + quantity1);

		int totalMoney = 0;
		if (cart.size() > 0) {
			for (OrderDetailDTO od1 : cart) {

				if (od1.getProducts().getSalePrice() != 0) {
					totalMoney += od1.getProducts().getSalePrice() * od1.getQuantity();
				} else {
					totalMoney += od1.getProducts().getPrice() * od1.getQuantity();
				}

			}
		}
		od.setTotalMoney(format.format(totalMoney));
		String ajaxResponse = "";
		try

		{
			ajaxResponse = mapper.writeValueAsString(od);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}
}
