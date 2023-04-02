<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매회원 개인정보 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/buyerstyle.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/smallheader.jsp"/>
		<section class="buyerPersonal-section my-5 container">
			<div class="container d-flex justify-content-center align-items-start">
				<c:import url="/WEB-INF/jsp/common/buyerPersonalNav.jsp" />
				
				<article class="container content">
					<div class="bio d-flex justify-content-between align-items-end">
						<div class="d-flex justify-content-around align-items-end">
							<i class="bi bi-person-circle display-4"></i>
							<div class="ml-3">
							<span class="display-5 font-weight-bold">${buyerList.name }님(일반회원)
							<br>
							가입일: <fmt:formatDate value="${buyerList.createdAt }" pattern="yyyy-MM-dd" /></span>
							<br>
							uid: ${buyerList.id }</span>
							</div>	
						</div>
						<button class="btn btn-primary" id="sellerSignUpBtn">판매회원 가입</button>
					</div>
					
					<div class="otherbox mt-5">
						<h5 class="text-primary">수정하실 사항 하나만 입력하셔도 됩니다.</h5>
						<div class="password mt-3">
							<div class="d-flex justify-content-between align-items-center">
								<div class="col-4">
									<h5>비밀번호</h5>
								</div>
								<input type="text" class="form-control col-10" placeholder="길이는 최소 6자이상" id="passwordInput">
							</div>
						</div>
						<div class="phone mt-3">
							<div class="d-flex justify-content-between align-items-center">
								<div class="col-4">
									<h5>휴대폰번호</h5>
								</div>
								<input type="text" class="form-control col-10" value="${buyerList.phoneNumber }" id="phoneNumberInput">
							</div>
						</div>
						<div class="email mt-3">
							<div class="d-flex justify-content-between align-items-center">
								<div class="col-4">
									<h5>이메일</h5>
								</div>
								<input type="text" class="form-control col-10" value="${buyerList.email }" id="emailInput">
								
							</div>
						</div>
						<div class="mt-3 d-flex justify-content-center">
							<button class="btn btn-lg btn-primary" id="modifyBtn">변경</button>
						</div>
					</div>
				</article>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#modifyBtn").on("click", function(){
				let password = $("#passwordInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				let email = $("#emailInput").val();
				
				if(password == ""){
					alert("수정할 비번 다시 확인하시기 바랍니다");
					return;
				}
				if(password.length < 6){
					alert("비번길이는 6글자 이상입니다.");
					return;
				}
				if(phoneNumber.length != 11){
					alert("전화번호는 11자의 숫자입니다");
					return;
				}
				if(email.includes("@") == false || email.endsWith(".com") == false){
					alert("이메일은 @를 포함해야하며 .com로 끝나야 합니다");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/buyer/personal/update"
					, data:{"password":password, "phoneNumber":phoneNumber, "email":email}
					, success:function(data){
						if(data.result == "success"){
							alert("수정성공");
							location.href="/product/main/view";
						}else{
							alert("수정 실패");
						}
					}
					, error:function(){
						alert("수정 에러");
					}
				});
			})
			
			$("#sellerSignUpBtn").on("click", function(){
				location.href="http://localhost:8080/seller/signup/view";
			});
		})
	</script>
</body>
</html>