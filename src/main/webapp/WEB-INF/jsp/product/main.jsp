<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>몰 메인페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/productstyle.css" type="text/css">

</head>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/smallheader.jsp" />
		<section class="main container my-3">
			<div class="navBox d-flex justify-content-center mb-3">
				<aside class="col-2 bg-success">
					<ul class="nav nav-pills">
						<li class="nav-item">
					    	<button class="btn btn-success btn-block">전체 카테고리</button>
						<li class="nav-item">
					    	<button class="btn btn-success btn-block">상품리뷰</button>
						</li>
						<li class="nav-item">
						    <button class="btn btn-success btn-block">상품문의</button>
						</li>
						<li class="nav-item">
						    <button class="btn btn-success btn-block">교환/반품</button>
						</li>
					</ul>
				</aside>
				<div class="col-10 banners">
					<aside>
						<a class="text-dark big" href="#">출석체크</a>
					</aside>
					<article class="bannerImg">
						<img width="100%" height="100%" src="https://cdn.pixabay.com/photo/2023/03/02/19/37/tunnel-7826204_960_720.jpg">
					</article>
				</div>
			</div>
			<article class="main-content">
				<h3 class="font-weight-bold">지금 제일 잘 나가는 상품</h3>
				<div class="container contents d-flex flex-wrap justify-content-center">
					<div class="content border text-center">
						<a href="#">
	                        <img class="img-thumbnail mt-2" src="data:image/jpeg;base64,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">
	                        <div class="name mt-2">스텐 304 냉장고 물병 2P세트 외 주방 S/S신상 시리즈</a></div>
	                        <div class="price mt-2"><h4 class="font-weight-bold">38,920원</h4></div>
                        </a>
                    </div>
                    <div class="content border text-center">
						<a href="#">
	                        <img class="img-thumbnail mt-2" src="data:image/jpeg;base64,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">
	                        <div class="name mt-2">스텐 304 냉장고 물병 2P세트 외 주방 S/S신상 시리즈</a></div>
	                        <div class="price mt-2"><h4 class="font-weight-bold">38,920원</h4></div>
                        </a>
                    </div>
                    <div class="content border text-center">
						<a href="#">
	                        <img class="img-thumbnail mt-2" src="data:image/jpeg;base64,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">
	                        <div class="name mt-2">스텐 304 냉장고 물병 2P세트 외 주방 S/S신상 시리즈</a></div>
	                        <div class="price mt-2"><h4 class="font-weight-bold">38,920원</h4></div>
                        </a>
                    </div>
				</div>
			</article>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
</body>
</html>