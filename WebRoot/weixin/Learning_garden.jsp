<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>资料详情</title>
<meta name="author" content="gxuwz">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/party.js"></script>
<link href="/wap/css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${path}/js/jquery.1.11.3.min.js"></script>
<script type="text/javascript" src="${path}/third/jwplayer/jwplayer.js"></script>
<script type="text/javascript">
	jwplayer.key = "hIJgVZ/O3fKHt+bwXrKjP9CWOBUiw60ISwuOfA==";
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	border: 0;
}

.n-article {
	padding: 1em;
}

.n-title {
	font-size: 1.5em;
	text-align: center;
	line-height: 1em;
	margin-bottom: 1em;
}

.n-info {
	color: gray;
	font-size: 1em;
}

.n-source {
	float: right;
}

.n-content {
	margin-top: 1.5em;
}

.n-head {
	border-bottom: 1px solid #E7D6C3;
}

#player {
	margin: 0 auto;
	text-align: center;
}
</style>
</head>

<body style="background-color: #fff;">
	<!-- 内容开始 -->
	<div class="common-container" style="background-color: #fff;">
		<div class="n-article">
			<div class="n-head">
				<h1 id="article" data-id="${con.id}" class="n-title">${con.title}</h1>
				<div class="n-info">
					<span>${con.operateTime}</span> <span class="n-source"></span>
				</div>
			</div>
			<div class="n-content">${content}</div>
		</div>
	</div>
</body>
</html>
