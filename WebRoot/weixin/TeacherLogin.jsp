<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>老师登录</title>

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
<!-- <script type="text/javascript">
    // 对浏览器的UserAgent进行正则匹配，不含有微信独有标识的则为其他浏览器
    var useragent = navigator.userAgent;
    if (useragent.match(/MicroMessenger/i) != 'MicroMessenger') {
        // 这里警告框会阻塞当前页面继续加载
        alert('已禁止本次访问：您必须使用微信内置浏览器访问本页面！');
        // 以下代码是用javascript强行关闭当前页面
        var opened = window.open('about:blank', '_self');
        opened.opener = null;
        opened.close();
    }
</script> -->
<body>

<form action="<%= basePath%>/biz/TbTeacher_login.action"
      name="form" id="l" method="post">
    <div class="page-group">
        <div class="page page-current">
            <header class="bar bar-nav">
                <h1 class='title'><font face="微软雅黑" style="font-weight: 100">老师登录</font></h1>
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
                                    <div class="item-title labell"><font face="微软雅黑" style="font-weight: 100">用户名：</font></div>
                                    <div class="item-input">
                                        <input type="text" name="tbTeacher.teacherPhone"
                                     value="${resetTeacher}" placeholder="teacherPhone">
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
                                    <div class="item-title labell"><font face="微软雅黑" style="font-weight: 100;">密码：</font></div>
                                    <div class="item-input">
                                        <input type="password" name="tbTeacher.teacherPasswork" placeholder="teacherPasswork">
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
        var a = document.getElementById("l")['tbTeacher.teacherPhone'].value;
        var b = document.getElementById("l")['tbTeacher.teacherPasswork'].value;
        if (a == "" || b == "") {
            $.alert('账号密码不能为空', '登录失败!');
            return;
        } else {
            document.getElementById("l").submit();
        }
    }
</script>
<%
		String fail = (String) request.getAttribute("f");
		String fail1 = new String(fail == null || "".equals(fail)
				? "ff"
				: fail);
		if (fail1.equals("t")) {
	 %>
	<script type="text/javascript">
		$.alert('请检查您的账号密码是否正确', '登录失败!');
	</script>
	<%} %>
	</body>
</html>
