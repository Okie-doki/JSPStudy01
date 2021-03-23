<%@page import="com.member.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="member.js?ver=2"></script>

<%
	request.setCharacterEncoding("utf-8");
	String sid = (String)session.getAttribute("userid");
	MemberDAOImpl dao = MemberDAOImpl.getInstance();
	ArrayList<MemberDTO> arr = dao.memList();
	int count = dao.getCount();
%>
</head>
<body>
	<div align="right">
		<a href="memberView.jsp"><%=sid %></a>관리자님 반갑습니다 /
		<a href="logout.jsp">로그아웃</a> /
<!-- 		board 연동을 위한 임시 작업 -->
		<a href="../board/list.jsp">게시판 이동</a>
	</div>
	<h3>전체보기(<span id="countSpan"><%=count %></span>)</h3>
	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>구분</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(MemberDTO member : arr){
				String mode = member.getAdmin()==0? "일반회원":"관리자";
		%>
			<tr>
				<td><%=member.getName() %></td>
				<td><%=member.getUserid() %></td>
				<td><%=member.getPhone() %></td>
				<td><%=member.getEmail() %></td>
				<td><%=mode %></td>
				<td><a href="javascript:del('<%=member.getUserid()%>', '<%=mode%>')">삭제</a></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>