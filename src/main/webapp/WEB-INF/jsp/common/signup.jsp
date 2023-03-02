<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap" class="bg-dark">
		<header class="bg-danger">
			여기는 나중에 만들기
		</header>
		<section class="bg-info d-flex justify-content-center align-items-center">
			<div class="signup-card">
				<h2>회원 가입</h2>
				<div class="identify-select bg-grey d-flex justify-content-around align-items-center">
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="buyer" checked>
					  <label class="form-check-label" for="flexRadioDefault1">
					    구매회원
					  </label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="seller">
					  <label class="form-check-label" for="flexRadioDefault2">
					    판매회원
					  </label>
					</div>
				</div>
				
				<div class="buyer-signup-card">
					<div class="buyer-id input-group mt-3">
					  <span class="input-group-text col-3">아이디</span>
					  <input type="text" class="form-control" placeholder="ID를 입력하세요">
					</div>
					
					<div class="buyer-pw input-group">
					  <span class="input-group-text col-3">비밀번호</span>
					  <input type="text" class="form-control" placeholder="비밀번호를 입력하세요">
					</div>
					
					<div class="buyer-pwConfirm input-group">
					  <span class="input-group-text col-3">비번 확인</span>
					  <input type="text" class="form-control" placeholder="위의 비밀번호를 다시 입력하세요">
					</div>
					
					<div class="buyer-name input-group">
					  <span class="input-group-text col-3">이름</span>
					  <input type="text" class="form-control" placeholder="이름을 입력하세요">
					</div>
					
					<div class="buyer-phoneNumber input-group">
					  <span class="input-group-text col-3">전화번호</span>
					  <input type="text" class="form-control" placeholder="전화번호를 입력하세요">
					</div>
					
					<div class="input-group mb-3">
					  <span class="input-group-text col-3">이메일</span>
					  <input type="text" class="form-control">
					  <button class="btn btn-outline-secondary dropdown-toggle" type="button">직접입력</button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item">@naver.com</a></li>
					    <li><a class="dropdown-item">@daum.net</a></li>
					    <li><a class="dropdown-item">@gmail.com</a></li>
					  </ul>
					</div>
				</div>
				
				<div class="confirm-btn col-6 mx-auto">
					<button class="btn btn-lg btn-primary">가입</button>
				</div>
			</div>
		</section>
		<footer class="bg-grey">
			여기는 footer
		</footer>
	</div>
</body>
</html>