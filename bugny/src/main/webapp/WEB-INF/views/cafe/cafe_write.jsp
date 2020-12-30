<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">

	<title>음악등록</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
	<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"href="resources/css/board.css">
	<script src="<c:url value="/resources/js/music.js" />"></script>
     <style type="text/css">
		body{
			padding-top: 150px;	
		}
	</style>
</head>
<body>
<%@include file="../common/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center text-muted">
				음악등록
			</h3>
			<div class="form-group row justify-content-end" id="search">
				<div class="w100" style="padding-right:10px">
					<select class="form-control form-control-sm" name="searchType" id="searchType">
						<option value="album">앨범</option>
						<option value="title">제목</option>
						<option value="singer">가수</option>
					</select>
				</div>
				<div class="w300" style="padding-right:10px">
					<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
				</div>
				<div>
					<button class="btn btn-sm btn-secondary" name="btnSearch" id="btnSearch">검색</button>
				</div>
			</div>
			
			<table class="table table-hover text-center">
				<thead>
						<tr> 
							<th style="width: 10%">순위</th>
							<th style="width: 10%">앨범</th>
							<th style="width: 5%">제목</th>
							<th style="width: 50%">가수</th>
							<th style="width: 5%">좋아요</th>
							<th style="width: 10%">재생수</th>
						</tr>
				</thead>
				<tbody>
					<tr>
					<c:if test="${not empty boardList }">
						<c:forEach var="board" items="${boardList }">
							<tr>
								<td>1</td>
								<td>앨범커버</td>	
								<td>거짓말</td>
								<td>빅뱅</td>
								<td>0</td>
								<td>154</td>
							</tr>
						</c:forEach>
					</c:if>
					</tr>
				</tbody>
			</table>
			<div class="justify-content-end" align="right" id="btn">
				<button type="button" class="btn btn-md btn-secondary pull-right" id="musicWriteP">
					노래등록
				</button>
			</div>
		</div>
	</div>
</div>
	

</body>
</html>