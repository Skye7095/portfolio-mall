<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 구매자 주문비번 차기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/non-memberstyle.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/smallheader.jsp"/>
		<section class="non-member-find-section d-flex justify-content-center align-items-center">
			<div class="bg-white border border-light signup-card">
				<h2 class="text-center">비회원 구매자 주문비밀번호 찾기</h2>
				
				<div class="non-member-lookup-card container">
					<div class="lookup-name input-group mt-3 px-3">
						<label class="col-4">주문자명</label>
						<input type="text" class="form-control">
					</div>
					
					<div class="lookup-phone input-group mt-3 px-3">
						<label class="col-4">핸드폰번호</label>
						<input type="text" class="form-control">
					</div>
					
					<div class="lookup-orderID input-group mt-3 px-3">
						<label class="col-4">장바구니번호</label>
						<input type="text" class="form-control">
					</div>
				</div>
				
				<div class="lookup-checkbox container d-flex align-items-center">
					<label class="col-4 text-center">비밀번호받기</label>
					<div class="col-8 d-flex justify-content-around my-3">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="method" value="phoneNumber" checked>
						  <label class="form-check-label">SMS</label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="method" value="email">
						  <label class="form-check-label">이메일</label>
						</div>
					</div>
				</div>
				
				<div class="lookup-guide container bg-light">
					<span>• 주문 시 입력한 이메일 주소 또는 휴대폰번호로 임시 비밀번호를 보내 드립니다.</span>
					<br>
					<span>• 전송받기 불가 시 고객센터로 문의바랍니다. (1566-0000)</span>
				</div>
				
				<div class="confirm-btn mt-5 mb-2 d-flex justify-content-center">
					<button class="btn btn-lg btn-primary" type="button">전송하기</button>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			
		})
	</script>
</body>
</html>