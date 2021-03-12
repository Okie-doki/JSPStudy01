<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#getBtn").on("click", function() {
			$.get("process.jsp", {
				"id" : $("#id").val(),
				"pwd" : $("#pwd").val(),
				"method" : "get"
			})
			.done(function(resp) {
				$("#result").html(resp);
			})
		})
		
		$("#postBtn").click(function() {
// 			변수 또는 상수로 지정하여 .done 실행
			const printStr = $.post("process.jsp", {
				"id" : $("#id").val(),
				"pwd" : $("#pwd").val(),
				"method" : "post"
			})
			printStr.done(function(resp) {
				$("#result").html(resp);
			})
		})
		
		$("#ajaxBtn").click(function() {
			$.ajax({
				type : "get",
				url : "process.jsp",
				data : {
					"id" : $("#id").val(),
					"pwd" : $("#pwd").val(),
					"method" : "ajax"
				}
			})
			.done(function(resp) {
				$("#result").html(resp);
			})
			.fail(function(e) {
				alert("error : "+e)
			})
		})
	})
</script>
</head>
<body>
	id : <input type="text" id="id" name="id"><br>
	pwd : <input type="password" id="pwd" name="pwd"><br>
	<button type="button" id="getBtn">get 전송</button>
	<button type="button" id="postBtn">post 전송</button>
	<button type="button" id="ajaxBtn">ajax 전송</button>
	<hr>
	<div id="result"></div>	
</body>
</html>