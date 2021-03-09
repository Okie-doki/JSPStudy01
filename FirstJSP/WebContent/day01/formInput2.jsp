<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn").click(function() {
			if($("#name").val()==""){
				alert("이름을 입력하세요");
				return;
			}
			if($("#age").val()=="" || !$.isNumeric($("#age").val())){
				alert("나이를 입력하세요");
				return;
			}
			if($("#pwd").val()==""){
				alert("비밀번호를 입력하세요");
				return;
			}
			if($("input:radio[name=gender]:checked").length==0){
				alert("성별을 선택하세요");
				return;
			}
			if($("input:checkbox[name=hobby]:checked").length==0){
				alert("취미선택");
				return false;
			}
			$("#frm").submit();
		})
	})
</script>
<body>
	<form action="formResult.jsp" id="frm" method="post">
		이름 : <input type="text" name="name" id="name" required="required"><br>
		나이 : <input type="text" name="age" id="age" required="required"><br>
		비밀번호 : <input type="password" name="pwd" id="pwd"><br>
		성별 :
		<input type="radio" name="gender" value="남" checked="checked">남자
		<input type="radio" name="gender" value="여">여자
		<br>
		관심분야<br>
		<input type="checkbox" name="hobby" value="운동">운동
		<input type="checkbox" name="hobby" value="게임">게임
		<input type="checkbox" name="hobby" value="등산">등산
		<input type="checkbox" name="hobby" value="영화">영화
		<br>
		직업
		<select name="job" id="job">
			<option value="학생">학생</option>
			<option value="공무원">공무원</option>
			<option value="회사원">회사원</option>
			<option value="기타">기타</option>
		</select>
		<br>
		<input type="button" id="btn" value="전송">
	</form>
</body>
</html>