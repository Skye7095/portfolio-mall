package com.portfolio.mall.cart;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.portfolio.mall.cart.bo.CartBO;
import com.portfolio.mall.product.bo.ProductBO;
import com.portfolio.mall.product.model.Product;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/buyer/cart")
public class CartRestController {
	
	@Autowired
	public CartBO cartBO;
	
	@Autowired
	public ProductBO productBO;

	// buyer가 개별상품을 장바구니에 담기
	@PostMapping("/add")
	public Map<String, String> buyerAddCart(
			@RequestParam("productId") int productId
			, @RequestParam("productPrice") int productPrice
			, @RequestParam("productAmount") int productAmount
			, @RequestParam("productDeliveryPrice") int productDeliveryPrice
			, @RequestParam("productSumPrice") int productSumPrice
			, @RequestParam("productTotalPrice") int productTotalPrice
			, HttpServletRequest request){

		HttpSession session = request.getSession();
		int buyerId = (Integer)session.getAttribute("buyerId");
		
		Product product = productBO.getProductById(productId);
		int sellerId = product.getSellerId();
		
		int addCount = cartBO.addCart(buyerId, sellerId, productId, productPrice, productAmount, productDeliveryPrice, productSumPrice, productTotalPrice);

		Map<String, String> result = new HashMap<>();
		if(addCount == -1) {
			result.put("result", "exists");
		}else if(addCount == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}

		return result;	
	}
	
	// 장바구니 개별 삭제
	@PostMapping("/delete")
	public Map<String, String> deleteCart(@RequestParam("cartId") int cartId){

		int count = cartBO.deleteCart(cartId);

		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}

		return result;	
	}
	
	// 결제완료할 때 장바구니 list를 모두 buyerOrderDetail테이블에 insert
	@PostMapping("/createOrder")
	public Map<String, String> createOrder(
			@RequestParam("buyerOrderId") String buyerOrderId
			, @RequestParam("status") String status){
		
		int count = cartBO.addBuyerOrderDetail(buyerOrderId, status);
				
		Map<String, String> result = new HashMap<>();
		if(count >= 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}

		return result;	
	}
}
