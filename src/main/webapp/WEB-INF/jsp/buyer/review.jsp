<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가쓴글-상품평</title>
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
		<section class="buyerWriting-section my-5">
			<div class="container d-flex justify-content-center align-items-start">
				<c:import url="/WEB-INF/jsp/common/buyerPersonalNav.jsp" />
				
				<article class="container writing-content">
					<h3>내가쓴글</h3>
					<div class="identify-select d-flex justify-content-around">
						<ul class="nav nav-tabs">
						  <li class="nav-item buyer-tab text-center">
						    <a class="nav-link" aria-current="page" href="/buyer/signup/view"><span class="text-dark">문의/답변</span></a>
						  </li>
						  <li class="nav-item seller-tab text-center">
						    <a class="nav-link active" href="/seller/signup/view"><span class="text-white font-weight-bold">리뷰</span></a>
						  </li>
						</ul>
					</div>
					
					<table class="table">
						<thead class="table-secondary text-center">
							<tr>
								<th>번호</th>
								<th>상품명</th>
								<th>내용</th>
								<th>작성일</th>
							</tr>
						</thead>
						
						<tbody>
							<tr class="border">
								<td class="text-center">
									<span>1</span>
								</td>
								<td>
									<a class="text-dark" href="#">1+1 1989 뉴욕 자수로고 버킷햇</a>
								</td>
								<td>
									<span>배송도 빠르고 아주 좋아요</span>
								</td>
								<td class="text-center">
									<span>2023-01-01</span>
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