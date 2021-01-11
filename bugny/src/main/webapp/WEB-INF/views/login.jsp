<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>로그인</title>
	<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
	  	  $("#register").on("click", function(){
	  	    location.href = 'registerPage';
	  	  });  
	  	
	  	});
	</script>
	<style type="text/css">
		#container{
			 width:500px;
			 padding-top: 150px;
		}
	</style>
</head>
<body>
<header>
<%@include file="./common/header.jsp" %>
</header>
<main role="main">
<div class="container" id="container">
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center text-muted">
				로그인
			</h3>
			<form role="form" action="loginOk" method="post">
				<div class="form-group">
					 
					<label for="exampleInputEmail1">
						아이디
					</label>
					<input type="text" name="id" placeholder="아이디를 입력해 주세요." class="form-control" id="id" required/>
					<div class="check_font" id="id_check"></div>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">
						비밀번호
					</label>
					<input type="password" name="password" placeholder="비밀번호를 입력해 주세요." class="form-control" id="password" required/>
				</div>
				<div class="check_font" id="id_password"></div>
				<div class="selectBtn text-center" style="margin-top: 10px;">
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
</main>
</body>
</html>





