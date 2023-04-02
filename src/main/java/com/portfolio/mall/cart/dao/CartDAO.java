package com.portfolio.mall.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.portfolio.mall.cart.model.Cart;
import com.portfolio.mall.cart.model.CartDecision;

@Repository
public interface CartDAO {
	
	// buyerId로 장바구니페이지에 개별 상품 넣기
	public int insertCart(
			@Param("buyerId") int buyerId
			, @Param("productId") int productId
			, @Param("productAmount") int productAmount
			, @Param("productSumPrice") int productSumPrice
			, @Param("productTotalPrice") int productTotalPrice);
	
	// buyerId로 cartDecision에 개별 상품 넣기
	public int insertCartDecision(
			@Param("buyerId") int buyerId
			, @Param("buyerOrderId") String buyerOrderId
			, @Param("productId") int productId
			, @Param("productAmount") int productAmount
			, @Param("productSumPrice") int productSumPrice
			, @Param("productTotalPrice") int productTotalPrice);

	// 같은 buyer가 같은 product를 추가했는지 조회
	public int selectSameCart(
			@Param("buyerId") int buyerId
			, @Param("productId") int productId);
	
	// 같은 buyer가 같은 product를 cartDecision추가했는지 조회
	public int selectSameCartDecision(
			@Param("buyerId") int buyerId
			, @Param("productId") int productId);

	// buyerId로 cartList 조회하기
	public List<Cart> selectCartList(@Param("buyerId") int buyerId);

	// 장바구니페이지 개별 상품 삭제하기
	public int deleteCart(@Param("cartId") int cartId);
	
	// 장바구니페이지 개별 상품 삭제하기 > cartDecision테이블에서
	public int deleteCartDecision(@Param("cartId") int cartId);
	
	// cartDecision buyerOrderId 수정
	public int updateCartDecision(
			@Param("buyerId") int buyerId
			, @Param("buyerOrderId") String buyerOrderId);
	
	// buyerOrderId로 cartDecisionList 조회
	public List<CartDecision> selectCartDecisionList(@Param("buyerOrderId") String buyerOrderId);
	
	// 장바구니 결제완료 후 cart테이블 같은 buyerId 삭제
	public int deleteCartList(@Param("buyerId") int buyerId);
}
