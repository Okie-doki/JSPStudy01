<%@page import="com.member.dto.MemberDTO"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>

<%
	String sid = (String)session.getAttribute("userid");
	MemberDAOImpl dao = MemberDAOImpl.getInstance();
	MemberDTO member = dao.findById(sid);
%>

<body>
	<div align="right" class="container pt-3">
		<%=sid %>님 반갑습니다 /
		<a href="logout.jsp">로그아웃</a> /
		<!-- 		board 연동을 위한 임시 작업 -->
		<a href="/MemberProject/board/list.jsp">게시판 이동</a>
	</div>
	<h3>회원정보 변경</h3>
	<a href="userDelete.jsp">회원탈퇴</a>
	<form action="memberUpdateProcess.jsp" method="post">
	<input type="hidden" name="userid" value="<%=sid%>">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=member.getName()%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pwd" value="<%=member.getPwd()%>"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="<%=member.getEmail()%>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" value="<%=member.getPhone()%>"></td>
			</tr>
			<tr>
				<td>구분</td>
				<td>
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="radio" class="form-check-input" name="admin" value="0">일반회원
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="radio" class="form-check-input" name="admin" value="1">관리자
						</label>
						
						<script type="text/javascript">
							if(<%=member.getAdmin()%>==0){
// 								prop -> property(속성값) 취급
								$("input:radio[value=0]").prop("checked", true);
							}else{
								$("input:radio[value=1]").prop("checked", true);
							}
						</script>
						
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-primary">수정하기</button>
					<input class="btn btn-primary" type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>