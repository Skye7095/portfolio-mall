<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="d-flex justify-content-between align-items-end">
	<div class="search-bar d-flex align-items-center">
		<img class="ml-2" width="50" src="/static/images/logo.png">
           <input type="text" class="form-control ml-2">
           <div class="search-icon ml-2" id="searchBtn"><i class="bi bi-search"></i></div>
	</div>
	
	<div class="d-flex justify-content-between">
		<a href="/buyer/cart/view">장바구니</a><span>&nbsp|&nbsp</span>
		<c:choose>
			<c:when test="${not empty buyerId }">
				<span>${buyerName }님 환영합니다</span> <a href="/buyer/signout">로그아웃</a>
			</c:when>
			<c:when test="${empty buyerId }">
				<a href="/buyer/signin/view">로그인</a>
			</c:when>
		</c:choose>
	</div>
</header>