/**
 * 
 */
//정규식
var exp=/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/

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
			alert("비밀번호가 일치하지 않습니다")
			$("#pwd_check").focus();
			return false;
		}
		
		if($("#email").val()==""){
			alert("이메일를 입력하세요");
			$("#email").focus();
			return false;
		}
		if($("#phone").val()==""){
			alert("전화번호를 입력하세요");
			$("#phone").focus();
			return false;
		}
//		정규식을 사용하여 전화번호 유효성 검사
//		if(!$("#phone").val().match(exp)){
//			alert("전화번호 양식이 아닙니다.");
//			$("#phone").focus();
//			return false;
//		}
		if(!exp.test($("#phone").val())){
			alert("전화번호 양식이 아닙니다.");
			$("#phone").focus();
			return false;
		}
				
		$("#frm").submit();
	})
	
//	아이디 입력창
	$("#idCheckBtn").click(function(){
		window.open("idCheck.jsp", "", "width=700 height=200");
	})
	
//	아이디 중복확인
	$("#idBtn").on("click", function(){
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
			return;
		}
		$.ajax({
			type : "post",
			url : "idCheckPro.jsp",
			data : {"userid" : $("#userid").val()},
			success : function(resp){
//				alert(resp);
				if(resp.trim()=="yes"){
					alert("사용 가능한 아이디입니다");
					$(opener.document).find("#userid").val($("#userid").val());
					self.close();
				}else{
					alert("사용 불가능한 아이디입니다");
					$("#userid").val("");
					$("#userid").focus();
				}
			},
			error : function(e){
				alert("error : "+e);
			}
		})
	})
})

function del(userid, mode){
	alert(userid);
//	웹에 적용 안되는 문제(캐쉬 삭제 필요)
	if(mode=="관리자"){
		alert("관리자는 삭제할 수 없습니다");
		return;
	}
	
	if(confirm("정말 삭제할까요?")){
		$.getJSON("memberDeletePro.jsp",{
			"userid" : userid
		},
		function(resp){
//			alert(resp);
			var str = "";
			$.each(resp.jarr, function(key, val){
				str += "<tr>";
				str += "<td>"+val.name+"</td>";
				str += "<td>"+val.userid+"</td>";
				str += "<td>"+val.phone+"</td>";
				str += "<td>"+val.email+"</td>";
				str += "<td>"+val.admin+"</td>";
//				str += "<td><a href='javascript:del('"+val.userid+"')'>삭제</a></td>"
				str += "<td><a href=javascript:del('"+val.userid+"','"+val.admin+"')>삭제</a></td>" //공백처리 문제가 발생하므로 해결방법 모색
				str += "</tr>";
			})
			$("table tbody").html(str);
			$("#countSpan").text(resp.countObj.count);
		})
	}
	
}