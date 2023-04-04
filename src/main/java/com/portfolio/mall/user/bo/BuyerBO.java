package com.portfolio.mall.user.bo;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.mall.cart.bo.CartBO;
import com.portfolio.mall.common.EncryptUtils;
import com.portfolio.mall.common.randomPW;
import com.portfolio.mall.product.bo.ProductBO;
import com.portfolio.mall.product.model.Product;
import com.portfolio.mall.user.dao.BuyerDAO;
import com.portfolio.mall.user.model.Buyer;
import com.portfolio.mall.user.model.BuyerOrder;
import com.portfolio.mall.user.model.BuyerOrderDetail;
import com.portfolio.mall.user.model.OrderDetail;

@Service
public class BuyerBO {
	
	@Autowired
	public BuyerDAO buyerDAO;
	
	@Autowired
	public ProductBO productBO;
	
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
			, int sum) {
		return buyerDAO.insertBuyerOrder(buyerId, buyerOrderId, receiverName, receiverPhoneNumber, receiverAddress, depositorName, sum);
	}
	
	// buyer 주문내역 조회
	public List<OrderDetail> getBuyerOrderList(int buyerId){	
		
		List<BuyerOrder> buyerOrderList = buyerDAO.selectBuyerOrderList(buyerId);
		
		List<OrderDetail> orderDetailList = new ArrayList<>();
		for(BuyerOrder buyerOrder:buyerOrderList) {
			OrderDetail orderDetail = new OrderDetail();
			
			String buyerOrderId = buyerOrder.getBuyerOrderId();
			orderDetail.setBuyerOrderId(buyerOrderId);
			
			String receiverName = buyerOrder.getReceiverName();
			orderDetail.setReceiverName(receiverName);
			
			String receiverPhoneNumber = buyerOrder.getReceiverPhoneNumber();
			orderDetail.setReceiverPhoneNumber(receiverPhoneNumber);
			
			String receiverAddress = buyerOrder.getReceiverAddress();
			orderDetail.setReceiverAddress(receiverAddress);
			
			String depositorName = buyerOrder.getDepositorName();
			orderDetail.setDepositorName(depositorName);
			
			int sum = buyerOrder.getSum();
			orderDetail.setSum(sum);
			
			Date createdAt = buyerOrder.getCreatedAt();
			orderDetail.setCreatedAt(createdAt);
				
			List<BuyerOrderDetail> buyerOrderDetailList = buyerDAO.selectBuyerOrderDetailList(buyerOrderId);
			for(BuyerOrderDetail buyerOrderDetail:buyerOrderDetailList) {
				int productId = buyerOrderDetail.getProductId();
				Product product = productBO.getProductById(productId);
				
				String productImgPath = product.getProductImgPath();
				String productName = product.getName();
				
				buyerOrderDetail.setProductImgPath(productImgPath);
				buyerOrderDetail.setProductName(productName);
			}
			orderDetail.setBuyerOrderDetailList(buyerOrderDetailList);
			
			orderDetailList.add(orderDetail);
		}
		
		return orderDetailList;
	}
	
	// buyerOrderId를 통해 buyerOrder테이블 조회
	public BuyerOrder getBuyerOrder(String buyerOrderId) {
		return buyerDAO.selectBuyerOrder(buyerOrderId);
	}
}
