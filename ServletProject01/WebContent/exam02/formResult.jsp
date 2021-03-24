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
<!-- 	JSTL(JSP Standard Tag Library) -->
	<h3>JSTL</h3>
	이름 : <c:out value="${name }"></c:out><br>
	성별 : <c:out value="${gender }"></c:out><br>
	나이 : <c:out value="${age }"></c:out><br>
	직업 : <c:out value="${job }"></c:out><br>
	취미 :
	<c:forEach items="${hobby }" var="h">
		${h }
	</c:forEach>
	<hr>
	
<%-- 	${} <- EL(Expression Language) 표기 --%>
	<h3>EL</h3>
	이름 : ${name }<br>
	성별 : ${gender }<br>
	나이 : ${age }<br>
	직업 : ${job }<br>
	취미(JSTL) : 
	<c:forEach items="${hobby }" var="h">
	 ${h }
	</c:forEach>
	<hr>
	
	<h3>Person2 객체</h3>
	이름 : ${p2.name }<br>
	성별 : ${p2.gender }<br>
	나이 : ${p2.age }<br>
	직업 : ${p2.job }<br>
	취미(JSTL) :
	<c:forEach items="${p2.hobby }" var="h">
		${h }
	</c:forEach>
	<hr> 
</body>
</html>