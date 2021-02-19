<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改音频</title>
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
var  _contextPath="<%=path%>";
var  _modulePath=_contextPath+"/sys/";
$(document).ready(function(){
  $(".clicks").click(function(){
   _open(_modulePath+"textures_open.action?view=add");
  });
});
</script>


<script>
         function submitForm(){
         var page = document.getElementById("page").value;
            this.queryForm.action="<%=basePath%>/biz/TbAudio_queryList.action?page="+page;
            this.queryForm.submit();
         }
         
         function querySubmit(){
            this.queryForm.action="<%=basePath%>/biz/TbAudio_queryList.action?page=1";
            this.queryForm.submit();
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
		window.location.href="<%= basePath%>/biz/TbReadDevice_changePwd.action?personalId="+id;
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
    <li><a href="#">念数管理</a></li>
    <li><a href="#">音频管理</a></li>
    <li><a href="#">修改音频</a></li>
    </ul>
    </div>
  
          
    <div class="formbody">
    
    <div class="formtitle"><span>音频信息</span></div>
    <form action="<%= basePath%>/biz/TbAudio_editAudio.action" method="post" id="commonform"  enctype="multipart/form-data">
    <ul class="forminfo">
	    <input name="audioId" type="hidden" value="${tbAudio.audioId}"/>
	    <li><label>数字：</label><input name="audioNumber" type="text"  class="dfinput" value="${tbAudio.audioNumber}"  readonly="readonly"/></li>
		<li ><label>所属音源：</label><input name="audioSoundSource" type="text"  class="dfinput" value="${tbAudio.audioSoundSource}" readonly="readonly"/>
    	</li>
    	<li ><label>文件路径：</label><input name="audioFilePath" type="text"  class="dfinput" value="${tbAudio.audioFilePath}"  readonly="readonly"/>
    	</li>
    	<li ><label>音频文件：</label>
    	<input type="file" name="audio" id="audio" class="dfinput" accept=".mp3,.m4a,.wav,.ogg"/>
	        
    	</li>
    	<li><label>&nbsp;</label><input name="add_btn" type="submit" class="btn" value="确认保存"/>
    	<input name="add_btn" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='javascript:history.go(-1);'"/>
    </li>
    </ul>
    </form>
    </div>
  </body>
</html>
