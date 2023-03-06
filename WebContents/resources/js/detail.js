$(function(){
	
	$(function(){
		let	sno = $('.replySno').val()
		
		console.log(sno);
		
		$.ajax({
			type : 'get',
			url : `${contextPath}/reply/list`,
			contentType : 'apllication/json;charset=utf-8',
			data : JSON.stringify(sno),
			success : function(result) {
				console.log(result);
			},
			error : function() {
				alert('에러');
			}
		})
	}),
	
	
	$('.modify').click(function(e){
		e.preventDefault();
		$('.moForm').attr('action',`${contextPath}/board/modify`)
					.attr('method', 'get')
		.submit();
	})
	
	
	
})