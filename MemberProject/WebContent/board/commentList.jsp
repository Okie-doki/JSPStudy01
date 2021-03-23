<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.board.dto.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	BoardDAO dao = BoardDAO.getInstance();
	ArrayList<CommentDTO> carr = dao.commentList(bnum);
	
// 	carr -> jason변환
	JSONObject mainObj = new JSONObject(); //메인
	
	JSONArray jarr = new JSONArray(); //데이터(배열)
	for(CommentDTO comment : carr){
		JSONObject obj = new JSONObject();
		obj.put("userid", comment.getUserid());
		obj.put("cnum", comment.getCnum());
		obj.put("bnum", comment.getBnum());
		obj.put("regdate", comment.getRegdate());
		obj.put("msg", comment.getMsg());
		jarr.add(obj);
	}
	
// 	메인에 담아 넘기기
	mainObj.put("main", jarr);
	out.println(mainObj.toString());
%>