<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 주문 내역</title>
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
		<section class="buyerOrderHistory-section my-5">
			<div class="container d-flex justify-content-center align-items-start">
				<c:import url="/WEB-INF/jsp/common/buyerPersonalNav.jsp" />
				
				<article class="container history-content">
					<table class="table">
						<thead class="table-secondary text-center">
							<tr>
								<th>날짜</th>
								<th>상품정보</th>
								<th>상태</th>
								<th>확인/신청</th>
							</tr>
						</thead>
						
						<tbody>
							<tr class="border">
								<td class="text-center">
									<span>2023-01-01</span>
									<div class="mt-2">
										<button class="btn btn-secondary">주문상세보기</button>
									</div>
									<div class="mt-2">
										<button class="btn btn-secondary">주문내역삭제</button>
									</div>
								</td>
								<td class="d-flex">
									<img width="100" height="100" src="https://m.worldwideworld.kr/web/product/tiny/202209/4be7381e5e91bbd41126eb391dd4ee38.jpg">
									<div>
										<div>
											<div class="d-flex align-items-end">
												<i class="bi bi-shop-window"></i>
												<a class="ml-1 text-dark" href="#">지윤이네</a>
												<button class="btn btn-sm btn-light ml-2">문의하기</button>
											</div>
											<a class="text-dark" href="#">1+1 1989 뉴욕 자수로고 버킷햇</a>
											<p>수량: 1개 / 주문번호: 0101011000101</p>
										</div>
										<div>
											<button class="btn btn-sm btn-light">옵션전체 보기<i class="bi bi-caret-right-fill"></i></button>
											<h4>9,900원</h4>
										</div>
									</div>
									
								</td>
								<td class="text-center">
									<h4>배송완료</h4>
									<div class="mt-2">
										<a href="#">배송추적<i class="bi bi-caret-right-fill"></i></a>
									</div>
								</td>
								<td class="text-center">
									<div class="mt-2">
										<button class="btn btn-success">리뷰 쓰기</button>
									</div>
									<div class="mt-2">
										<button class="btn btn-light">반품신청</button>
									</div>
									<div class="mt-2">
										<button class="btn btn-light">교환신청</button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
</body>
</html>