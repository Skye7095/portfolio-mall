package com.portfolio.mall.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class productController {
	
	// 개별 상품 전시 페이지
	@GetMapping("/items/view")
	public String productItemsView() {
		return "/product/items";
	}
	
	// 메인페이지
	@GetMapping("/main/view")
	public String mainView() {
		return "/product/main";
	}
	
}
