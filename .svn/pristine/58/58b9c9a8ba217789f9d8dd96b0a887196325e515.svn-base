<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>以往作答记录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="icon" href="http://host/favicon.ico" type="image/x-icon" />

<link rel="icon" href="http://host/favicon.ico" type="image/x-icon" />

<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/sm.css">
<link rel="stylesheet" href="css/sm-extend.min.css">


</head>
</head>
<body>
	<%
		int i = 1, j = 0, n = 0, m = 0;
	%>
	<form action="<%=basePath%>/front1/TbFeedback_list.action" name="form"
		id="a" method="post">
		<div class="content">
			<div class="div_main" align="center">
				<div class="div_main_top">
					<div class="list-block media-list1">
						<ul>
							<li>
								<div class="item1-link item1-content">
									<div class="item1-media">
										<img src="/upload/${sessionScope.personaldata.image}"
											style="padding-top:0.1rem;width: 4.8rem;height:4.8rem;border-radius: 2.4rem;">
									</div>
									<div class="item1-inner">
										<div class="item1-title-row">
											<div class="item1-title">
												<span style="font-size:0.9rem;">${sessionScope.Name}&nbsp;</span><a
													href="<%=basePath%>/weixin/Mentor_home.jsp"> <c:choose>
														<c:when test="${sessionScope.time==0}">
															<span
																style=" color:#FFF;font-size:0.65rem; background-color:#bbb9b9">&nbsp;VIP&nbsp;</span>
														</c:when>
														<c:when test="${sessionScope.personaldata.level==0}">
															<img src="/images/mentor.png"
																style='width: 1.2rem;height:0.9rem;vertical-align:middle;'>
														</c:when>
														<c:when test="${sessionScope.personaldata.level==1}">
															<img src="/images/mentor2.png"
																style='width: 1.2rem;height:0.9rem;vertical-align:middle;'>
														</c:when>
														<c:when test="${sessionScope.personaldata.level==2}">
															<img src="/images/mentor1.png"
																style='width: 1.2rem;height:0.9rem;vertical-align:middle;'>
														</c:when>
													</c:choose>
												</a>

											</div>
											<div class="item1-after">
												<a
													href="<%=basePath%>/front1/WeixinLogin_OpenMentorHome.action"><img
													src="/images/return.png"
													style='width: 1.1rem;height:1.0rem;vertical-align:middle;'></a>
											</div>
										</div>
										<div class="item1-title-row">
											<div class="item1-title">联系电话：&nbsp;&nbsp;${sessionScope.personaldata.mobilePhone}</div>
											<div class="item1-after"></div>
										</div>
										<div class="item1-title-row">
											<div class="item1-title">
												已作答：&nbsp;&nbsp;${advice_nember} <img src="/images/done.png"
													style='width: 0.9rem;height:1.0rem;vertical-align:middle;'>
											</div>
											<div class="item1-after"></div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="div_main_a">
					<div class="buttons-tab">
						<a href="#tab3" class="tab-link button1"><div align="left">以往作答记录</div></a>
					</div>
				</div>
				<div class="div_main_main11">
					<div class="tabs">
						<div id="tab1" class="tab active">
							<div class="content-block">
								<div class="list-block">
									<s:iterator value="fatherPreviousquestions" id="id">

										<ul>
											<li class="item-content">
												<div class="item-innerc">
													<span style=" color:#f6be37;">健康自述：</span>${readmeContent}
												</div>
											</li>
											<li class="item-content1">
												<div class="item-inner1">
													<div class="item-title">${memberName}&nbsp;&nbsp;${readmeTime}</div>
													<div class="item-after1"></div>
												</div>
											</li>
											<s:iterator value="adviceList" id="id1">
												<s:if test="#id1.readmeId==#id.readmeId">
													<%
														if (n == 0) {
													%>
													<li class="item-content">
														<div class="item-innerc">
															<span style=" color:#0894ec;">调理建议：</span>${adviceContent}
														</div>
													</li>
													<li class="item-content1">
														<div class="item-inner1">
															<div class="item-title">${adviceTime}</div>
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
											</s:iterator>
											<s:iterator value="childPreviousquestions" id="id2">
												<s:if test="#id2.fatherId==#id.readmeId">


													<li class="item-content">
														<div class="item-innerc">
															<span style=" color:#f6be37;">追加提问：</span>${readmeContent}
														</div>
													</li>
													<li class="item-content1">
														<div class="item-inner1">
															<div class="item-title">${memberName}&nbsp;&nbsp;${readmeTime}</div>
															<div class="item-after1"></div>
														</div>
													</li>
													<%
														j++;
													%>

													<s:iterator value="adviceList" id="id3">
														<s:if test="#id3.readmeId==#id2.readmeId">
															<%
																if (m == 0) {
															%>
															<li class="item-content">
																<div class="item-innerc">
																	<span style=" color:#0894ec;">调理建议：</span>${adviceContent}
																</div>
															</li>
															<li class="item-content1">
																<div class="item-inner1">
																	<div class="item-title">${adviceTime}</div>
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

													</s:iterator>

												</s:if>

											</s:iterator>

											<s:iterator value="tbFeedback" id="id2">
												<s:if test="#id2.readmeId==#id.readmeId">




													<li class="item-content">
														<div class="item-innerc">
															<font style=" color:#fa770e;">效果反馈：</font>${feedbackContent}
														</div>
													</li>
													<li class="item-content1">
														<div class="item-inner1">
															<div class="item-title">${feedbackTime}</div>
															<div class="item-after1"></div>
														</div>
												</s:if>

											</s:iterator>
											<li class="item-content">
												<div class="item-innerq">
													<div class="item-title"></div>
													<div class="item-after">
														<div class="content-block11">
															<div class="row">

																<%
																	if (j == 0) {
																%>
																<div class="col-100">
																	<a
																		href="<%= basePath%>/front1/TbAdvice_openAddiAdvice.action?idd=${id.readmeId}&idd1=${id.personalId}&idd2=1"
																		class="button button-big button-fill button-success">追加回复</a>
																</div>
																<%
																	} else {
																%>

																<div class="col-100">
																	<a
																		href="<%= basePath%>/front1/TbAdvice_openAddiAdvice.action?idd=${id.readmeId}&idd1=${id.personalId}&idd2=0"
																		class="button button-big button-fill button-success">追加回复</a>
																</div>

																<%
																	}
																%>
																<%
																	j = 0;
																		n = 0;
																		m = 0;
																%>
															</div>
														</div>


													</div>
												</div>
											</li>
										</ul>
										<div class="sa"></div>
									</s:iterator>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<script type='text/javascript'
		src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='js/sm.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='http://g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js'
		charset='utf-8'></script>
	<%
		String fail = (String) request.getAttribute("fail");
		String fail1 = new String(fail == null || "".equals(fail)
				? "ff"
				: fail);
		if (fail1.equals("fail")) {
	%>
	<script type="text/javascript">
		$.alert('用户已进行反馈，无须再进行回复', '操作失败！');
	</script>
	<%
		}
	%>

</body>
</html>
