package com.portfolio.mall.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.portfolio.mall.product.bo.ProductBO;
import com.portfolio.mall.product.model.Product;
import com.portfolio.mall.user.bo.SellerBO;
import com.portfolio.mall.user.model.OrderItems;

@RestController
@RequestMapping("/product")
public class productRestController {
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private SellerBO sellerBO;
		
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
	
	// 구매자 구매완료후 해당 product재고 줄여줌
	@PostMapping("/modifyInventory")
	public Map<String, String> salesEnd(
			@RequestParam("orderId") String orderId){
		List<OrderItems> orderItemsList = productBO.getOrderItemsList(orderId);
		int productId = 0;
		int sellerAmount = 0;
		int amount = 0;
		int count = 0;
		for(OrderItems orderItems:orderItemsList) {
			productId = orderItems.getProductId();
			sellerAmount = orderItems.getProductAmount();
			
			Product product = productBO.getProductById(productId);
			int inventory = product.getAmount();
			amount = inventory - sellerAmount;
			
			count = productBO.updateProductAmount(productId, amount);
		}

		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
