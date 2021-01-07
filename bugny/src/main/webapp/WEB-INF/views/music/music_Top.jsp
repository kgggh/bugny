<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">

	<title>음악듣기</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
	<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"href="resources/css/board.css">
	<script src="<c:url value="/resources/js/music.js" />"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script type="text/javascript">
	</script>
    <style type="text/css">
		body{
			padding-top: 150px;		
		}
		#table td {
			vertical-align: middle;
			text-align: center;
		}
	</style>
</head>
<body>
<%@include file="../common/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center text-muted">
				이 노래 모르면 간첩!
			</h3>
			<table class="table table-hover text-center" id="table">
				<thead>
						<tr> 
							<th style="width: 10%">순위</th>
							<th style="width: 10%">앨범</th>
							<th style="width: 10%">발매일</th>
							<th style="width: 30%">제목</th>
							<th style="width: 20%">가수</th>
							<th style="width: 10%">좋아요</th>
							<th style="width: 10%"></th>
						</tr>
				</thead>
				<tbody>
				<c:if test="${not empty musicTop }">
					<c:forEach var="music" items="${musicTop }">
						<tr>
							<td>${count }</td>
							<td>${music.album }</td>	
							<td>${music.releaseDate }</td>
							<td><a href="musicDetail?music_idx=<c:out value="${music.music_idx }"/>" >${music.title }</a></td>
							<td>${music.singer }</td>
							<td><i class="far fa-heart " id="heart" > </i> ${music.likeCheck }</td>
							<td><a href="${music.playURL }"onclick="window.open(this.href,'','width=500,height=500,scrollbars=no'); return false;"><i class="fab fa-youtube fa-3x"></i></a></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty musicTop }">
						<tr>
							<td colspan="6">등록된 노래가 없습니다.</td>
						</tr>
				</c:if>
				</tbody>
			</table>
			<div class="justify-content-end" align="right" id="btn">
				<c:if test="${user.id eq 'admin'}">
				<button type="button" class="btn btn-md btn-secondary pull-right" id="musicWriteP">
					음악등록
				</button>
				</c:if>
			</div>
			<div>
			  	<ul class="pagination" style="justify-content: center;">
					<c:if test="${pagination.prev }">
						<li class="page-item">
							<a class="page-link" href='<c:url value="/musicTop?page=${pagination.startPage-1 }"/>'>Previous</a>
						</li>
					</c:if>
				    <c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="pageNum">
						<li class="page-item <c:out value="${pagination.cri.page == pageNum ? 'active' : ''}"/>">
							<a class="page-link" href='<c:url value="/musicTop?page=${pageNum }"/>'>${pageNum }</a>
						</li>
					</c:forEach>	
					<c:if test="${pagination.next && pagination.endPage >0 }">
						<li class="page-item">
							<a class="page-link" href='<c:url value="/musicTop?page=${pagination.endPage+1 }"/>'>Next</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>
	

</body>
</html>