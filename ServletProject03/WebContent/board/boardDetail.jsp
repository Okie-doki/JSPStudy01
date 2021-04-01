<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<script>
	$(function() {
		$("#delBtn").click(function() {
			if (confirm("정말 삭제할까요?")) {
// 				location.href="delete?num=${board.num}";
				$.getJSON("delete", {
					"num" : $("#num").val()
				}, function(resp) {
// 					alert(resp);
					if(resp==0){
						alert("삭제할 수 없습니다")
					}else{
						alert("삭제 완료");
						location.href="boardlist";
					}
				})
			}
		})
	})
</script>


<div class="container">
	<h3>게시글 상세보기</h3>
	<input type="hidden" name="num" id="num" value=${board.num }>
	<table class="table table-hover mt-3">
		<tr>
			<th>글번호</th>
			<td id="no">${board.num }</td>
			<th>조회수</th>
			<td>${board.readcount }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.userid }</td>
			<th>작성일</th>
			<td>${board.regdate }</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3">${board.subject }</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3">${board.content }</td>
		</tr>
	</table>
	<br>
	<c:if test="${board.userid==sessionScope.user.userid }">
		<button type="button" class="btn btn-primary mb-3" onclick="location.href='boardupdate?num=${board.num}'">수정</button>
		<button type="button" class="btn btn-secondary mb-3" id="delBtn">삭제</button>
	</c:if>
	
</div>


<%@ include file="../include/footer.jsp"%>