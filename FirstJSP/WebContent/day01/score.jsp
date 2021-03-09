<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check() {
		if (document.getElementById("name").value == "") {
			alert("이름을 입력하세요");
			return;
		}
		if (document.getElementById("kor").value == ""
				|| isNaN(document.getElementById("kor").value)) {
			alert("국어 점수(숫자)를 입력하세요");
			return;
		}
		if (document.getElementById("eng").value == ""
				|| isNaN(document.getElementById("eng").value)) {
			alert("영어 점수(숫자)를 입력하세요");
			return;
		}
		if (document.getElementById("math").value == ""
				|| isNaN(document.getElementById("math").value)) {
			alert("영어 점수(숫자)를 입력하세요");
			return;
		}
		frm.submit();
	}
</script>
</head>
<body>
	<form action="scoreResult.jsp" name="frm">
		이름 : <input type="text" name="name" id="name"><br>
		국어 : <input type="text" name="kor" id="kor"><br>
		영어 : <input type="text" name="eng" id="eng"><br>
		수학 : <input type="text" name="math" id="math"><br>
		<input type="button" value="성적조회" onclick="check()">
		<button type="button" onclick="check()">성적조회 버튼</button>
		<input type="reset" value="취소">
	</form>
</body>
</html>