<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="d-flex justify-content-between align-items-end">
	<div class="search-bar d-flex align-items-center">
		<a href="/product/main/view"><img class="ml-2" width="50" src="/static/images/logo.png" ></a>
        <input type="text" class="form-control ml-2" id="searchInput">
        <button class="btn btn-primary ml-2" id="searchBtn">검색</button>
	</div>
	
	<div class="d-flex justify-content-between">
		<c:choose>
			<c:when test="${not empty buyerId }">
				<span>${buyerName }님 환영합니다</span> <a href="/buyer/signout">로그아웃</a>
				<span>&nbsp|&nbsp</span><a href="/buyer/cart/view">장바구니</a>
			</c:when>
			
			<c:when test="${not empty sellerId }">
				<span>${sellerName }님 환영합니다</span> <a href="/seller/signout">로그아웃</a>
			</c:when>
			
			<c:when test="${empty buyerId || empty sellerId }">
				<a href="/buyer/signin/view">로그인</a>
			</c:when>
		</c:choose>
		
	</div>
</header>

<script>
	$(document).ready(function(){
		
		$("#searchBtn").on("click", function(){
			let keyword = $("#searchInput").val();
			
			
		})
		
	})
</script>