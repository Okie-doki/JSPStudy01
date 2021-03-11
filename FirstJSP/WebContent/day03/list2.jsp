<%@page import="com.day03.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.day03.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩4 테이블 레퍼런스 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
<script type="text/javascript">
	function searchCheck() {
		if(document.querySelector("#word").value===""){
			alert("검색어를 입력하세요");
			return;
		}
		document.querySelector("#frm").submit();
	}
</script>

</head>
<%
	request.setCharacterEncoding("utf-8");
	String field = "";
	String word = "";
	if(request.getParameter("word")!=null){
		word = request.getParameter("word");
		field = request.getParameter("field");
	}
	AddressDAO dao = AddressDAO.getInstance();
// 	ArrayList<Address> arr = dao.getList(); //기본 리스트 출력
	ArrayList<Address> arr = dao.getList(field, word); //검색 출력 포함
	int count = dao.getCount(field, word);
%>
<body>
	<div class="container">
		<h3>전체보기(<%=count %>)</h3>
		<div align="right">
			<a href="insert.jsp">추가하기</a> /
			<a href="list2.jsp">전체보기</a>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody>
			<%
				for(Address ad : arr){
			%>
				<tr>
					<td><%=ad.getNum() %></td>
<!-- 					이름을 선택했을 때 특정값을 가지고 페이지 이동(파일명?필요항목) -->
					<td><a href="detail.jsp?num=<%=ad.getNum()%>"><%=ad.getName() %></a></td>
					<td><%=ad.getAddr() %></td>	
					<td><%=ad.getTel() %></td>			
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
		<form action="list2.jsp" id="frm">
			<select name="field">
				<option value="name">이름</option>
				<option value="tel">전화번호</option>
			</select>
			<input type="text" name="word" id="word">
			<input type="button" value="검색" onclick="searchCheck()">
		</form>
	</div>
</body>
