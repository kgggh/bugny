<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>음악등록</title>
	<link rel="stylesheet" type="text/css"href="resources/css/reset.css">
	<link rel="stylesheet" type="text/css"href="resources/css/music.css">
	<link rel="stylesheet" type="text/css"href="resources/css/board.css">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="<c:url value="/resources/js/music.js" />"></script>
	<script type="text/javascript" src="resources/se/js/HuskyEZCreator.js" charset="utf-8" ></script>
	
	<script type="text/javascript">
	$(function(){
		$("#form2").validate({
			//규칙
			rules:{
				releaseDate:{
					required : true, //필수입력여부
					date : true 	//date
				}
			},
			//메시지
			messages:{
				releaseDate:{
					required :"생년월일을 입력해 주세요",
					date : " Ex) YYYY-MM-DD" 
				}
			},
			//메시지 태그
			errorElement : 'span', 	//태그
			errorClass: 'error',	//클레스 이름
			validClass:'vaild'
				
		});
		return false;
});
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
<%@include file="../common/header.jsp" %>
<body>
<div class="container" id="container">
	<h3 class="text-center text-muted " id="subTitle">
		음악등록
	</h3>
	<form name="form2"  id="form2" role="form2" >
		<div class="mb-3">
			<label for="title">제목</label>
			<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
		</div>
		<div class="mb-3">
			<label for="singer">가수</label>
			<input type="text" class="form-control" name="singer" id="singer" placeholder="가수를 입력해 주세요">
		</div>
		<div class="mb-3">
			<label for="playURL">URL</label>
			<input type="text" class="form-control" name="playURL" id="playURL" placeholder="재생 url주소를 입력해 주세요.">
		</div>
		<div class="mb-3">
			<label for="releaseDate">발매일</label>
			<input type="date" class="form-control" name="releaseDate" id="releaseDate" placeholder="발매일을 작성해주세요. Ex)yyyy-mm-dd">
		</div>
		<div class="contentDiv">
			<label for="album">앨범커버</label>
		 	<textarea id="txtContent" name="album" rows="30" style="width:100%;"></textarea>
		</div>
		<div class="selectBtn">
			<button type="submit"  class="btn btn-sm btn-secondary" id="btnWrite" onclick="onWrite()">작성완료</button>
			<button type="button" class="btn btn-sm btn-secondary" id="btnList">목록</button>
		</div>
	</form>
</div>
</body>

<script type="text/javascript"  charset="utf-8" >

	

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
oAppRef: oEditors,
elPlaceHolder: document.getElementById('txtContent'), // html editor가 들어갈 textarea id
sSkinURI: "resources/se/SmartEditor2Skin.html",  // html editor가 skin url
fOnAppLoad: function () { 
    //수정모드를 구현할 때 사용할 부분. 로딩이 끝난 후 값이 체워지게 하는 구현을 하면 된다.
     var album = '${music.album}';         //db에서 불러온 값을 여기에서 체워넣으면 됨.
     oEditors.getById["txtContent"].exec("PASTE_HTML", [album]); //로딩이 끝나면 contents를 txtContent에 넣음
 },
 fCreator: "createSEditor2"
});	

var onWrite = function(){
oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
var form2 = document.getElementById("form2"); 
var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
if($("#title").val() == '') {
	alert("제목을 작성해주세요."); 
	$('#title').focus();
	return;
}
if($("#singer").val() == '') {
	alert("가수를 작성해주세요."); 
	$('#singer').focus();
	return;
}
if($("#playURL").val() == '') {
	alert("URL을 작성해주세요."); 
	$('#playURL').focus();
	return;
}

if(!date_pattern .test(form2.releaseDate.value)){
	alert("발매일을 확인해주세요."); 
	$('#releaseDate').focus();
return false;
}

form2.action ="musicWrite";              
form2.submit();  
};


var pasteHTML = function(filename){
var sHTML = '<img width="60px" height="60px" src="${pageContext.request.contextPath}/resources/upload/'+filename+'">';
oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]);
};

</script>

<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
</html>


