<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		out.println("이름 : "+name);
	%>
	<br>
	<%
		out.println("주소 : "+addr);
	%>
	<br>
	<%
		out.println("전화번호 : "+phone);
	%>
</body>
</html>