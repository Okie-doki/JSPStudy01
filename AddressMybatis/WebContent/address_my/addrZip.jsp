<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#send").click(function() {
			sendIt();
		})
		
		$("#dong").keydown(function(e) {
			if(e.keyCode==13){
				sendIt();
				return;
			}
		})
		
		$("#result").on("click", "tr", function() {
			var address = $("td:eq(1)", this).text()+" "+
						$("td:eq(2)", this).text()+" "+
						$("td:eq(3)", this).text()+" "+
						$("td:eq(4)", this).text();
			$(opener.document).find("#zipcode").val($("td:eq(0)", this).text());
			$(opener.document).find("#addr").val(address);
			self.close();
		})
	})
	
	var sendIt = function() {
		if($("#dong").val()==""){
			alert("동이름을 입력하세요");
			$("#dong").focus();
			return false;
		}
		$.ajax({
			type: "post",
			url: "zip.my",
			data: {"dong" : $("#dong").val()}
		})
		.done(function(resp) {
//				alert(resp.length);
			var str = "<table>";
			$.each(resp, function(key, val) {
				var gugun = val.gugun==null? "":val.gugun;
				var bunji = val.bunji==null? "":val.bunji;
				str += "<tr>";
				str += "<td>"+val.zipcode+"</td>";
				str += "<td>"+val.sido+"</td>";
				str += "<td>"+gugun+"</td>";
				str += "<td>"+val.dong+"</td>";
				str += "<td>"+bunji+"</td>";
				str += "</tr>";
			})
			
			str += "</table>";
			$("#result").html(str);
		})
		.fail(function(e) {
			alert("우편번호 검색 실패")
		})
	}
</script>
<body>
	<table>
		<tr>
			<td>동이름 입력 : <input type="text" name="dong" id="dong">
			<input type="button" value="검색" id="send">
			</td>
		</tr>
	</table>
	<div id="result"></div>
</body>
</html>