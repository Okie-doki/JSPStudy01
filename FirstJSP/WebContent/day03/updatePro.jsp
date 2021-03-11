<%@page import="com.day03.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="ad" class="com.day03.Address"></jsp:useBean>
<jsp:setProperty property="*" name="ad"/>
<%
	AddressDAO dao = AddressDAO.getInstance();
	dao.addressUpdate(ad);
	response.sendRedirect("list2.jsp");
%>