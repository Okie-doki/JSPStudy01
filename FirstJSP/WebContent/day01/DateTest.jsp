<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%!
	Calendar ca = Calendar.getInstance();
	String[] week = {"일", "월", "화", "수", "목", "금", "토"};
	String day_of_the_week = null;
%>
<%
	switch(ca.get(Calendar.DAY_OF_WEEK)){
	case 1: day_of_the_week = "일"; break;
	case 2: day_of_the_week = "월"; break;
	case 3: day_of_the_week = "화"; break;
	case 4: day_of_the_week = "수"; break;
	case 5: day_of_the_week = "목"; break;
	case 6: day_of_the_week = "금"; break;
	case 7: day_of_the_week = "토"; break;
	}
%>
</head>
<body>
	오늘은
	<%=ca.get(Calendar.YEAR) %>년
	<%=ca.get(Calendar.MONTH)+1 %>월
	<%=ca.get(Calendar.DATE) %>일
	<%=ca.get(Calendar.DAY_OF_WEEK) %>
	<hr>
	배열을 이용한 요일 : <%=week[ca.get(Calendar.DAY_OF_WEEK)-1] %>요일
	<hr>
	switch를 이용한 요일 : <%=day_of_the_week %>요일
</body>
</html>