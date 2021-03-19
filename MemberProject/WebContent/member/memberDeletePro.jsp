<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.member.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	MemberDAOImpl dao = MemberDAOImpl.getInstance();
	dao.memDelete(userid);
	ArrayList<MemberDTO> arr = dao.memList();
	
	int count = dao.getCount(); //출력 회원 인원수
	
// 	결과값 arr -> jason형태로 return
	JSONObject mainObj = new JSONObject();
	JSONArray jarr = new JSONArray();
	for(MemberDTO member : arr){
		JSONObject obj = new JSONObject();
		obj.put("name", member.getName());
		obj.put("userid", member.getUserid());
		obj.put("pwd", member.getPwd());
		obj.put("email", member.getEmail());
		obj.put("phone", member.getPhone());
		obj.put("admin", member.getAdmin()==0? "일반회원":"관리자");
		jarr.add(obj);
	}
	
// 	회원 수 추가 -> jason 형태로 return
	JSONObject countObj = new JSONObject();
	countObj.put("count", count);
	
// 	mainObj에 추가 저장
	mainObj.put("jarr", jarr);
	mainObj.put("countObj", countObj);
	out.println(mainObj.toString());
%>