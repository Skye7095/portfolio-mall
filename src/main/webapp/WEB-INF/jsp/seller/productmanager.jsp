<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						<button class="btn btn-primary" id="goToBtn">상품 업로드</button>
					</div>
					<table class="table mt-3">
						<thead class="table-secondary text-center">
							<tr>
								<th>상품번호</th>
								<th>상품</th>
								<th>재고</th>
								<th>단가</th>
								<th></th>
								<th></th>
							</tr>
						<thead>
						
						<tbody class="border">
						<c:forEach var="product" items="${productList }">
							<tr>
								<th class="text-center">${product.id }</th>
								<th class="d-flex align-items-start">
									<img width="50" height="50" src="${product.productImgPath }">
									<a href="/product/items/view?id=${product.id }">${product.name }</a>
								</th>
								<th class="text-center">${product.amount }</th>
								<th class="text-center"><fmt:formatNumber value="${product.price }" />원</th>
								<th class="text-center">
									<button class="btn btn-danger modifyBtn" data-product-id="${product.id }">수정</button>
								</th>
								<th class="text-center">
									<button class="btn btn-danger deleteBtn" data-product-id="${product.id }">판매종료</button>
								</th>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</aside>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
</body>

<script>
	$(document).ready(function(){
		
		$(".modifyBtn").on("click", function(){
			let productId = $(this).data("product-id");
			
			location.href="/seller/productmodify/view?id=" + productId;
		})
		
		$(".deleteBtn").on("click", function(){
			let productId = $(this).data("product-id");

			if(!confirm("판매종료되면 해당 상품 재고가 0이되며 판매할 수 없습니다. 진짜 판매종료하시겠어요?")){
				return;
			}else{
				$.ajax({
					type:"post"
					, url:"/seller/productmanager/salesEnd"
					, data:{"productId": productId}
					, success:function(data){
						if(data.result="success"){
							location.reload();
						}else{
							alert("실패");
						}
					}
					, error:function(data){
						alert("에러");
					}
				})
			}
			
		})
		
		$("#goToBtn").on("click", function(){
			location.href="/product/upload/view";
		});
	})
</script>
</html>