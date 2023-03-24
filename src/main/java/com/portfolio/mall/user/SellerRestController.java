package com.portfolio.mall.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.portfolio.mall.user.bo.SellerBO;
import com.portfolio.mall.user.model.Seller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/seller")
public class SellerRestController {
	
	@Autowired
	public SellerBO sellerBO;
	
	// seller 회원가입
	@PostMapping("/signup")
	public Map<String, String> sellersignup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email){
		
		int count = sellerBO.addSeller(loginId, password, name, phoneNumber, email);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == -1) {
			result.put("result", "exists");
		}else if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	// seller 회원가입시 id 중복확인
	@GetMapping("/duplicated_id")
	public Map<String, Boolean> duplicatedId(
			@RequestParam("loginId") String loginId){
		
		boolean isDuplicatedById = sellerBO.isDuplicated(loginId);
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(isDuplicatedById == true) {
			result.put("is_duplicated", true);
		}else {
			result.put("is_duplicated", false);
		}
		
		return result;
	}
	
	// seller 로그인
	@PostMapping("/signin")
	public Map<String, String>  signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request){
		
		Seller seller = sellerBO.getSellerByIdPw(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(seller != null) {
			HttpSession session = request.getSession();
			session.setAttribute("sellerId", seller.getId());
			session.setAttribute("sellerName", seller.getName());
			
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// seller 아이디 찾기-phone
	@PostMapping("/findId/phone")
	public String findIdByPhone(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber){
		return sellerBO.getSellerIDByPhone(name, phoneNumber);		
	}
	
	// seller 아이디 찾기-email
	@PostMapping("/findId/email")
	public String findIdByEmail(
			@RequestParam("name") String name
			, @RequestParam("email") String email){
		
		return sellerBO.getSellerIDByEmail(name, email);
	}
	
	// seller 전화번호로 비밀번호 리셋하기
	@PostMapping("/resetPW/phone")
	public Map<String, String> resetpwByPhone(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		String newPW = sellerBO.getSellerPWByPhone(name, phoneNumber);
		
		Map<String, String> result = new HashMap<>();
		if(newPW == "0") {	
			result.put("result", "fail");
		}else {
			result.put("result", "success");
			result.put("newPW", newPW);
		}
		
		return result;
	}
	
	// seller 비밀번호 찾기-email
	@PostMapping("/resetPW/email")
	public Map<String, String> resetpwByEmail(
			@RequestParam("name") String name
			, @RequestParam("email") String email) {
		String newPW = sellerBO.getSellerPWByEmail(name, email);
		
		Map<String, String> result = new HashMap<>();
		if(newPW == "0") {
			result.put("result", "fail");
		}else {
			result.put("result", "success");
			result.put("newPW", newPW);
		}
		
		return result;
	}
}
