<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script>
	$(document).ready(function() {
		$("#loginBtn").click(function() {
			if ($("#userid").val() == "") {
				alert("아이디를 입력하세요");
				$("#userid").focus();
				return false;
			}
			if ($("#pwd").val() == "") {
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
				return false;
			}
			$.ajax({
				type: "post",
				url: "login",
				data: {
					"userid" : $("#userid").val(),
					"pwd" : $("#pwd").val()
				},
				success: function(resp) {
// 					alert(resp)
					//0일반회원 1관리자 -1비회원 2비번오류
					if(resp.trim()==0){
						alert("일반회원");
						$(location).attr("href", "../index.jsp");
					}else if(resp.trim()==1){
						alert("관리자");
						location.href="memberlist";
					}else if(resp.trim()==-1){
						alert("회원이 아닙니다. 회원가입하세요");
					}else if(resp.trim()==2){
						alert("비밀번호를 확인하세요");
					}
				},
				error: function(e) {
					alert("error: "+e);
				}
			})
		})
	})

</script>

<div class="container">
  <h2>로그인</h2>
  <form action="">
    <div class="form-group">
      <label for="email">Userid:</label>
      <input type="email" class="form-control" id="userid" placeholder="Enter userid" name="userid">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    </div>
    <button type="button" class="btn btn-primary" id="loginBtn">Log-in</button>
  </form>
</div>



<%@ include file="../include/footer.jsp" %>
