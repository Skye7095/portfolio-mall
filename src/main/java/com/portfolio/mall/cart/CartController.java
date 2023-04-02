package com.portfolio.mall.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.portfolio.mall.cart.bo.CartBO;
import com.portfolio.mall.cart.model.CartDetail;
import com.portfolio.mall.product.bo.ProductBO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/buyer/cart")
public class CartController {
	
	@Autowired
	public CartBO cartBO;

	@Autowired
	public ProductBO productBO;
	// 장바구니 페이지
	@GetMapping("/view")
	public String cartView(
			@RequestParam(value="buyerOrderId", defaultValue="") String buyerOrderId
			, HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int buyerId = (Integer)session.getAttribute("buyerId");

		List<CartDetail> cartDetailList = cartBO.getCartDetailList(buyerId);		
		model.addAttribute("cartDetailList", cartDetailList);
		
		int totalAmount = 0;
		int totalProductPrice = 0;
		int totalDeliveryPrice = 0;
		int sum = 0;
		for(int i = 0; i < cartDetailList.size(); i++) {
			totalAmount += cartDetailList.get(i).getProductCount();
			totalProductPrice += cartDetailList.get(i).getProductCountPrice();
			totalDeliveryPrice += cartDetailList.get(i).getProductDeliveryPrice();
			sum = totalProductPrice + totalDeliveryPrice;
		}
		
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("totalProductPrice", totalProductPrice);
		model.addAttribute("totalDeliveryPrice", totalDeliveryPrice);
		model.addAttribute("sum", sum);
		
		return "/buyer/cart";
	}

	
	
}
