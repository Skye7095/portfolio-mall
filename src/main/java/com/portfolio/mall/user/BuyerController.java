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

import com.portfolio.mall.cart.bo.CartBO;
import com.portfolio.mall.cart.model.CartDetail;
import com.portfolio.mall.user.bo.BuyerBO;
import com.portfolio.mall.user.model.Buyer;
import com.portfolio.mall.user.model.OrderDetail;
import com.portfolio.mall.user.model.OrderReceiver;

@Controller
@RequestMapping("/buyer")
public class BuyerController {
	
	@Autowired
	private BuyerBO buyerBO;

	
	@Autowired
	private CartBO cartBO;
	
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
	
	// 구매회원 로그아웃
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("buyerId");
		session.removeAttribute("buyerName");
		
		return "redirect:/product/main/view";
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
	public String buyerPersonal(
			HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int id = (Integer)session.getAttribute("buyerId");
		
		Buyer buyerList = buyerBO.getBuyerById(id);
		model.addAttribute("buyerList", buyerList);
		
		return "/buyer/personal";
	}
	
	// 구매회원 전체주문내역 페이지
	@GetMapping("/orderhistory/view")
	public String buyerOrderhistory(
			HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int buyerId = (Integer)session.getAttribute("buyerId");
		
		List<OrderDetail> orderDetailList = buyerBO.getOrderDetailList(buyerId);
		model.addAttribute("orderDetailList", orderDetailList);
		
		return "/buyer/orderHistory";
	}
	
	// 구매회원 주문결제 페이지
	@GetMapping("/purchasing/view")
	public String buyerPurchasingView(
			HttpServletRequest request
			, Model model) {		
		HttpSession session = request.getSession();
		int buyerId = (Integer)session.getAttribute("buyerId");
		
		Buyer buyer = buyerBO.getBuyerById(buyerId);
		model.addAttribute("buyer", buyer);
		
		List<CartDetail> cartDetailList = cartBO.getCartDetailList(buyerId);
		model.addAttribute("cartDetailList", cartDetailList);
			
		int totalAmount = 0;
		int totalProductPrice = 0;
		int totalDeliveryPrice = 0;
		int sum = 0;
		for(int i = 0; i < cartDetailList.size(); i++) {
			totalAmount += cartDetailList.get(i).getProductAmount();
			totalProductPrice += cartDetailList.get(i).getProductSumPrice();
			totalDeliveryPrice += cartDetailList.get(i).getProductDeliveryPrice();
			sum = totalProductPrice + totalDeliveryPrice;
		}
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("totalProductPrice", totalProductPrice);
		model.addAttribute("totalDeliveryPrice", totalDeliveryPrice);
		model.addAttribute("sum", sum);
		
		return "/buyer/purchasing";
	}
	
	// buyer주문완료 페이지
	@GetMapping("/purchaseCompleted/view")
	public String purchasingCompletedView(
			@RequestParam(value="orderId", defaultValue="") String orderId
			, HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int buyerId = (Integer)session.getAttribute("buyerId");
		
		Buyer buyer = buyerBO.getBuyerById(buyerId);
		model.addAttribute("buyer", buyer);
		
		OrderReceiver orderReceiver = buyerBO.getOrderReceiver(orderId);
		model.addAttribute("orderReceiver", orderReceiver);
		
		model.addAttribute("orderId", orderId);
		
		return "/buyer/purchaseCompleted";
	}
}
