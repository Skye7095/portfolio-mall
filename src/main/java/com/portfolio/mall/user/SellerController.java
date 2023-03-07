package com.portfolio.mall.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
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
	public String sellerPersonal() {
		return "/seller/personal";
	}
	
	// 판매회원 판매내역 페이지
	@GetMapping("/contract/view")
	public String sellerContract() {
		return "/seller/contract";
	}
	
	// 판매회원 문의내역 페이지
	@GetMapping("/inquirylist/view")
	public String sellerInquiryList() {
		return "/seller/inquiry";
	}
	// 판매회원 상품관리 페이지
	@GetMapping("/productmanager/view")
	public String sellerProductManager() {
		return "/seller/productmanager";
	}
	
}
