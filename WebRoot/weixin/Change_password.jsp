<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改密码</title>
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
	<form
		action="<%= basePath%>/front1/TbPersonalData_changePassword.action"
		name="form" id="l" method="post">
		<div class="page-group">
			<div class="page page-current">
				<header class="bar bar-nav">
				<h1 class='title'>修改登录密码</h1>
				</header>
				<div class="content">
					<!-- <div class="list-block1">&nbsp;</div> -->

					<div class="list-block">
						<ul>
							<!-- Text inputs -->
							<li>
								<div class="item-content">
									<div class="item-media">
										<i class="icon icon-form-name"></i>
									</div>
									<div class="item-inner">
										<div class="item-title label">原密码：</div>
										<div class="item-input">
											<input type="text" id="old" name="oldPassword"
												placeholder="Old Password">
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="item-content">
									<div class="item-media">
										<i class="icon icon-form-gender"></i>
									</div>
									<div class="item-inner">
										<div class="item-title label">新密码：</div>
										<div class="item-input">
											<input type="password" name="password" id="password"
												placeholder="New Password">
										</div>
									</div>
								</div>
							</li>

							<li>
								<div class="item-content">
									<div class="item-media">
										<i class="icon icon-form-name"></i>
									</div>
									<div class="item-inner">
										<div class="item-title label">确认密码：</div>
										<div class="item-input">
											<input type="password" name="password1" id="password1"
												placeholder="Confirm Password">
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="content-block">
						<div class="row">
							<div class="col-50">
								<a class="button button-big button-fill button-success"
									onClick="validate()">确认修改</a>
							</div>
							<div class="col-50">
								<a href="#" onClick="javascript :history.back(-1);"
									class="button button-big button-fill button-danger">取消</a>
							</div>
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
			var a = document.getElementById("password").value;
			var b = document.getElementById("password1").value;
			var c = document.getElementById("old").value;
			if (a != b) {
				$.alert('两次输入的密码不一致', '修改失败！');
				return;
			} else if (a == "" || b == "" || c == "") {
				$.alert('请输入完整信息', '修改失败！');
			} else {
				document.getElementById("l").submit();
			}
		}
	</script>
	<%
		String fail = (String) request.getAttribute("ti");
		System.out.println("用户不存在，登录失败" + fail);
		String fail1 = new String(fail == null || "".equals(fail)
				? "ff"
				: fail);
		if (fail1.equals("no")) {
	 %>
	<script type="text/javascript">
		$.alert('原密码错误！请检查无误后再次尝试', '修改失败！');
	</script>
	<%} %>
</body>
</html>
