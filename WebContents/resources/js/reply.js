$(function(){
	
	$('.replybtn').click(function(e){
		let sno1 = $('.replySno').val()
		let reply = {
			sno : $('.replySno').val(), 
			reply : $('.replyVal').val(),
			writer : $('.replyWriter').val()
		};
		
		console.log(JSON.stringify(reply));
		$.ajax({
			type : 'post',
			url : `${contextPath}/reply/write`,
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify(reply) ,
			success : function(result){
				window.location.href = `${contextPath}/board/detail/`+sno1;
			}, 
			error : function(){
				alert('에러');
			}	
		});
	}),
	
	$('.answerBtn').click(function(e){
		e.preventDefault();
		
		if($(this).parent().find('.commentC').attr('type')=='text'){
			
			let sno1 = $('.replySno').val()
			
			let comment = {
				reply : $(this).parent().find('.commentC').val(),
				writer : $(this).parent().find('.commentW').val(),
				sno : $('.replySno').val(),
				parent_id : $(this).parent().find('.commentParent_id').val()
			};
			
			$.ajax({
				type : 'post',
				url : `${contextPath}/reply/commentWrite`,
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify(comment) ,
				success : function(result){
					window.location.href = `${contextPath}/board/detail/`+sno1;
				}, 
				error : function(){
					alert('에러');
				}	
			});
		}
		
		$(this).parent().find('.commentC').attr('type','text');                    
	}),
	
	
	$('.answerDel').click(function(e){
		e.preventDefault();
			let sno1 = $('.replySno').val()
			
			let comment = {
				sno : $('.replySno').val(),
				rno : $(this).parent().find('.commentParent_id').val()
			};
			
			$.ajax({
				type : 'post',
				url : `${contextPath}/reply/answerdel`,
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify(comment) ,
				success : function(result){
					window.location.href = `${contextPath}/board/detail/`+sno1;
				}, 
				error : function(){
					alert('에러');
				}	
			});
	}),
	

	
})