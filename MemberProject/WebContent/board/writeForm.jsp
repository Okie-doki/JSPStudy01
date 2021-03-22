<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기</h1>
	<form action="writePro.jsp" method="post">
		<table border="1">
			<tr>
				<td colspan="2" align="right"><a href="list.jsp">목록</a></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="writer">
				</td>
			</tr>
			<tr>
				<td>Email</td>
				<td>
					<input type="text" name="email">
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="subject">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="50" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="passwd">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="저장">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>