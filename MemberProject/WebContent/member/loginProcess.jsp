<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	MemberDAOImpl dao = MemberDAOImpl.getInstance();
	
// 	로그인 체크
	int flag = dao.loginCheck(userid, pwd);
// 	out.println(flag);
	if(flag==0||flag==1){
		session.setAttribute("userid", userid);
	}
%>