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
	
// 	한 화면에 보여지는 게시글
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int pageSize = 5; //한 화면에 보여지는 게시글 갯수
	int startRow = (currentPage-1)*pageSize+1; //시작할 게시물 번호
	int endRow = currentPage*pageSize; //마지막 게시물 번호 페이지
	ArrayList<BoardDTO> arr = dao.boardList(field, word, startRow, endRow);
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

	<div align="center">
		<%
			if(count>0){ //예) 게시글 48개 화면에서 한화면에 5개씩 출력 -> 48/5 = 10개
				int pageCount = count/pageSize + (count%pageSize==0? 0:1); //페이지 수 - count%pageSize 나머지값이 존재하면 페이지 수 1추가
				int pageBlock = 3; //한 화면에 출력할 페이지수
				int startPage = (int)((currentPage-1)/pageBlock)*pageBlock+1;
				int endPage = startPage + pageBlock - 1;
				if(endPage > pageCount){
					endPage = pageCount;
				}
				
				//이전
				if(startPage > pageBlock){
					%>
					<a href="list.jsp?pageNum=<%=startPage-pageBlock%>&field=<%=field%>&word=<%=word%>">[이전]</a>
					<%
				}
				
				//페이지 번호
				//word가 검색되었을 때 페이지 이동 시 값을 그대로 갖고 가기 위해 field와 word값을 포함
				for(int i=startPage; i<=endPage; i++){
					if(i==currentPage){ //현재 페이지에는 링크 없음
				%>
						[<%=i %>]
				<%
					}else{ //현재 페이지가 아닐 경우 이동하기 위한 링크 존재
				%>
						<a href="list.jsp?pageNum=<%=i%>&field=<%=field%>&word=<%=word%>"><%=i %></a>
				<%
					}
				}
				
				//다음
				if(endPage < pageCount){
					%>
					<a href="list.jsp?pageNum=<%=startPage+pageBlock%>&field=<%=field%>&word=<%=word%>">[다음]</a>
					<%
				}
			}
		%>
	</div>
</body>
</html>