<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#send").on("click", function() {
			$.getJSON("zipProcess.jsp",
					{"dong" : $("#dong").val()}, 
					function(resp) {
// 						alert(resp.length);
// 						table형태의 html 출력
						var str = "<table>"
						$.each(resp, function(index, val) {
							str += "<tr>";
							str += "<td>" + val.zipcode + "</td>";
							str += "<td>" + val.sido + "</td>";
							str += "<td>" + val.gugun + "</td>";
							str += "<td>" + val.dong + "</td>";
							str += "<td>" + val.bunji + "</td>";
							str += "</tr>";
						})
						str += "</table>";
						$("#result").html(str);
					}
			)
		})
		$("#result").on("click", "tr", function() {
// 			eq 함수 = 같은지 비교, 배열과 동일하게 0번부터 진행
			var address = $("td:eq(1)", this).text()+" "+
						$("td:eq(2)", this).text()+" "+
						$("td:eq(3)", this).text()+" "+
						$("td:eq(4)", this).text()+" ";
			$(opener.document).find("#zipcode").val($("td:eq(0)", this).text()); //td:eq(0) -> zipcode
			$(opener.document).find("#addr").val(address);
			self.close();
		})
	})
</script>
</head>
<body>
	<table>
		<tr>
			<td>동이름
				<input type="text" name="dong" id="dong">
				<input type="button" value="검색" id="send">
			</td>
		</tr>
	</table>
	<div id="result"></div>
</body>
</html>