<%@page import="com.board.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
	BoardDAO dao = BoardDAO.getInstance();
	
// 	검색
	String field ="";
	String word = "";
	if(request.getParameter("word")!=null){
		word = request.getParameter("word");
		field = request.getParameter("field");
	}
	
	ArrayList<BoardDTO> arr = dao.boardList(field, word);
	int count = dao.boardCount(field, word);
	
%>

</head>
<body>
	<div align="right">
		<a href="writeForm.jsp">글쓰기</a>
	</div>
	<h2>게시글 목록(<%=count %>)</h2>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<%
			for(BoardDTO board : arr){
		%>
		<tr>
			<td><%=board.getNum() %></td>
			<td><a href="boardView.jsp?num=<%=board.getNum()%>"><%=board.getSubject() %></a></td>
			<td><%=board.getWriter() %></td>
			<td><%=board.getReg_date() %></td>
			<td><%=board.getReadcount() %></td>
		</tr>
		<%
			}
		%>
	</table>
	<br><br>
	
	<form action="list.jsp" name="search" method="get">
		<select name="field" size="1">
			<option value="subject">제목</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" size="16" name="word">
		<input type="submit" value="찾기">
	</form>

</body>
</html>