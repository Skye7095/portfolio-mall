package com.portfolio.mall.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.portfolio.mall.user.model.Buyer;
import com.portfolio.mall.user.model.BuyerOrderDetail;
import com.portfolio.mall.user.model.NonMember;

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
	
	// 비회원 구매내역 조회
	public NonMember selectNonMember(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("orderPassword") String orderPassword);
	
	// 비회원 주문비번 찾기
	public NonMember selectNonMemberByOrderId(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("orderId") int orderId);
	
	// buyer 개인정보 변경
	public int updateBuyer(
			@Param("id") int id
			, @Param("password") String password
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email);
	
	// buyer 결제정보 insert
	public int insertBuyerOrder(
			@Param("buyerId") int buyerId
			, @Param("buyerOrderId") String buyerOrderId
			, @Param("receiverName") String receiverName
			, @Param("receiverPhoneNumber") String receiverPhoneNumber
			, @Param("receiverAddress") String receiverAddress
			, @Param("depositorName") String depositorName
			, @Param("sum") int sum
			, @Param("status") String status);
	
	// 같은 orderId가 여러번 결제됐는지 확인
	public Integer sameOrder(
			@Param("buyerId") int buyerId
			, @Param("buyerOrderId") String buyerOrderId);
	
	// buyerOrderDetail 조회하기
	public BuyerOrderDetail selectBuyerOrderDetail(@Param("buyerOrderId") String buyerOrderId);
}
