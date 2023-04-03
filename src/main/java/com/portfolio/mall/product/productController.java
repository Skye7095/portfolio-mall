package com.portfolio.mall.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.portfolio.mall.product.bo.ProductBO;
import com.portfolio.mall.product.model.Product;
import com.portfolio.mall.user.bo.SellerBO;
import com.portfolio.mall.user.model.Seller;

@Controller
@RequestMapping("/product")
public class productController {
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private SellerBO sellerBO;
	
	// 상품업로드 페이지
	@GetMapping("/upload/view")
	public String sellerProductUpload() {		
		return "/product/upload";
	}
	
	// 개별 상품 전시 페이지
	@GetMapping("/items/view")
	public String productItemsView(
			@RequestParam(value="id", defaultValue="1") int id
			, Model model) {
		Product product = productBO.getProductById(id);
		model.addAttribute(product);
		
		int sellerId = product.getSellerId();
		Seller seller = sellerBO.getSeller(sellerId);
		model.addAttribute(seller);

		return "/product/items";
	}
	
	// 메인페이지
	@GetMapping("/main/view")
	public String mainView(Model model) {
		List<Product> productList = productBO.getProduct();
		model.addAttribute("productList", productList);
		
		return "/product/main";
	}
	
	// 카테고리
	@GetMapping("/category/view")
	public String categoryView(
			@RequestParam(value="category", defaultValue="패션·의류·잡화") String category
			, Model model) {		
		List<Product> productList = productBO.getProductByCategory(category);
		model.addAttribute("productList", productList);
		
		return "/product/category";
	}
	
}
