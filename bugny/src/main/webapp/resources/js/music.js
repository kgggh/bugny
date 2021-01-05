 $(document).on('click', '#musicWriteP', function(e){
		location.href="musicWriteP";
	});

	
 $(document).on('click', '#btnList', function(e){
		e.preventDefault();
		history.back(-1);
	});

	

	var modify = function(){
		var form = $('.viewForm')[0];
		form.action = 'musicModify';
		form.submit();
	};
	
	$(document).on('click', '#btnLiked', function(e){
		location.href="liked";
	});



	