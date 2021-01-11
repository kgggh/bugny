<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Bugny</title>
	<script type="text/javascript">
	</script>
		
	<style type="text/css">
		#main{
			height: 100vh;
			width: 100%;
			background-img: url("resources/img/main-image.jpg");
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
			background: url("resources/img/main-image.jpg") no-repeat center/cover;

		}
	</style>
</head>
<body>
<%@include file="./common/header.jsp" %>
<div id="main">
</div>
</body>
</html>
