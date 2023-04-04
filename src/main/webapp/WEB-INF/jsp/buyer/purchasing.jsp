<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매회원 주문결제</title>
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
		<div class="d-flex justify-content-between align-items-end mt-3">
			<div>
				<h2 class="font-weight-bold">주문결제</h2>
			</div>
			<div>
				<span class="text-secondary">장바구니&nbsp; <i class="bi bi-chevron-right"></i> &nbsp;</span>
				<span class="font-weight-bold">주문결제</span>
				<span class="text-secondary">&nbsp; <i class="bi bi-chevron-right"></i> &nbsp;주문완료</span>
			</div>
		</div>
		
		
		<section class="purchasing-section container">
			<div class="d-flex mt-3">
				<div class="container purchasing-card col-8 mx-3">
					<article class="border container bg-light my-3">
						<div class="d-flex justify-content-between align-items-end mt-3">
							<h4 class="font-weight-bold">주문자 정보</h4>
						</div>
						
						<div class="container d-flex align-items-end mt-3">
							<h6 class="font-weight-bold col-4">주문자 이름</h6>
							<h6 id="buyerName">${buyer.name }</h6>
						</div>
						<div class="container d-flex align-items-end mt-3">
							<h6 class="font-weight-bold col-4">주문자 전화번호</h6>
							<h6 id="buyerPhoneNumber">${buyer.phoneNumber }</h6>
						</div>
					</article>
					
					<article class="border container bg-light my-3">
						<div class="d-flex justify-content-between align-items-end mt-3">
							<h4 class="font-weight-bold">배송 정보</h4>
							<div>
								<input type="checkbox" id="sameCheck" value="same">
								<label>주문자정보와 일치</label>
							</div>
						</div>
						
						<div class="container d-flex align-items-end mt-3">
							<h6 class="font-weight-bold col-4">배송 이름</h6>
							<input type="text" class="form-control" id="receiverNameInput">
						</div>
						<div class="container d-flex align-items-end mt-3">
							<h6 class="font-weight-bold col-4">배송 전화번호</h6>
							<input type="text" class="form-control" id="receiverPhoneNumberInput">
						</div>
						<div class="container d-flex align-items-end my-3">
							<h6 class="font-weight-bold col-4">배송 주소</h6>
							<input type="text" class="form-control" id="receiverAddressInput">
						</div>
					</article>
							
					<article class="border container mt-3 bg-light">
						<h4 class="font-weight-bold mt-3">결제수단</h4>
						<hr>
						<div class="container my-3">
				    		<h4 class="font-weight-bold">무통장 입금</h4>
					  	</div>
					  	<div class="container my-3 d-flex align-items-end">
				    		<h6 class="font-weight-bold col-4">입금자명</h6>
				    		<input type="text" class="form-control" id="depositorNameInput">
					  	</div>
					  	<div class="container my-3 d-flex align-items-end">
				    		<p class="col-4">입금계좌</p>
				    		<p>하나은행: (주식회사)몰 0000000-0000000-00000</p>
					  	</div>
					</article>
				</div>
				
				<div class="simple-paymentinfo2-card col-4 mb-3">
					<aside class="border border-dark">
						<div class="container my-3">
							<div>
								<h5 class="font-weight-bold">주문상품 ${totalAmount }개</h5>		
							</div>
							<hr>
							<div class="details">
								<c:forEach var="cartDetail" items="${cartDetailList }">
								<div class="items" id="cartId" data-cart-id="${cartDetail.productId }" value="${cartDetail.productId }">
									<div class="d-flex">
										<img width="100" height="100" src="${cartDetail.productImgPath }">
										<div>
											<a class="text-dark" href="/product/items/view?id=${cartDetail.productId }">${cartDetail.productOriginName }</a>
											<div>
												<span class="font-weight-bold" id="productPrice">${cartDetail.productPrice }</span>원
												<span> / </span><span id="productAmount">${cartDetail.productAmount }</span>개
											</div>
										</div>
									</div>
									<div class="bg-light d-flex justify-content-between">
										<span>상품금액</span>
										<span>${cartDetail.productSumPrice }원</span>
									</div>
									<div class="bg-light d-flex justify-content-between">
										<span>배송비</span>
										<span>${cartDetail.productDeliveryPrice }원</span>
									</div>
								</div>
								<hr>
								</c:forEach>
								
								<div class="d-flex justify-content-between">
									<div>
										<p>상품금액</p>
										<p>배송비</p>
									</div>
									<div class="text-right">
										<p>${totalProductPrice }원</p>
										<p>${totalDeliveryPrice }원</p>
									</div>
								</div>
							</div>
							<hr>
							<div class="d-flex justify-content-between align-items-center">
								<h5 class="font-weight-bold">총결제금액</h5>
								<div class="d-flex">
									<h3 class="font-weight-bold" id="sum">${sum }</h3>
									<h3 class="font-weight-bold">원</h3>
								</div>
							</div>
							<button class="btn btn-primary btn-block text-white font-weight-bold my-3" type="button" id="purchaseBtn">결제하기</button>
						</div>
					</aside>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			$("#sameCheck").on("change", function(){
				
				if($(this).is(":checked")){
					$('input[id=receiverNameInput]').attr("value",$("#buyerName").text());
					$('input[id=receiverPhoneNumberInput]').attr("value",$("#buyerPhoneNumber").text());
				}else{
					$('input[id=receiverNameInput]').attr("value","");
					$('input[id=receiverPhoneNumberInput]').attr("value","");
				}
				
			})
			
			$("#purchaseBtn").on("click", function(){
				
				// buyerOrderId 생성 > B + 오늘날짜 + 난수(6자리)
				let now = new Date();
				let year = now.getFullYear().toString();
				let month = now.getMonth() + 1;
				let day = now.getDate();
				
				// 만약에 월이 1~9월이면 문자열을 반환할 때 앞에 0을 붙여줌. 아니면 그냥 문자열 반환
				if(month < 10){
					month = "0" + month.toString();
				}else{
					month = month.toString();
				}
				
				// 날짜도 위와 마찬가지 > 결국 yyyyMMdd를 맞춰줌
				if(day < 10){
					day = "0" + day.toString();
				}else{
					day = day.toString();
				}
				
				// 혹시 buyer가 같은 날에 여러건을 구매할 수 있어서 5자리 난수 생성
				let random = '';
			    for (let i = 0; i < 5; i++) {
			    	random += Math.floor(Math.random() * 10);
			    }
				
			    
				let buyerOrderId = "B" + year + month + day + random;
				
				let receiverName = $("#receiverNameInput").val();
				let receiverPhoneNumber = $("#receiverPhoneNumberInput").val();
				let receiverAddress = $("#receiverAddressInput").val();
				let depositorName = $("#depositorNameInput").val();
				let sum = parseInt($("#sum").text());
				
				if(receiverName == ""){
					alert("배송 이름 입력해주세요");
					return;
				}
				if(receiverPhoneNumber == ""){
					alert("배송 전화번호 입력해주세요");
					return;
				}
				if(receiverAddress == ""){
					alert("배송 주소 입력해주세요");
					return;
				}
				if(depositorName == ""){
					alert("입금자명 입력해주세요");
					return;
				}
				
				// 총 주문갯수가 0개면 주문 못하게
				let totalAmount = ${totalAmount};
				if(totalAmount > 0){
					$.ajax({
						type:"post"
						, url:"/buyer/purchasing/createOrder"
						, data:{"buyerOrderId":buyerOrderId, "receiverName":receiverName, "receiverPhoneNumber":receiverPhoneNumber, "receiverAddress":receiverAddress, "depositorName":depositorName, "sum":sum}
						, success:function(data){
							if(data.result == "success"){
								location.href="/buyer/purchaseCompleted/view?buyerOrderId=" + buyerOrderId;
							}else{
								alert("결제 실패");
							}
						}
						, error:function(){
							alert("결제 에러");
						}
					}) 	
				}
	
				$.ajax({
					type:"post"
					, url:"/buyer/cart/createOrder"
					, data:{"buyerOrderId":buyerOrderId, "status":"결제확인중"}
				 	, success:function(data){
				 		if(data.result == "fail"){
				 			alert("주문실패");
				 			return;
				 		}
				 	}
				 	, error:function(){
				 		alert("주문 에러");
				 	}
				}) 
				
				
			})
		})
	</script>
</body>
</html>