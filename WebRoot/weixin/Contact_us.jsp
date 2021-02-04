<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>关于我们</title>

<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="css/sm-extend.min.css">
<link href="css/lianxi.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<header class="bar bar-nav">
	<h1 class='title'>关于我们</h1>
	</header>
	<div class="content">
		<div class="list-block">
			<ul>
				<!-- Text inputs -->
				<li>
					<div class="item-content"></div>
				</li>
				<li>
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-name"></i>
						</div>
						<div class="item-inner">
							<div class="item-title label">电话号码：</div>
							<div class="item-input">0532-85653575</div>
						</div>
					</div>
				</li>
				<li>
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-email"></i>
						</div>
						<div class="item-inner">
							<div class="item-title label">电子邮箱：</div>
							<div class="item-input">qdydxsys@163.com</div>
						</div>
					</div>
				</li>
				<li>
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-password"></i>
						</div>
						<div class="item-inner">
							<div class="item-title label">官方Q Q：</div>
							<div class="item-input"></div>
						</div>
					</div>
				</li>
				<li class="align-top">
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-comment"></i>
						</div>
						<div class="item-inner">
							<div class="item-title label">公司地址：</div>
							<div class="item-input">
								<textarea>山东省青岛市崂山区香港东路233号卧龙山庄3号楼101户</textarea>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
