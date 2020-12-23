<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시글 쓰기</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"href="resources/css/board.css">
	<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="<c:url value="/resources/js/board.js" />"></script>
	<script type="text/javascript" src="resources/se/js/HuskyEZCreator.js" charset="utf-8" ></script>
	
</head>
<body>
<%@include file="../common/header.jsp" %>
<div class="container" role="main">
	<h3 class="text-center ">게시글 쓰기</h3>
	<form name="form" id="form" role="form" method="post">
		<div  style="padding-right:10px">
			<select class="form-control form-control-sm" name="category" id="category">
				<option value="패션">패션</option>
				<option value="음악">음악</option>
				<option value="카페">카페</option>
				<option value="취미">취미</option>
				<option value="자유">자유</option>
			</select>
		</div>
		<div class="mb-3">
			<label for="title">제목</label>
			<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
		</div>

		<div class="mb-3">
			<label for="reg_id">작성자</label>
			<input type="text" class="form-control" value="${user.id }" name="id" id="id" readonly="readonly">
		</div>
		<div class="contentDiv">
		 	<textarea id="txtContent" name="contents" rows="30" style="width:100%;"></textarea>
		</div>
		<div class="selectBtn">
			<button type="button"  class="btn btn-sm btn-secondary" id="btnWrite" onclick="onWrite()">작성완료</button>
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
     var title = '${board.title}';               
     var contents = '${board.contents}';         //db에서 불러온 값을 여기에서 체워넣으면 됨.
     document.getElementById("title").value = title;     
     oEditors.getById["txtContent"].exec("PASTE_HTML", [contents]); //로딩이 끝나면 contents를 txtContent에 넣음
 },
 fCreator: "createSEditor2"
});	

var onWrite = function(){
oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
var form = document.getElementById("form");  
form.action ="boardWrite";              
form.submit();  
};


var pasteHTML = function(filename){
var sHTML = '<img src="${pageContext.request.contextPath}/resources/upload/'+filename+'">';
oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]);
};

</script>
</html>


