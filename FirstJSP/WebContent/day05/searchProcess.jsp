<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.day05.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.day05.fAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String field = request.getParameter("field");
	String word = request.getParameter("word");
	fAddressDAO dao = fAddressDAO.getInstance();
	ArrayList<Address> arr = dao.searchList(field, word);
	int count = dao.searchCount(field, word); //검색 결과값의 갯수
	
// 	결과값 자바 arr -> jason으로 return
// 	json-simple web-inf>lib 파일 추가
// 	mainObj - 루트
	JSONObject mainObj = new JSONObject();
// 	countObj - 개수
	JSONObject countObj = new JSONObject();
	countObj.put("count", count);

	JSONArray jarr = new JSONArray();
	for(Address ad : arr){
		JSONObject obj = new JSONObject();
		obj.put("num", ad.getNum());
		obj.put("name", ad.getName());
		obj.put("addr", ad.getAddr());
		obj.put("zipcode", ad.getZipcode());
		obj.put("tel", ad.getTel());
		jarr.add(obj);
	}
	
// 	json 다채원 배열
	mainObj.put("jarrObj", jarr);
	mainObj.put("countObj", countObj);	
	
	out.println(mainObj.toString());
%>