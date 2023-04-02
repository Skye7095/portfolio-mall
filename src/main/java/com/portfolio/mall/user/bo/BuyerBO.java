package com.portfolio.mall.user.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.mall.cart.bo.CartBO;
import com.portfolio.mall.cart.model.CartDecisionDetail;
import com.portfolio.mall.common.EncryptUtils;
import com.portfolio.mall.common.randomPW;
import com.portfolio.mall.product.dao.ProductDAO;
import com.portfolio.mall.user.dao.BuyerDAO;
import com.portfolio.mall.user.model.Buyer;
import com.portfolio.mall.user.model.BuyerOrder;
import com.portfolio.mall.user.model.BuyerOrderDetail;
import com.portfolio.mall.user.model.NonMember;

@Service
public class BuyerBO {
	
	@Autowired
	public BuyerDAO buyerDAO;
	
	@Autowired
	public ProductDAO productDAO;
	
	@Autowired
	public CartBO cartBO;
	
	// 회원가입시 buyer 정보 입력
	public int addBuyer(
			String loginId
			, String password
			, String name
			, String phoneNumber
			, String email) {
		// 비밀번호 암호화
		String encryptPW = EncryptUtils.md5(password);
		int buyerCount = 0;
		
		// 같은 사람이 여러 id를 만들었는지 확인 > 같은 name & phoneNumber || 같은 name & email
		int count =  buyerDAO.selectSameBuyer(name, phoneNumber, email);
		if(count != 0) {
			// 이미 가입했음
			buyerCount = -1; 
		}else {
			// 처음 가입하는 경우
			buyerCount = buyerDAO.insertBuyer(loginId, encryptPW, name, phoneNumber, email);
		}
		
		return buyerCount;
	}
	
	// id 중복확인
	public boolean isDuplicated(String loginId) {
		int count = buyerDAO.selectCountById(loginId);
		
		if(count != 0) {
			return true;
		}else {
			return false;
		}
	}
	
	// buyer 로그인
	public Buyer getBuyerByIdPw(
			String loginId
			, String password) {
		String encryptPW = EncryptUtils.md5(password);
		
		return buyerDAO.selectBuyerByIdPassword(loginId, encryptPW);
	}
	
	// buyer 아이디 찾기-phone
	public String getBuyerIDByPhone(
			String name
			, String phoneNumber) {
		return buyerDAO.selectBuyerByPhone(name, phoneNumber);
	}
	
	// buyer 조회
	public Buyer getBuyerById(int id) {
		return buyerDAO.selectBuyerById(id);
	}
	
	// buyer 아이디 찾기-email
	public String getBuyerIDByEmail(
			String name
			, String email) {
		return buyerDAO.selectBuyerByEmail(name, email);
	}
	
	// 이름과 전화번호를 통해 buyer의 비밀번호 리셋하기
	public String getBuyerPWByPhone(
			String name
			, String phoneNumber) {
		// 랜덤비번 생성
		String randPW = randomPW.randomNum();
		String encryptNewPW = EncryptUtils.md5(randPW); // 임시비번 암호화

		Buyer buyer =  buyerDAO.selectBuyerPWByPhone(name, phoneNumber);
		int buyerId = buyer.getId();
		
		// 1단계:update 성공여부 판단하기
		int count = buyerDAO.updatedBuyerPW(buyerId, encryptNewPW);
		
		//  2단계: update된 비밀번호 전달하기
		String newPW = "0";
		if(count == 1) {
			newPW = randPW;
		}else {
			newPW = "0";
		}
		
		return newPW;
	}
	
	// buyer 비밀번호 찾기 - email
	public String getBuyerPWByEmail(
			String name
			, String email) {
		// 랜덤비번 생성
		String randPW = randomPW.randomNum();
		String encryptNewPW = EncryptUtils.md5(randPW); // 임시비번 암호화

		Buyer buyer =  buyerDAO.selectBuyerPWByEmail(name, email);
		int buyerId = buyer.getId();
		
		// 1단계:update 성공여부 판단하기
		int count = buyerDAO.updatedBuyerPW(buyerId, encryptNewPW);
		
		//  2단계: update된 비밀번호 전달하기
		String newPW = "0";
		if(count == 1) {
			newPW = randPW;
		}else {
			newPW = "0";
		}
		
		return newPW;
	}
	
	// 비회원 구매내역 조회
	public NonMember getNonMember(
			String name
			, String phoneNumber
			, String orderPassword) {
		
		return buyerDAO.selectNonMember(name, phoneNumber, orderPassword);
	}
	
	// 비회원 주문비번 찾기
	public NonMember getNonMemberByOrderId(
			String name
			, String phoneNumber
			, int orderId) {
		
		return buyerDAO.selectNonMemberByOrderId(name, phoneNumber, orderId);
	}
	
	// buyer personal 페이지 정보 변경
	public int updateBuyer(
			int id
			, String password
			, String phoneNumber
			, String email) {
		
		String encryptPW = EncryptUtils.md5(password);
		
		return buyerDAO.updateBuyer(id, encryptPW, phoneNumber, email);
	}
	
	// buyer 결제정보
	public int addBuyerOrder(
			int buyerId
			, String buyerOrderId
			, String receiverName
			, String receiverPhoneNumber
			, String receiverAddress
			, String depositorName
			, int sum
			, String status) {
		int count = 0;
		
		if(buyerDAO.sameOrder(buyerId, buyerOrderId) == null) {
			// 최초 결제
			count = buyerDAO.insertBuyerOrder(buyerId, buyerOrderId, receiverName, receiverPhoneNumber, receiverAddress, depositorName, sum, status);
		}else {
			// 이미 결제했음
			count = -1;
		}

		return count;
	}
	
	// buyerOrderId로 구매내역 조회
	public BuyerOrderDetail getBuyerOrderDetail(String buyerOrderId) {
		return buyerDAO.selectBuyerOrderDetail(buyerOrderId);
	}
	
	// buyerId로 전체 구매내역 list 조회
	public List<BuyerOrderDetail> getOrderHistoryList(int buyerId){
		List<BuyerOrder> buyerOrderList = buyerDAO.selectOrderHistory(buyerId);
		
		List<BuyerOrderDetail> buyerOrderDetailList = new ArrayList<>();
		for(BuyerOrder buyerOrder:buyerOrderList) {
			BuyerOrderDetail buyerOrderDetail = new BuyerOrderDetail();
			
			int id = buyerOrder.getId();
			buyerOrderDetail.setId(id);
			
			String buyerOrderId = buyerOrder.getBuyerOrderId();
			buyerOrderDetail.setBuyerOrderId(buyerOrderId);
			
			String receiverName = buyerOrder.getReceiverName();
			buyerOrderDetail.setReceiverName(receiverName);
			
			String receiverPhoneNumber = buyerOrder.getReceiverPhoneNumber();
			buyerOrderDetail.setReceiverPhoneNumber(receiverPhoneNumber);
			
			String receiverAddress = buyerOrder.getReceiverAddress();
			buyerOrderDetail.setReceiverAddress(receiverAddress);
			
			String depositorName = buyerOrder.getDepositorName();
			buyerOrderDetail.setDepositorName(depositorName);
			
			int sum = buyerOrder.getSum();
			buyerOrderDetail.setSum(sum);
			
			List<CartDecisionDetail> cartDecisionDetailList = cartBO.getCartDecisionDetailList(buyerOrderId);
			buyerOrderDetail.setCartDecisionDetailList(cartDecisionDetailList);
			
			String status = buyerOrder.getStatus();
			buyerOrderDetail.setStatus(status);
			
			Date createdAt = buyerOrder.getCreatedAt();
			buyerOrderDetail.setCreatedAt(createdAt);
			
			buyerOrderDetailList.add(buyerOrderDetail);
		}
		
		return buyerOrderDetailList;
	}
}
