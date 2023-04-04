<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매내역</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/sellerstyle.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/smallheader.jsp" />
		<section class="productmanager-section my-5">
			<div class="container d-flex justify-content-center align-items-start">
				<c:import url="/WEB-INF/jsp/common/sellerPersonalNav.jsp" />
				
				<aside class="container contract-content mt-3">
					<div class="d-flex justify-content-between">
						<h3>판매내역</h3>
						<div class="col-4 d-flex justify-content-between align-items-end">
							<div>정산금액: <fmt:formatNumber value="${income }" />원</div>
						</div>
					</div>
					
					<table class="table mt-3">
						<thead class="table-secondary text-center">
							<tr>
								<th>주문번호</th>
								<th>상품</th>
								<th>구매수량</th>
								<th>결제금액</th>
								<th>상태</th>							
							</tr>
						</thead>
						
						<c:forEach var="sellerContractDetail" items="${sellerContractDetailList }">
						<tbody class="border">
							<tr id="info" data-order-id=${sellerContractDetail.buyerOrderId }>
								<th class="text-center">
									<p>${sellerContractDetail.buyerOrderId }</p>
									<div data-toggle="modal" data-target="#infoCheckModal" class="mr-2 info-btn" data-order-id="${sellerContractDetail.buyerOrderId }"><button class="btn btn-sm btn-light">배송정보 확인</button></div>
								</th>
								<th class="d-flex align-items-start">
									<img width="50" height="50" src="${sellerContractDetail.productImgPath }">
									<a href="#">${sellerContractDetail.productName }</a>
								</th>
								<th class="text-center">${sellerContractDetail.productAmount }</th>
								<th class="text-center">${sellerContractDetail.productTotalPrice }원</th>
								<th class="text-center">
									<h6 class="font-weight-bold">${sellerContractDetail.status }</h6>
									<div class="d-flex">
										<select class="form-select form-select-lg statusSelect" id="statusSelect" data-order-id="${sellerContractDetail.buyerOrderId }">
										  <option selected>결제확인중</option>
										  <option value="1">결제완료</option>
										  <option value="2">배송중</option>
										  <option value="3">배송완료</option>
										</select>
										<input class="form-control deliveryNumberInput" placeholder="배송장 번호 입력해주세요" data-order-id="${sellerContractDetail.buyerOrderId }">
										<button class="btn btn-sm btn-primary text-white statusBtn">확인</button>
									</div>
								</th>		
							</tr>
						</tbody>
						</c:forEach>
					</table>
				</aside>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<!-- modal -->
	
	<c:forEach var="sellerContractDetail" items="${sellerContractDetailList }">
	<div class="modal fade infoCheckModal" id="infoCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	    
	      <div class="modal-body" id="info" data-order-id="${sellerContractDetail.buyerOrderId }">
	        	<div class="d-flex">
	        		<h6 class="col-4">수취인 이름</h6>
	        		<h6>${sellerContractDetail.receiverName }</h6>
	        	</div>
	        	<div class="d-flex">
	        		<h6 class="col-4">수취인 전화번호</h6>
	        		<h6>${sellerContractDetail.receiverPhoneNumber }</h6>
	        	</div>
	        	<div class="d-flex">
	        		<h6 class="col-4">수취인 주소</h6>
	        		<h6>${sellerContractDetail.receiverAddress }</h6>
	        	</div>
	      </div>
	
	    </div>
	  </div>
	</div>
	</c:forEach>
	
	<script>
	$(document).ready(function(){
		$(".deliveryNumberInput").hide();
				
		$(".statusSelect").change(function(){
			var orderId = $(this).data("order-id");
			let statusSelect = $(".statusSelect").val();
			
			if(statusSelect == "2"){
				$(".deliveryNumberInput").show();
			}else{
				$(".deliveryNumberInput").hide();
			}
		})
		
		/* $(".statusBtn").on("click", function(){
			let orderId = $(this).data("order-id");
			
			let statusSelect = $(".statusSelect").val();
			let status = "";
			let deliveryNumber = $(".deliveryNumberInput").val();
			
			if(statusSelect == "1"){
				status = "결제완료";
			}else if(statusSelect == "2"){
				status = "배송중";
				if(deliveryNumber = ""){
					alert("운송장번호 입력해주세요");
					return;
				}
			}else if(statusSelect == "3"){
				status = "배송완료";
			}
			
		})
		
		$(".info-btn").on("click", function(){
			// 해당 info-btn 태그에 있는 order-id를 모달의 a태그에 넣는다.
			let buyerOrderId = $(this).data("order-id");
			
			// data-order-id=""
			$("#info").data("order-id", buyerOrderId);
		});
		
		$(".infoCheckModal").on("click", function(){
			let buyerOrderId = $(this).data("order-id");

		})  */
	})
	</script>
</body>
</html>