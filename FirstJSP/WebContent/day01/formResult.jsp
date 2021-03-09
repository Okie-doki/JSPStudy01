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
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String pwd = request.getParameter("pwd");
	String gender = request.getParameter("gender");
	String[] Hobbies =request.getParameterValues("hobby"); //배열일 경우 getParameterValues
	String strHobby="";
	try{
		for(String hobby : Hobbies)
			strHobby += hobby + " ";
	}catch(NullPointerException e){
		strHobby = "선택없음";
	}
	String job = request.getParameter("job");
%>
<body>
	이름 : <%=name %><br>
	나이 : <%=age %><br>
	비밀번호 : <%=pwd %><br>
	성별 : <%=gender %><br>
	취미 : <%=strHobby %><br>
	직업 : <%=job %><br>
	<hr>
	이름 : <%=request.getParameter("name") %><br>
	나이 : <%=request.getParameter("age") %><br>
	비밀번호 : <%=request.getParameter("pwd") %><br>
	성별 : <%=request.getParameter("gender") %><br>
	취미 : <%=strHobby %><br>
	직업 : <%=request.getParameter("job") %><br>
</body>
</html>