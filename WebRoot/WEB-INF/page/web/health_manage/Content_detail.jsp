<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>新闻详情</title>
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
	
<style type="text/css">
	.n-content {
	margin-top: 1.5em;
}
</style> 

	
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">学习园地</a></li>
    <li><a href="#">新闻资料</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>查看新闻资料</span></div>
    
    <div class="n-content">${content}</div>
		
</div>
	
</body>
</html>

