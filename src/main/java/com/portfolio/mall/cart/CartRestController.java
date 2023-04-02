package com.portfolio.mall.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.portfolio.mall.cart.bo.CartBO;
import com.portfolio.mall.cart.model.Cart;
import com.portfolio.mall.cart.model.CartDetail;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/buyer/cart")
public class CartRestController {
	
	@Autowired
	public CartBO cartBO;

	// buyer가 개별상품을 장바구니에 담기
	@PostMapping("/add")
	public Map<String, String> buyerAddCart(
			@RequestParam("productId") int productId
			, @RequestParam("productAmount") int productAmount
			, @RequestParam("productSumPrice") int productSumPrice
			, @RequestParam("productTotalPrice") int productTotalPrice
			, HttpServletRequest request){

		HttpSession session = request.getSession();
		int buyerId = (Integer)session.getAttribute("buyerId");
		
		int addCount = cartBO.addCart(buyerId, productId, productAmount, productSumPrice, productTotalPrice);

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
	
	// buyer가 개별상품을 장바구니에 담기
	@PostMapping("/addDecision")
	public Map<String, String> buyerAddCartDecision(
			@RequestParam("productId") int productId
			, @RequestParam("buyerOrderId") String buyerOrderId
			, @RequestParam("productAmount") int productAmount
			, @RequestParam("productSumPrice") int productSumPrice
			, @RequestParam("productTotalPrice") int productTotalPrice
			, HttpServletRequest request){

		HttpSession session = request.getSession();
		int buyerId = (Integer)session.getAttribute("buyerId");
		
		int addCount = cartBO.addCartDecision(buyerId, buyerOrderId, productId, productAmount, productSumPrice, productTotalPrice);

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
	
	// 장바구니 개별 삭제 > cartDecision테이블에서
	@PostMapping("/deleteDecision")
	public Map<String, String> deleteCartDecision(@RequestParam("cartId") int cartId){

		int count = cartBO.deleteCartDecision(cartId);

		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}

		return result;	
	}
		
	// 장바구니페이지에서 구매버튼 누르면 order생성하기 > 현재 페이지의 있는 모든 cart정보를 모두 cartDesicion테이블로 insert
	@PostMapping("/cartDecision")
	public Map<String, String> addCartDesicion(
			@RequestParam("buyerOrderId") String buyerOrderId
			, HttpServletRequest request){

		HttpSession session = request.getSession();
		int buyerId = (Integer)session.getAttribute("buyerId");
		
		int count = cartBO.updateCartDecision(buyerId, buyerOrderId);
		
		Map<String, String> result = new HashMap<>();
		if(count >= 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}

		return result;		
	}
}
