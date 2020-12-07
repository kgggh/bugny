<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>메인화면</title>
</head>
<body>
<h1>
	메인화면
</h1>
<p><a href="registerPage">회원가입</a></p>
<c:if test="${empty user}">
<p><a href="loginPage">로그인</a></p>
</c:if>
<c:if test="${not empty user}">
	${user.id}
	${user.password},
	${user.name},
	${user.phone},
	${user.logdate}
	님 하이
<p><a href="logout">로그아웃</a></p>
</c:if>
<p><a href="musicPage">음악</a></p>
<p><a href="boardPage">게시판</a></p>
</body>
</html>
