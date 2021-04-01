<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript" src="../js/member.js?ver=1"></script>

<div class="container">
	<h2>회원리스트(<span id="cntSpan">${count}</span>)</h2>
	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>구분</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${members }" var="member">
				<tr>
					<td>${member.name }</td>
					<td>${member.userid }</td>
					<td>${member.phone }</td>
					<td>${member.email }</td>
					<c:if test="${member.admin==0 }">
						<td>일반회원</td>
						<td onclick="del(${member.userid})">삭제</td>
					</c:if>
					<c:if test="${member.admin==1 }">
						<td>관리자</td>
						<td>Admin</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@ include file="../include/footer.jsp"%>
