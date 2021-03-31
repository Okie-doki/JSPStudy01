/**
 * 
 */
//정규식
var exp=/^ [0-9]{3}-[0-9]{4}-[0-9]{4} $/

$(document).ready(function(){
	$("#sendBtn").click(function(){
		if($("#name").val()==""){
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		}
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false;
		}
		if($("#pwd").val()==""){
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			return false;
		}
		if($("#pwd").val()!=$("#pwd_check").val()){
			alert("비밀번호가 일치하지 않습니다");
			$("#pwd_check").focus();
			return false;
		}
		if($("#email").val()==""){
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
		if($("#phone").val()==""){
			alert("전화번호를 입력하세요");
			$("#phone").focus();
			return false;
		}
//		if(!$("#phone").val().match(exp)){
//			alert("전화번호 양식이 아닙니다");
//			$("#phone").focus();
//			return false;
//		}
//		if(!exp.test($("#phone").val())){
//			alert("전화번호 양식이 아닙니다");
//			$("#phone").focus();
//			return false;
//		}
		$("#frm").submit();
	})
	
//	아이디 입력창
	$("#idCheckBtn").on("click", function(){
		window.open("idCheck", "", "width=700 height=200");
	})
	
//	아이디 중복확인
	$("#useBtn").on("click", function(){
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
			return;
		}
		
		$.ajax({
			type: "post",
			url: "idCheck",
			data: {"userid" : $("#userid").val()},
			success: function(resp){
				//alert(resp.trim().length);
				if(resp.trim()=="yes"){
					alert("사용 가능한 아이디입니다");
					$(opener.document).find("#userid").val($("#userid").val());
					self.close();
				}else{
					alert("사용 불가능한 아이디입니다")
					$("#userid").val("");
					$("#userid").focus();
				}
			},
			error: function(e){
				alert("error :"+e);
			}
		})
	})
})