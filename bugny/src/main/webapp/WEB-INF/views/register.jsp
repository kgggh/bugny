<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
	<link rel="stylesheet" type="text/css"href="resources/css/reset.css">
	<link rel="stylesheet" type="text/css"href="resources/css/register.css">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<style type="text/css">
	#container{
			 width:500px;
			 padding-top: 150px;
		}
	</style>
</head>
<body>
<%@include file="./common/header.jsp" %>
<div class="container" id="container" >
	<div class="row">
		<div class="col-md-12 ">
			<h3 class="text-center text-muted">
				회원가입
			</h3>
			<form role="form" action="register" class="form" method="post">
				<div class="form-group">
					<label for="id" >* 아이디</label>
					<input type="text" name="id" id="id" placeholder="아이디를 입력해 주세요." class="form-control"/>
				</div>
				<div class="check_font" id="idCheck"></div>
				<div class="form-group">
					<label for="password">* 비밀번호</label>
					<input type="password" name="password" id="password" placeholder="비밀번호를 입력해 주세요." class="form-control" />
				</div>
				<div class="form-group">
					<label for="name">* 이름</label>
					<input type="text" name="name" id="name"  placeholder="이름을 입력해 주세요." class="form-control" />
				</div>
				<div class="form-group">
					<label for="birth">* 생년월일</label>
					<input type="text" name="birth" id="birth" placeholder="생년월일을 입력해 주세요." class="form-control" />
				</div>
				<div class="form-group">
					<label for="email">* 이메일</label>
					<input type="text" name="email"id="email"  placeholder="이메일을 입력해 주세요." class="form-control" />
				</div>
				<div class="form-group">
					<label for="address">주소</label>
					<input type="text" name="address" id="address" placeholder="주소를 입력해 주세요." class="form-control" />
				</div>
				<div class="form-group">
					<label for="phone">핸드폰</label>
					<input type="text" name="phone" id="phone" placeholder="핸드폰번호를 입력해 주세요." class="form-control" />
				</div>
				<div class="selectDiv" style="margin-top: 30px;">
					<button type="submit" class="btn btn-secondary " id="register">
						회원가입
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
	<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="resources/js/validate.js"></script> 
	<script type="text/javascript" src="resources/js/user.js"></script> 
</html>