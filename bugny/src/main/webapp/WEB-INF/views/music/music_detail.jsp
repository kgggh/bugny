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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<script src="<c:url value="/resources/js/music.js" />"></script>
	<link rel="stylesheet" type="text/css"href="resources/css/board.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script type="text/javascript">

	 $(document).ready(function(){
		 getLiked();
		});
	
	function getLiked(){
		var url = "${pageContext.request.contextPath}/restBoard/replyList";
		var data = {"music_idx" : "${musicDetail.music_idx}", "id" : "${user.id}"};
		$.ajax({
	           type: 'POST',
	           url: "getLiked",
	           data: data,
	           dataType: 'json',
	           success: function(data) {
	        	   console.log("성공"+data);
		      }	
		, error: function(error){
			console.log("에러 : " + error);
		}
		});
	}
			
			
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
				            <th class="active" colspan="">앨범커버</th>
				            <td colspan="">${musicDetail.album }</td>
				        	<th class="active" >제목</th>
				            <td colspan="" style=""><c:out value="${musicDetail.title }"/></td>
			               	<th class="active" colspan="">가수</th>
				            <td colspan=""><c:out value="${musicDetail.singer }"/></td>
				            <th class="active" colspan="" >발매일</th>
				            <td colspan=""><c:out value="${musicDetail.releaseDate}"/></td>
				        </tr>
	         		</table>
  				</div>
			</div>
			<div class="text-center">
			<c:choose>
				  <c:when test="${empty user}">
				  	<button class="btn btn-md btn-secondary" id="liked">추천</button> <p id="liked">${musicDetail.likeCheck }</p>
				  </c:when>
				  <c:otherwise>
			   		<button class="btn btn-md btn-secondary" id="liked">추천</button><p id="liked"> ${musicDetail.likeCheck}</p>
				  </c:otherwise>
			</c:choose>
			</div>
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



