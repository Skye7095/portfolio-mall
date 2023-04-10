<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<h3 class="mb-3">전체주문내역</h3>
					<table class="table">
						<thead class="table-secondary text-center">
							<tr>
								<th>
									<table width="100%">
										<thead class="text-center">
											<tr>
												주문날짜
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>주문번호</td>
											</tr>
										</tbody>
									</table>
								</th>
								<th>
									<table width="100%">
										<thead class="text-center">
											<tr>
												주문정보
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>상품정보</td>
												<td>주문상태</td>
											</tr>
										</tbody>
									</table>
								</th>
							</tr>
						</thead>
											
						<tbody>
						<c:forEach var="orderDetail" items="${orderDetailList }" >
						<tr>
							<td class="text-center">
								<span><fmt:formatDate value="${orderDetail.createdAt }" pattern="yyyy-MM-dd" /></span>
								<p>주문번호: ${orderDetail.orderId }</p>
							</td>
							
							<td>
								<table width="100%">
									<tbody>
									<c:forEach var="orderItems" items="${orderDetail.orderItemsList }" >
										<td class="d-flex">
											<img width="100" height="100" src="${orderItems.productImgPath }">
											<div>
												<div>
													<a class="text-dark" href="/product/items/view?id=${orderItems.productId }">${buyerOrderDetail.productName }</a>
													<p>수량: ${orderItems.productAmount }개 / ${orderItems.productPrice }원</p>
												</div>
												<div>
													<h4>${orderItems.productSumPrice }원</h4>
												</div>
											</div>
										</td>	
										<td class="text-center">
											<h4>${orderItems.status }</h4>
											<c:if test="${orderItems.status eq '배송중' || orderItems.status eq '배송완료'}">
												<h6>${orderItems.deliveryNumber }</h6>
											</c:if>
										</td>
									</tbody>
									</c:forEach>
								</table>
							</td>
							
						</tr>
						</c:forEach>
						</tbody>
					</table>
				</article>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
</body>
</html>