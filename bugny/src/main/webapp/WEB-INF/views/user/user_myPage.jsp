<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>마이페이지</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
	<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"href="resources/css/login.css">
	<script type="text/javascript">
	$(document).ready(function(){
	  	  $("#userUpdatePage").on("click", function(){
	  	    location.href = 'userUpdatePage';
	  	  });  
	  	
	  	});
	</script>
	<style type="text/css">
		body{
			padding-top: 150px;
		}
	</style>
</head>
<body>
<%@include file="../common/header.jsp" %>
<div class="container">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center text-muted">
				My Page
			</h3>
			<p>${user.id }님 환영합니다.</p>
			<p>최근 접속일 : <fmt:formatDate value="${user.logTime }" type="Date" pattern="yyyy-MM dd:hh:mm"/> </p>
			<button type="button" class="btn btn-secondary "  id="userUpdatePage">
				정보수정
			</button>
			<p>내가 쓴글</p>
			<p>추천 누른 글</p>
			<p>추천 누른 음악</p>
			
			
		</div>
	</div>
</div>
</div>

</body>
</html>




