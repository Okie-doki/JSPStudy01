<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script >
$(function() {
	$("#result").on("click", "div", function() {
		$(opener.document).find("#zipcode").val($("#zip", this).text());
		$(opener.document).find("#addr").val($("#ad", this).text());
		self.close();
	})
	
	$("#send").on("click", function() {
		if($("#dong").val()==""){
			alert("동이름을 입력하세요");
			return false;
		}
		const target = document.querySelector("#result");
		fetch("zip?dong="+$("#dong").val(), {method : "post"})
		.then((res)=>res.json())
		.then(function(res) {
// 			target.innerHTML = res.map(d=>d.zipcode+" "+d.sido+" "+d.gugun+" "+d.dong+" "+d.bunji+"<br>").join("");
			target.innerHTML = res.map(d=>"<div><span id='zip'>"+d.zipcode+"</span><span id='ad'>"+d.sido
					+" "+d.gugun+" "+d.dong+" "+d.bunji+"</sapn></div>").join("");
		})
	})
})
</script>
</head>
<body>
<table>
   <tr>
      <td>동이름 입력 : <input type="text" name="dong" id="dong">
      <input type="button" value="검색" id="send">      
      </td>
   </tr>
</table>
   <div id="result"></div>
</body>
</html>      