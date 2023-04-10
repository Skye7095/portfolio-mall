<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
							<div>판매금액: <fmt:formatNumber value="${salesAmount }" />원</div>
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
						<c:forEach var="sellerContract" items="${sellerContractList }" varStatus="vs">
						<tbody class="border">
							<tr id="info" data-order-id=${sellerContract.orderId }>
								<th class="text-center">
									<p id="orderId">${sellerContract.orderId }</p>
									<p id="orderItemsId" class="d-none" data-id="${sellerContract.id }">${sellerContract.id }</p>
									<div data-toggle="modal" data-target="#infoCheckModal${vs.index }" class="mr-2 info-btn" data-order-id="${sellerContract.orderId }"><button class="btn btn-sm btn-light">배송정보 확인</button></div>
								</th>
								<th class="d-flex align-items-start">
									<img width="50" height="50" src="${sellerContract.productImgPath }">
									<a href="#">${sellerContract.productName }</a>
								</th>
								<th class="text-center">${sellerContract.productAmount }</th>
								<th class="text-center">${sellerContract.productTotalPrice }원</th>
								<th class="text-center">
									<div class="d-flex justify-content-around">
										<h6 class="font-weight-bold">${sellerContract.status }</h6>
											<p id="deliveryNumber${sellerContract.id }">${sellerContract.deliveryNumber }</p>				
										</div>
									<div class="d-flex">
										<select class="form-select form-select-lg statusSelect" data-orderitems-id="${sellerContract.id }" id="statusSelect${sellerContract.id }">
										  <option selected>결제확인중</option>
										  <option value="1">주문취소</option>
										  <option value="2">결제완료</option>
										  <option value="3">배송중</option>
										  <option value="4">배송완료</option>
										</select>
										<input class="form-control d-none" placeholder="배송장 번호 입력해주세요" id="deliveryNumberInput${sellerContract.id }">
										<button class="btn btn-sm btn-primary text-white statusBtn" data-orderitems-id="${sellerContract.id }" id="statusBtn${sellerContract.id }">확인</button>
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
	
	<c:forEach var="sellerContract" items="${sellerContractList }" varStatus="vs">
	<div class="modal fade" id="infoCheckModal${vs.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	    
	      <div class="modal-body" id="info" data-order-id="${sellerContract.orderId }">
	        	<div class="d-flex">
	        		<h6 class="col-4">수취인 이름</h6>
	        		<h6>${sellerContract.orderReceiver.receiverName }</h6>
	        	</div>
	        	<div class="d-flex">
	        		<h6 class="col-4">수취인 전화번호</h6>
	        		<h6>${sellerContract.orderReceiver.receiverPhoneNumber }</h6>
	        	</div>
	        	<div class="d-flex">
	        		<h6 class="col-4">수취인 주소</h6>
	        		<h6>${sellerContract.orderReceiver.receiverAddress }</h6>
	        	</div>
	      </div>
	
	    </div>
	  </div>
	</div>
	</c:forEach>
	
	<script>
	$(document).ready(function(){
		
		$(".statusSelect").change(function(){	
			
			let id = $(this).data("orderitems-id");
			let statusSelect = $(this).val();
			
			if(statusSelect == "3"){
				$("#deliveryNumberInput" + id).removeClass("d-none");
			}else{
				$("#deliveryNumberInput" + id).addClass("d-none");
			}
		})
	
		$(".statusBtn").on("click", function(){
			let id = $(this).data("orderitems-id");

			let statusSelect = $("#statusSelect" + id).val();
			let status = "";
			let deliveryNumber = "";
			
			if(statusSelect == "1"){
				status = "주문취소";
			}else if(statusSelect == "2"){
				status = "결제완료";
				
			}else if(statusSelect == "3"){
				status = "배송중";
				if(deliveryNumber = ""){
					alert("운송장번호 입력해주세요");
					return;
				}else{
					deliveryNumber = $("#deliveryNumberInput"+id).val();
					$("#deliveryNumber"+id).text(deliveryNumber);
				}
			}
			
			$.ajax({
				type:"post"
				, url:"/seller/contract/modifyStatus"
				, data:{"id":id, "status":status, "deliveryNumber":deliveryNumber}
				, success:function(data){
					if(data.result == "success"){
						alert("성공");
						location.reload();
					}else{
						alert("실패");
					}
				}
				, error:function(){
					alert("에러");
				}
			})
			
			if(statusSelect == "4"){
				status= "배송완료";
				deliveryNumber = $("#deliveryNumber"+id).text();
				
				$.ajax({
					type:"post"
					, url:"/seller/contract/modifyStatus"
					, data:{"id":id, "status":status, "deliveryNumber":deliveryNumber}
					, success:function(data){
						if(data.result == "success"){
							alert("성공");
							location.reload();
						}else{
							alert("실패");
						}
					}
					, error:function(){
						alert("에러");
					}
				})
			}
		})
	})
	</script>
</body>
</html>