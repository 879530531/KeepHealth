<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>追加建议</title>

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
    Integer memberId = (Integer)request.getAttribute("memberId");
    Integer fatherId = (Integer)request.getAttribute("fatherId");
    Integer readmeId = (Integer)request.getAttribute("readmeId");
   %>
	<form action="<%= basePath%>/front1/TbAdvice_Additional.action"
		name="form" id="8" method="post">
		<div class="content">
			<div class="list-blockk">
				<textarea name="adviceContent" id="adviceContent" class="B2"
					placeholder="追加建议:"></textarea>
				<input type="hidden" value="<%=memberId %>" name="memberId"
					id="memberId"> <input type="hidden" value="<%=fatherId %>"
					name="fatherId" id="fatherId"> <input type="hidden"
					value="<%=readmeId %>" name="readmeId" id="readmeId">
			</div>
			<div class="content-block">
				<div class="row">
					<div class="col-50">
						<a class="button button-big button-fill button-success"
							onClick="validate()">提交</a>
					</div>
					<div class="col-50">
						<a href="/front1/WeixinLogin_OpenMentorHome.action"
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
	      var a = document.getElementById("8").adviceContent.value;
	      if( a=="" )
	      {
	       $.alert('回复内容不能为空', '回复失败！');
	       return;
	      }else
	      {
	      document.getElementById("8").submit();
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
