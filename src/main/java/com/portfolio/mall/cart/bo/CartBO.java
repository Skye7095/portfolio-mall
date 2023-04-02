package com.portfolio.mall.cart.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.mall.cart.dao.CartDAO;
import com.portfolio.mall.cart.model.Cart;
import com.portfolio.mall.cart.model.CartDetail;
import com.portfolio.mall.cart.model.CartSum;
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

	// cartId 기반으로 장바구니 페이지에 상품들 조회하기
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
	
	// 장바구니 페이지의 total 계산하기
	public CartSum getCartSum(int buyerId){
		List<Cart> cartList = cartDAO.selectCartList(buyerId);
		
		CartSum cartSum = new CartSum();
		int totalAmount = 0;
		int totalProductPrice = 0;
		int totalDeliveryPrice = 0;
		int sum = 0;
		for(Cart cart:cartList) {
			int productCount = cart.getProductAmount();
			totalAmount += productCount;
			
			int productId = cart.getProductId();
			Product product = productBO.getProductById(productId);			
			int productPrice = product.getPrice();
			int productCountPrice = productCount * productPrice;
			totalProductPrice += productCountPrice;
			
			int productDeliveryPrice = product.getDeliveryPrice();
			totalDeliveryPrice += productDeliveryPrice;
			
			sum = totalProductPrice + totalDeliveryPrice;
		}
		
		cartSum.setTotalAmount(totalAmount);
		cartSum.setTotalProductPrice(totalProductPrice);
		cartSum.setTotalDeliveryPrice(totalDeliveryPrice);
		cartSum.setSum(sum);
		
		return cartSum;
	}
	
	// 장바구니 페이지 개별 상품 삭제하기
	public int deleteCart(int cartId) {
		return cartDAO.deleteCart(cartId);
	}
	
	// 장바구니 cartId 조회 > cartDesicion insert 편하게
	public Cart getCart(int cartId) {
		return cartDAO.selectCart(cartId);
	};
	
	// 장바구니페이지에서 구매버튼 누르면 order생성하기 > 현재 페이지의 있는 모든 cart정보를 모두 cartDesicion테이블로 insert
	public int addCartDesicion(
			int buyerId
			, int productId
			, int productAmount
			, int productSumPrice
			, int productTotalPrice) {		
		return cartDAO.insertCartDesicion(buyerId, productId, productAmount, productSumPrice, productTotalPrice);
	}
}
