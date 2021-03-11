<%@page import="com.day03.ZipCodeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.day03.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a:link {text-decoration: none; color: #000}
	a:hover {text-decoration: none; color: #000}
	a:visited {text-decoration: none; color: #000}
</style>
<%
	request.setCharacterEncoding("utf-8");
	String dong = request.getParameter("dong");
	AddressDAO dao = AddressDAO.getInstance();
	ArrayList<ZipCodeBean> zarr = dao.zipcodeRead(dong);
%>
<script type="text/javascript">
	function dongCheck() {
// 		방법1(예외처리)
// 		if(document.getElementById("dong").value==""){
// 			alert("동 이름을 입력하세요")
// 			document.getElementById("dong").focus(); //빈칸 포커스
// 			return;
// 		}

// 		방법2(예외처리) - querySelector로 변경. 기능동일
		if(document.querySelector("#dong").value==""){
			alert("동 이름을 입력하세요");
			document.querySelector("#dong").focus();
			return;
		}
		document.getElementById("frm").submit();
	}
	
	function send(code, sido, gugun, dong, bunji) {
		var address = sido+" "+gugun+" "+dong+" "+bunji;
		opener.document.getElementById("zipcode").value=code;
		opener.document.getElementById("addr").value=address;
		self.close();
	}
</script>
</head>
<body>
	<b>우편번호 검색</b>
	<form action="zipCheck.jsp" id="frm">
		<table>
			<tr>
				<td>
					동이름 : <input type="text" name="dong" id="dong">
					<input type="button" value="검색" onclick="dongCheck()">
				</td>
			</tr>
			<tr>
			<%
				if(zarr.isEmpty()){
			%>
					<td>검색 결과가 없습니다</td>
			<%
				}else{
			%>
					<td>*검색 후 아래 우편번호를 클릭하면 자동으로 입력합니다</td>
			<%
				}
			%>
			</tr>
			<%
				for(ZipCodeBean z : zarr){
					String zip = z.getZipcode();
					String sido = z.getSido();
					String gugun = z.getGugun();
					String dongs = z.getDong();
					String bunji = z.getBunji();
			%>
			<tr>
				<td>
					<a href="javascript:send('<%=zip%>', '<%=sido%>','<%=gugun%>','<%=dongs%>','<%=bunji%>')">
						<%=zip %> <%=sido %> <%=gugun %> <%=dongs %> <%=bunji %>
					</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</form>
</body>
</html>