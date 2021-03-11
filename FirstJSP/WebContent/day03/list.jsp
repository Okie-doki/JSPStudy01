<%@page import="com.day03.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.day03.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	AddressDAO dao = AddressDAO.getInstance();
	ArrayList<Address> arr = dao.getList();
%>
<body>
	<div align="right"><a href="insert.jsp">추가하기</a></div>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Address ad : arr){
		%>
			<tr>
				<td><%=ad.getNum() %></td>
				<td><%=ad.getName() %></td>
				<td><%=ad.getAddr() %></td>				
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</body>
