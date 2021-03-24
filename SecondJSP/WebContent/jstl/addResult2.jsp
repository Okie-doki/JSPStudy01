<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 사용하기 위한 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	첫번째 수 : ${param.num1 }<br>
	두번째 수 : ${param.num2 }<br>
	<hr>
	결과 : ${param.num1 + param.num2 }<br>
	
<!-- 	jstl 출력문-->
	<c:set var="no" value="${param.num1 }">
	</c:set>
	${no }<br>
	
<!-- 	jstl if문 -->
	<c:if test="${no%2==0 }">
		짝수
	</c:if>
	<c:if test="${no%2!=0 }">
		홀수
	</c:if>
	<hr>
	
<!-- 	jstl switch문 -->
	<c:choose>
		<c:when test="${no%2==0 }">
			짝수
		</c:when>
		<c:when test="${no%3==0 }">
			3의 배수
		</c:when>
		<c:otherwise>
			홀수
		</c:otherwise>
	</c:choose>
	<hr>
</body>
</html>