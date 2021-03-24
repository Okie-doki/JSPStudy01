<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${param.id }가 좋아하는 색깔은 ${param.color }
	<hr>
	
	<c:set var="id" value="${param.color }"></c:set>
	
	<c:if test="${param.id=='' || param.id==null }">
		<c:set var="id" value="guest"></c:set>
	</c:if>
	
	<c:choose>
		<c:when test="${param.color=='yellow' }">
			<c:set var="c" value="노랑색">
			</c:set>
		</c:when>
		<c:when test="${param.color=='blue' }">
			<c:set var="c" value="파랑색">
			</c:set>
		</c:when>
		<c:when test="${param.color=='orange' }">
			<c:set var="c" value="오렌지색">
			</c:set>
		</c:when>
		<c:when test="${param.color=='pink' }">
			<c:set var="c" value="분홍색">
			</c:set>
		</c:when>
		<c:when test="${param.color=='black' }">
			<c:set var="c" value="검정색">
			</c:set>
		</c:when>
	</c:choose>
	
	${id }가 좋아하는 색깔은 <span style="background-color: ${param.color}">${c }</span>
</body>
</html>