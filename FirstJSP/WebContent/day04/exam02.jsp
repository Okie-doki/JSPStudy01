<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
// 	전송방식에 따라 처리 방법(get, post, ajax)
	$(document).ready(function() {
		$("#getBtn").click(function() {
			$.get("process.jsp",
				{
					"id" : $("#id").val(),
					"pwd" : $("#pwd").val(),
					"method" : "get"
				},
				function(data) {
// 					alert(data); //결과값 테스트
					$("#result").html(data); //데이터 html처리
				}
			)
		})
		
// 		$("#postBtn").click(function() {
// 			$.post("process.jsp",
// 					{
// 						"id" : $("#id").val(),
// 						"pwd" : $("#pwd").val(),
// 						"method" : "post"
// 					}, 
// 					function(data) {
// 						$("#result").html(data);
// 					}
// 			)
// 		})
		
// 		위에서 사용한 .click과 동일
		$("#postBtn").on("click", function() {
			$.post("process.jsp", {
				"id" : $("#id").val(),
				"pwd" : $("#pwd").val(),
				"method" : "post"
			}, function(resp) {
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
				},
				success : function(resp) {
					$("#result").html(resp);
				},
				error : function(e) {
					alert("error : "+e);
				}
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
	<div id="result"></div>	
</body>
</html>