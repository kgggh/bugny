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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script type="text/javascript">
		$(document).on('click', '#btnUpdate', function(e){
			location.href="boardUpdateP?board_idx=${boardDetail.board_idx}";
		});
		$(document).on('click', '#btnDelete', function(e){
			location.href="boardDelete?board_idx=${boardDetail.board_idx}";
		});

		$(function(){
			// 추천버튼 클릭시(추천 추가 또는 추천 제거)
			$("#rec_update").click(function(){
				$.ajax({
					url: "/board/likeUpdate",
	                type: "POST",
	                data: {
	                    idx: ${board.board_idx},
	                    id: '${id}'
	                },
	                success: function () {
				        recCount();
	                },
				})
			})
			
			// 게시글 추천수
		    function recCount() {
				$.ajax({
					url: "/board/likeCount",
	                type: "POST",
	                data: {
	                    idx: ${board.board_idx}
	                },
	                success: function (count) {
	                	$("#heart").html(count);
	                },
	                error:
	                	function (request, status, error){
	                	alert("ajax실패")
	                	}
				})
		    };
		    recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
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
				            <th class="active" colspan="2">카테고리</th>
				            <td colspan="3"><c:out value="${boardDetail.category }"/></td>
			               	<th class="active" colspan="2">작성자</th>
				            <td colspan="3"><c:out value="${boardDetail.id }"/></td>
				            <th class="active" colspan="3" >작성일</th>
				            <td colspan="4"><c:out value="${boardDetail.regdate}"/></td>
				        </tr>
				        <tr>
				        	<th class="active" >제목</th>
				            <td colspan="9" style=""><c:out value="${boardDetail.title }"/></td>
				          	<th class="active" colspan="2" >조회수</th>
				            <td ><c:out value="${boardDetail.hit }"/></td>
				            <th class="active" colspan="2">추천</th>
				            <td colspan="2"><i class="far fa-heart " id="heart">${boardDetail.liked }</i></td>
				        </tr>
				       	<tr>
				            <th colspan="16">${boardDetail.contents}</th>
				        </tr>
	         		</table>
  				</div>
			</div>
			<div class="text-center">
				<c:if test="${boardDetail.id == user.id }">
				<button type="button" class="btn btn-md btn-secondary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-md btn-secondary" id="btnDelete">삭제</button>
				</c:if>
				<button type="button" class="btn btn-md btn-secondary" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>

</html>



