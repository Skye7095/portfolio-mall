package com.portfolio.mall.product;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.portfolio.mall.product.bo.ProductBO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/product")
public class productRestController {
	
	@Autowired
	private ProductBO productBO;
		
	// 상품 업로드
	@PostMapping("/upload")
	public Map<String, Object> productUpload(
			@RequestParam("productFile") MultipartFile productFile
			, @RequestParam("category") String category
			, @RequestParam("name") String name
			, @RequestParam("price") int price
			, @RequestParam("amount") int amount
			, @RequestParam("deliveryPrice") int deliveryPrice
			, @RequestParam(value="introduction", required=false) String introduction
			, @RequestParam("detailsFile") MultipartFile detailsFile
			, HttpServletRequest request){
		
		// 로그인된 seller의 테이블 id 컬럽 값
		HttpSession session = request.getSession();
				
		int sellerId = (Integer) session.getAttribute("sellerId");
		
		int count = productBO.addProduct(sellerId, productFile, category, name, price, amount, deliveryPrice, introduction, detailsFile);
		
		Map<String, Object> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 상품 수정
	@PostMapping("/modify")
	public Map<String, Object> productModify(
			@RequestParam("id") int id
			, @RequestParam("category") String category
			, @RequestParam("name") String name
			, @RequestParam("price") int price
			, @RequestParam("amount") int amount
			, @RequestParam("deliveryPrice") int deliveryPrice
			, @RequestParam(value="introduction", required=false) String introduction
			, HttpServletRequest request){
		HttpSession session = request.getSession();
		int sellerId = (Integer) session.getAttribute("sellerId");
		
		int count = productBO.modifyProduct(id, sellerId, category, name, price, amount, deliveryPrice, introduction);
		
		Map<String, Object> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
