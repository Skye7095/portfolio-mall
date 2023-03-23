<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매회원로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/buyerstyle.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/smallheader.jsp" />
		<section class="signin-section my-5">
			<div class="d-flex justify-content-center">
				<div class="signin-title border-bottom">
					<div class="signin-logo d-flex align-items-center">
						<img width="100px" src="/static/images/logo.png" />
						<h1>Mall</h1>
					</div>
				</div>
			</div>
			
			<div class="signin-card container mt-5">
				<h4>구매회원 로그인</h4>
				<hr>
				<div class="small-signin-card container">
					<div class="signin-select d-flex justify-content-around align-items-center">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="identity" value="buyer" checked>
						  <label class="form-check-label">구매회원</label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="identity" value="seller">
						  <label class="form-check-label">판매회원</label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="identity" value="non-member">
						  <label class="form-check-label">비회원</label>
						</div>
					</div>
					
					<div class="signin-info">
						<div class="signin-info-input">
							<div class="buyer-id input-group my-3">
							  <label class="input-group-text col-4">아이디</label>
							  <input type="text" class="form-control" id="loginIdInput">
							</div>
							
							<div class="buyer-pw input-group mb-3">
							  <label class="input-group-text col-4">비밀번호</label>
							  <input type="password" class="form-control" id="passwordInput">
							</div>
						</div>
						
						<div class="links d-flex justify-content-center align-items-end">
							<a class="text-dark" href="/buyer/findID/view">아이디찾기</a>&nbsp; | &nbsp;
						    <a class="text-dark" href="/buyer/resetPW/view">비밀번호찾기</a>&nbsp; | &nbsp;
						   	<a class="text-dark" href="/buyer/signup/view">회원가입</a>
						</div>
						
						<div class="signin-info-confirm my-3 d-flex justify-content-center">
							<button class="btn btn-lg btn-primary" type="button" id="signinBtn">로그인</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="other-signin d-flex justify-content-center">
				<button class="btn btn-lg btn-warning mx-3" type="button">카카오로 시작하기</button>
				<button class="btn btn-lg btn-success mx-3" type="button">네이버로 시작하기</button>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#signinBtn").on("click", function(){
				let id = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				
				if(id == ""){
					alert("아이디를 입력하세요");
					return;
				}
				
				if(password == ""){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/buyer/signin"
					, data:{"loginId":id, "password":password}
					, success:function(data){
						if(data.result == "success"){
							location.href="/product/main/view";
						}else{
							alert("로그인 실패");
						}
					}
					, error:function(){
						alert("로그인 에러");
					}
				})
			});
			
			 $("input[name=identity]").on('change', function() {
	                if($(this).val() == 'buyer') {
	                	location.href="http://localhost:8080/buyer/signin/view";
	                } else if($(this).val() == 'seller'){
	                	location.href="http://localhost:8080/seller/signin/view";
	                } else{
	                	location.href="http://localhost:8080/buyer/non-member/lookup/view";
	                }
	         });
		})
	</script>
</body>
</html>