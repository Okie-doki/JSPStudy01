<%@page import="com.day01.DateBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DateBean bean = new DateBean(); //객체 생성
%>
<%=bean.getToday() %>