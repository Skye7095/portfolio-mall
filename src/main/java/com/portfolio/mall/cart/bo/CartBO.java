package com.portfolio.mall.cart.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.mall.cart.dao.CartDAO;
import com.portfolio.mall.cart.model.Cart;
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
			, int sellerId
			, int productId
			, int productPrice
			, int productAmount
			, int productDeliveryPrice
			, int productSumPrice
			, int productTotalPrice) {

		int cartCount = 0;

		// 같은 buyer가 같은 product를 추가했는지
		int sameCartCount = cartDAO.selectSameCart(buyerId, productId);

		if(sameCartCount != 0) {
			// 이미 추가된 상태
			cartCount = -1;
		}else {
			cartCount = cartDAO.insertCart(buyerId, sellerId, productId, productPrice, productAmount, productDeliveryPrice, productSumPrice, productTotalPrice);
		}

		return cartCount;
	}

	// buyerId 기반으로 장바구니 페이지에 상품들 조회하기
	public List<CartDetail> getCartDetailList(int buyerId){
		List<Cart> cartList = cartDAO.selectCartList(buyerId);
		
		List<CartDetail> cartDetailList = new ArrayList<>();
		for(Cart cart:cartList) {
			CartDetail cartDetail = new CartDetail();
			
			int id = cart.getId();
			cartDetail.setId(id);
			
			int productId = cart.getProductId();
			cartDetail.setProductId(productId);
			
			Product product = productBO.getProductById(productId);
			int productOriginPrice = product.getPrice();
			cartDetail.setProductOriginPrice(productOriginPrice);
			
			String productImgPath = product.getProductImgPath();
			cartDetail.setProductImgPath(productImgPath);
			
			String productOriginName = product.getName();
			cartDetail.setProductOriginName(productOriginName);
			
			int productPrice = cart.getProductPrice();
			cartDetail.setProductPrice(productPrice);
			
			int productAmount = cart.getProductAmount();
			cartDetail.setProductAmount(productAmount);
			
			int productDeliveryPrice = cart.getProductDeliveryPrice();
			cartDetail.setProductDeliveryPrice(productDeliveryPrice);
			
			int productSumPrice = cart.getProductSumPrice();
			cartDetail.setProductSumPrice(productSumPrice);

			int productTotalPrice = cart.getProductTotalPrice();
			cartDetail.setProductTotalPrice(productTotalPrice);
			
			cartDetailList.add(cartDetail);
		}
		
		return cartDetailList;
	}

	// 장바구니 페이지 개별 상품 삭제하기
	public int deleteCart(int cartId) {
		return cartDAO.deleteCart(cartId);
	}
	
	// 장바구니 결제완료 후 cart테이블 같은 buyerId 삭제
	public int allClearCart(int buyerId) {
		return cartDAO.deleteCartList(buyerId);
	}
	
	// cart 개별 조회
	public Cart getCart(int cartId) {
		return cartDAO.selectCart(cartId);
	}
	
	// 결제완료후 장바구니 리스트를 buyerOrderDetail 테이블에 insert
	public int addBuyerOrderDetail(
			String buyerOrderId
			, String status) {
		
		return cartDAO.insertBuyerOrderDetail(buyerOrderId, status);
	}
}
