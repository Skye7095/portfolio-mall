<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매회원 비밀번호 재설정</title>
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
		<section class="sellerfind-section d-flex justify-content-center align-items-center">
			<div class="bg-white border border-light signup-card">
				<h2 class="text-center">판매회원 비밀번호 재설정</h2>
				<div class="sellerfind-select d-flex justify-content-around">
					<ul class="nav nav-tabs">
					  <li class="nav-item id-tab text-center">
					    <a class="nav-link" href="/seller/findID/view"><span class="text-dark">아이디 찾기</span></a>
					  </li>
					  <li class="nav-item pw-tab text-center">
					    <a class="nav-link active" href="/seller/resetPW/view"><span class="text-white font-weight-bold">비밀번호 재설정</span></a>
					  </li>
					</ul>
				</div>
				
				<div class="sellerfindid-checkbox d-flex justify-content-around my-3">
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="method" value="phoneNumber" checked>
					  <label class="form-check-label">휴대폰으로 찾기</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="method" value="email">
					  <label class="form-check-label">이메일로 찾기</label>
					</div>
				</div>
					
				<div class="sellerfindidbyphone-card container" id="findidbyphone">
					<div class="findid-name input-group mt-3 px-3">
					  <input type="text" class="form-control" placeholder="이름">
					</div>
					
					<div class="findid-phoneNumber input-group my-1 px-3">
					  <input type="text" class="form-control" placeholder="휴대폰번호(숫자만 입력)">
					</div>

					<div class="confirm-btn mt-5 mb-2 d-flex justify-content-center">
						<button class="btn btn-lg btn-primary" type="button">비밀번호 리셋하기</button>
					</div>
				</div>
				
				<div class="sellerfindidbyemail-card container d-none" id="findidbyemail">
					<div class="findid-name input-group mt-3 px-3">
					  <input type="text" class="form-control" placeholder="이름">
					</div>
					
					<div class="findid-email input-group my-1 px-3">
					  <input type="text" class="form-control" placeholder="이메일">
					</div>

					<div class="confirm-btn mt-5 mb-2 d-flex justify-content-center">
						<button class="btn btn-lg btn-primary" type="button">비밀번호 리셋하기</button>
					</div>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
		
			// ID 찾는 방법에 따라서 관련된 div를 숨기기/나타나기
			$("input[name=method]").on('change', function() {
                if($(this).val() == 'phoneNumber') {
                    $("#findidbyphone").removeClass("d-none");
                    $("#findidbyemail").addClass("d-none");
                } else {
                    $("#findidbyphone").addClass("d-none");
                    $("#findidbyemail").removeClass("d-none");
                }
            });
			
		})
	</script>
</body>
</html>