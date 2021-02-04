<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>追加提问</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/sm.min.css">
<link rel="stylesheet" href="css/sm-extend.min.css">
</head>

<body>
	<%
    String mentorId = request.getParameter("mentorId");
    String fatherId = request.getParameter("fatherId");
   %>
	<form action="<%= basePath%>/front1/TbReadme_addZhuijia.action"
		name="form" id="3" method="post">
		<div class="content">
			<div class="list-blockk">
				<textarea name="readmeContent" id="readmeContent" class="B2"
					placeholder="追加提问:"></textarea>
				<input type="hidden" value="<%=mentorId %>" name="mentorId"
					id="mentorId"> <input type="hidden" value="<%=fatherId %>"
					name="fatherId" id="fatherId">
			</div>
			<div class="content-block">
				<div class="row">
					<div class="col-50">
						<a class="button button-big button-fill button-success"
							onClick="validate()">提交</a>
					</div>
					<div class="col-50">
						<a href="/front1/WeixinLogin_ReturnMemberHome.action"
							class="button button-big button-fill button-danger">取消</a>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
	</form>
	<script type="text/javascript">
	 function validate()
	     {
	      var a = document.getElementById("3").readmeContent.value;
	      if( a=="" )
	      {
	       $.alert('提问内容不能为空', '提交失败！');
	       return;
	      }else
	      {
	      document.getElementById("3").submit();
		 }
		 }
	 </script>
	<script type='text/javascript'
		src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='http://g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='http://g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js'
		charset='utf-8'></script>
</body>
</html>
