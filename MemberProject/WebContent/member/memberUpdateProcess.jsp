<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="com.member.dto.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<%
	MemberDAOImpl dao = MemberDAOImpl.getInstance();
	int flag = dao.memUpdate(member);
	
	if(flag==1){
		session.invalidate(); //모든 세션 삭제(개별삭제 아님)
		response.sendRedirect("loginForm.jsp");
	}
%>