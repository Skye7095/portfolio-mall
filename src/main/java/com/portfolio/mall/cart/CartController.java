package com.portfolio.mall.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.portfolio.mall.cart.bo.CartBO;
import com.portfolio.mall.cart.model.CartDetail;
import com.portfolio.mall.cart.model.CartSum;
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
			HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int buyerId = (Integer)session.getAttribute("buyerId");
		
		List<CartDetail> cartDetailList = cartBO.getCartDetailList(buyerId);		
		model.addAttribute("cartDetailList", cartDetailList);
		
		CartSum cartSum = cartBO.getCartSum(buyerId);
		model.addAttribute("cartSum", cartSum);
		return "/buyer/cart";
	}
	
	
}
