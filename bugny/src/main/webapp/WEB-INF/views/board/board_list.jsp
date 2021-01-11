<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시글리스트</title>
	<link rel="stylesheet" type="text/css"href="resources/css/board.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/board.js" />"></script>
    <script type="text/javascript">
    
    </script>
    
    <style type="text/css">
		#subTitle{
			padding-bottom: 50px;
		}
		#container{
			 padding-top: 150px;
		}
	</style>
</head>
<body>
<%@include file="../common/header.jsp" %>

<div class="container-fluid" id="container">
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center text-muted " id="subTitle">
				자유게시판
			</h3>
			<form method="get" role="form">
				<div class="form-group row justify-content-end" id="search">
						<div class="w100" style="padding-right:10px">
							<select class="form-control form-control-sm" name="searchType" id="searchType">
								<option value="t"
									<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
								<option value="c"
									<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
								<option value="w"
								<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>작성자</option>
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
			<table class="table table-hover text-center">
				<thead>
						<tr> 
							<th style="width: 10%">No</th>
							<th style="width: 5%">카테고리</th>
							<th style="width: 50%">제목</th>
							<th style="width: 5%">작성자</th>
							<th style="width: 20%">작성일</th>
							<th style="width: 10%">조회수</th>
						</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boardList }">
						<c:choose>
							<c:when test="${board.display eq 'y' }">
							<tr>
								<td>${board.board_idx }</td>
								<td>${board.category }</td>	
								<td><a href="boardDetail?board_idx=<c:out value="${board.board_idx }"/>" >${board.title }</a></td>
								<td>${board.id }</td>
								<td>${board.regdate }</td>
								<td><i class="fas fa-eye"></i> ${board.hit }</td>
							</tr>
							</c:when>
							<c:otherwise>
								<tr> 
									<td colspan="6">삭제된 게시글입니다. </td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${empty boardList }">
							<tr>
								<td colspan="6">등록된 게시글이 없습니다.</td>
							</tr>
					</c:if>
				</tbody>
			</table>
			<div class="justify-content-end" align="right" id="btn">
				<c:if test="${not empty user }">
				<button type="button" class="btn btn-md btn-secondary pull-right" id="boardWriteP">
					글작성
				</button>
				</c:if>
			</div>
			<div>
			  	<ul class="pagination" style="justify-content: center;">
					<c:if test="${pagination.prev }">
						<li class="page-item">
							<a class="page-link" href='<c:url value="/boardList${pagination.makeSearch(pagination.startPage - 1)}"/>'>Previous</a>
						</li>
					</c:if>
				    <c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="pageNum">
						<li class="page-item <c:out value="${pagination.cri.page == pageNum ? 'active' : ''}"/>">
							<a class="page-link" href='<c:url value="/boardList${pagination.makeSearch(pageNum)}"/>'>${pageNum }</a>
						</li>
					</c:forEach>	
					<c:if test="${pagination.next && pagination.endPage >0 }">
						<li class="page-item">
							<a class="page-link" href='<c:url value="/boardList${pagination.makeSearch(pagination.endPage + 1)}"/>'>Next</a>
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
	
						formObj.attr("action","boardList");
						formObj.submit();
				
					});
			});
	</script>
</html>