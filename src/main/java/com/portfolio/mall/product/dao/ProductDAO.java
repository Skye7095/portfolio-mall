package com.portfolio.mall.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.portfolio.mall.product.model.Product;
import com.portfolio.mall.user.model.OrderItems;

@Repository
public interface ProductDAO {
	
	// product 업로드
	public int insertProduct(
			@Param("sellerId") int sellerId
			, @Param("productImgPath") String productImgPath
			, @Param("category") String category
			, @Param("name") String name
			, @Param("price") int price
			, @Param("amount") int amount
			, @Param("deliveryPrice") int deliveryPrice
			, @Param("introduction") String introduction
			, @Param("detailsImgPath") String detailsImgPath);
		
	// product 구체내용 조회하기
	public Product selectProductById(@Param("id") int id);
	
	// 같은 sellerId인 상품 조회
	public List<Product> selectProductList(@Param("sellerId") int sellerId);
	
	// 메인페이지 조회
	public List<Product> selectProduct();

	// 상품을 카테고리 별로 조회
	public List<Product> selectProductByCategory(@Param("category") String category);
	
	// 상품을 키워드로 조회
	public List<Product> selectProductByKeyword(@Param("keyword") String keyword);
	
	// 상품 재고 0으로 수정하기 > seller가 판매중지하고 싶은 경우
	public int updateProductAmount(@Param("id") int id, @Param("amount") int amount);
	
	// 상품 수정
	public int updateProduct(
			@Param("id") int id
			, @Param("sellerId") int sellerId
			, @Param("category") String category
			, @Param("name") String name
			, @Param("price") int price
			, @Param("amount") int amount
			, @Param("deliveryPrice") int deliveryPrice
			, @Param("introduction") String introduction);
	
	// 판매된 상품 조회
	public List<OrderItems> selectOrderItemsListById(@Param("productId") int productId);
	
	// 판매된 상품 전체 조회
	public List<OrderItems> selectOrderItemsList(@Param("orderId") String orderId);
}
