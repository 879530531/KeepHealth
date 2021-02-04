<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>信息发布</title>
	<link rel="stylesheet" href="${path}/editor/themes/default/default.css" />
	<link rel="stylesheet" href="${path}/editor/plugins/code/prettify.css" />
	<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
	<script charset="utf-8" src="${path}/editor/kindeditor.js"></script>
	<script charset="utf-8" src="${path}/editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="${path}/editor/plugins/code/prettify.js"></script>
<script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script> 
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content"]', {
				cssPath : '${path}/editor/plugins/code/prettify.css',
				uploadJson : '${path}/biz/Content_imgUpload.action',
				allowFileManager : false,
				filterMode:false, //标签过滤模式
				resizeType : 1, //是否可以改变编辑框的大小；0-不可以；1-只可以修改高度；2宽高-都可以修改
				allowPreviewEmoticons : false,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['contentForm'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['contentForm'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">学习园地</a></li>
    <li><a href="#">发布学习资料</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>学习资料编辑</span></div>
    
    
	<form name="contentForm" method="post" enctype="multipart/form-data" action="${path}/biz/Content_update.action">
	    <input  name="con.id" type="hidden" value="${con.id}" />
	    <input type="hidden" name="con.operate" value="${con.operate}"/>
		<input  type="hidden" name="con.userId" value="${con.userId}"/>
		<input  type="hidden" name="con.upload" value="${con.upload}"/>
		<input  type="hidden" name="con.cover" value="${con.cover}"/>
	<ul class="forminfo">
	    <li><label>类型</label>
	    <select class="dfinput" name="con.type">
	    <option value="1">图文</option>
	    <option value="2">视频</option>
	    </select></li>
	    <li><label>资料标题</label><input class="dfinput" type="text" name="con.title" value="${con.title}"/></li>
	    <li><label>详细摘要</label><input class="dfinput" type="text" name="con.detail" value="${con.detail}"/></li>
 		<li><label>内容</label><textarea name="content" style="width:700px;height:320px;visibility:hidden;">${content}</textarea>
		<br /></li>
		<li><br/><label>&nbsp;</label><input class="btn"  type="submit" value="发布" /> 
		<input name="asd" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='javascript:history.go(-1);'"/></li>
		</ul>
		
	</form>
	
	
</body>
</html>

