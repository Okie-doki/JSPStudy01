<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

<div class="jumbotron mb-5">
	<div class="container">
		<h1 class="display-5">상품 상세 정보</h1>
	</div>
</div>

<div class="d-flex container">
	<div class="card" style="width: 400px">
		<img class="card-img-top" src="/ServletProject03/upload/${product.filename }" alt="Card image">
	</div>
	<div class="container">
		<table class="table table-borderless">
			<tr>
				<th width="200px">상품명(분류)</ht>
				<td>${product.pname}(${product.category })</td>
			</tr>
			<tr>
				<th>가격</ht>
				<td>${product.unitPrice}</td>
			</tr>
			<tr>
				<th>제조사</ht>
				<td>${product.manufacturer}</td>
			</tr>
			<tr>
				<th>재고수</ht>
				<td>${product.unitsInStock}</td>
			</tr>
			<tr>
				<th>상태</ht>
				<td>${product.condition}</td>
			</tr>
			<tr>
				<th>설명</ht>
				<td>${product.description}</td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-primary">장바구니</button>
					<button class="btn btn-info">구매하기</button>
				</td>
			</tr>
		</table>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>