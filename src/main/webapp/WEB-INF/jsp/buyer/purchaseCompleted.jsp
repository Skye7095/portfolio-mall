<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
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
				<h2 class="font-weight-bold">주문완료</h2>
			</div>
			<div>
				<span class="text-secondary">장바구니&nbsp; <i class="bi bi-chevron-right"></i> &nbsp;</span>
				<span class="text-secondary">주문결제&nbsp; <i class="bi bi-chevron-right"></i> &nbsp;</span>
				<span class="font-weight-bold">주문완료</span>
			</div>
		</div>
		
		
		<section class="purchaseCompleted-section container">
			<div class="p-3" id="buyerOrderId" value="${buyerOrderDetail.buyerOrderId }">
				<div class="mt-3 text-center display-3"><i class="bi bi-bag-check-fill"></i></div>
				<h5 class="font-weight-bold text-center mt-3">${buyer.name }님, 주문하신 소중한 상품을 곧 보내 드릴게요!</h5>
				<div class="d-flex justify-content-center my-3">
					<button class="btn btn-success" id="mainBtn">쇼핑 계속하기</button>
				</div>
				<div class="deliveryinfo container border bg-white">
					<div class="d-flex justify-content-between align-items-end mt-3">
						<h4 class="font-weight-bold text-success">배송정보</h4>
					</div>
					<h6 class="font-weight-bold">${buyerOrderDetail.receiverName } ${buyerOrderDetail.receiverPhoneNumber }</h6>
				  	<h6>${buyerOrderDetail.receiverAddress }</h6>
				</div>
				<div class="paymentinfo container border bg-white my-3">
					<div class="d-flex justify-content-between align-items-end mt-3">
						<h4 class="font-weight-bold text-success">주문번호</h4>
					</div>
					<div class="d-flex justify-content-between align-items-center mt-3">
						<h6 class="mr-3">주문번호</h6>
						<h6>${buyerOrderDetail.buyerOrderId }</h6>
					</div>
					<div class="d-flex justify-content-between align-items-center mt-3">
						<h6 class="mr-3">총결제금액</h6>
						<h6>${buyerOrderDetail.sum }원</h6>
					</div>
				</div>
			</div>	
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#mainBtn").on("click", function(){
				location.href="/product/main/view";
			})
			
		})
	</script>
</body>
</html>