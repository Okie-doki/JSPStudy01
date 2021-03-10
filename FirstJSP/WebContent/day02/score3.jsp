<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 사용 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
		$("#btn").click(function() {
			if($("#name").val()==""){
				alert("이름을 입력하세요");
				return;
			}
			if($("#kor").val()==""
					|| !$.isNumeric($("#kor").val())){
				alert("국어점수를 입력하세요")
				return;
			}
			if($("#eng").val()==""
					|| !$.isNumeric($("#eng").val())){
				alert("영어점수를 입력하세요")
				return;
			}
			if($("#math").val()==""
					|| !$.isNumeric($("#math").val())){
				alert("수학점수를 입력하세요")
				return;
			}
			$("#frm").submit();
		})
	})
</script>
</head>
<body>
	<form action="scoreResult3.jsp" id="frm">
		이름 : <input type="text" name="name" id="name"><br>
		국어 : <input type="text" name="kor" id="kor"><br> 
		영어 : <input type="text" name="eng" id="eng"><br>
		수학 : <input type="text" name="math" id="math"><br>
		<input type="button" value="성적조회" id="btn">
		<input type="reset" value="취소">
	</form>
</body>
</html>