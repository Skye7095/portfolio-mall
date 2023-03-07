<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div class="d-flex align-items-center">
				<h4><i class="bi bi-check-circle"></i></h4>&nbsp; &nbsp;
				<a class="text-dark" href="#">전체선택</a>&nbsp; | &nbsp;
				<a class="text-dark" href="#">선택삭제</a>
			</div>
			
			<div class="d-flex mt-3">
				<article class="container cart-card col-8 mx-3">	
					<table class="table">
						<thead class="table-secondary text-center">
							<tr>
								<th></th>
								<th>상품명</th>
								<th>수량</th>
								<th>가격</th>		
							</tr>
						</thead>
						
						<tbody class="border">
							<tr>
								<th><h4><i class="bi bi-check-circle"></i></h4></th>
								<th class="d-flex">
									<img width="100" height="100" src="https://m.worldwideworld.kr/web/product/tiny/202209/4be7381e5e91bbd41126eb391dd4ee38.jpg">
									<div>
										<a class="text-dark" href="#">1+1 1989 뉴욕 자수로고 버킷햇</a>
									</div>
								</th>
								<th >
									<div class="d-flex">
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
								</th>
								<th>
									<div class="d-flex align-items-center">
										<h4>9,900원</h4>
										<button class="btn btn-light"><h5><i class="bi bi-x"></i></h5></button>
									</div>
								</th>
							</tr>
						</tbody>
					</table>
				</article>
				
				<div class="simple-paymentinfo1-card col-4 mb-3">
					<aside class="border border-dark">
						<div class="container my-3">
							<div>
								<h5 class="font-weight-bold">결제정보</h5>				
							</div>
							<hr>
							<div class="d-flex justify-content-between">
								<div>
									<p>상품수</p>
									<p>상품금액</p>
									<p>배송비</p>
								</div>
								<div class="text-right">
									<p>1개</p>
									<p>9,900원</p>
									<p>0원</p>
								</div>
							</div>
							<hr>
							<div class="d-flex justify-content-between align-items-center">
								<h5 class="font-weight-bold">총결제금액</h5>
								<h3 class="font-weight-bold">9,900원</h3>
							</div>
							<div class="form-check text-center">
								<input class="form-check-input" type="checkbox">
								<label class="form-check-label">비회원으로 주문하기</label>
							</div>
							<button class="btn btn-primary btn-block text-white font-weight-bold my-3" type="button">구매하기</button>
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