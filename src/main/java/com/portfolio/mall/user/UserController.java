package com.portfolio.mall.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	// 회원가입 페이지
	@GetMapping("/signup/view")
	public String signupView() {
		return "/common/signup";
	}
}
