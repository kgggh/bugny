<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Bugny</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	 integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
	 crossorigin="anonymous">
	<!-- common CSS -->
	<link rel="stylesheet" href="<c:url value='/resources/css/header.css'/>" >
	
</head>
<body >
<!-- 상단 메뉴바{s} -->
	<nav class="navbar fixed-top navbar-expand-sm navbar-dark bg-dark" id="navbar">
		<a class="navbar-brand" href="home">Bugny</a>
		 <div class="collapse navbar-collapse" id="navDiv">
			<ul class="navbar-nav  mr-auto">
				<li class="nav-item">
				  <a class="nav-link" href="musicTop">인기음악</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="musicNewest">최신음악</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="reqMusicList">음악요청</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="boardList">자유게시판(구현)</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="liveChat" >라이브채팅</a>
				</li>
		    </ul>
		    <ul class="nav navbar-nav ml-auto navbar-right">
		    <c:if test="${empty user }">
				<li class="nav-item">
					<a class="nav-link" href="loginPage">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="registerPage">회원가입</a>
				</li>
		    </c:if>
		    <c:if test="${not empty user }">
				<li class="nav-item">
					<a class="nav-link" href="logout">로그아웃</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="myPage">마이페이지</a>
				</li>
		    </c:if>
		    </ul>
		</div>
	</nav>
<div>
</div>
</body>
</html>

