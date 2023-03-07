<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 관심</title>
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
		<section class="buyerLike-section my-5">
			<div class="container d-flex justify-content-center align-items-start">
				<c:import url="/WEB-INF/jsp/common/buyerPersonalNav.jsp" />
				
				<article class="container like-content">
					<table class="table">
						<thead>
							<tr>
								<th>
									<div class="d-flex align-items-center">
										<h4><i class="bi bi-check-circle"></i></h4>&nbsp; &nbsp;
										<a class="text-dark" href="#">전체선택</a>&nbsp; | &nbsp;
	    								<a class="text-dark" href="#">선택삭제</a>
									</div>								
								</th>
							</tr>
						</thead>
						
						<tbody>
							<tr class="border">
								<td class="d-flex">
									<h4><i class="bi bi-check-circle"></i></h4>&nbsp; &nbsp;
									<img width="100" height="100" src="https://m.worldwideworld.kr/web/product/tiny/202209/4be7381e5e91bbd41126eb391dd4ee38.jpg">
									<div>
										<div>
											<a class="text-dark" href="#">1+1 1989 뉴욕 자수로고 버킷햇</a>
										</div>
										<div>
											<h4>9,900원</h4>
										</div>
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