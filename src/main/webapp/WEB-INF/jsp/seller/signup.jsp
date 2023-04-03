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

<link rel="stylesheet" href="/static/css/sellerstyle.css" type="text/css">

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
					    <a class="nav-link" aria-current="page" href="/buyer/signup/view"><span class="text-dark">구매회원</span></a>
					  </li>
					  <li class="nav-item seller-tab text-center">
					    <a class="nav-link active" href="/seller/signup/view"><span class="text-white font-weight-bold">판매회원</span></a>
					  </li>
					</ul>
				</div>
				
				<div class="bg-white seller-signup-card" id="seller-signup-card">
					<div class="seller-id input-group mt-3 px-3">
					 	<span class="input-group-text col-3">아이디</span>
					 	<input type="text" class="form-control" placeholder="ID를 입력하세요" id="loginIdInput">
					 	<button type="button" class="btn btn-info btn-sm ml-2" id="isDuplicateBtn">중복확인</button>
					</div>
					
					<p class="text-success d-none ml-5" id="avaliableId">사용가능한 아이디입니다.</p>
					<p class="text-danger d-none ml-5" id="isDuplicatedId">중복된 아이디입니다.</p>
					
					<div class="seller-pw input-group my-1 px-3">
						<span class="input-group-text col-3">비밀번호</span>
						<input type="password" class="form-control" placeholder="6글자 이상을 입력하세요" id="passwordInput">
					</div>
					
					<div class="seller-pwConfirm input-group my-1 px-3">
					  <span class="input-group-text col-3">비번 확인</span>
					  <input type="password" class="form-control" placeholder="위의 비밀번호를 다시 입력하세요" id="passwordConfirm">
					</div>
					
					<div class="seller-name input-group my-1 px-3">
						<span class="input-group-text col-3">이름</span>
						<input type="text" class="form-control" placeholder="이름을 입력하세요" id="nameInput">
					</div>
					
					<div class="seller-phoneNumber input-group my-1 px-3">
						<span class="input-group-text col-3">전화번호</span>
						<input type="text" class="form-control" placeholder="전화번호를 입력하세요" id="phoneNumberInput">
					</div>
					
					<div class="input-group mb-3 px-3">
						<span class="input-group-text col-3">이메일</span>
						<input type="text" class="form-control" id="emailInput">
						<select class="btn btn-outline-secondary dropdown-toggle" id="emailSelect"/>
					  		<option value="">직접입력</option>
					  		<option value="n">@naver.com</option>
					  		<option value="d">@daum.com</option>
					  		<option value="g">@gmail.com</option>
						</select>
					</div>
					
					<div class="confirm-btn mb-2 d-flex justify-content-center">
						<button class="btn btn-lg btn-primary" type="button" id="signupBtn">판매회원 가입</button>
					</div>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			var isDuplicatedCheck = false;
			var isDuplicatedId = true;
			
			$("#isDuplicateBtn").on("click", function(){
				let id = $("#loginIdInput").val();
				
				if(id == ""){
					alert("아이디를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/seller/duplicated_id"
					, data:{"loginId":id}
					, success:function(data){
						isDuplicatedCheck = true;
						
						if(data.is_duplicated == true){
							isDuplicatedId = true;
							$("#isDuplicatedId").removeClass("d-none");
							$("#avaliableId").addClass("d-none");
						}else{
							isDuplicatedId = false;
							$("#isDuplicatedId").addClass("d-none");
							$("#avaliableId").removeClass("d-none");
						}
					}
					, error:function(){
						alert("중복체크 에러");
					}
				})
			});
			
			$("#signupBtn").on("click", function(){
				let id = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirm").val();
				let name = $("#nameInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				let email = "";
				let emailInput = $("#emailInput").val();
				let emailSelect = $("#emailSelect").val();
				
				if(id == ""){
					alert("아이디를 입력하세요");
					return;
				}
				
				if(isDuplicatedCheck == false){
					alert("아이디 중복확인하세요");
					return;
				}
				
				if(isDuplicatedId == true){
					alert("아이디 중복되었습니다");
					return;
				}
				
				if(password.length < 6){
					alert("비밀번호가 6자 이상이어야 해요");
					return;
				}
				
				if(passwordConfirm != password){
					alert("비밀번호 다시 확인해주세요");
					return;
				}
				
				if(name == ""){
					alert("이름을 입력하세요");
					return;
				}
				
				if(!phoneNumber.startsWith("010") || phoneNumber.length != 11){
					alert("010로 시작한 11자리 전화번호를 입력하세요");
					return;
				}
				
				if(!$.isNumeric(phoneNumber)){
					alert("전화번호 숫자만 입력하세요");
					return;
				}
				
				if(emailSelect == ""){
					if(emailInput.includes("@") == false || emailInput.endsWith(".com") == false){
						alert("이메일은 @를 포함해야하며 .com로 끝나야 합니다");
						return;
					}else{
						email = emailInput;
					}
				}else if(emailSelect == "n"){
					email = emailInput + "@naver.com";
				}else if(emailSelect == "g"){
					email = emailInput + "@gmail.com";
				}else{
					email = emailInput + "@daum.com";
				}
				
				$.ajax({
					type:"post"
					, url:"/seller/signup"
					, data:{"loginId":id, "password":password, "name":name, "phoneNumber":phoneNumber, "email":email}
					, success:function(data){
						if(data.result == "success"){
							alert("회원가입 성공");
							location.href = "/seller/signin/view";
						}else if(data.result == "exists"){
							alert("이미 가입했습니다");
							location.href = "/seller/signin/view";
						}else{
							alert("회원가입 실패");
						}
					}
					, error:function(){
						alert("회원가입 에러");
					}
				});
			});
		})
	</script>
</body>
</html>