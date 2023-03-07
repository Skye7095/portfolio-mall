<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
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
				
				<aside class="container productmanager-content">
					<div class="d-flex justify-content-between">
						<h3>상품관리</h3>
						<button class="btn btn-primary">상품 업로드</button>
					</div>
					<table class="table mt-3">
						<thead class="table-secondary text-center">
							<tr>
								<th>상품번호</th>
								<th>상품</th>
								<th>재고</th>
								<th>단가</th>
								<th></th>
							</tr>
						<thead>
						
						<tbody class="border">
							<tr>
								<th class="text-center">00020012</th>
								<th class="d-flex align-items-start">
									<img width="50" height="50" src="https://m.worldwideworld.kr/web/product/tiny/202209/4be7381e5e91bbd41126eb391dd4ee38.jpg">
									<a href="#">1+1 1989 뉴욕 자수로고 버킷햇</a>
								</th>
								<th class="text-center">3</th>
								<th class="text-center">9,900원</th>
								<th class="text-center">
									<button class="btn btn-danger">판매중지</button>
								</th>
							</tr>
						</tbody>
					</table>
				</aside>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
</body>
</html>