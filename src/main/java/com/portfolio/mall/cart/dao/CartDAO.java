package com.portfolio.mall.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.portfolio.mall.cart.model.Cart;

@Repository
public interface CartDAO {
	
	// buyerId로 장바구니페이지에 개별 상품 넣기
	public int insertCart(
			@Param("buyerId") int buyerId
			, @Param("sellerId") int sellerId
			, @Param("productId") int productId
			, @Param("productPrice") int productPrice
			, @Param("productAmount") int productAmount
			, @Param("productDeliveryPrice") int productDeliveryPrice
			, @Param("productSumPrice") int productSumPrice
			, @Param("productTotalPrice") int productTotalPrice);

	// 같은 buyer가 같은 product를 추가했는지 조회
	public int selectSameCart(
			@Param("buyerId") int buyerId
			, @Param("productId") int productId);
	
	// buyerId로 cartList 조회하기
	public List<Cart> selectCartList(@Param("buyerId") int buyerId);

	// 장바구니페이지 개별 상품 삭제하기
	public int deleteCart(@Param("cartId") int cartId);
		
	// 장바구니 결제완료 후 cart테이블 같은 buyerId 삭제
	public int deleteCartList(@Param("buyerId") int buyerId);
	
	
	// 개별 cart 조회
	public Cart selectCart(@Param("cartId") int cartId);
	
	// 결제완료시 장바구니 리스트를 buyerOrderDetail테이블에 insert
	public int insertBuyerOrderDetail(
			@Param("buyerOrderId") String buyerOrderId
			, @Param("status") String status);
}
