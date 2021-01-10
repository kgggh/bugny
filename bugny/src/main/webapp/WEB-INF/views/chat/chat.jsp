<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">

	<title>라이브채팅</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdn.pubnub.com/pubnub-3.4.4.js"></script>
	<script type="text/javascript">
		
	
	   var pubnub = PUBNUB.init({
	    	publish_key: 'pub-c-5420be45-0fb1-47f9-8ea6-13b4c0c4a37e',
	    	subscribe_key: 'sub-c-99fff064-4631-11e8-afae-2a65d00afee8',
	    	ssl: true
	    });
	    
	    pubnub.subscribe({
	    	channel: 'chat',
	    	message: displayPub
	    });
	    
	    pubnub.history({
	    	channel: 'chat',
	    	reverse: false,
	    	count: 300
	    }, function(status, response){
	    	$.each(status[0], function(i, item){
	    		displayPub(item);
	    	});
	    	
	    });

		
		function displayPub(message){
			var html = "<div>"+message.username+": "+message.text+"</div>";
			$("#chatPub").append(html).scrollTop(999999);
		}
		
		function sendPub(){
			if($("#messagePub").val() == '') {
				alert("메세지를 입력해주세요."); return;
			}
			pubnub.publish({
				channel: 'chat',
				message:{
					username: $("#name").val(),
					text: $("#messagePub").val()
				}
			});
			$("#messagePub").val('').focus();
		}
		
		$(document).ready(function(){
			
			$("#sendPub").click(function(){
				sendPub();
			});
			$("#messagePub").keyup(function(event){
				if(event.keyCode == 13) sendPub();
			});
			
			
		});

	
		 
	</script>
	<style type="text/css">
		#chatPub{
			overflow: auto;
			height:500px;
			background-color: #FAFAFA;
			
		}
		body{
			padding-top: 150px;	
		}
		#subTilte{
			padding-bottom: 50px;
		}
		#sendChat{
		}
	</style>
</head>
<body>
<%@include file="../common/header.jsp" %>
<div class="container">
	<div>
		<h3 class="text-center text-muted " id="subTilte">라이브채팅방</h3>
		<div id="chatPub"></div>
		<c:if test="${not empty user }">
		<input type="hidden" id="name" value="${user.id }" placeholder="name" readonly="readonly" required/>
		</c:if>
		<c:if test="${empty user}">
		<input type="hidden" id="name" value="Guest" placeholder="name" readonly="readonly" required/>
		</c:if>
	</div>
	<div id="sendChat">
		<input type="text" id="messagePub" placeholder="message" required style="width: 89%;"/>
		<input type="submit" id="sendPub" value="전송" style="width: 10%;"/>
	</div>

</div>
	
</body>
<script type="text/javascript">
	

</script>
</html>