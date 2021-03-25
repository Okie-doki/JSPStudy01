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
		$("#send").on("click", function() {
			sendIt();
		})
		//키보드 이벤트 처리
		$("#dong").keydown(function(e) {
// 			엔터키 keycode는 13
			if(e.keyCode==13){
				sendIt();
				return false;
			}
		})
		
		$("#result").on("click", "tr", function() {
			var address = $("td:eq(1)", this).text()+" "+
						$("td:eq(2)", this).text()+" "+
						$("td:eq(3)", this).text()+" "+
						$("td:eq(4)", this).text();
			$(opener.document).find("#zipcode").val($("td:eq(0)", this).text())
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
			url: "zip.addr",
			data: {"dong" : $("#dong").val()}
		})
		.done(function(resp) {
			var str = "<table>";
// 			리턴받을 값 타입을 json이라 명시하지 않았을 때 사용
// 			d = JSON.parse(resp);
// 			for(i=0; i<d.length; i++){
// 				str += "<tr>";
// 				str += "<td>"+d[i].zipcode+"</td>";
// 				str += "<td>"+d[i].sido+"</td>";
// 				str += "<td>"+d[i].gugun+"</td>";
// 				str += "<td>"+d[i].dong+"</td>";
// 				str += "<td>"+d[i].bunji+"</td>";
// 				str += "</tr>";
// 			}

// 			리턴받을 타입을 json 명시
			$.each(resp, function(i, val) {
				str += "<tr>";
				str += "<td>"+val.zipcode+"</td>";
				str += "<td>"+val.sido+"</td>";
				str += "<td>"+val.gugun+"</td>";
				str += "<td>"+val.dong+"</td>";
				str += "<td>"+val.bunji+"</td>";
				str += "</tr>";
			})
			str += "</table>";
			$("#result").html(str);
		})
		.fail(function(e) {
			alert("error : "+e);
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