<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

<div class="jumbotron mb-5">
	<div class="container">
		<h1 class="display-5">상품목록</h1>
	</div>
</div>

<div class="container">
	<div class="row" align="center">
		<c:forEach items="${products }" var="product">
			<div class="col-4" style="width: 400px">
				<img class="card-img-top" src="/ServletProject03/upload/${product.filename }"
					alt="Card image" style="width: 50%">
				<div>
					<h4 class="card-title">${product.pname }</h4>
					<p class="card-text">${product.description }</p>
					<a href="pdetail?productId=${product.productId }" class="btn btn-primary">상세보기</a>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>