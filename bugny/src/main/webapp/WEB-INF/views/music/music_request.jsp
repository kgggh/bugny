<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시판</title>
	<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<link rel="stylesheet" type="text/css"href="resources/css/board.css">
	<script src="<c:url value="/resources/js/board.js" />"></script>
	
    <script type="text/javascript">
    
    $(document).ready(function(){
        var page= 1;
    	$("#paging").on("click", "li a", function(event) {
    		event.originalEvent.preventDefault();
		});
    	showReqList();
		
	});

    var printPaging = function printPaging(page) {
 		var str = "";
 		if(page.prev) {
 			str += "<li class='page-item'><a class='page-link' onclick=reqPageList("+(page.startPage -1)+") href= '" + (page.startPage -1) + "'> Prev </a></li>";
 		}

 		for(var i = page.startPage, len = page.endPage; i <= len; i++) {
 			var classStr = page.cri.page == i ? 'active' : '';
 			str += '<li class="page-item ' + classStr + ' + "><a class="page-link" onclick=reqPageList('+i+') href= "'+ i +'">' + i + '</a> </li>';
 		}
 		if(page.next) {
 			str += "<li class='page-item'><a class='page-link' onclick= reqPageList("+(page.endPage +1)+") href='" + (page.endPage +1) + "'> Next </a></li>";
 		}
 		$("#paging").html(str);
 	};
    

    function reqPageList(page){
		$.ajax({
	           url: "${pageContext.request.contextPath}/reqPageList",
	           type: 'POST',
	           data: {
					"page" : page
		           },
	           dataType: 'json',
	           success: function(data) {
	        	  var htmls = "";
		          if(data.list.length < 1){
			           htmls = "<tr><td colspan="+6+">게시글이 없습니다.<td></tr>" ;
			      } else {
	        	   		$(data.list).each(function() {
						htmls += '<tr id="req_idx' + this.req_idx + '"><td>'+ this.contents +' </td>  <td>'+ this.id +' </td>';
		        	   	htmls += '<td>'+ this.regdate +' <a href="javascript:void(0)" onclick="fn_deleteReply(' + this.req_idx + ', \'' + this.id + '\')" > <i class="fas fa-trash"></i> </a> </td></tr>'
	                   	});
			    	}
				$("#tbody").html(htmls);
				printPaging(data.page);
		      }	, error: function(error){
					console.log("에러 : " + error);
				}
		});
    }

    

	function showReqList(){
		$.ajax({
	           url: "${pageContext.request.contextPath}/getReqList",
	           dataType: 'json',
	           type: "GET",
	           success: function(data) {
	        	   var htmls = "";
		           if(data.list.length < 1){
			           htmls = "<tr><td colspan="+6+">게시글이 없습니다.<td></tr>" ;
			      } else {
	        	   		$(data.list).each(function() {
						htmls += '<tr id="req_idx' + this.req_idx + '"><td>'+ this.contents +' </td>  <td>'+ this.id +' </td>';
		        	   	htmls += '<td>'+ this.regdate +' <a href="javascript:void(0)" onclick="fn_deleteReply(' + this.req_idx + ', \'' + this.id + '\')" > <i class="fas fa-trash"></i> </a> </td></tr>'
		                   	});
			    	}
				$("#tbody").html(htmls);
				printPaging(data.page);
		      }	, error: function(error){
					console.log("에러 : " + error);
				}
		 	
		});
	}

	

    
	  $(document).on('click', '#btnReqSave', function(){
			var url = "${pageContext.request.contextPath}/restReqMusic/reqMusicCreate";
			var contents = $('#contents').val();
			var id = "${user.id}";
			var data = JSON.stringify({"contents": contents
					, "id": id
			});
			var headers = {"Content-Type" : "application/json"
					, "X-HTTP-Method-Override" : "POST"};
			if(contents.trim() == ""){
				alert('요청사항을 작성해주세요.');
				return;
				}
			$.ajax({
				url: url
				, headers : headers
				, data : data
				, type : 'POST'
				, dataType : 'text'
				, success: function(data){
					$('#contents').val('');
					showReqList();
				}
				, error: function(error){
					console.log("에러 : " + error);
				}
			});
		});
	 

	    function fn_deleteReply(req_idx, id){
			var writer = id;
			var loginId = "${user.id}";
			var req_idx = req_idx;
			var url = "${pageContext.request.contextPath}/restReqMusic/reqMusicDelete";
			var data = {"req_idx": req_idx};
			if(loginId =="admin"|| writer == loginId){
				$.ajax({
					url: url
					, data : data
					, type : 'POST'
					, dataType : 'text'
					, success: function(result){
						showReqList();
					}
					, error: function(error){
						console.log("에러 : " + error);
					}
				});
		}else {
			alert("작성자만 삭제가능");
			return false;
			}
	    }
 
	   
    </script>
    
    <style type="text/css">
		body{
			padding-top: 150px;
		}
		#subTitle{
			padding-bottom: 50px;
		}
	</style>
</head>
<%@include file="../common/header.jsp" %>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center text-muted " id="subTitle">
				음악요청
			</h3>
			<!-- Reply Form {s} -->
			<c:if test="${not empty user }">
			<div class="my-3 p-3 bg-white rounded shadow-sm" >
				<form name="form" id="form" role="form" method="post">
				<div class="row">
					<div class="col-sm-10">
						<textarea name="contents" id="contents" class="form-control" rows="1" placeholder="요청사항을 적어주세요." style="resize: none;"></textarea>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-sm btn-secondary" id="btnReqSave" style="width: 100%; margin-top: 4px"> 작 성 </button>
					</div>
				</div>
				</form>
			</div>
			</c:if>
			<!-- Reply Form {e} -->
			<table class="table table-hover text-center">
				<thead>
						<tr> 
							<th style="width: 70%">내용</th>
							<th style="width: 10%">작성자</th>
							<th style="width: 20%">작성일</th>
						</tr>
				</thead>
				<tbody id="tbody">
				</tbody>
			</table>
			<div class="pagination" style="justify-content: center;" id="paging">
			</div>
		</div>
	</div>
</div>
</body>
</html>