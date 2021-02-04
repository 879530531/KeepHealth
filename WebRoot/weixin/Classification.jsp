<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<!-- 鼻替换成el表达式 -->

	<title>免费取方</title>
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
				<h1 class='title'"><font face="微软雅黑" style="font-weight: 150">免费取方</font></h1>
			</header>
		</div>
		<div class="div_main_main11">
			<!-- 加功能时迭代显示 -->
			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">1</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=乾卦（大肠、首）'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.0rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>乾卦（大肠、首）</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>

			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">2</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=兑卦（肺、口）'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.0rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>兑卦（肺、口）</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>


			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">3</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=离卦（心、小肠、目）'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.0rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>离卦（心、小肠、目）</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>


			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">4</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=震卦（肝、足）'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.0rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>震卦（肝、足）</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>



			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">5</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=巽卦（胆、股）'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.0rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>巽卦（胆、股）</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>



			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">6</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=坎（肾、耳）'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.0rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>坎（肾、耳）</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>



			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">7</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=艮卦（胃、手）'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.0rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>艮卦（胃、手）</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>



			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">8</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=坤卦（脾、腹）'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.0rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>坤卦（脾、腹）</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>


			<%-- <div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">9</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=足'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.1rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>足</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>

			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">10</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=胆'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.1rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>胆</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>

			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">11</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=股'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.1rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>股</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>


			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">12</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=肾'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.1rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>肾</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>


			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">13</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=耳'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.1rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>耳</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>


			<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">14</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=胃'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.1rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>胃</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>--%>


			<%-- <div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">15</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=手'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.1rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>手</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>--%>


			<%-- <div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">16</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=脾'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.1rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>脾</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>--%>

  <%--<div class="list-block" style="border-bottom: 1px solid #CDCDCD;padding: .3rem 0;">
				<div class="div_main_main_left" style="padding-top: .3rem;">
					<span class="xuhao"><span class="xuhao ziti">17</span></span>
				</div>
				<a href='<%=basePath%>/biz/TbFormula_queryTbFormulaList.action?tbFormula.formulaType=腹'
				   class="item-content1 item-link">
					<div class="div_main_main_right" style="padding-top: .3rem;">
						<div style="text-align: left;font-size: 1.1rem;">
							<div class="overflow" style="color: #3B3B3B;"><span>腹</span><span class="xuanze">选择</span></div>
						</div>
					</div>
				</a>
			</div>   --%>
		</div>
	</div>

</div>

</body>
<script type="text/javascript">
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
</script>
</html>