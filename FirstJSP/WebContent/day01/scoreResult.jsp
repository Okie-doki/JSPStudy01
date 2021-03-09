<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	int sum = kor + eng + math;
	double avg1 = sum/3;
	int avg2 = sum/3;
	char grade1 = ' ';
	char grade2 = ' ';
	
	if(avg1 >= 90)
		grade1 = 'A';
	else if(avg1 >= 80)
		grade1 = 'B';
	else if(avg1 >= 70)
		grade1 = 'C';
	else if(avg1 >= 60)
		grade1 = 'D';
	else
		grade1 = 'F';
	
	switch(avg2/10){
	case 10:
	case 9: grade2 = 'A'; break;
	case 8: grade2 = 'B'; break;
	case 7: grade2 = 'C'; break;
	case 6: grade2 = 'D'; break;
	default: grade2 = 'F';
	}
%>

<body>
	이름 : <%=name %><br>
	국어 점수 : <%=kor %><br>
	영어 점수 : <%=eng %><br>
	수학 점수 : <%=math %><br>
	총점 : <%=sum %><br>
	평균 : <%=avg1 %><br>
	학점1(if) : <%=grade1 %><br>
	학점2(for) : <%=grade2 %><br>
</body>
</html>