<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<section class="container my-3">
			<div class="bannerBox d-flex justify-content-center mb-3">	
				<div class="navBox d-flex justify-content-center mb-3">
					<aside class="col-2 bg-success">
						<h4 class="text-white mt-2">전체카테고리</h4>
						<ul class="nav nav-pills">
							<li class="nav-item">
						    	<button class="btn btn-success btn-block"><a class="text-white" href="/product/category/view?category=패션·의류·잡화">패션·의류·잡화</a></button>
							</li>
							<li class="nav-item">
							    <button class="btn btn-success btn-block"><a class="text-white" href="/product/category/view?category=식품·생필품">식품·생필품</a></button>
							</li>
							<li class="nav-item">
							    <button class="btn btn-success btn-block"><a class="text-white" href="/product/category/view?category=컴퓨터·가전제품">컴퓨터·가전제품</a></button>
							</li>
							<li class="nav-item">
							    <button class="btn btn-success btn-block"><a class="text-white" href="/product/category/view?category=기타">기타</a></button>
							</li>
						</ul>
					</aside>
					<div class="col-10 banners">
						<article class="bannerImg">
							<img width="800px" height="300px" id="bannerImage" src="/static/images/banner1.jpg">
						</article>
					</div>
				</div>	
			</div>
			<article class="main-content">
				<h3 class="font-weight-bold">최신 상품</h3>
				<div class="container contents d-flex flex-wrap justify-content-center">
				<c:forEach var="product" items="${productList }">
					<div class="itemContent border text-center mx-3 my-3">
						<a href="/product/items/view?id=${product.id }">
	                        <img width=200px class="img-thumbnail mt-2" src="${product.productImgPath }">
	                        <div class="name mt-2">${product.name }</div>
	                        <div class="price mt-2"><h4 class="font-weight-bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}"/>원</h4></div>
                        </a>
                    </div>
                </c:forEach>
				</div>
			</article>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			var bannerList = ["/static/images/banner1.jpg", "/static/images/banner2.jpg", "/static/images/banner3.jpg"];
            var currentImageIndex = 0;
            setInterval(function() {
                $("#bannerImage").attr("src", bannerList[currentImageIndex]);
                currentImageIndex++;

                if(currentImageIndex == bannerList.length) {
                    currentImageIndex = 0;
                }
            }, 3000); 
		})
	</script>
</body>
</html>