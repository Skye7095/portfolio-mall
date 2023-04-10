package com.portfolio.mall.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.portfolio.mall.user.model.SellerContract;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	public SellerBO sellerBO;
	
	@Autowired
	public ProductBO productBO;
	
	// 판매회원가입 페이지
	@GetMapping("/signup/view")
	public String sellerSignupView() {
		return "/seller/signup";
	}
		
	// 판매회원 로그인 페이지
	@GetMapping("/signin/view")
	public String sellerSigninView() {
		return "/seller/signin";
	}
	
	// 판매회원 로그아웃
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("sellerId");
		session.removeAttribute("sellerName");
		
		return "redirect:/product/main/view";
	}
	
	// 판매회원 아이디 찾기 페이지
	@GetMapping("/findID/view")
	public String sellerFindIDView() {
		return "/seller/findID";
	}
		
	// 판매회원 비밀번호 찾기 페이지
	@GetMapping("/resetPW/view")
	public String sellerFindPWView() {
		return "/seller/resetPW";
	}
	
	// 판매회원 나의정보 페이지
	@GetMapping("/personal/view")
	public String sellerPersonal(
			HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int id = (Integer)session.getAttribute("sellerId");
		
		Seller sellerList = sellerBO.getSeller(id);
		model.addAttribute("sellerList", sellerList);
		
		return "/seller/personal";
	}
	
	// 판매회원 판매내역 페이지
	@GetMapping("/contract/view")
	public String sellerContract(
			HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int sellerId = (Integer)session.getAttribute("sellerId");
		
		List<SellerContract> sellerContractList = sellerBO.getSellerContractList(sellerId);		
		model.addAttribute("sellerContractList", sellerContractList);
		
		int salesAmount = 0;	// 판매 금액 > 주문생성되면 판매금액 누적
		int income = 0;		// 배송완료된 상태인 주문들의 금액 누적
		for(int i = 0; i < sellerContractList.size(); i++) {
			salesAmount += sellerContractList.get(i).getProductTotalPrice();
			
			String status = sellerContractList.get(i).getStatus();
			if(status == "배송완료") {
				income += sellerContractList.get(i).getProductTotalPrice();
			}
		}
		model.addAttribute("salesAmount", salesAmount);
		model.addAttribute("income", income);
		
		return "/seller/contract";
	}
	
	// 판매회원 상품관리 페이지
	@GetMapping("/productmanager/view")
	public String sellerProductManager(
			HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int sellerId = (Integer)session.getAttribute("sellerId");
		
		List<Product> productList = productBO.getProductList(sellerId);
		model.addAttribute("productList", productList);
		
		return "/seller/productmanager";
	}
	
	// 이미 등록된 상품을 수정
	@GetMapping("/productmodify/view")
	public String sellerProductManager(
			@RequestParam("id") int id
			, Model model) {
		
		Product product = productBO.getProductById(id);
		model.addAttribute("product", product);
		
		return "/product/modify";
	}
}
