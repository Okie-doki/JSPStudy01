<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<script>
	$(function() {
		$("#writeBtn").click(function() {
			if(${empty sessionScope.user}){
				alert("로그인하세요");
				location.href="/ServletProject03/member/login";
			}else{
				location.href="/ServletProject03/board/write"
			}
		})
	})
</script>

<div class="container">
	<div class="d-flex justify-content-between mb-3">
		<h3>게시글 리스트(<span id="cntSpan">${count }</span>)</h3>
		<button type="button" class="btn btn-secondary"  id="writeBtn">글쓰기</button>
	</div>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${boards }" var="board" varStatus="st">
				<tr>
	<%-- 					<td>${board.num}</td> --%>
					<td>${rowNo - st.index}</td>
					<td><a href="boardDetail?num=${board.num }">${board.subject }</a></td>
					<td>${board.userid }</td>
					<td>${board.regdate }</td>
					<td>${board.readcount }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="d-flex justify-content-between mt-3">
		<ul class="pagination">
			<!-- 		이전 -->
			<c:if test="${startPage > blockPage}">
				<li class="page-item"><a class="page-link" href="boardlist?pageNum=${startPage-blockPage}&field=${field}&word=${word}">이전</a></li>
			</c:if>
			
			<!-- 		페이지 번호 -->
			<c:forEach begin="${startPage }" end="${endPage }" var="i">
			<!-- 			현재 페이지가 아님 -->
				<c:if test="${i!=currentPage }">
					<li class="page-item"><a class="page-link" href="boardlist?pageNum=${i }&field=${field}&word=${word}">${i }</a></li>
				</c:if>
				<!-- 			선택된 현재 페이지 -->
				<c:if test="${i==currentPage }">
					<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 		다음 -->
			<c:if test="${endPage < totPage }">
				<li class="page-item"><a class="page-link" href="boardlist?pageNum=${startPage+blockPage }&field=${field}&word=${word}">다음</a></li>
			</c:if>
		</ul>
	</div>
	
	<form action="boardlist" class="form-inline">
		<select  class="form-control mr-sm-1" name="field" id="field">
			<option value="subject">제목</option>
			<option value="userid">작성자</option>
		</select>
		<input class="form-control" type="text" id="word" name="word" placeholder="search">
		<button class="btn btn-success" type="submit">찾기</button>
	</form>
	
</div>

<%@ include file="../include/footer.jsp"%>