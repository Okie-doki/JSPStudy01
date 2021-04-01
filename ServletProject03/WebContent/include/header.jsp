<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="#">HOME</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav mr-auto">
<!-- 			상대경로보다 절대경로 사용 : 어느 위치에서든 메뉴이동 가능해야 하기 때문 -->
			<li class="nav-item">
				<a class="nav-link" href="/ServletProject03/board/boardlist">게시판</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">상품보기</a>
			</li>
			
			<c:choose>
				<%-- session 존재하지 않을 경우 --%>
				<c:when test="${empty sessionScope.user }">
					<li class="nav-item">
						<%-- 차후 1개의 프로젝트 진행 시 server에서 '/'로 설정 --%>
						<a class="nav-link" href="/ServletProject03/member/login">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/ServletProject03/member/join">회원가입</a>
					</li>
				</c:when>
				
				<%-- session이 존재 --%>
				<c:otherwise>
					<li class="nav-item">
						<a class="nav-link" href="/ServletProject03/member/logout">로그아웃</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/ServletProject03/member/view">정보수정</a>
					</li>
				</c:otherwise>		
			</c:choose>
		</ul>
		<ul class="navbar-nav">
			<c:if test="${sessionScope.user.admin==1 }">
		      	<li class="nav-item">
					<a class="nav-link" href="/ServletProject03/product/pinsert">상품등록</a>
				</li>
		      	<li class="nav-item">
					<a class="nav-link" href="/ServletProject03/member/memberlist">회원목록</a>
				</li>
				<span class="navbar-text">${sessionScope.user.name}(관리자)님 반갑습니다</span>		
			</c:if>
			<c:if test="${sessionScope.user.admin==0 }">
				<span class="navbar-text">${sessionScope.user.name}님 반갑습니다</span>		
			</c:if>
		</ul>
	</div>
</nav>
<br><br>