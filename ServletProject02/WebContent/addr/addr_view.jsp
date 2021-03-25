<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function del() {
		if(confirm("정말 삭제할까요?"))
			location.href="delete.addr?num=${address.num}";
	}
	
	function zipfinder() {
		window.open("zip.addr", "", "width=700 height=400");
	}
</script>

<body>
	<h3>상세보기</h3>
	<form action="update.addr" method="post">
	<input type="hidden" name="num" value="${address.num }">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="${address.name }"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
					<input type="text" name="zipcode" id="zipcode" value="${address.zipcode }">
					<input type="button" value="검색" onclick="zipfinder()">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr" id="addr" value="${address.addr }" size="50"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" value="${address.tel }"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="reset" value="취소">
					<input type="button" value="전체보기" onclick="location.href='list.addr'">
					<input type="button" value="삭제" onclick="location.href='delete.addr?num=${address.num}'">
					<input type="button" value="삭제(함수이용)" onclick="del()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>