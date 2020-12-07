<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="register">
		<p>아이디<input type="text" name="id"></p>
		<p>비번<input type="password" name="password"></p>
		<p>이름<input type="text" name="name"></p>
		<p>생일<input type="date" name="birth"></p>
		<p>이메일<input type="text" name="email"></p>
		<p>주소<input type="text" name="address"></p>
		<p>핸드폰<input type="text" name="phone"></p>
	<input type="submit" value="회원가입">
	</form>
</body>
</html>