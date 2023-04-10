package com.portfolio.mall.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.portfolio.mall.user.model.Buyer;
import com.portfolio.mall.user.model.OrderReceiver;
import com.portfolio.mall.user.model.OrderItems;

@Repository
public interface BuyerDAO {
	
	// 회원가입 buyer 추가
	public int insertBuyer(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email);
	
	// id 중복확인
	public int selectCountById(@Param("loginId") String loginId);
	
	// 같은 사람이 여러 id를 만들었는지 확인 > 같은 name & phoneNumber || 같은 name & email
	public int selectSameBuyer(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email);

	// buyer 로그인
	public Buyer selectBuyerByIdPassword(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	// buyer 조회
	public Buyer selectBuyerById(@Param("id") int id);
	
	// buyer 아이디찾기-phone
	public String selectBuyerByPhone(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);
	
	
	// buyer 아이디찾기-email
	public String selectBuyerByEmail(
			@Param("name") String name
			, @Param("email") String email);
	
	// buyer 비밀번호 찾기 - phone
	public Buyer selectBuyerPWByPhone(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);
	
	// buyer 비밀번호 찾기 - phone
	public Buyer selectBuyerPWByEmail(
			@Param("name") String name
			, @Param("email") String email);
	
	// buyer 비밀번호 찾기 후 랜덤 비번 생성한 뒤 기존 비번 update
	public int updatedBuyerPW(
			@Param("buyerId") int buyerId
			, @Param("newPW") String newPW);
	
	// buyer의 비밀번호 리셋하고 update된 비번 불러오기
	public String updatedBuyerNewPw(
			@Param("buyerId") int buyerId);
		
	// buyer 개인정보 변경
	public int updateBuyer(
			@Param("id") int id
			, @Param("password") String password
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email);
	
	// buyer 결제정보 insert
	public int insertOrderReceiver(
			@Param("buyerId") int buyerId
			, @Param("orderId") String orderId
			, @Param("receiverName") String receiverName
			, @Param("receiverPhoneNumber") String receiverPhoneNumber
			, @Param("receiverAddress") String receiverAddress
			, @Param("depositorName") String depositorName
			, @Param("sum") int sum);
	
	// 같은 orderId가 여러번 결제됐는지 확인
	public Integer sameOrder(
			@Param("buyerId") int buyerId
			, @Param("orderId") String orderId);
	
	// buyerId로 전체 구매내역 list 조회
	public List<OrderReceiver> selectOrderReceiverList(@Param("buyerId") int buyerId);
	
	// buyer 상세주문내역 조회
	public List<OrderItems> selectOrderItemsList(@Param("orderId") String orderId);

	// buyerOrderId를 통해 buyerOrder테이블 조회
	public OrderReceiver selectOrderReceiver(@Param("orderId") String orderId);
}
