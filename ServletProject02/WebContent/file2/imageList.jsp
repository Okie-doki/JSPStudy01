<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩4 레이아웃 사용 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	<h2>File Image</h2>
	<div class="row">
		<c:forEach items="${arr }" var="item">
			<div class="clo">
<%-- 				${item.name } / ${item.title } / ${item.image } --%>
<!-- 				<image src=""> -->
				<div class="card" style="width:200px" align="center">
					<img class="card-img-top" src="../upload/${item.image }" alt="Card image" style="width:100%">
						<div class="card-body">
							<h4 class="card-title">${item.title }</h4>
							<p class="card-text">${item.name }</p>
						</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>