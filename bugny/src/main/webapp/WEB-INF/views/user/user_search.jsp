<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>로그인</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
	<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"href="resources/css/login.css">
	<script type="text/javascript">
		$(document).ready(function(){
	  	  $("#register").on("click", function(){
	  	    location.href = 'registerPage';
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
<div class="container" style="width:500px; margin-top: 100px;">
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center text-muted">
				로그인
			</h3>
			<form role="form" action="login" method="post">
				<div class="form-group">
					 
					<label for="exampleInputEmail1">
						아이디
					</label>
					<input type="text" name="id" placeholder="아이디를 입력해 주세요." class="form-control" id="id" required/>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">
						비밀번호
					</label>
					<input type="password" name="password" placeholder="비밀번호를 입력해 주세요." class="form-control" id="password" required/>
				</div>
				<div class="interval_height a_none">
					<a href="${pageContext.request.contextPath}/user/userSearch">&nbsp; 아이디 / 비밀번호 찾기</a>
				</div>
				<div class="selectBtn" style="margin-top: 50px;">
				<button type="submit" class="btn btn-secondary "  id="login">
					로그인
				</button>
				<button type="button" class="btn btn-secondary " id="register">
					회원가입
				</button>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>




