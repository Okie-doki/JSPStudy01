<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {
		$("#loginBtn").click(function() {
			if($("#userid").val()==""){
				alert("아이디를 입력하세요");
				$("#userid").focus();
				return false;
			}
			if($("#pwd").val()==""){
				alert("비밀번호를 입력하세요")
				$("#pwd").focus();
				return false;
			}
			$.ajax({
				type: "post",
				url: "loginProcess.jsp",
				data : {
					"userid" : $("#userid").val(),
					"pwd" : $("#pwd").val()
				},
				success : function(resp) {
// 					alert(resp);
// 					resp 0, -1, 2
					if(resp.trim()==-1){
						alert("회원이 아닙니다 회원가입하세요");
					}else if(resp.trim()==2){
						alert("비밀번호가 틀립니다 비번 확인하세요");
					}else if(resp.trim()==1){ //관리자
						alert("관리자 로그인");
// 						location.href="memberList.jsp";
						$(location).attr("href", "memberList.jsp"); //location 요소에 href 속성 추가
					}else if(resp.trim()==0){
						alert("일반회원 로그인");
						$(location).attr("href", "memberView.jsp");
					}
				},
				erro : function(e) {
					alert("error : "+e);
				}
			})
		})
	})
</script>
</head>
<body>
	<form action="">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" id="userid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="로그인" id="loginBtn">
					<input type="button" value="취소">
					<input type="button" value="회원가입" onclick="location.href='memberForm.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>