<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/smallheader.jsp"/>
		<section class="signup-section d-flex justify-content-center align-items-center">
			<div class="bg-white border border-light signup-card">
				<h2 class="text-center">회원 가입</h2>
				<div class="identify-select d-flex justify-content-around">
					<ul class="nav nav-tabs">
					  <li class="nav-item buyer-tab text-center">
					    <a class="nav-link" aria-current="page" href="/user/buyer/signup/view"><span class="text-dark">구매회원</span></a>
					  </li>
					  <li class="nav-item seller-tab text-center">
					    <a class="nav-link active" href="/user/seller/signup/view"><span class="text-white font-weight-bold">판매회원</span></a>
					  </li>
					</ul>
				</div>
				
				<div class="bg-white seller-signup-card" id="seller-signup-card">
					<div class="seller-id input-group mt-3 px-3">
					  <span class="input-group-text col-3">아이디</span>
					  <input type="text" class="form-control" placeholder="ID를 입력하세요">
					</div>
					
					<div class="seller-pw input-group my-1 px-3">
					  <span class="input-group-text col-3">비밀번호</span>
					  <input type="text" class="form-control" placeholder="비밀번호를 입력하세요">
					</div>
					
					<div class="seller-pwConfirm input-group my-1 px-3">
					  <span class="input-group-text col-3">비번 확인</span>
					  <input type="text" class="form-control" placeholder="위의 비밀번호를 다시 입력하세요">
					</div>
					
					<div class="seller-name input-group my-1 px-3">
					  <span class="input-group-text col-3">이름</span>
					  <input type="text" class="form-control" placeholder="이름을 입력하세요">
					</div>
					
					<div class="seller-phoneNumber input-group my-1 px-3">
					  <span class="input-group-text col-3">전화번호</span>
					  <input type="text" class="form-control" placeholder="전화번호를 입력하세요">
					</div>
					
					<div class="input-group mb-3 px-3">
					  <span class="input-group-text col-3">이메일</span>
					  <input type="text" class="form-control">
					  <button class="btn btn-outline-secondary dropdown-toggle" type="button">직접입력</button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item">@naver.com</a></li>
					    <li><a class="dropdown-item">@daum.net</a></li>
					    <li><a class="dropdown-item">@gmail.com</a></li>
					  </ul>
					</div>
					
					<div class="confirm-btn mb-2 d-flex justify-content-center">
						<button class="btn btn-lg btn-primary" type="button">판매회원 가입</button>
					</div>
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