package com.portfolio.mall.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.portfolio.mall.user.model.OrderItems;
import com.portfolio.mall.user.model.Seller;

@Repository
public interface SellerDAO {
	
	// seller 회원가입
	public int insertSeller(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email);
	
	// 같은 사람이 여러 id를 만들었는지 확인 > 같은 name & phoneNumber || 같은 name & email
	public int selectSameSeller(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email);
	
	// seller 회원가입시 id 중복여부 확인
	public int selectCountById(@Param("loginId") String loginId);
	
	// seller 로그인
	public Seller selectSellerByIdPassword(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	// seller 아이디찾기-phone
	public String selectSellerByPhone(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);
	
	// seller 아이디찾기-email
	public String selectSellerByEmail(
			@Param("name") String name
			, @Param("email") String email);
	
	// seller 비밀번호 찾기 - phone
	public Seller selectSellerPWByPhone(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);
	
	// seller 비밀번호 찾기 - phone
	public Seller selectSellerPWByEmail(
			@Param("name") String name
			, @Param("email") String email);
	
	// seller 비밀번호 찾기 후 랜덤 비번 생성한 뒤 기존 비번 update
	public int updatedSellerPW(
			@Param("sellerId") int sellerId
			, @Param("newPW") String newPW);
	
	// seller의 비밀번호 리셋하고 update된 비번 불러오기
	public String updatedSellerNewPw(
			@Param("sellerId") int sellerId);
	
	// seller 조회
	public Seller selectSeller(@Param("sellerId") int sellerId);
	
	// seller 개인정보 수정
	public int updateSeller(
			@Param("id") int id
			, @Param("password") String password
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email);
	
	// 판매내역 조회
	public List<OrderItems> selectOrderItemsList(@Param("sellerId") int sellerId);
	
	// order 상태변경
	public int updateStatus(
			@Param("id") int id
			, @Param("status") String status
			, @Param("deliveryNumber") String deliveryNumber);
}
