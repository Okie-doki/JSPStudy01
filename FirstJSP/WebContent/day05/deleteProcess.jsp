<%@page import="com.day05.fAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	fAddressDAO dao = fAddressDAO.getInstance();
	dao.delete(num);
	response.sendRedirect("list.jsp");
%>