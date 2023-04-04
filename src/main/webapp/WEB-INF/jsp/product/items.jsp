<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 전시</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/productstyle.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/smallheader.jsp"/>
		<section class="container mt-3">
			<div class="d-flex justify-content-center">
				<div class="items-section">
					<div class="section-header text-right">
						<span>상품번호: ${product.id }</span>
					</div>
					
					<article class="d-flex justify-content-around align-items-start">
						<div class="items-img d-flex justify-content-center">
							<img width="500" height="500" src="${product.productImgPath }">
						</div>
						
						<div class="payment-info ml-3">
							<btn class="btn btn-white">
								<i class="bi bi-shop-window"></i>
								<span>${seller.name }</span>
							</btn>
							<hr>
							<div class="items-info d-flex">
								<div class="col-9">
									<h4>${product.name }</h4>
									<div class="d-flex">
										<h2 id="productPrice"> ${product.price }</h2>
										<h4>원</h4>
									</div>
									
								</div>
								<div class="like col-3 d-flex justify-content-center align-items-center">
									<btn class="btn btn-white btn-lg rounded-circle border border-dark"><i class="bi bi-heart"></i></btn>
								</div>
							</div>
							<hr>
							
							<div class="delivery-info d-flex p-2">
								<i class="bi bi-truck"></i>
								<div class="d-flex">
									<p class="ml-3">배송비: </p>
									<p id="productDeliveryPrice">${product.deliveryPrice }</p>
									<p>원</p>
								</div>
							</div>
							<div class="amount-info d-flex p-2">
								<i class="bi bi-box"></i>
								<p class="ml-3">재고: <fmt:formatNumber value="${product.amount }" />개</p>
							</div>
							<hr>
							<c:if test="${product.amount eq 0 }">
								<h3 class="bg-secondary text-center text-white">재고소진으로 인해 판매종료</h3>
							</c:if>
						</div>		
					</article>
				</div>
			</div>
			
			<div class="d-flex justify-content-center mt-5">
				<div class="about-section d-flex align-items-start">
					<article class="items-content col-8">
						<div class="nav-tab mb-3">
							<ul class="nav nav-pills">
							  <li class="nav-item">
							    <button class="btn btn-light btn-lg" id="detailsBtn">상세설명</button>
							  </li>
							  <li class="nav-item">
							    <button class="btn btn-light btn-lg" id="cancelBtn">교환/반품</button>
							  </li>
							</ul>
						</div>
						<div class="about-content container border">
							<div id="detailsBox" class="my-3">
								<p class="font-weight-bold">상품설명</p>
      							<hr>
      							<p>${product.introduction }</p>
								<img width="100%" src="${product.detailsImgPath }">
							</div>
      						
      						<div id="cancelBox" class="my-3">
      							<div class="cancelinfo">
      								<p class="font-weight-bold">교환/반품 정보</p>
      								<hr>
      								<div class="small">
      									<div>· <span class="font-weight-bold">반품배송비(편도):&nbsp;</span><fmt:formatNumber value="${product.deliveryPrice }" />원</div>
      									<div>· <span class="font-weight-bold">교환배송비(완보):&nbsp;</span><fmt:formatNumber value="${product.deliveryPrice *2 }" />원</div>
      									<div>· <span class="font-weight-bold">보내실곳:&nbsp;</span>대전광역시 유성구</div>
      									<div>· 단, 교환/반품 비용은 상품 및 교환/반품 사유에 따라 변경될 수 있으므로 교환/반품 신청 화면 확인 부탁드립니다.
      								</div>
      							</div>
      							<div class="cancelDuration mt-5">
      								<p class="font-weight-bold">교환/반품 사유에 따른 요청 가능 기간</p>
      								<hr>
      								<div class="small">
      									<div>· 구매자 단순 변심: 상품 수령 후 7일 이내(구매자 반품 배송비 부담)</div>
      									<div>· 표시/광고와 상이, 계약 내용과 다르게 이행된 경우: 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내(판매자 반품배송비 부담)</div>
      								</div>
      							</div>
      							<div class="cancelNotAvailable mt-5">
      								<p class="font-weight-bold">교환/반품 불가한 경우</p>
      								<hr>
      								<div class="small">
      									<div>· 교환/반품 요청이 기간이 지난 경우</div>
      									<div>· 소비자의 책임 있는 사유로 상품 등이 분실/파손/훼손된 경우 (단, 확인을 위한 포장 훼손 제외)</div>
      									<div>· 소비자의 사용/소비에 의해 상품 등의 가치가 현저히 감소한 경우 (예 : 식품, 화장품, 향수, 음반)</div>
      									<div>· 제품을 설치 또는 장착하였거나 개통한 경우 (예 : 전자제품, 컴퓨터, 휴대폰 등)</div>
      									<div>· 시간의 경과에 의해 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우 (신선식품과 같이 유통기한이 정해져 있는 상품)</div>
      									<div>· 복제가 가능한 상품 등의 포장을 훼손한 경우 (CD/DVD/GAME/BOOK의 경우 포장 개봉 시)</div>
      									<div>· 주문제작 상품 중 상품제작에 들어간 경우 (주문접수 후 개별생산, 맞춤 제작 등)</div>
      								</div>
      							</div>
      							<div class="contractInfo mt-5">
      								<p class="font-weight-bold">거래 조건에 대한 정보</p>
      								<hr>
      								<div class="small">
      									<div>· 소화물 택배의 배송은 발송일로부터 1~2 영업일이 소요되나, 지역/대형 화물/설치/예약/발송지체 등의 특이사항에 따라 배송기간은 달라질 수 있습니다.</div>
      									<div>· ‘전자상거래등에서의소비자보호에관한법률’이 정하는 바에 따라 소비자의 청약철회 후 판매자가 재화 등을 반환 받은 날로부터 3영업일 이내에 지급받은 대금의 환급을 정당한 사유없이 지연하는 때에는 소비자는 지연기간에 대해서 전상법 시행령으로 정하는 이율을 곱하여 산정한 지연이자(지연배상금)을 신청할 수 있습니다.</div>
      								</div>
      							</div>
      							<div class="sellerInfo mt-5">
      								<p class="font-weight-bold">판매자 정보</p>
      								<hr>
      								<div class="small">
      									<div>· 상호명: ${seller.name }</div>
      									<div>· 연락처: ${seller.phoneNumber }</div>
      									<div>· 이메일: ${seller.email }</div>
      								</div>
      							</div>
      						</div>
						</div>
					</article>
					
					<div class="simple-paymentinfo2-card col-4 mb-3">
						<aside class="border border-dark">
							<div class="container my-3">
								<div class="details">
									<div class="items">
										<div class="d-flex mb-2">
											<img width="100" height="100" src="${product.productImgPath }">
											<div>
												<a class="text-dark" href="#">${product.name }</a>
											</div>
										</div>
										<div class="d-flex justify-content-around mb-3">
											<div class="amount d-flex align-items-end">
											<c:choose>
												<c:when test="${product.amount eq 0 }">
													<div class="bg-secondary text-center">
														<span class="text-white">재고소진으로 인해 판매종료</span>
													</div>
												</c:when>
												<c:otherwise>
													<input type="number" value="1" min="1" max="${product.amount }" id="productAmountInput">
													<button class="btn btn-sm" id="numberConfirmBtn">선택</button>
												</c:otherwise>
											</c:choose>											
											</div>
										</div>
										<div class="price bg-light d-flex justify-content-between">
												<h6>가격</h6>
												<div class="d-flex">
													<h6 class="font-weight-bold" id="productSumPrice"></h6>
													<h6>원</h6>
												</div>
										</div>
										<div class="bg-light d-flex justify-content-between">
											<span>배송비</span>
											<span>${product.deliveryPrice }원</span>
										</div>
									</div>
									<hr>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<h5 class="font-weight-bold">총 금액</h5>
									<div class="d-flex align-items-end">
										<h3 class="font-weight-bold" id="productTotalPrice"></h3>
										<h6>원</h6>
									</div>
								</div>
								<c:choose>
									<c:when test="${not empty buyerId }">
										<button class="btn btn-light btn-block border text-dark font-weight-bold my-3" type="button" id="buyerCartBtn">장바구니</button>
										<button class="btn btn-primary btn-block text-white font-weight-bold my-3" type="button" id="buyerPurchaseBtn">결제하기</button>
									</c:when>
									<c:when test="${not empty sellerId }">
										<button class="btn btn-light btn-block border text-dark font-weight-bold my-3" type="button" id="sellerCartBtn">장바구니</button>
										<button class="btn btn-primary btn-block text-white font-weight-bold my-3" type="button" id="sellerPurchaseBtn">결제하기</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-light btn-block border text-dark font-weight-bold my-3" type="button" id="nonCartBtn">장바구니</button>
										<button class="btn btn-primary btn-block text-white font-weight-bold my-3" type="button" id="nonPurchaseBtn">결제하기</button>	
									</c:otherwise>
								</c:choose>
							</div>
						</aside>
					</div>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
</body>

<script>
	$(document).ready(function(){		
		
		var numberChecked = false;

		var productPrice = ${product.price };
		$("#productSumPrice").text(productPrice);
		var productDeliveryPrice = ${product.deliveryPrice };
		var productTotalPrice = productPrice + productDeliveryPrice;
		$("#productTotalPrice").text(productTotalPrice);
		
		$("#numberConfirmBtn").on("click", function(){			
			let productAmount = $("#productAmountInput").val();
			let productSumPrice = productPrice * productAmount;
			$("#productSumPrice").text(productSumPrice);
			let productTotalPrice = productSumPrice + productDeliveryPrice;
			$("#productTotalPrice").text(productTotalPrice);
			
			numberChecked = true;
		})
		
		$("#productAmountInput").on("change", function(){
			numberChecked = false;
		})	
		
		$("#nonPurchaseBtn").on("click", function(){
			if(!confirm("구매회원만 사용가능한 기능입니다. 구매회원으로 로그인하시겠어요?")){
				return;
			}else{
				location.href="/buyer/signin/view";
			}
		})
		
		$("#nonCartBtn").on("click", function(){
			if(!confirm("구매회원만 사용가능한 기능입니다. 구매회원으로 로그인하시겠어요?")){
				return;
			}else{
				location.href="/buyer/signin/view";
			}
		})
		
		$("#sellerPurchaseBtn").on("click", function(){
			if(!confirm("구매회원만 사용가능한 기능입니다. 구매회원으로 로그인하시겠어요?")){
				return;
			}else{
				location.href="/buyer/signin/view";
			}
		})
		
		$("#sellerCartBtn").on("click", function(){
			if(!confirm("구매회원만 사용가능한 기능입니다. 구매회원으로 로그인하시겠어요?")){
				return;
			}else{
				location.href="/buyer/signin/view";
			}
		})
		
		$("#buyerPurchaseBtn").on("click", function(){
			
			if(numberChecked == false){
				alert("수량 확인해주세요");
				return;
			}else{
				location.href="/buyer/purchasing/view";
			}
			
			let productId = ${product.id};
			let productAmount = $("#productAmountInput").val();
			let productSumPrice = $("#productSumPrice").text();
			let productTotalPrice = $("#productTotalPrice").text();
			
			
			$.ajax({
				type:"post"
				, url:"/buyer/cart/add"
				, data:{"productId":productId, "productPrice":productPrice, "productAmount":productAmount, "productDeliveryPrice":productDeliveryPrice, "productSumPrice":productSumPrice, "productTotalPrice":productTotalPrice}
				, success:function(data){
					if(data.result =="success"){
						location.href="/buyer/purchasing/view";
					}
				}
				, error:function(){
					alert("구매에러");
				}
			})
		})
		
		$("#buyerCartBtn").on("click", function(){

			let productId = ${product.id};
			let productPrice = parseInt($("#productPrice").text());
			let productAmount = $("#productAmountInput").val();
			let productDeliveryPrice = parseInt($("#productDeliveryPrice").text());
			let productSumPrice = productPrice * productAmount;
			let productTotalPrice = productSumPrice + productDeliveryPrice;
			
			if(numberChecked == false){
				alert("수량 확인해주세요");
				return;
			}

			$.ajax({
				type:"post"
				, url:"/buyer/cart/add"
				, data:{"productId":productId, "productPrice":productPrice, "productAmount":productAmount, "productDeliveryPrice":productDeliveryPrice, "productSumPrice":productSumPrice, "productTotalPrice":productTotalPrice}
				, success:function(data){
					if(data.result =="success"){
						if(!confirm("장바구니에 추가성공. 장바구니로 이동하시겠어요?")){
							return;
						}else{
							location.href="/buyer/cart/view";
						}
					}else if(data.result == "exists"){
						if(!confirm("이미 추가했습니다. 장바구니로 이동하시겠어요?")){
							return;
						}else{
							location.href="/buyer/cart/view";
						}
					}else{
						alert("추가 실패");
					}
				}
				, error:function(){
					alert("에러");
				}
			})
			
		})
		
		$("#detailsBox").show();
		$("#cancelBox").hide();
		
		$("#detailsBtn").css("background-color","#3B71CA");
		
		$("#detailsBtn").on("click", function(){
			$("#detailsBox").show();
			$("#cancelBox").hide();
			
			$("#detailsBtn").css("background-color","#3B71CA");
			$("#cancelBtn").css("background-color","#FBFBFB");
		});
		
		$("#cancelBtn").on("click", function(){
			$("#detailsBox").hide();
			$("#cancelBox").show();
			
			$("#detailsBtn").css("background-color","#FBFBFB");
			$("#cancelBtn").css("background-color","#3B71CA");
		});
	})
</script>
</html>