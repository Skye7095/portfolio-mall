<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 업로드</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/productstyle.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/smallheader.jsp"/>
		<section class="upload-section container">
			<h2 class="font-weight-bold">상품등록</h2>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="font-weight-bold col-3">판매자ID</td>
						<td>ksjdf</td>
					</tr>
					<tr>
						<td class="font-weight-bold col-3">스토어 네임</td>
						<td>지윤이네</td>
					</tr>
					<tr>
						<td class="font-weight-bold col-3">상품 이미지</td>
						<td class="d-flex justify-content-center">
							<div class="img-upload col-4 d-flex justify-content-center align-items-center">
								<input class="file" type="file" multiple>
							</div>
							<div class="img-list">
								<div class="files d-flex justify-content-center align-items-center">
								    <img width="25" src="http://m.tmoja.com/web/product/big/bn_ballcap_bk_1.jpg">
								    <label>http://m.tmoja.com/web/product/big/bn_ballcap_bk_1.jpg</label>
								</div>
								<div class="files d-flex justify-content-center align-items-center">
								    <img width="25" src="http://m.tmoja.com/web/product/big/bn_ballcap_bk_1.jpg">
								    <label>http://m.tmoja.com/web/product/big/bn_ballcap_bk_1.jpg</label>
								</div>
								<div class="files d-flex justify-content-center align-items-center">
								    <img width="25" src="http://m.tmoja.com/web/product/big/bn_ballcap_bk_1.jpg">
								    <label>http://m.tmoja.com/web/product/big/bn_ballcap_bk_1.jpg</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="font-weight-bold col-3">카테고리</td>
						<td><select class="form-select form-select-lg">
							  <option selected>전체 카테고리</option>
							  <option value="1">패션·의류·잡화</option>
							  <option value="2">식품·생필품</option>
							  <option value="3">컴퓨터·가전제품</option>
							  <option value="3">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="font-weight-bold col-3">상품명</td>
						<td>
							<div class="input-group">
							  <input type="text" class="form-control" placeholder="최대 한글 25자 또는 영, 숫자 50자">
							</div>
						</td>
					</tr>
					<tr>
						<td class="font-weight-bold col-3">판매가격</td>
						<td>
							<div class="input-group">
							  <input type="text" class="form-control">원
							</div>
						</td>
					</tr>
					<tr>
						<td class="font-weight-bold col-3">판매수량</td>
						<td>
							<div class="input-group">
							  <input type="text" class="form-control">개<span class="text-primary">(최대 99,999개)</span>
							</div>
						</td>
					</tr>
					<tr>
						<td class="font-weight-bold col-3">배송비</td>
						<td>
							<div class="input-group">
							  <input type="text" class="form-control">원
							</div>
						</td>
					</tr>
					<tr>
						<td class="font-weight-bold col-3">상품정보</td>
						<td>
							<textarea class="form-control" rows="20"></textarea>
							<button class="btn btn-primary mt-3">상세설명 이미지</button>
						</td>
					</tr>
				</tbody>	
			</table>
			
			<div class="d-flex justify-content-center my-4">
				<button class="btn btn-lg btn-primary">업로드하기</button>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
</body>
<script>
	$(document).ready(function(){
		
	})
</script>
</html>