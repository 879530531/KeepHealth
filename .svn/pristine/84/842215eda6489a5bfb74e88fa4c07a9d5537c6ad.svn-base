<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>效果反馈</title>

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

<link href="css/qq.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/sm.css">
<link href="js/jq22.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jq22.js"></script>
</head>

<body>
	<%
		int i = 1, n = 0, m = 0;
	%>
	<form action="<%=basePath%>/front1/TbFeedback_add.action" name="form"
		id="a" method="post">
		<div class="content">
			<div class="div_main_main" align="center">
				<table width="98%" border="0" class="tabl">
					<tr>
						<td width="98%" valign="top">
							<div class="list-block">
								<ul>
									<s:iterator value="fatherHealthList" id="father">
										<li class="item-content">
											<div class="item-innerc">
												<span style=" color:#f6be37;">健康自述：</span>${father.readmeContent}
											</div>
										</li>
										<li class="item-content1">
											<div class="item-inner1">
												<div class="item-title">${father.readmeTime}</div>
												<div class="item-after1"></div>
											</div>
										</li>
										<s:iterator value="fatherAdviceList" id="advice">
											<s:if test="#father.readmeId == #advice.readmeId">
												<%
													if (n == 0) {
												%>
												<li class="item-content">
													<div class="item-innerc">
														<span style=" color:#0894ec;">调理建议：</span>${advice.adviceContent}
													</div>
												</li>
												<li class="item-content1">
													<div class="item-inner1">
														<div class="item-title">${advice.mentorName}&nbsp;&nbsp;${advice.adviceTime}</div>
														<div class="item-after1"></div>
													</div>
												</li>
												<%
													n++;
												%>
												<%
													} else {
												%>
												<li class="item-content">
													<div class="item-innerc">
														<span style=" color:#0894ec;"> 追加建议：</span>${adviceContent}
													</div>
												</li>
												<li class="item-content1">
													<div class="item-inner1">
														<div class="item-title">${adviceTime}</div>
														<div class="item-after1"></div>
													</div>
												</li>
												<%
													}
												%>
											</s:if>
										</s:iterator>
										<s:iterator value="childHealthList" id="child">
											<s:if test="#father.readmeId == #child.fatherId">
												<li class="item-content">
													<div class="item-innerc">
														<span style=" color:#f6be37;">追加提问：</span>${child.readmeContent}
													</div>
												</li>
												<li class="item-content1">
													<div class="item-inner1">
														<div class="item-title">${child.readmeTime}</div>
														<div class="item-after1"></div>
													</div>
												</li>
											</s:if>
											<s:iterator value="fatherAdviceList" id="advice">
												<s:if
													test="#father.readmeId == #child.fatherId & #child.readmeId== #advice.readmeId">
													<%
														if (m == 0) {
													%>
													<li class="item-content">
														<div class="item-innerc">
															<span style=" color:#0894ec;">调理建议：</span>${advice.adviceContent}
														</div>
													</li>
													<li class="item-content1">
														<div class="item-inner1">
															<div class="item-title">${advice.mentorName}&nbsp;&nbsp;${advice.adviceTime}</div>
															<div class="item-after1"></div>
														</div>
													</li>
													<%
														m++;
													%>
													<%
														} else {
													%>
													<li class="item-content">
														<div class="item-innerc">
															<span style=" color:#0894ec;">追加建议：</span>${adviceContent}
														</div>
													</li>
													<li class="item-content1">
														<div class="item-inner1">
															<div class="item-title">${adviceTime}</div>
															<div class="item-after1"></div>
														</div>
													</li>
													<%
														}
													%>
												</s:if>
												<%
													n = 0;
																m = 0;
												%>
											</s:iterator>
										</s:iterator>
										<li class="item-content">
											<div class="item-inner">
												<div class="item-title"></div>
												<div class="item-after">
													<div class="content-block11"></div>
												</div>
											</div>
									</s:iterator>
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="height:0.3rem">
					</tr>
					<tr>
						<td colspan="2">
							<table width="100%" style="height:8.6rem" border="0">
								<tr>
									<td align="center"><textarea class="B1"
											name="feedbackContent" placeholder="效果反馈:"></textarea></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="height:2.5rem"><div align="left">
								<table width="100%" border="0">
									<tr>
										<td width="30%" align="center">打星评分：</td>
										<td width="70%" align="left"><input name="starEvaluation"
											class="mm" id="rating_simple1" type="hidden"> <input
											name="readmeId" class="mm" value="${readmeId}"
											id="rating_simple1" type="hidden"> <input
											name="personalId" class="mm" value="${mentorId}"
											id="rating_simple1" type="hidden"></td>
									</tr>
								</table>
							</div></td>
					</tr>
				</table>
				<table width="100%" border="0">
					<tr>
						<td width="100%" align="center">
							<div class="content-blocks">
								<div class="row">
									<div class="col-5a">
										<a class="button button-big1 button-fill button-success"
											onClick="validate()">提交</a>
									</div>
									<div class="col-5a">
										<a href="/front1/WeixinLogin_ReturnMemberHome.action"
											class="button button-big1 button-fill button-danger">取消</a>
									</div>
								</div>
							</div>


						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<script language="javascript" type="text/javascript">
		function test(value) {
			alert("This rating's value is " + value);
		}
		$(function() {
			$("#rating_simple1").webwidget_rating_simple({
				rating_star_length : '5',
				rating_initial_value : '',
				rating_function_name : '',//this is function name for click
				directory : 'js/'
			});
		});
	</script>
	<script type="text/javascript">
		function validate() {
			var a = document.getElementById("a").feedbackContent.value;
			if (a == "") {
				$.alert('反馈内容不能为空', '反馈失败！');
				return;
			} else {
				document.getElementById("a").submit();
			}
		}
	</script>
</body>
</html>
