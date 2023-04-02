package com.portfolio.mall.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.portfolio.mall.cart.bo.CartBO;
import com.portfolio.mall.cart.model.CartDecision;
import com.portfolio.mall.product.bo.ProductBO;
import com.portfolio.mall.user.bo.BuyerBO;
import com.portfolio.mall.user.model.Buyer;
import com.portfolio.mall.user.model.NonMember;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/buyer")
public class BuyerRestController {
	
	@Autowired
	public BuyerBO buyerBO;
	
	@Autowired
	public ProductBO productBO;
	
	@Autowired
	public CartBO cartBO;
	
	// buyer 회원가입
	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email){
		
		// buyer 회원가입
		int count = buyerBO.addBuyer(loginId, password, name, phoneNumber, email);
		
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
	
	// buyer 회원가입시 ID 중복확인
	@GetMapping("/duplicated_id")
	public Map<String, Boolean> duplicatedId(@RequestParam("loginId") String loginId){
		
		boolean isDuplicatedById = buyerBO.isDuplicated(loginId);
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(isDuplicatedById == true) {
			result.put("is_duplicated", true);
		}else {
			result.put("is_duplicated", false);
		}
		
		
		return result;
	}
	
	// buyer 로그인
	@PostMapping("/signin")
	public Map<String, String>  signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request){
		
		Buyer buyer = buyerBO.getBuyerByIdPw(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(buyer != null) {
			HttpSession session = request.getSession();
			session.setAttribute("buyerId", buyer.getId());
			session.setAttribute("buyerName", buyer.getName());
			
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// buyer 아이디 찾기-phone
	@PostMapping("/findId/phone")
	public String findIdByPhone(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber){
		return buyerBO.getBuyerIDByPhone(name, phoneNumber);		
	}
	
	// buyer 아이디 찾기-email
	@PostMapping("/findId/email")
	public String findIdByEmail(
			@RequestParam("name") String name
			, @RequestParam("email") String email){
		
		return buyerBO.getBuyerIDByEmail(name, email);
	}
	
	// buyer 전화번호로 비밀번호 리셋하기
	@PostMapping("/resetPW/phone")
	public Map<String, String> resetpwByPhone(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		String newPW = buyerBO.getBuyerPWByPhone(name, phoneNumber);
		
		Map<String, String> result = new HashMap<>();
		if(newPW == "0") {	
			result.put("result", "fail");
		}else {
			result.put("result", "success");
			result.put("newPW", newPW);
		}
		
		return result;
	}
	
	// buyer 비밀번호 찾기-email
	@PostMapping("/resetPW/email")
	public Map<String, String> resetpwByEmail(
			@RequestParam("name") String name
			, @RequestParam("email") String email) {
		String newPW = buyerBO.getBuyerPWByEmail(name, email);
		
		Map<String, String> result = new HashMap<>();
		if(newPW == "0") {
			result.put("result", "fail");
		}else {
			result.put("result", "success");
			result.put("newPW", newPW);
		}
		
		return result;
	}

	// 비회원 구매내역 조회
	@PostMapping("/non-member/lookup")
	public Map<String, String> nonMemberLookup(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("orderPassword") String orderPassword){
		
		NonMember nonMember = buyerBO.getNonMember(name, phoneNumber, orderPassword);
		
		Map<String, String> result = new HashMap<>();
		
		if(nonMember != null) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 비회원 주문비번 찾기
	@PostMapping("/non-member/findOrderPW")
	public Map<String, String> nonMemberFindPW(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("orderId") int orderId){
		
		NonMember nonMember = buyerBO.getNonMemberByOrderId(name, phoneNumber, orderId);
		String orderPW = nonMember.getOrderPassword();
		
		Map<String, String> result = new HashMap<>();
		
		if(nonMember != null) {
			result.put("result", "success");
			result.put("orderPW", orderPW);
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// buyer Personal 페이지에서 변경
	@PostMapping("/personal/update")
	public Map<String, String> modifyBuyer(
			@RequestParam("password") String password
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email
			, HttpServletRequest request){
		HttpSession session = request.getSession();
		int id = (Integer)session.getAttribute("buyerId");
		
		int count = buyerBO.updateBuyer(id, password, phoneNumber, email);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// buyer 결제정보 입력하기
	@PostMapping("/purchasing/createOrder")
	public Map<String, String> createBuyerOrder(
			@RequestParam("buyerOrderId") String buyerOrderId
			, @RequestParam("receiverName") String receiverName
			, @RequestParam("receiverPhoneNumber") String receiverPhoneNumber
			, @RequestParam("receiverAddress") String receiverAddress
			, @RequestParam("depositorName") String depositorName
			, @RequestParam("sum") int sum
			, HttpServletRequest request){
		HttpSession session = request.getSession();
		int buyerId = (Integer)session.getAttribute("buyerId");
		
		String status = "결제완료";
		int count = buyerBO.addBuyerOrder(buyerId, buyerOrderId, receiverName, receiverPhoneNumber, receiverAddress, depositorName, sum, status);
		
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
	
	// buyer가 구매완료 후 장바구니 전체 삭제
	@PostMapping("/clearAllCart")
	public Map<String, String> clearAllCart(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int buyerId = (Integer)session.getAttribute("buyerId");
		
		int count = cartBO.allClearCart(buyerId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count >= 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
}