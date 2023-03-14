<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<span>상품번호: 0020202020202</span>
					</div>
					
					<article class="d-flex justify-content-around align-items-start">
						<div class="items-img d-flex justify-content-center">
							<img width="80%" src="https://cdn.pixabay.com/photo/2015/06/24/01/15/coffee-819362_960_720.jpg">
						</div>
						
						<div class="payment-info ml-3">
							<btn class="btn btn-white">
								<i class="bi bi-shop-window"></i>
								<span>지윤이네</span>
							</btn>
							<hr>
							<div class="items-info d-flex">
								<div class="col-9">
									<h4>스텐 304 냉장고 물병 2P세트 외 주방 S/S신상 시리즈</h4>
									<div class="stars">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-half"></i>
										<i class="bi bi-star"></i>
										<span>(3.5)</span>
									</div>
									<h2>22,900원</h2>
								</div>
								<div class="like col-3 d-flex justify-content-center align-items-center">
									<btn class="btn btn-white btn-lg rounded-circle border border-dark"><i class="bi bi-heart"></i></btn>
								</div>
							</div>
							<hr>
							
							<div class="delivery-info d-flex p-2">
								<i class="bi bi-truck"></i>
								<p class="ml-3">배송비: 3,000원</p>
							</div>
							<hr>
							
							<div class="option-info bg-light border">
								<div class="items d-flex justify-content-around">
									<h6 class="col-8">스텐 304 냉장고 물병 2P세트 외 주방 S/S신상 시리즈</h6>
									<button class="btn">X</button>
								</div>
								<hr>
								<div class="d-flex justify-content-around mb-3">
									<div class="amount d-flex align-items-end">
										<div>
											<i class="bi bi-dash-circle"></i>
										</div>
										<div class="mx-1">
											<input class="amountinput" type="text">
										</div>
										<div>
											<i class="bi bi-plus-circle"></i>										
										</div>
									</div>
									<div class="price">
										<h6 class="font-weight-bold">22,900원</h6>
									</div>
								</div>
							</div>
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
							  <li class="nav-item">
							    <button class="btn btn-light btn-lg" id="reviewBtn">상품리뷰</button>
							  </li>
							  <li class="nav-item">
							    <button class="btn btn-light btn-lg" id="inquiryBtn">상품문의</button>
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
								<img width="100%" src="https://cdn.pixabay.com/photo/2023/02/26/14/04/deer-7815910_960_720.jpg">
							</div>
      						<div id="reviewBox" class="my-3">
      							<p class="font-weight-bold">상품리뷰</p>
      							<table class="table text-center">
      								<thead>
      									<tr>
      										<th width="100"></th>
      										<th>리뷰내용</th>
      										<th>작성자</th>
      										<th>작성일</th>
      									</tr>
      								</thead>
      								
      								<tbody>
      									<tr height="100">
      										<td width="100" class="bg-info d-flex justify-content-center align-items-center"></td>
      										<td>빼송 빠름</td>
      										<td>맛있장러</td>
      										<td>2023.02.09</td>
      									</tr>
      									<tr height="100">
      										<td width="100" class="bg-info"></td>
      										<td>빼송 빠름</td>
      										<td>맛있장러</td>
      										<td>2023.02.09</td>
      									</tr>
      								</tbody>
      							</table>
      						</div>
      						<div id="inquiryBox" class="my-3">
      							<p class="font-weight-bold">상품문의</p>
      							<hr>
      							<div class="d-flex justify-content-end mb-3">
      								<button class="btn btn-light">문의하기</button>
      								<button class="btn btn-light">전체 문의보기</button>
      							</div>
      							
      							<table class="table text-center">
      								<thead>
      									<tr>
      										<th>번호</th>
      										<th>답변상태</th>
      										<th>제목</th>
      										<th>문의자</th>
      										<th>등록일</th>
      									</tr>
      								</thead>
      								
      								<tbody>
      									<tr>
      										<td>1</td>
      										<td>진행중</td>
      										<td>상품 문의합니다</td>
      										<td>ohm***</td>
      										<td>2023.03.10</td>
      									</tr>
      								</tbody>
      							</table>
							</div>
      						<div id="cancelBox" class="my-3">
      							<div class="cancelinfo">
      								<p class="font-weight-bold">교환/반품 정보</p>
      								<hr>
      								<div class="small">
      									<div>· <span class="font-weight-bold">반품배송비(편도):&nbsp;</span>3,000원</div>
      									<div>· <span class="font-weight-bold">교환배송비(완보):&nbsp;</span>6,000원</div>
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
      									<div>· 상호명: 지윤이네</div>
      									<div>· 대표자: 신진욱</div>
      									<div>· 연락처: 010-0202-0202</div>
      									<div>· 사업장소재지: 대전 유성구</div>
      									<div>· 이메일: envlkdjf@gmail.com</div>
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
										<div class="d-flex">
											<img width="100" height="100" src="https://m.worldwideworld.kr/web/product/tiny/202209/4be7381e5e91bbd41126eb391dd4ee38.jpg">
											<div>
												<a class="text-dark" href="#">1+1 1989 뉴욕 자수로고 버킷햇</a>
											</div>
										</div>
										<div class="d-flex justify-content-around mb-3">
											<div class="amount d-flex align-items-end">
												<div>
													<i class="bi bi-dash-circle"></i>
												</div>
												<div class="mx-1">
													<input class="amountinput" type="text">
												</div>
												<div>
													<i class="bi bi-plus-circle"></i>										
												</div>
											</div>
										</div>
										<div class="price bg-light d-flex justify-content-between">
												<h6>가격</h6>
												<h6 class="font-weight-bold">22,900원</h6>
											</div>
										<div class="bg-light d-flex justify-content-between">
											<span>배송비</span>
											<span>3,000원</span>
										</div>
									</div>
									<hr>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<h5 class="font-weight-bold">총 금액</h5>
									<h3 class="font-weight-bold">22,800원</h3>
								</div>
								<button class="btn btn-light btn-block border text-dark font-weight-bold my-3" type="button">장바구니</button>
								<button class="btn btn-primary btn-block text-white font-weight-bold my-3" type="button">결제하기</button>
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
		$("#detailsBox").show();
		$("#reviewBox").hide();
		$("#inquiryBox").hide();
		$("#cancelBox").hide();
		
		$("#detailsBtn").css("background-color","#3B71CA");
		
		$("#detailsBtn").on("click", function(){
			$("#detailsBox").show();
			$("#reviewBox").hide();
			$("#inquiryBox").hide();
			$("#cancelBox").hide();
			
			$("#detailsBtn").css("background-color","#3B71CA");
			$("#reviewBtn").css("background-color","#FBFBFB");
			$("#inquiryBtn").css("background-color","#FBFBFB");
			$("#cancelBtn").css("background-color","#FBFBFB");
		});
		
		$("#reviewBtn").on("click", function(){
			$("#detailsBox").hide();
			$("#reviewBox").show();
			$("#inquiryBox").hide();
			$("#cancelBox").hide();
			
			$("#detailsBtn").css("background-color","#FBFBFB");
			$("#reviewBtn").css("background-color","#3B71CA");
			$("#inquiryBtn").css("background-color","#FBFBFB");
			$("#cancelBtn").css("background-color","#FBFBFB");
		});
		
		$("#inquiryBtn").on("click", function(){
			$("#detailsBox").hide();
			$("#reviewBox").hide();
			$("#inquiryBox").show();
			$("#cancelBox").hide();
			
			$("#detailsBtn").css("background-color","#FBFBFB");
			$("#reviewBtn").css("background-color","#FBFBFB");
			$("#inquiryBtn").css("background-color","#3B71CA");
			$("#cancelBtn").css("background-color","#FBFBFB");
		});
		
		$("#cancelBtn").on("click", function(){
			$("#detailsBox").hide();
			$("#reviewBox").hide();
			$("#inquiryBox").hide();
			$("#cancelBox").show();
			
			$("#detailsBtn").css("background-color","#FBFBFB");
			$("#reviewBtn").css("background-color","#FBFBFB");
			$("#inquiryBtn").css("background-color","#FBFBFB");
			$("#cancelBtn").css("background-color","#3B71CA");
		});
	})
</script>
</html>