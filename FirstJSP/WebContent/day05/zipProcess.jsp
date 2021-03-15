<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.day05.ZipCode"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.day05.fAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String dong = request.getParameter("dong");
	fAddressDAO dao = fAddressDAO.getInstance();
	ArrayList<ZipCode> arr = dao.getZipcode(dong);
	
// 	java -> json 변환
	JSONArray jarr = new JSONArray();
	for(ZipCode z : arr){
		JSONObject obj = new JSONObject();
		obj.put("zipcode", z.getZipcode());
		obj.put("sido", z.getSido());
		obj.put("gugun", z.getGugun());
		obj.put("dong", z.getDong());
		obj.put("bunji", z.getBunji());
		jarr.add(obj);
	}
	out.println(jarr.toString());
%>