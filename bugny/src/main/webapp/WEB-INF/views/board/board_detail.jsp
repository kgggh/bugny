<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시판</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
	<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<script src="<c:url value="/resources/js/board.js" />"></script>
	<link rel="stylesheet" type="text/css"href="resources/css/board.css">
	<script type="text/javascript">
		$(document).on('click', '#btnUpdate', function(e){
			location.href="boardUpdateP?board_idx=${boardDetail.board_idx}";
		});
	</script>
</head>
<%@include file="../common/header.jsp" %>
<body>
	<article>
		<div class="container" style="width: 900px;" role="main">
		
			<h2>내용</h2>
			<div class="bg-white rounded shadow-sm">
				<div class="board_title"><c:out value="${boardDetail.title }"/></div>
				<div class="board_tag">TAG : <c:out value="${boardDetail.category }"/></div>
				<div class="board_info_box">
					<span class="board_author"><c:out value="${boardDetail.board_idx }"/></span>
					<span class="board_date"><c:out value="${boardDetail.regdate}"/></span>
				</div>
				<div class="board_content">${boardDetail.contents}</div>
			</div>
			<div class="text-center">
				<button type="button" class="btn btn-md btn-secondary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-md btn-secondary" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-md btn-secondary" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>

</html>



