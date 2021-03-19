<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = (String)session.getAttribute("userid");
	MemberDAOImpl dao = MemberDAOImpl.getInstance();
	dao.memDelete(sid);
	response.sendRedirect("loginForm.jsp");
%>