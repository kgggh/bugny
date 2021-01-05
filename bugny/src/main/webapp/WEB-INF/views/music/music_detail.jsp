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
	<script src="<c:url value="/resources/js/music.js" />"></script>
	<link rel="stylesheet" type="text/css"href="resources/css/board.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script type="text/javascript">
	</script>
	<style type="text/css">
		body{
			padding-top: 150px;
		}
		#subTitle{
			padding-bottom: 50px;
		}
		#heart{
			cursor:pointer;
		}
	</style>
</head>
<body>
<%@include file="../common/header.jsp" %>
	<article>
		<div class="container" style="width: 900px;" role="main">
		    <h3 class="text-center text-muted "  id="subTitle">
			게시글 상세
			</h3>
 			<div class="row">
			    <div class="table table-responsive">
			        <table class="table" >
			        <colgroup>
					    <col class="col-xs-1">
					 	<col class="col-xs-7">
					</colgroup>
				        <tr>
				            <th class="active" colspan="2">앨범커버</th>
				            <td colspan="3">${musicDetail.album }</td>
				        	<th class="active" >제목</th>
				            <td colspan="9" style=""><c:out value="${musicDetail.title }"/></td>
			               	<th class="active" colspan="2">가수</th>
				            <td colspan="3"><c:out value="${musicDetail.singer }"/></td>
				        </tr>
				        <tr>
				            <th class="active" colspan="3" >발매일</th>
				            <td colspan="4"><c:out value="${musicDetail.releaseDate}"/></td>
				            <c:if test="${not empty user}">
				            <th class="active" colspan="2"><a href="liked?music_idx=${musicDetail.music_idx }&id=${user.id}">추천</a></th>
				            </c:if>
				        </tr>
	         		</table>
  				</div>
			</div>
			<input type="hidden" name="music_idx" value="${musicDetail.music_idx }">
			<div class="text-center">
				<c:if test="${user.id eq admin }">
				<button type="button" class="btn btn-md btn-secondary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-md btn-secondary" id="btnDelete">삭제</button>
				</c:if>
				<button type="button" class="btn btn-md btn-secondary" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>

</html>



