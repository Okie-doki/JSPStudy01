<%@page import="com.day05.fAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="ad" class="com.day05.Address"></jsp:useBean>
<jsp:setProperty property="*" name="ad"/>

<%
	fAddressDAO dao = fAddressDAO.getInstance();
	dao.insert(ad);
	response.sendRedirect("list.jsp");
%>