	$(document).ready(function(){
	  	  $("#userUpdate").on("click", function(){
	  	  	alert('정보수정완료!!');
	  	    location.href = 'user/userUpdate';
	  	  });  
	  	});
	  	
	  	
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$(document).ready(function(e){
		$("#id").blur(function() {
			var idJ = /^[a-z0-9]{6,12}$/;
			var id = $('#id').val();
			$.ajax({
				url : 'idCheck?id='+ id,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);							
					if (data == 1) {
							// 1 : 아이디가 중복되는 문구
							$("#idCheck").text("사용중인 아이디입니다.");
							$("#idCheck").css("color", "red");
							$("#register").attr("disabled", true);
						} else {
							if(idJ.test(id)){
								// 0 : 아이디 길이 / 문자열 검사
								$("#idCheck").text("");
								$("#register").attr("disabled", false);
					
							} else if(id == ""){
								$('#idCheck').text('아이디를 입력해주세요.');
								$('#idCheck').css('color', 'red');
								$("#register").attr("disabled", true);				
								
							} else {
								$('#idCheck').text("아이디는 소문자와 숫자 6~12자리만 가능합니다.");
								$('#idCheck').css('color', 'red');
								$("#register").attr("disabled", true);
							} 		
							
						} 
						
					}, error : function() {
							console.log("실패");
					}
				});
			});
	});