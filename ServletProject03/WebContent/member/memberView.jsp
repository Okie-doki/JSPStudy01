<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<script type="text/javascript">
	function check() {
		if($("#pwd").val()==""){
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			return false;			
		}
		if($("#pwd_check").val()==""){
			alert("비밀번호 확인을 입력하세요");
			$("#pwd_check").focus();
			return false;
		}
		if($("#pwd").val()!=$("#pwd_check").val()){
			alert("비밀번호가 일치하지 않습니다");
			$("#pwd_check").focus();
			return false;
		}
		return true;
	}
	
	function del() {
		if(confirm("정말 탈퇴할까요?")){
			location.href="delete";
		}
	}
</script>

<div class="container">
	<h2>회원변경</h2>
<!-- 	onsubmit 해당 조건이 true가 되어야 sumbit 됨 -->
	<form action="update" id="frm" method="post" onsubmit="return check()"> 
		<div class="form-group">
			<label for="userid">UserID:</label> <input type="text"
				class="form-control" id="userid" value="${member.name }"
				name="userid" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label for="name">Name:</label> <input type="text"
				class="form-control" id="name" value="${member.name }" name="name">
		</div>
		
		<div class="form-group">
			<label for="pwd">Password:</label> <input type="password"
				class="form-control" id="pwd" placeholder="Enter password"
				name="pwd">
		</div>
		<div class="form-group">
			<label for="pwd_check">Password_Check:</label> <input type="password"
				class="form-control" id="pwd_check" placeholder="Enter password"
				name="pwd_check">
		</div>
		
		<div class="form-group">
			<label for="email">Email:</label> <input type="text"
				class="form-control" id="email" value="${member.email }"
				name="email">
		</div>
		
		<div class="form-group">
			<label for="phone">Phone:</label> <input type="text"
				class="form-control" id="phone" value="${member.phone }"
				name="phone">
		</div>
		
		<div class="form-check-inline">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="admin" value="0">일반회원
			</label>
		</div>
		<div class="form-check-inline">
			<label class="form-check-label"> <input type="radio"
				class="form-check-input" name="admin" value="1">관리자
			</label>
		</div>
		
		<script type="text/javascript">
			if(${member.admin==0}){
				$("input:radio[value=0]").prop("checked", true);
			}else{
				$("input:radio[value=1]").prop("checked", true);
			}
		</script>
		<br><br>
		
		<button type="submit" class="btn btn-primary">수정</button>
		<button type="button" class="btn btn-secondary" onclick="del()">회원탈퇴</button>
		
	</form>
</div>

<%@ include file="../include/footer.jsp"%>