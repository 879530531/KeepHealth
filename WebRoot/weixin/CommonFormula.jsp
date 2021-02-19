<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!-- 鼻炎替换成el表达式 -->
<title>${tbFormula.formulaSymptom}</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="icon" href="http://host/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/sma.css">
<link rel="stylesheet" href="css/sm-extend.min.css">
</head>
<body>
	<div class="content">
		<div class="div_main" align="center">
			<div class="div_main_top2">
				<header class="bar bar-nav">
					<h1 class='title'><font face="微软雅黑" style="font-weight: 100">${tbFormula.formulaSymptom}</font></h1>
				</header>
			</div>
			<div class="div_main_main11">
				<%-- <div style="border-bottom: 1px solid white;margin-bottom: .3rem; ">
					<div style="text-align: left;padding: 0 .8rem;font-size: 1rem;border: 1px solid white;-moz-border-radius: .5rem;
	-o-border-radius: .5rem;
	-webkit-border-radius: .5rem;
	border-radius: .5rem;">
						<span>症状：${tbFormula.formulaSymptom}</span><br>
						<span>症状详情：${tbFormula.formulaSymptomDetails}</span>
					</div>
				</div>--%>
				<!-- 加功能时迭代显示 -->
				<% int i = 1; %>
				<s:iterator value="tbFormulaContexts" id="array">
				<!-- <div class="list-block" style="border-bottom: 1px solid #fff;margin: .2rem 0;">-->
				<div class="list-block" style="border-bottom: 1px solid #CDCDCD;margin: .2rem 0;">
					<a href="javascript:;" class="item-content1 item-link">
						<div class="div_main_main_left" style="padding: .3rem;">
							<span class="xuhao"><span class="xuhao ziti"><%=i++ %></span></span>
						</div>
						<div class="div_main_main_right" style="padding: .3rem;">
							<div style="text-align: left;font-size: 1.2rem;">

								<div class="overflow" style="color: #3B3B3B;"  onclick="javascript:window.location.href='/weixin/Read_number.jsp?display=${array}'"><s:property value="array" /><span class="xuanze"><font style="color:black;font-size:16px; ">选择</span></div>

								

							</div>
							
						</div>
					</a>
				</div>
				<!-- 迭代结束 -->
				</s:iterator>

			</div>
		</div>
	</div>
</body>
</html>
