package com.portfolio.mall.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.mall.common.EncryptUtils;
import com.portfolio.mall.common.randomPW;
import com.portfolio.mall.user.dao.SellerDAO;
import com.portfolio.mall.user.model.Buyer;
import com.portfolio.mall.user.model.Seller;

@Service
public class SellerBO {
	
	@Autowired
	public SellerDAO sellerDAO;
	
	// seller 회원가입
	public int addSeller(
			String loginId
			, String password
			, String name
			, String phoneNumber
			, String email) {
		
		String encryptPW = EncryptUtils.md5(password);
		int sellerCount = 0;
		
		// 같은 사람이 여러 id를 만들었는지 확인 > 같은 name & phoneNumber || 같은 name & email
		int count =  sellerDAO.selectSameSeller(name, phoneNumber, email);
		if(count != 0) {
			// 이미 가입했음
			sellerCount = -1; 
		}else {
			// 처음 가입하는 경우
			sellerCount = sellerDAO.insertSeller(loginId, encryptPW, name, phoneNumber, email);
		}
		
		return sellerCount;
	}
	
	// seller 회원가입시 id 중복확인
	public boolean isDuplicated(String loginId) {
		int count = sellerDAO.selectCountById(loginId);
		
		if(count != 0) {
			return true;	// 해당 id 이미 사용중
		}else {
			return false;
		}
	}
	
	// seller 로그인
	public Seller getSellerByIdPw(String loginId, String password) {
		String encryptPW = EncryptUtils.md5(password);
		
		return sellerDAO.selectSellerByIdPassword(loginId, encryptPW);
	}
	
	// seller 아이디찾기-phone
	public String getSellerIDByPhone(
			String name
			, String phoneNumber) {
		return sellerDAO.selectSellerByPhone(name, phoneNumber);
	}
	
	// buyer 아이디 찾기-email
	public String getSellerIDByEmail(
			String name
			, String email) {
		return sellerDAO.selectSellerByEmail(name, email);
	}
	
	// 이름과 전화번호를 통해 seller의 비밀번호 리셋하기
	public String getSellerPWByPhone(
			String name
			, String phoneNumber) {
		// 랜덤비번 생성
		String randPW = randomPW.randomNum();
		String encryptNewPW = EncryptUtils.md5(randPW); // 임시비번 암호화

		Seller seller = sellerDAO.selectSellerPWByPhone(name, phoneNumber);
		int sellerId = seller.getId();
		
		// 1단계:update 성공여부 판단하기
		int count = sellerDAO.updatedSellerPW(sellerId, encryptNewPW);
		
		//  2단계: update된 비밀번호 전달하기
		String newPW = "0";
		if(count == 1) {
			newPW = randPW;
		}else {
			newPW = "0";
		}
		
		return newPW;
	}
	
	// seller 비밀번호 찾기 - email
	public String getSellerPWByEmail(
			String name
			, String email) {
		// 랜덤비번 생성
		String randPW = randomPW.randomNum();
		String encryptNewPW = EncryptUtils.md5(randPW); // 임시비번 암호화

		Seller seller =  sellerDAO.selectSellerPWByEmail(name, email);
		int sellerId = seller.getId();
		
		// 1단계:update 성공여부 판단하기
		int count = sellerDAO.updatedSellerPW(sellerId, encryptNewPW);
		
		//  2단계: update된 비밀번호 전달하기
		String newPW = "0";
		if(count == 1) {
			newPW = randPW;
		}else {
			newPW = "0";
		}
		
		return newPW;
	}
}
