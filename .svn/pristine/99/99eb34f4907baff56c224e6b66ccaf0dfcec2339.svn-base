<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>调理建议</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<link rel="stylesheet" href="//res.layui.com/layui/build/css/layui.css"
	media="all">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="icon" href="http://host/favicon.ico" type="image/x-icon" />

<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="css/pan.css">
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/sm.css">
<link rel="stylesheet" href="css/sm-extend.min.css">

</head>

<body>
	<div class="content">
		<form id="s" name="form1" method="post"
			action="<%= basePath%>/biz/TbAdvice_add.action">

			<div class="div_main_main11">
				<table width="100%" class="tabl" border="0">
					<tr>
						<td width="42%">&nbsp;</td>
						<td width="36%">&nbsp;</td>
						<td width="21%">&nbsp;</td>
					</tr>
					<s:iterator value="tbPersonalData1" id="pr">
						<tr>
							<td align="left">昵称：</td>
							<td>${pr.name}<input type="hidden" value="${pr.personalId}"
								name="memberId" id="memberId"></td>
							<td><a
								href="<%= basePath%>/front1/TbAdvice_OpenMemberDetails.action?idd=${pr.personalId}">详情</a></td>
						</tr>
						<tr>
							<td height="0.3rem;">&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="left">职业：</td>
							<td>${pr.professional}</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td height="0.3rem;">&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="left">手机号码：</td>
							<td>${pr.mobilePhone}</td>
							<td>&nbsp;</td>
						</tr>
					</s:iterator>
					<tr>
						<td height="0.3rem;">&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<s:iterator value="tbReadmeList" id="pt">
						<tr>
							<td colspan="4">
								<div class="list-block">
									<ul>
										<li class="item-content">
											<div class="item-innern">
												<span style=" color:#f6be37;">健康自述：</span>${pt.readmeContent}
											</div>
										</li>
										<li class="item-content1">
											<div class="item-innerm">
												<div class="item-title"></div>
												<div class="item-after1">${pt.readmeTime}</div>
											</div>
										</li>
									</ul>
								</div>
							</td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<div class="div_main_main1">
				<table width="100%" border="0">
					<s:iterator value="tbReadmeList" id="pe">
						<tr>
							<td align="left"><textarea class="BB" name="adviceContent"
									id="adviceContent" placeholder="调理建议:"></textarea> <input
								type="hidden" value="${pe.readmeId}" name="readmeId"
								id="readmeId"></td>
						</tr>
					</s:iterator>
					<tr>
						<td align="center">
							<table width="100%" border="0"
								style="height:5rem;margin-left:-0.66rem">
								<tr>
									<td width="50%" align="center">
										<div class="content-block">
											<div class="row">
												<div class="col-5a">
													<a class="button button-big1 button-fill button-success"
														onClick="validate()">提交</a>
												</div>
												<div class="col-5a">
													<a onclick="location.href='javascript:history.go(-1);'"
														class="button button-big1 button-fill button-danger">取消</a>
												</div>
											</div>
										</div> <input type="hidden" id="tip" value="${sessionScope.aler1}">
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function validate() {
			var a = document.getElementById("s").adviceContent.value;
			if (a == "") {
				$.alert('调理建议内容不能为空', '提交失败！');
				return;
			} else {
				document.getElementById("s").submit();
			}
		}
	</script>
	<script type='text/javascript'
		src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='js/sm.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='http://g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js'
		charset='utf-8'></script>
</body>
</html>
