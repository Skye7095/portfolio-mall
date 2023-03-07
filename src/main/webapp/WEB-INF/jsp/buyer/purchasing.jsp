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
					<article class="border container bg-light">
						<div class="d-flex justify-content-between align-items-end mt-3">
							<h4 class="font-weight-bold text-success">김지윤</h4>
							<button class="btn btn-info">배송지 변경</button>
						</div>
						
						<h6 class="font-weight-bold">김지윤 010-0000-0000</h6>
					  	<h6>서울특별시 강남구 테헤란로</h6>
					</article>
					
					<article class="border container my-3 bg-light">
						<h4 class="font-weight-bold mt-3">캐시 사용</h4>
						<hr>						
					  	<div class="my-3">
					  		<div class="d-flex">
						  		<div class="col-4 font-weight-bold">
						    		<label class="col-form-label">나의 캐시 <span class="text-primary">89원</span></label>
						    	</div>
						    	<div class="col-8 d-flex">
					    			<input type="text" class="form-control mr-2">
					    			<button class="btn btn-success d-none">사용하기</button>
					    			<button class="btn btn-secondary">전액사용</button>
					    		</div>
				    		</div>
					  	</div>
					</article>
					
					<article class="border container mt-3 bg-light">
						<h4 class="font-weight-bold mt-3">결제수단</h4>
						<hr>
						<div class="container my-3 d-flex justify-content-around">
					    	<div class="text-center">
					    		<img width="100" src="https://blog.kakaocdn.net/dn/U0ezR/btqzR2cXmFv/4KMeM58bVZK3Qftiue0CtK/img.jpg">
					    		<p>현대카드</p>
					    	</div>
					    	<div class="text-center">
					    		<img width="100" src="https://blog.kakaocdn.net/dn/U0ezR/btqzR2cXmFv/4KMeM58bVZK3Qftiue0CtK/img.jpg">
					    		<p>현대카드</p>
					    	</div>
					    	<div class="text-center">
					    		<img width="100" src="https://blog.kakaocdn.net/dn/U0ezR/btqzR2cXmFv/4KMeM58bVZK3Qftiue0CtK/img.jpg">
					    		<p>현대카드</p>
					    	</div>
					    	<div class="text-center">
					    		<img width="100" src="https://blog.kakaocdn.net/dn/U0ezR/btqzR2cXmFv/4KMeM58bVZK3Qftiue0CtK/img.jpg">
					    		<p>현대카드</p>
					    	</div>
					  	</div>
					  	
					  	<div class="container my-3 d-flex justify-content-around">
					    	<div class="text-center">
					    		<img width="100" src="https://blog.kakaocdn.net/dn/U0ezR/btqzR2cXmFv/4KMeM58bVZK3Qftiue0CtK/img.jpg">
					    		<p>현대카드</p>
					    	</div>
					    	<div class="text-center">
					    		<img width="100" src="https://blog.kakaocdn.net/dn/U0ezR/btqzR2cXmFv/4KMeM58bVZK3Qftiue0CtK/img.jpg">
					    		<p>현대카드</p>
					    	</div>
					    	<div class="text-center">
					    		<img width="100" src="https://blog.kakaocdn.net/dn/U0ezR/btqzR2cXmFv/4KMeM58bVZK3Qftiue0CtK/img.jpg">
					    		<p>현대카드</p>
					    	</div>
					    	<div class="text-center">
					    		<img width="100" src="https://blog.kakaocdn.net/dn/U0ezR/btqzR2cXmFv/4KMeM58bVZK3Qftiue0CtK/img.jpg">
					    		<p>현대카드</p>
					    	</div>
					  	</div>
					  	
					</article>
				</div>
				
				<div class="simple-paymentinfo2-card col-4 mb-3">
					<aside class="border border-dark">
						<div class="container my-3">
							<div>
								<h5 class="font-weight-bold">주문상품 1개</h5>		
							</div>
							<hr>
							<div class="details">
								<div class="items">
									<div class="d-flex">
										<img width="100" height="100" src="https://m.worldwideworld.kr/web/product/tiny/202209/4be7381e5e91bbd41126eb391dd4ee38.jpg">
										<div>
											<a class="text-dark" href="#">1+1 1989 뉴욕 자수로고 버킷햇</a>
											<div>
												<span class="font-weight-bold">9,900원</span>
												<span> / 1개</span>
											</div>
										</div>
									</div>
									<div class="bg-light d-flex justify-content-between">
										<span>배송비</span>
										<span>3,000원</span>
									</div>
								</div>
								<hr>
								<div class="items">
									<div class="d-flex">
										<img width="100" height="100" src="https://m.worldwideworld.kr/web/product/tiny/202209/4be7381e5e91bbd41126eb391dd4ee38.jpg">
										<div>
											<a class="text-dark" href="#">1+1 1989 뉴욕 자수로고 버킷햇</a>
											<div>
												<span class="font-weight-bold">9,900원</span>
												<span> / 1개</span>
											</div>
										</div>
									</div>
									<div class="bg-light d-flex justify-content-between">
										<span>배송비</span>
										<span>0원</span>
									</div>
								</div>
								<hr>
								<div class="d-flex justify-content-between">
									<div>
										<p>상품금액</p>
										<p>할인금액</p>
										<p>배송비</p>
									</div>
									<div class="text-right">
										<p>19,800원</p>
										<p class="text-success">-0원</p>
										<p>3,000원</p>
									</div>
								</div>
							</div>
							<hr>
							<div class="d-flex justify-content-between align-items-center">
								<h5 class="font-weight-bold">총결제금액</h5>
								<h3 class="font-weight-bold">22,800원</h3>
							</div>
							<p class="text-right">캐시 <span class="text-primary">70원</span> 정립예정</p>
							<button class="btn btn-primary btn-block text-white font-weight-bold my-3" type="button">결제하기</button>
						</div>
					</aside>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			
		})
	</script>
</body>
</html>