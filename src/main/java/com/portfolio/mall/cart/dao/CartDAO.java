package com.portfolio.mall.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.portfolio.mall.cart.model.Cart;
import com.portfolio.mall.cart.model.CartDetail;

@Repository
public interface CartDAO {
	
	// buyerId로 장바구니페이지에 개별 상품 넣기
	public int insertCart(
			@Param("buyerId") int buyerId
			, @Param("productId") int productId
			, @Param("productAmount") int productAmount
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
	
	// 장바구니 개별 상품 조회하기> cartDesicion에 insert 편하게
	public Cart selectCart(@Param("cartId") int cartId);
	
	// 장바구니페이지에서 구매버튼 누르면 order생성하기 > 현재 페이지의 있는 모든 cart정보를 모두 cartDesicion테이블로 insert
	public int insertCartDesicion(
			@Param("buyerId") int buyerId
			, @Param("productId") int productId
			, @Param("productAmount") int productAmount
			, @Param("productSumPrice") int productSumPrice
			, @Param("productTotalPrice") int productTotalPrice);
}
