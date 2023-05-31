package com.portfolio.mall.product.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.portfolio.mall.common.FileManagerService;
import com.portfolio.mall.product.dao.ProductDAO;
import com.portfolio.mall.product.model.Product;
import com.portfolio.mall.user.model.OrderItems;

@Service
public class ProductBO {

	@Autowired
	private ProductDAO productDAO;
	
	// 상품 업로드
	public int addProduct(
			int sellerId
			, MultipartFile productFile
			, String category
			, String name
			, int price
			, int amount
			, int deliveryPrice
			, String introduction
			, MultipartFile detailsFile) {
		String productImgPath = FileManagerService.saveFile(sellerId, productFile);
		
		String detailsImgPath = FileManagerService.saveFile(sellerId, detailsFile);
		
		return productDAO.insertProduct(sellerId, productImgPath, category, name, price, amount, deliveryPrice, introduction, detailsImgPath);
	}
		
	// product 구체내용 불러오기 > 개별상품페이지에서 detail를 확인
	public Product getProductById(int id){
		return productDAO.selectProductById(id);
	};
		
	// 같은 sellerId인 관련상품 조회하기
	public List<Product> getProductList(int sellerId) {
		return productDAO.selectProductList(sellerId);
	}
	
	// 메인페이지 상품 조회
	public List<Product> getProduct(){		
		return productDAO.selectProduct();
	}
	
	// 상품을 카테고리 별로 조회
	public List<Product> getProductByCategory(String category){
		return productDAO.selectProductByCategory(category);
	}
	
	// 상품 키워드로 검색
	public List<Product> getProductByKeyword(String keyword){
		return productDAO.selectProductByKeyword(keyword);
	}
	
	// 상품 재고수량 수정
	public int updateProductAmount(
			int id
			, int amount) {
		return productDAO.updateProductAmount(id, amount);
	}
	
	// 상품 수정
	public int modifyProduct(
			int id
			, int sellerId
			, String category
			, String name
			, int price
			, int amount
			, int deliveryPrice
			, String introduction) {
		
		return productDAO.updateProduct(id, sellerId, category, name, price, amount, deliveryPrice, introduction);
	}
	
	// 판매된 상품들 조회
	public List<OrderItems> getOrderItemsListById(int productId){
		return productDAO.selectOrderItemsListById(productId);
	}
	
	// 판매된 상품 전체 조회
	public List<OrderItems> getOrderItemsList(String orderId){
		return productDAO.selectOrderItemsList(orderId);
	}
}
