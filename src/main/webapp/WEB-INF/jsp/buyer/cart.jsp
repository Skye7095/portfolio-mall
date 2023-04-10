<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
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
				<h2 class="font-weight-bold">장바구니</h2>
			</div>
			<div>
				<span class="font-weight-bold">장바구니</span>
				<span class="text-secondary">&nbsp; <i class="bi bi-chevron-right"></i> &nbsp;주문결제</span>
				<span class="text-secondary">&nbsp; <i class="bi bi-chevron-right"></i> &nbsp;주문완료</span>
			</div>
		</div>
		
		
		<section class="cart-section container">
			<article class="container cart-card my-3">	
				<table class="table">
					<thead class="table-secondary text-center">
						<tr>
							<th>상품명</th>
							<th>수량</th>
							<th>단가</th>	
							<th>배송비</th>
							<th>상품 총금액</th>
							<th></th>
						</tr>
					</thead>
					
					<tbody class="border cartDetail">
					<c:forEach var="cartDetail" items="${cartDetailList }">
						<tr class="tr" data-cart-id="${cartDetail.id }">
							<th class="d-flex">
								<img width="100" height="100" src="${cartDetail.productImgPath }">
								<div>
									<a class="text-dark" href="/product/items/view?id=${cartDetail.productId }">${cartDetail.productOriginName }</a>
								</div>
							</th>
							<th>
								<div class="d-flex justify-content-center">
								<c:choose>
									<c:when test="${cartDetail.productInventory <= 0 }">
										<div class="bg-secondary text-center">
											<span class="text-white">재고소진으로 인해 판매종료</span>
										</div>
									</c:when>
									<c:otherwise>
										<input type="number" value="${cartDetail.productAmount }" min="1" max="${cartDetail.productInventory }" class="productAmountInput${cartDetail.id }">
										<button class="btn btn-sm numberConfirmBtn" data-cart-id="${cartDetail.id }" data-product-id="${cartDetail.productId }">선택</button>
									</c:otherwise>
								</c:choose>
								</div>
							</th>
							<th>
								<div class="d-flex justify-content-center">
									<h4 class="productPrice${cartDetail.id }">${cartDetail.productPrice }</h4>
									<h4>원</h4>
								</div>
							</th>
							<th>
								<div class="d-flex justify-content-center">
									<h4 class="productDeliveryPrice${cartDetail.id }">${cartDetail.productDeliveryPrice }</h4>
									<h4>원</h4>
								</div>
							</th>
							<th>
								<div class="d-flex justify-content-center">
									<h4 class="productTotalPrice${cartDetail.id }">${cartDetail.productTotalPrice }</h4>
									<h4>원</h4>
								</div>
							</th>
							<th>
								<button class="btn btn-sm btn-danger deleteBtn" data-cart-id="${cartDetail.id }" data-product-id="${cartDetail.productId }">삭제</button>
							</th>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
			
			<div class="simple-paymentinfo1-card container mb-3">
				<aside class="border border-dark">
					<div class="container my-3">
						<h5 class="font-weight-bold">결제정보</h5>				
						<hr>
						<div class="d-flex">
							<div class="d-flex justify-content-between col-6">
								<div>
									<p>상품수</p>
									<p>상품금액</p>
									<p>배송비</p>
								</div>
								<div class="text-right">
									<div class="d-flex justify-content-end">
										<p id="totalAmount">${totalAmount}</p>개
									</div>
									<div class="d-flex justify-content-end">
										<p id="totalProductPrice">${totalProductPrice}</p>원
									</div>
									<div class="d-flex justify-content-end">
										<p id="totalDeliveryPrice">${totalDeliveryPrice}</p>원
									</div>
								</div>
							</div>
							<div class="align-items-center col-6">
								<div class="d-flex justify-content-between align-items-end">
									<h5 class="font-weight-bold">전체 금액</h5>
									<div class="d-flex justify-content-end align-items-end">
										<h3 class="font-weight-bold" id="sum">${sum}</h3>
										<h6>원</h6>
									</div>
								</div>
								<div>
									<div class="d-flex justify-content-center">
										<button class="btn btn-primary btn-lg text-white font-weight-bold my-3" type="button" id="purchaseBtn">구매하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</aside>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			$(".numberConfirmBtn").on("click", function(){
				let cartId = $(this).data("cart-id");
				let productId = $(this).data("product-id");
				
				var productAmount = $(".productAmountInput"+cartId).val();
				var productPrice = Number($(".productPrice"+cartId).text());
				var productDeliveryPrice = Number($(".productDeliveryPrice"+cartId).text());
				var productSumPrice = productAmount * productPrice;
				var productTotalPrice = productPrice * productAmount + productDeliveryPrice;
				$(".productTotalPrice"+cartId).text(productTotalPrice);
				
				$.ajax({
					type:"post"
					, url:"/buyer/cart/update"
					, data:{"productId":productId, "productAmount":productAmount, "productSumPrice":productSumPrice, "productTotalPrice":productTotalPrice}
					, success:function(data){
						if(data.result == "success"){
							location.reload();
						}else{
							alert("수정실패");
						}
					}
					, error:function(){
						alert("수정에러");
					}
				})
			})
			
			$(".deleteBtn").on("click", function(){
				let cartId = $(this).data("cart-id");
				let productId = $(this).data("product-id");
				
				$.ajax({
					type:"post"
					, url:"/buyer/cart/delete"
					, data:{"cartId":cartId}
					, success:function(data){
						if(data.result == "success"){
							location.reload();
						}else{
							alert("삭제 실패");
							return;
						}
					}
					, error:function(){
						alert("삭제 오류");
					}
				})
			})
			
			$("#purchaseBtn").on("click", function(){
				let totalAmount = ${totalAmount};
				
				if(totalAmount > 0){
					location.href="/buyer/purchasing/view";
				}else{
					alert("장바구니 비어있어요. 상품을 담고 다시 찾아주세요");
					location.href="/product/main/view";
				}
				
			})
		})
	</script>
</body>
</html>