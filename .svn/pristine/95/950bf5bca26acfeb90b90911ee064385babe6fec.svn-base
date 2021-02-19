<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>会员登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="css/sm.min.css">
<link rel="stylesheet" href="css/sm-extend.min.css">

</head>

<body>
	<%
		Cookie myCookie[] = request.getCookies();
		int user = 0;
		int password = 0;
		if (null != myCookie) {
			for (int n = 0; n < myCookie.length; n++) {
				Cookie newCookie = myCookie[n];
				if ("username".equals(newCookie.getName())) {

					user = 1;
				} else if ("password".equals(newCookie.getName())) {

					password = 1;
				}
			}
		}

		if (0 != user && 0 != password) {

			response.sendRedirect("/front1/WeixinLogin_weixinLogin.action");

		}
	%>
	<form action="${path}/front1/WeixinLogin_weixinLogin.action"
		name="form" id="l" method="post">
		<div class="page-group">
			<div class="page page-current">
				<header class="bar bar-nav">
				<h1 class='title'>会员登录</h1>
				</header>
				<div class="content">
					<div class="list-block1">&nbsp;</div>
					<div class="list-block">
						<ul>
							<!-- Text inputs -->
							<li>
								<div class="item-content">
									<div class="item-media">
										<i class="icon icon-form-name"></i>
									</div>
									<div class="item-inner">
										<div class="item-title labell">用户名：</div>
										<div class="item-input">
											<input type="text" name="mobilePhone"
												placeholder="Moblie Phone">
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="list-block">
						<ul>
							<!-- Text inputs -->
							<li>
								<div class="item-content">
									<div class="item-media">
										<i class="icon icon-form-password"></i>
									</div>
									<div class="item-inner">
										<div class="item-title labell">密码：</div>
										<div class="item-input">
											<input type="password" name="password" placeholder="Password">
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="list-block1">&nbsp;</div>
					<div class="content-block">
						<div class="row1">
							<a class="button button-big button-fill button-success"
								onClick="validate()">登录</a>
						</div>
					</div>
					<div class="content-block">
						<div class="row1">
							<a href="javascript:window.location = 'weixin/Register.jsp'"
								class="button button-big button-fill button-success">成为会员</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script type='text/javascript'
		src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='http://g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='http://g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js'
		charset='utf-8'></script>
	<script type="text/javascript">
		function validate() {
			var a = document.getElementById("l").mobilePhone.value;
			var b = document.getElementById("l").password.value;
			if (a == "" || b == "") {
				$.alert('账号密码不能为空', '登录失败!');

				return;
			} else {
				document.getElementById("l").submit();
			}
		}
	</script>
	<%
		String fail = (String) request.getAttribute("fail");
		String tib = (String) request.getAttribute("tib");
		System.out.println(tib+"======");
		String fail1 = new String(fail == null || "".equals(fail)
				? "ff"
				: fail);
		String tib1 = new String(tib == null || "".equals(tib)
				? "ff"
				: tib);
		if (fail1.equals("fail1")) {
	%>
	<script type="text/javascript">
		$.alert('请检查您的账号密码是否正确', '登录失败!');
	</script>
	<%
		}
		if (tib1.equals("success")) {
	%>
	<script type="text/javascript">
		$.showPreloader('注册成功！请登录')
		setTimeout(function() {
			$.hidePreloader();
		}, 2000);
	</script>
	<%
		}
	%>
</body>
</html>
