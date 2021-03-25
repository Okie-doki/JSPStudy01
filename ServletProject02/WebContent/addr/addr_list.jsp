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
	<div align="right"><a href="insert.addr">글쓰기</a></div>
	<h3>회원목록보기(${count })</h3>
	<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>주소</th>
				<th>우편번호</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${lists }" var="address">
				<tr>
					<td><a href="view.addr?num=${address.num }">${address.name }</a></td>
					<td>${address.addr }</td>
					<td>${address.zipcode }</td>
					<td>${address.tel }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>