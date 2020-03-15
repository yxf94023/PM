$(function(){

	
	$(".accordion").accordion({
		active: 0,
		heightStyle: 'content',
		collapsible: true
	});
	
	// 创建目录
	$("#content").children().each(function(index, element){
	
		var tagName=$(this).get(0).tagName;
	
		if(tagName.substr(0,1).toUpperCase()=="H"){
			
			var contentH=$(this).html();//获取内容
			var markid=contentH.substr(0, contentH.search(' '));
			$(this).attr("id",markid);//为当前h标签设置id
			$("#menu").append("<a href='#"+markid+"'>"+contentH+"</a><br/>");//在目标DIV中添加内容
		}
	});	
	
	$('#goto-top a').click(function(){
	
		console.log('11')
		$('body,html').animate({scrollTop:0}, 500);
		return false;
	});			
});