<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改金额</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script> 
<script type="text/javascript">
/*
 *_contextPath:上下文路径
 *_modulePath: 模块路径
 */

$(document).ready(function(){
  $(".clicks").click(function(){
   _open(_modulePath+"textures_open.action?view=add");
  });
});
</script>

<script type="text/javascript">
	function replace4(){
	   var x = document.getElementById("feeId").value;//获取input内元素
	   if(x==""|| isNaN(x)){//进行数字校验，如果不是数字填出对话框进行提示
	   	alert("请填写整数");
	   }
	}
	</script>


<script type="text/javascript">
	//重置
	$(document).ready(function(){
		var file = document.getElementById('audio');
		file.outerHTML = file.outerHTML;
		var id;
		$(".tablelinkdelete1").click(function(){
		
		 	id = $(this).attr("idValue");
		
		  	$(".tip2").fadeIn(200);
		 });
		  
	  	$(".tiptop a").click(function(){
	  	$(".tip2").fadeOut(200);
	});
		
	$(".sure1").click(function(){
		$(".tip2").fadeOut(100);
		window.location.href="";
	});
		
	  	$(".cancel1").click(function(){
	  		$(".tip2").fadeOut(100);
		});

	});
</script>

<style type="text/css">
.tablelinkdelete{color:#056dae;}
.tablelinkdelete1{color:#056dae;font-size:14px;}
</style>
</head>
  <body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">咨询管理</a></li>
    <li><a href="#">金额管理</a></li>
    <li><a href="#">修改金额</a></li>
    </ul>
    </div>
  
          
    <div class="formbody">
    
    <div class="formtitle"><span>暂无</span></div>
  
    </div>
  </body>
</html>
