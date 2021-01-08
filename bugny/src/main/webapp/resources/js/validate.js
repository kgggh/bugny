$(function(){
			$(".form").validate({
				//규칙
				rules:{
					name:{
						required : true //필수입력여부
					},
					
					password:{
						required : true,
						minlength : 8,
						passwordChk : true,
						maxlength : 16
						
					},
					
					email:{
						required : true, //필수입력여부
						email : true 	//이메일형식
					},
					
					birth:{
						required : true, //필수입력여부
						date : true 	//date
					}
				},

				//메시지
				messages:{
					name:{
						required : "이름을 입력해 주세요."
					},
					password:{
						required : "패스워드를 입력해 주세요.",
						minlength : ("비밀번호는 8자 이상 입력해 주세요"),
						passwordChk : "비밀번호는 영문자, 숫자, 특수문자 조합을 입력해야 합니다.",
						maxlength : ("비밀번호는 16자 이하 입력해 주세요")
						
					},
					email: {
						required : "이메일은 필수 입력입니다.",
						email : "이메일 형식을 지켜주세요.EX)aa@naver.com" 
					},
					birth:{
						required :"생년월일을 입력해 주세요",
						date : "Ex) YYYY-MM-DD" 
					}
					
				},

				//메시지 태그
				errorElement : 'span', 	//태그
				errorClass: 'error',	//클레스 이름
				validClass:'vaild' 
			});
			
			$.validator.addMethod("passwordChk",  function( value, element ) {
				return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
			}); 
		});
		
		
$(function(){
			$(".form1").validate({
				//규칙
				rules:{
					password:{
						required : true,
						minlength : 8,
						passwordChk : true,
						maxlength : 16
					},
					email:{
						required : true, //필수입력여부
						email : true 	//이메일형식
					}
				},
				//메시지
				messages:{
					password:{
						required : "패스워드를 입력해 주세요.",
						minlength : ("비밀번호는 8자 이상 입력해 주세요"),
						passwordChk : "비밀번호는 영문자, 숫자, 특수문자 조합을 입력해야 합니다.",
						maxlength : ("비밀번호는 16자 이하 입력해 주세요")
					},
					email: {
						required : "이메일은 필수 입력입니다.",
						email : "이메일 형식을 지켜주세요.EX)aa@naver.com" 
					}
				},

				//메시지 태그
				errorElement : 'span', 	//태그
				errorClass: 'error',	//클레스 이름
				validClass:'vaild' 
			});
			
			$.validator.addMethod("passwordChk",  function( value, element ) {
				return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
			}); 
		});
		
				
