<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매회원 개인정보 수정</title>
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
		<section class="sellerPersonal-section my-5">
			<div class="container d-flex justify-content-center align-items-start">
				<c:import url="/WEB-INF/jsp/common/sellerPersonalNav.jsp" />
				
				<article class="container content">
					<div class="bio d-flex justify-content-between align-items-end">
						<div class="d-flex justify-content-around align-items-end">
							<i class="bi bi-person-circle display-4"></i>
							<div class="ml-3">
							<span class="display-5 font-weight-bold">xxx님
							<br>
							가입일: </span>
							</div>	
						</div>
						<button class="btn btn-primary">구매회원 가입</button>
					</div>
					
					<div class="otherbox mt-5">
						<div class="password mt-3">
							<div class="d-flex justify-content-between align-items-center">
								<h5 class="col-4">비밀번호</h5>
								<div class="col-2">
							    	<button class="btn btn-sm btn-primary">변경</button>
							    </div>
							</div>
						</div>
						<div class="phone mt-3">
							<div class="d-flex justify-content-between align-items-center">
								<div class="col-4">
									<h5>전화번호:</h5>010-0000-0000
								</div>
								<div class="col-2">
							    	<button class="btn btn-sm btn-primary">변경</button>
							    </div>
							</div>
						</div>
						<div class="email mt-3">
							<div class="d-flex justify-content-between align-items-center">
								<div class="col-4">
									<h5>이메일:</h5> abcd@gmail.com
								</div>
								<div class="col-2">
							    	<button class="btn btn-sm btn-primary">변경</button>
							    </div>
							</div>
						</div>
						<div class="bankaccount mt-3">
							<div class="d-flex justify-content-between align-items-center">
								<div class="col-4">
									<h5>정산 계좌:</h5>농협 0000000000000
								</div>
								<div class="col-2">
							    	<button class="btn btn-sm btn-primary">변경</button>
							    </div>
							</div>
						</div>
					</div>
				</article>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
</body>
</html>