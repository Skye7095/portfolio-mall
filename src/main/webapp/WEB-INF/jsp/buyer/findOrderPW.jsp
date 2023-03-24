<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 구매자 주문비번 찾기</title>
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
						<input type="text" class="form-control" id="nameInput">
					</div>
					
					<div class="lookup-phone input-group mt-3 px-3">
						<label class="col-4">핸드폰번호</label>
						<input type="text" class="form-control" id="phoneNumberInput">
					</div>
					
					<div class="lookup-orderID input-group mt-3 px-3">
						<label class="col-4">주문서번호</label>
						<input type="text" class="form-control" id="orderIdInput">
					</div>
				</div>
				
				
				
				<div class="lookup-guide container bg-light mt-3">
					<span>• 임시 비밀번호를 알람으로 뜹니다.</span>
					<br>
					<span>• 확인 불가 시 고객센터로 문의바랍니다. (1566-0000)</span>
				</div>
				
				<div class="confirm-btn mt-5 mb-2 d-flex justify-content-center">
					<button class="btn btn-lg btn-primary" type="button" id="confirmBtn">비번 조회하기</button>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#confirmBtn").on("click", function(){
				let name = $("#nameInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				let orderId = $("#orderIdInput").val();
				
				if(name == ""){
					alert("주문자 이름을 입력하세요");
					return;
				}
				if(phoneNumber == ""){
					alert("주문자 전화번호를 입력하세요");
					return;
				}
				if(orderId == ""){
					alert("주문서번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/buyer/non-member/findOrderPW"
					, data:{"name":name, "phoneNumber":phoneNumber, "orderId":orderId}
					, success:function(data){
						if(data.result == "success"){
							alert("비번: " + data.orderPW);
						}else{
							alert("비번 조회 실패");
						}
					}
					, error:function(){
						alert("비번 조회 오류");
					}
				});
			});
		})
	</script>
</body>
</html>