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
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<style type="text/css">
	.dropdown:hover .dropdown-menu {
		    display: block;
		    margin-top: 0;
		}
		#dropdown{
			color: white;
			border: 0px;
		}
		.nav-item > a {
			font-size: 20px;	
		}
		#dropdown li > a{
			font-size: 20px;	
		}
		#dropdown {
			width: 236px;
			text-align: center;
		}
		#btn{
			font-size: 20px;
			color: rgba(255,255,255,.5);
		}
	</style>
</head>
<body >
<nav class="navbar navbar-expand-md navbar-dark bg-dark" id="navbar">
	<a class="navbar-brand" href="home">Bugny</a>
	<button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#navDiv"> 
		<span class="navbar-toggler-icon"></span> </button>
	 <div class="collapse navbar-collapse flex-grow-0" id="navDiv">
		<ul class="navbar-nav me-auto mb-2 mb-md-0">
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
			  <a class="nav-link" href="boardList">자유게시판</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link" href="liveChat" >라이브채팅</a>
			</li>
	    </ul>
	    <ul class="nav navbar-nav ml-auto navbar-right">
	    <c:if test="${empty user }">
			<li class="nav-item">
				<a class="nav-link" href="login">로그인</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="registerPage">회원가입</a>
			</li>
	    </c:if>
	    <c:if test="${not empty user }">
			<div class="dropdown"  >
			<button class="btn dropdown-toggle bg-dark" type="button" data-toggle="dropdown" id="btn">마이페이지
			<span class="caret"></span></button>
			<ul class="dropdown-menu  bg-dark " id="dropdown" >
			  <li>${user.id } 님 접속중</li>
			  <li>최근 접속일 : <fmt:formatDate  pattern="yyyy-MM-dd HH:mm" value="${user.logTime }"/> </li>
			  <li><a class="nav-link" href="myPage">정보수정</a></li>
			</ul>
		</div>
		<li class="nav-item">
				<a class="nav-link" href="logout">로그아웃</a>
		</li>
	    </c:if>
	    </ul>
	</div>
</nav>
</body>

</html>

