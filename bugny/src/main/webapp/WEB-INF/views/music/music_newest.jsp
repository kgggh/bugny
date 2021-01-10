<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">

	<title>음악듣기</title>
	<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<link rel="stylesheet" type="text/css"href="resources/css/board.css">
	<script src="<c:url value="/resources/js/music.js" />"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	
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
<%@include file="../common/header.jsp" %>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center text-muted">
				최신음악
			</h3>
			<form method="get" role="form">
				<div class="form-group row justify-content-end" id="search">
						<div class="w100" style="padding-right:10px">
							<select class="form-control form-control-sm" name="searchType" id="searchType">
								<option value="t"
									<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
								<option value="c"
									<c:out value="${cri.searchType eq 's'?'selected':''}"/>>가수</option>
							</select>
						</div>
						<div class="w300" style="padding-right:10px">
							<input type="text" class="form-control form-control-sm" name="keyword" id="keywordInput" value="${cri.keyword }">
						</div>
						<div>
							<button class="btn btn-sm btn-secondary " type="button" id="btnSearch">검색</button>
						</div>
				</div>
			</form>
			<table class="table table-hover text-center" id="table">
				<thead>
						<tr> 
							<th style="width: 10%">앨범</th>
							<th style="width: 10%">발매일</th>
							<th style="width: 40%">제목</th>
							<th style="width: 30%">가수</th>
							<th style="width: 10%">조회수</th>
						</tr>
				</thead>
				<tbody>
					<c:if test="${not empty musicNewest }">
						<c:forEach var="music" items="${musicNewest }">
							<tr>
								<td>${music.album }</td>	
								<td>${music.releaseDate }</td>
								<td><a href="musicDetail?music_idx=<c:out value="${music.music_idx }"/>" >${music.title }</a></td>
								<td>${music.singer }</td>
								<td><i class="fas fa-eye"></i> ${music.hit }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty musicNewest }">
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
							<a class="page-link" href='<c:url value="/musicNewest${pagination.makeSearch(pagination.startPage - 1)}"/>'>Previous</a>
						</li>
					</c:if>
				    <c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="pageNum">
						<li class="page-item <c:out value="${pagination.cri.page == pageNum ? 'active' : ''}"/>">
							<a class="page-link" href='<c:url value="/musicNewest${pagination.makeSearch(pageNum)}"/>'>${pageNum }</a>
						</li>
					</c:forEach>	
					<c:if test="${pagination.next && pagination.endPage >0 }">
						<li class="page-item">
							<a class="page-link" href='<c:url value="/musicNewest${pagination.makeSearch(pagination.endPage + 1)}"/>'>Next</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>
	
</body>
<script type="text/javascript">
var formObj = $("form[role='form']")
	$(document).ready(
			function() {
				$('#btnSearch').on(
					"click",
					function(event) {
						var page = '${cri.page}';
						var perPageNum = '${cri.perPageNum}';
						var searchType = '${cri.searchType}}';
						var keyword = '${cri.keyword}';
	
						formObj.attr("action","musicNewest");
						formObj.submit();
						
				
					});
			});
			
</script>
</html>