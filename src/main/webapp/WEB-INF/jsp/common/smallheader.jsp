<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="d-flex justify-content-between">
	<div class="search-bar d-flex align-items-center">
		<img class="ml-2" width="50" src="/static/images/logo.png">
           <input type="text" class="form-control ml-2">
           <div class="search-icon ml-2" id="searchBtn"><i class="bi bi-search"></i></div>
	</div>
	
	<div class="icons d-flex align-items-end">
		<a class="text-dark" href="/buyer/signin/view">로그인</a>&nbsp; | &nbsp;
	    <a class="text-dark" href="/buyer/signup/view">회원가입</a>&nbsp; | &nbsp;
	   	<a class="text-dark" href="#">장바구니</a>
	</div>
</header>