<%@page import="com.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="com.board.dto.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	BoardDAO dao = BoardDAO.getInstance();
	String ip = request.getRemoteAddr(); //접속한 클라이언트 ip주소
	board.setIp(ip);
	int flag = dao.boardUpdate(board);
	if(flag==1){
		response.sendRedirect("list.jsp");
	}
%>