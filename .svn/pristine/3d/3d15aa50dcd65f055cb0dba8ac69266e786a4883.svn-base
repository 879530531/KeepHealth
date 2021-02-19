<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!-- 鼻替换成el表达式 -->

<title>${tbFormula.formulaType}</title>
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
                    <h1 class='title'><font face="微软雅黑" style="font-weight: 100">${tbFormula.formulaType}</font></h1>
				</header>
			</div>
			<div class="div_main_main11">
				<!-- 加功能时迭代显示 -->
				<%int i=1;%>
				<s:iterator value="list" var="tbFormula">
				<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
					<div class="div_main_main_left">
						<span class="xuhao"><span class="xuhao ziti"><%=i++%></span></span>
					</div>
					<a href='<%=basePath %>biz/TbFormula_queryFormulaContext.action?tbFormula.formulaId=<s:property value="#tbFormula.formulaId"/>'
					<%--<a href='<%=basePath %>biz/TbFormula_queryTbFormulaList.action?tbFormula=<s:property value="tbFormula"/>'--%>
						class="item-content1 item-link">
					<div class="div_main_main_right">
						<div style="text-align: left;font-size: 1.1rem;">
							<div class="overflow" style="color: #3B3B3B;"><s:property value="#tbFormula.formulaSymptom" /><span class="xuanze">选择</span></div>
							<%-- <div class="overflow" style="color: #3B3B3B;"><s:property value="#tbFormula.formulaSymptomDetails" /></div>--%>
						</div>
					</div>
					</a>
				</div>
				</s:iterator>
				<!-- 迭代结束 -->

			</div>
		</div>
	</div>
</body>
</html>
