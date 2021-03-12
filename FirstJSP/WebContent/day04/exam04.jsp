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
// 		json 형태의 파일 출력
		$("#b1").click(function() {
			$.get("sample.txt", function(resp, status) {
				var str = "데이터 : "+resp+" 상태 : "+ status;
				$("#result").text(str); //텍스트로 출력
			})
		})
		
		$("#b2").click(function() {
			$.get("sample.txt", function(resp) {
				var dada = JSON.parse(resp); //json 파싱
				var str = "";
				for(i=0; i<dada.length; i++){
					console.log(dada[i].picture) //콘솔로 확인. 브라우저에서 확인 가능
					str += "이름 : "+dada[i].irum+"<br>";
				}
				$("#result").html(str);
			})
		})
		
		$("#b3").click(function() {
			var str = "";
// 			.get + json 함친 함수 .getJSON
			$.getJSON("sample.txt", function(resp) {
				$.each(resp, function(key, val) {
					console.log(key);
					str += "회원번호 : "+val.memberNumber+"<br>";
					str += "이름 : "+val.irum+"<br>";
					str += "이미지 : "+val.picture+"<br>";
				})
				$("#result").html(str);
			})
		})
	})
</script>
</head>
<body>
	<button id="b1">결과1</button>
	<button id="b2">결과2</button>
	<button id="b3">결과3</button>
	<hr>
	<div id="result"></div>
</body>
</html>