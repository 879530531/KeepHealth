//党费系统wap端通用js
//作者：刘洪涛
$(document).ready(function(e) {
	
	$(".header-menu").click(function(e) { //个人中心菜单隐藏or显示
		$(".down-menu").toggle();
	});
	
	$("#goback").click(function() { //回退功能
		history.back(-1);
	});
	
});