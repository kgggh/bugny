<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Bugny</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/home.css'/>" >
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
	<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	 $(document).ready(function(){
	        var page= 1;
	    	$("#paging").on("click", "li a", function(event) {
	    		event.originalEvent.preventDefault();
			});
	    	reqPageList(page);
			
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
				           htmls = "<tr><td colspan="+2+">게시글이 없습니다.<td></tr>" ;
				      } else {
		        	   		$(data.list).each(function() {
							htmls += '<tr><td >'+ this.contents +' </td><td>'+ this.regdate +'</td></tr>';
		                   	});
				    	}
					$("#tbody1").html(htmls);
					printPaging(data.page);
			      }	, error: function(error){
						console.log("에러 : " + error);
					}
			});
	    }
	
	</script>
	<style type="text/css">
		body{
			padding-top: 150px;
		}
	</style>
</head>
<%@include file="./common/header.jsp" %>
<body>

<div class="container">
	<section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <nav>
                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" onclick="reqPageList(1)" id="nav-1-tab" data-toggle="tab" href="#nav-1" role="tab" aria-controls="nav-1" aria-selected="true">음악요청</a>
                                <a class="nav-item nav-link" id="nav-2-tab" data-toggle="tab" href="#nav-2" role="tab" aria-controls="nav-2" aria-selected="false">인기게시글</a>
                                <a class="nav-item nav-link" id="nav-3-tab" data-toggle="tab" href="#nav-3" role="tab" aria-controls="nav-3" aria-selected="false">최신음악</a>
                                <a class="nav-item nav-link" id="nav-4-tab" data-toggle="tab" href="#nav-4" role="tab" aria-controls="nav-4" aria-selected="false">인기음악</a>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-1" role="tabpanel" aria-labelledby="nav-1-tab">
                                <table class="table text-center" cellspacing="0" id="table1">
	                                <thead>
                                        <tr>
                                            <th style="width: 75%">관리자님 노래 요청드려요!</th>
                                            <th>작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody1">
                                    </tbody>
                                </table>
                                <div class="pagination" style="justify-content: center;" id="paging">
                                
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-2" role="tabpanel" aria-labelledby="nav-2-tab">
                                <table class="table" cellspacing="0">
                                     <thead>
                                        <tr>
                                            <th>제목</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="#">표시될 제목입니다,,,.~</a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="nav-3" role="tabpanel" aria-labelledby="nav-3-tab">
                                <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>앨범커버</th>
                                            <th>제목</th>
                                            <th>가수</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>커버사진</td>
                                            <td>제목</td>
                                            <td>가수</td>
                                            <td>재생버튼</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="nav-4" role="tabpanel" aria-labelledby="nav-4-tab">
                                <table class="table" cellspacing="0">
                                     <thead>
                                        <tr>
                                            <th>앨범커버</th>
                                            <th>제목</th>
                                            <th>가수</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>커버사진</td>
                                            <td>제목</td>
                                            <td>가수</td>
                                            <td>재생버튼</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
</div>
</body>
</html>
