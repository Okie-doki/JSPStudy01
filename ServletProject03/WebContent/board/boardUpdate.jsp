<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="container">
  <form action="boardupdate" method="post" id="frm">
    <div class="form-group">
      <label for="num">Num:</label>
      <input type="text" class="form-control" id="num" name="num" readonly="readonly" value="${board.num }">
    </div>
    <div class="form-group">
      <label for="userid">Userid:</label>
      <input type="text" class="form-control" id="userid" name="userid" readonly="readonly" value="${sessionScope.user.userid }">
    </div>
    <div class="form-group">
      <label for="subject">Subject:</label>
      <input type="text" class="form-control" id="subject" placeholder="Enter subject" name="subject" value="${board.subject }">
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter email" name="email" value="${board.email }">
    </div>
    <div class="form-group">
      <label for="content">Content:</label><br>
      <textarea rows="5" class="form-control" id="content" name="content">${board.content}</textarea>
    </div>
    <button type="submit" class="btn btn-primary">수정</button>
    <button type="reset" class="btn btn-secondary">다시 쓰기</button>
  </form>
</div>

<%@ include file="../include/footer.jsp"%>