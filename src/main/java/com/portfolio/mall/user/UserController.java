package com.portfolio.mall.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	// 구매회원가입 페이지
	@GetMapping("/buyer/signup/view")
	public String buyerSignupView() {
		return "/buyer/signup";
	}
	
	// 판매회원가입 페이지
	@GetMapping("/seller/signup/view")
	public String sellerSignupView() {
		return "/seller/signup";
	}
	
	// 구매회원 로그인 페이지
	@GetMapping("/buyer/signin/view")
	public String buyerSigninView() {
		return "/buyer/signin";
	}
	
	// 판매회원 로그인 페이지
	@GetMapping("/seller/signin/view")
	public String sellerSigninView() {
		return "/seller/signin";
	}
	
	// 비회원 조회 페이지
	@GetMapping("/non-member/lookup/view")
	public String non_memberLookupView() {
		return "/non-member/lookup";
	}
	
	// 구매회원 아이디 찾기 페이지
	@GetMapping("/buyer/findID/view")
	public String buyerFindIDView() {
		return "/buyer/findID";
	}
	
	// 구매회원 비밀번호 찾기 페이지
	@GetMapping("/buyer/resetPW/view")
	public String buyerFindPWView() {
		return "/buyer/resetPW";
	}
	
	// 판매회원 아이디 찾기 페이지
		@GetMapping("/seller/findID/view")
		public String sellerFindIDView() {
			return "/seller/findID";
		}
		
	// 판매회원 비밀번호 찾기 페이지
	@GetMapping("/seller/resetPW/view")
	public String sellerFindPWView() {
		return "/seller/resetPW";
	}
	
	// 비회원 주문비밀버호 찾기
	@GetMapping("/non-member/lookupPW/view")
	public String non_memberLookupPWView() {
		return "/non-member/findOrderPW";
	}
}
