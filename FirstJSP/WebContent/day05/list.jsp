<%@page import="com.day05.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.day05.fAddressDAO"%>
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
		$("#btnSearch").click(function() {
			$.ajax({
				type: "get",
				url: "searchProcess.jsp",
				data: {
					"field" : $("#field").val(),
					"word" : $("#word").val()
				},
				success : function(resp) {
// 					alert(resp);
// 					resp json 형식으로 인식
					var d = JSON.parse(resp); //데이터(jarrObj), 갯수(countObj)
					var str = "";
					$.each(d.jarrObj, function(index, val) {
						str += "<tr>";
						str += "<td>"+val.num+"</td>";
						str += "<td><a href='detail.jsp?num="+val.num+"'>"+val.name+"</a></td>";
						str += "<td>"+val.addr+"</td>";
						str += "</tr>"
					})
					$("table tbody").html(str);
					$("#cntSpan").text(d.countObj.count)
				},
				error : function(e) {
					alert("error : "+e);
				}
			})
		})
	})

</script>
</head>
<%
	request.setCharacterEncoding("utf-8");
	fAddressDAO dao = fAddressDAO.getInstance();
	ArrayList<Address> arr = dao.list();
	int count = dao.addrCount();
%>
<body>
	<div align="right"><a href="insert.jsp">추가하기</a></div>
	<h3>전체보기(<span id="cntSpan"><%=count %></span>)</h3>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Address ad : arr){
		%>
			<tr>
				<td><%=ad.getNum() %></td>
				<td><a href="detail.jsp?num=<%=ad.getNum()%>"><%=ad.getName() %></a></td>
				<td><%=ad.getAddr() %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
	<select name="field" id="field">
		<option value="name">이름</option>
		<option value="tel">전화번호</option>
	</select>
	<input type="text" name="word" id="word">
	<input type="button" value="검색" id="btnSearch">
</body>
</html>