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
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		int sum = num1 + num2;
// 		out.println(sum);
	%>
	결과 : <%=num1+num2 %><br>
	sum : <%=sum %><hr>
	
	<%
// 		짝수, 홀수 출력
		if(sum%2==0){
	%>
			<%=sum %> : 짝수
	<%
		}else{
	%>
			<%=sum %> : 홀수
	<%
		}
	%>
</body>
</html>