package com.portfolio.mall.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/buyer")
public class BuyerController {
	
	// 구매회원가입 페이지
	@GetMapping("/signup/view")
	public String buyerSignupView() {
		return "/buyer/signup";
	}
		
	// 구매회원 로그인 페이지
	@GetMapping("/signin/view")
	public String buyerSigninView() {
		return "/buyer/signin";
	}
	
	// 구매회원 아이디 찾기 페이지
	@GetMapping("/findID/view")
	public String buyerFindIDView() {
		return "/buyer/findID";
	}
	
	// 구매회원 비밀번호 찾기 페이지
	@GetMapping("/resetPW/view")
	public String buyerFindPWView() {
		return "/buyer/resetPW";
	}
	
	// 구매회원 나의정보 페이지
	@GetMapping("/personal/view")
	public String buyerPersonal() {
		return "/buyer/personal";
	}
	
	// 구매회원 전체주문내역 페이지
	@GetMapping("/orderhistory/view")
	public String buyerOrderhistory() {
		return "/buyer/orderHistory";
	}
	
	// 구매회원 나의관림 페이지
	@GetMapping("/like/view")
	public String buyerLike() {
		return "/buyer/like";
	}
	
	// 구매회원 내가 쓴 글(문의/답변) 페이지
	@GetMapping("/mybbs/myinquerylist/view")
	public String buyerInquery() {
		return "/buyer/inquery";
	}
	
	// 구매회원 내가 쓴 글(상품평) 페이지
	@GetMapping("/mybbs/myreviewlist/view")
	public String buyerReview() {
		return "/buyer/review";
	}
	
	// 구매회원 출석체크 페이지
	@GetMapping("/attendence/view")
	public String buyerAttendence() {
		return "/buyer/attendence";
	}

}
