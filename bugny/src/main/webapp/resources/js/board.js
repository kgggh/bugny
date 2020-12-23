
 $(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href="boardPage";
	});

	
 $(document).on('click', '#boardWriteP', function(e){
		location.href="boardWriteP";
	});

	var modify = function(){
		var form = $('.viewForm')[0];
		form.action = 'boardModify';
		form.submit();
	};
	
	var onList = function(){
		location.href='boardPage';
	};
	

	$(document).on('click', '#btnList', function(e){
		location.href = "boardPage";
	});






