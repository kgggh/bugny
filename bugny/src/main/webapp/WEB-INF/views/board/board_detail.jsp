<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시판</title>
	<script src="<c:url value="/resources/js/board.js" />"></script>
	<link rel="stylesheet" type="text/css"href="resources/css/board.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script type="text/javascript">
	

		$(document).ready(function(){
			showReplyList();
		});

		$(document).on('click', '#btnUpdate', function(e){
			location.href="boardUpdateP?board_idx=${boardDetail.board_idx}";
		});
		$(document).on('click', '#btnDelete', function(e){
			location.href="boardDelete?board_idx=${boardDetail.board_idx}";
		});

		function showReplyList(){
			var url = "${pageContext.request.contextPath}/restBoard/replyList";
			var data = {"board_idx" : "${boardDetail.board_idx}"};
			$.ajax({
		           type: 'POST',
		           url: url,
		           data: data,
		           dataType: 'json',
		           success: function(result) {
		              	var htmls = "";
						if(result.length < 1){
							htmls = "달린 댓글이 없습니다.";
						} else {
				                    $(result).each(function(){
				                     htmls += '<div class="media text-muted pt-3" id="reply_idx' + this.reply_idx + '">';
				                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
				                     htmls += '<title>Placeholder</title>';
				                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
				                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
				                     htmls += '</svg>';
				                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
				                     htmls += '<span class="d-block">';
				                     htmls += '<strong class="text-gray-dark">' + this.id + '</strong>';
				                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
				                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.reply_idx + ', \'' + this.id + '\', \'' + this.contents + '\' )" style="padding-right:5px">수정</a>';
				                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.reply_idx + ', \'' + this.id + '\')" >삭제</a>';
				                     htmls += '</span>';
				                     htmls += '</span>';
				                     htmls += this.contents;
				                     htmls += '</p>';
				                     htmls += '</div>';
				                });
						}
						$("#replyList").html(htmls);
			      }	
			});
		}


		
		function fn_editReply(reply_idx, id, contents){
			var writer = id
			var loginId = "${user.id}";
			if(writer != loginId){
				alert("작성자만 수정가능");
				return false;	
			}
			
			var htmls = "";
			htmls += '<div class="media text-muted pt-3" id="reply_idx' + reply_idx + '">';
			htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
			htmls += '<title>Placeholder</title>';
			htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
			htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
			htmls += '</svg>';
			htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
			htmls += '<span class="d-block">';
			htmls += '<strong class="text-gray-dark">' + id + '</strong>';
			htmls += '<span style="padding-left: 7px; font-size: 9pt">';
			htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + reply_idx + ', \'' + id + '\')" style="padding-right:5px">저장</a>';
			htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소</a>';
			htmls += '</span>';
			htmls += '</span>';		
			htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
			htmls += contents;
			htmls += '</textarea>';
			htmls += '</p>';
			htmls += '</div>';
			$('#reply_idx' + reply_idx).replaceWith(htmls);
			$('#reply_idx' + reply_idx + ' #editContent').focus();
		}

		
		function fn_updateReply(reply_idx, id){
			
			var url = "${pageContext.request.contextPath}/restBoard/replyUpdate";
			var replyEditContent = $('#editContent').val();
			var data = JSON.stringify({"contents": replyEditContent
					, "reply_idx": reply_idx
			});
			var headers = {"Content-Type" : "application/json"
					, "X-HTTP-Method-Override" : "POST"};
			$.ajax({
				url: url
				, headers : headers
				, data : data
				, type : 'POST'
				, dataType : 'text'
				, success: function(result){
	                                console.log(result);
					showReplyList();
				}
				, error: function(error){
					console.log("에러 : " + error);
				}
			});
		}

		function fn_deleteReply(reply_idx, id){
			var url = "${pageContext.request.contextPath}/restBoard/replyDelete";
			var data = {"reply_idx": reply_idx};
			var writer = id
			var loginId = "${user.id}";

			if(loginId =="admin"|| writer == loginId){
			$.ajax({
				url: url
				, data : data
				, type : 'POST'
				, dataType : 'text'
				, success: function(result){
					showReplyList();
				}
				, error: function(error){
					console.log("에러 : " + error);
				}
			});
		} else{
			alert('작성자만 삭제가능');
			return false;
			}
		}

	

		$(document).on('click', '#btnReplySave', function(){
			var url = "${pageContext.request.contextPath}/restBoard/replyCreate";
			var contents = $('#contents').val();
			var id = "${user.id}";
			var data = JSON.stringify({"contents": contents
					, "id": id
					, "board_idx":'${boardDetail.board_idx}'
			});
			var headers = {"Content-Type" : "application/json"
					, "X-HTTP-Method-Override" : "POST"};
			if(contents.trim() == ""){
				alert('댓글을 작성해주세요.');
				return;
				}
			$.ajax({
				url: url
				, headers : headers
				, data : data
				, type : 'POST'
				, dataType : 'text'
				, success: function(result){
					showReplyList();
					$('#contents').val('');
					$('#id').val('');
				}
				, error: function(error){
					console.log("에러 : " + error);
				}
			});
		});

	



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
				            <td colspan="2"><i class="far fa-heart " id="heart"> ${boardDetail.liked }</i></td>
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
			
			<!-- Reply Form {s} -->
			<c:if test="${not empty user }">
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<form name="form" id="form" role="form" method="post">
				<input type="hidden" name="board_idx" id="board_idx" value="${boardDetail.board_idx }"/>
				<div class="row">
					<div class="col-sm-10">
						<textarea name="contents" id="contents" class="form-control" rows="3" placeholder="댓글을 입력해 주세요" style="resize: none;"></textarea>
					</div>
					<div class="col-sm-2">
						<input type="hidden" name="id" class="form-control" id="id" value="${user.id }" placeholder="댓글 작성자"></input>
						<button type="button" class="btn btn-sm btn-secondary" id="btnReplySave" style="width: 100%; margin-top: 30px"> 저 장 </button>
					</div>
				</div>
				</form>
			</div>
			</c:if>
			<!-- Reply Form {e} -->
			
			<!-- Reply List {s}-->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<h6 class="border-bottom pb-2 mb-0">댓글들</h6>
				<div id="replyList"></div>
			</div> 
			<!-- Reply List {e}-->
			<div class="pagination" style="justify-content: center;" id="paging">
			</div>
		</div>
	</article>
</body>

</html>



