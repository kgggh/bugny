<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원정보수정</title>
	<link rel="stylesheet" type="text/css"href="resources/css/reset.css">
	<link rel="stylesheet" type="text/css"href="resources/css/register.css">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
	<script src="<c:url value="/resources/js/validate.js" />"></script>
	
</head>
<body>
<%@include file="../common/header.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center text-muted">
				회원정보수정
			</h3>
			<form role="form" action="userUpdate" class="form">
				<div class="form-group">
					<label for="id">아이디</label>
					<input type="text" name="id" id="id" value="${user.id }" class="form-control" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label>
					<input type="password" name="password" id="password" placeholder="변경하실 비밀번호를 입력해주세요." class="form-control" />
				</div>
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" name="name" id="name" value="${user.name }" readonly="readonly" placeholder="이름을 입력해 주세요." class="form-control" />
				</div>
				<div class="form-group">
					<label for="birth">생년월일</label>
					<input type="text" name="birth" id="birth" value="${user.birth }" readonly="readonly" class="form-control" />
				</div>
				<div class="form-group">
					<label for="email">이메일</label>
					<input type="text" name="email"id="email" value="${user.email }" placeholder="이메일을 입력해 주세요." class="form-control" />
				</div>
				<div class="form-group">
					<label for="address">주소</label>
					<input type="text" name="address" id="address" value="${user.address }" placeholder="주소를 입력해 주세요." class="form-control" />
				</div>
				<div class="form-group">
					<label for="phone">핸드폰</label>
					<input type="text" name="phone" id="phone" value="${user.phone }" placeholder="핸드폰번호를 입력해 주세요." class="form-control" />
				</div>
				<div class="selectDiv">
					<button type="submit" class="btn btn-primary " id="userUpdate">
						수정
					</button>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>





