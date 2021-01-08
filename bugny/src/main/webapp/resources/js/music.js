 $(document).on('click', '#musicWriteP', function(e){
		location.href="musicWriteP";
	});


	var modify = function(){
		var form = $('.viewForm')[0];
		form.action = 'musicModify';
		form.submit();
	};



	