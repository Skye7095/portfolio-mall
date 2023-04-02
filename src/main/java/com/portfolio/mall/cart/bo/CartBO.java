package com.portfolio.mall.cart.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.mall.cart.dao.CartDAO;
import com.portfolio.mall.cart.model.Cart;
import com.portfolio.mall.cart.model.CartDecision;
import com.portfolio.mall.cart.model.CartDecisionDetail;
import com.portfolio.mall.cart.model.CartDetail;
import com.portfolio.mall.product.bo.ProductBO;
import com.portfolio.mall.product.model.Product;

@Service
public class CartBO {
	
	@Autowired
	public CartDAO cartDAO;

	@Autowired
	public ProductBO productBO;

	// buyerId 기반으로 장바구니 페이지에 상품 추가하기
	public int addCart(
			int buyerId
			, int productId
			, int productAmount
			, int productSumPrice
			, int productTotalPrice) {

		int cartCount = 0;

		// 같은 buyer가 같은 product를 추가했는지
		int sameCartCount = cartDAO.selectSameCart(buyerId, productId);

		if(sameCartCount != 0) {
			// 이미 추가된 상태
			cartCount = -1;
		}else {
			cartCount = cartDAO.insertCart(buyerId, productId, productAmount, productSumPrice, productTotalPrice);
		}

		return cartCount;
	}
	
	// buyerId 기반으로 장바구니 페이지에 상품 추가하기
	public int addCartDecision(
			int buyerId
			, String buyerOrderId
			, int productId
			, int productAmount
			, int productSumPrice
			, int productTotalPrice) {

		int cartCount = 0;
		
		// 같은 buyer가 같은 product를 추가했는지
		int sameCartCount = cartDAO.selectSameCartDecision(buyerId, productId);

		if(sameCartCount != 0) {
			// 이미 추가된 상태
			cartCount = -1;
		}else {
			cartCount = cartDAO.insertCartDecision(buyerId, buyerOrderId, productId, productAmount, productSumPrice, productTotalPrice);
		}

		return cartCount;
	}

	// buyerId 기반으로 장바구니 페이지에 상품들 조회하기
	public List<CartDetail> getCartDetailList(int buyerId){
		List<Cart> cartList = cartDAO.selectCartList(buyerId);

		List<CartDetail> cartDetailList = new ArrayList<>();
		for(Cart cart:cartList) {
			CartDetail cartDetail = new CartDetail();

			int cartId = cart.getId();
			cartDetail.setId(cartId);

			int productId = cart.getProductId();
			cartDetail.setProductId(productId);

			Product product = productBO.getProductById(productId);
			cartDetail.setProductImgPath(product.getProductImgPath());
			cartDetail.setProductName(product.getName());

			int productCount = cart.getProductAmount();
			cartDetail.setProductCount(productCount);

			int productPrice = product.getPrice();
			cartDetail.setProductPrice(productPrice);

			int productDeliveryPrice = product.getDeliveryPrice();
			cartDetail.setProductDeliveryPrice(productDeliveryPrice);

			int productCountPrice = productCount * productPrice;
			cartDetail.setProductCountPrice(productCountPrice);

			cartDetailList.add(cartDetail);
		}

		return cartDetailList;
	}

	// 장바구니 페이지 개별 상품 삭제하기
	public int deleteCart(int cartId) {
		return cartDAO.deleteCart(cartId);
	}
	
	// 장바구니 페이지 개별 상품 삭제하기 > cartDecision테이블에서
	public int deleteCartDecision(int cartId) {
		return cartDAO.deleteCartDecision(cartId);
	}

	// 장바구니페이지에서 구매버튼 누르면 order생성하기 > cartDecision의 buyerOrderId를 수정
	public int updateCartDecision(
			int buyerId
			, String buyerOrderId) {		
		return cartDAO.updateCartDecision(buyerId, buyerOrderId);
	}
	
	// buyerOrderId 기반으로 장바구니 리스트에 상품들 조회하기
	public List<CartDecisionDetail> getCartDecisionDetailList(String buyerOrderId){
		List<CartDecision> cartDecisiontList = cartDAO.selectCartDecisionList(buyerOrderId);
		
		List<CartDecisionDetail> cartDecisionDetailList = new ArrayList<>();
		for(CartDecision cartDecision:cartDecisiontList) {
			CartDecisionDetail cartDecisionDetail = new CartDecisionDetail();
			
			int cartId = cartDecision.getId();
			cartDecisionDetail.setId(cartId);
			
			int buyerId = cartDecision.getBuyerId();
			cartDecisionDetail.setBuyerId(buyerId);
			
			int productId = cartDecision.getProductId();
			cartDecisionDetail.setProductId(productId);
			
			Product product = productBO.getProductById(productId);
			String productImgPath = product.getProductImgPath();
			cartDecisionDetail.setProductImgPath(productImgPath);
			
			String productName = product.getName();
			cartDecisionDetail.setProductName(productName);
			
			int productPrice = product.getPrice();
			cartDecisionDetail.setProductPrice(productPrice);
			
			int productAmount = cartDecision.getProductAmount();
			cartDecisionDetail.setProductAmount(productAmount);
			
			int productSumPrice = cartDecision.getProductSumPrice();
			cartDecisionDetail.setProductSumPrice(productSumPrice);
			
			int productDeliveryPrice = product.getDeliveryPrice();
			cartDecisionDetail.setProductDeliveryPrice(productDeliveryPrice);
			
			int productTotalPrice = cartDecision.getProductTotalPrice();
			cartDecisionDetail.setProductTotalPrice(productTotalPrice);
			
			cartDecisionDetailList.add(cartDecisionDetail);
		}
		
		return cartDecisionDetailList;
	}
	
	// 장바구니 결제완료 후 cart테이블 같은 buyerId 삭제
	public int allClearCart(int buyerId) {
		return cartDAO.deleteCartList(buyerId);
	}
}
