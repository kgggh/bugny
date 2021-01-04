
 $(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href="boardList";
	});

	
 $(document).on('click', '#boardWriteP', function(e){
		location.href="boardWriteP";
	});

	var modify = function(){
		var form = $('.viewForm')[0];
		form.action = 'boardModify';
		form.submit();
	};
	


	$(document).on('click', '#btnList', function(e){
		location.href = "boardList";
	});






