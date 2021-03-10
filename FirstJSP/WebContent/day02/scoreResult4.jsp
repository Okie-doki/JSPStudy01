<%@page import="com.day02.ScoreBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- jsp:useBean 객체 생성과 동일 -->
<!-- class -> 파일 위치 -->
<jsp:useBean id="sb" class="com.day02.ScoreBean"></jsp:useBean>
<jsp:setProperty property="*" name="sb"/>

<!-- 개별 생성 방법 -->
<%-- <jsp:setProperty property="name" name="sb"/> --%>
<%-- <jsp:setProperty property="kor" name="sb"/> --%>
<%-- <jsp:setProperty property="eng" name="sb"/> --%>
<%-- <jsp:setProperty property="math" name="sb"/> --%>

<body>
	이름 : <%=sb.getName() %><br>
	국어 : <%=sb.getKor() %><br>
	영어 : <%=sb.getEng() %><br>
	수학 : <%=sb.getMath() %><br>
	총점 : <%=sb.getTotal() %><br>
	평균 : <%=sb.getAvg() %><br>
	학점 : <%=sb.getGrade() %><br>
</body>
</html>