<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>以往咨询记录</title>

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
<link rel="stylesheet" href="css/sm.css">
<link rel="stylesheet" href="css/sm-extend.min.css">
</head>

<body>
	<%
		int i = 1, j = 1, n = 0, m = 0;
	%>
	<div class="content">
		<div class="div_main" align="center">
			<div class="div_main_top">
				<div class="list-block media-list1">
					<ul>
						<li>
							<div class="item1-link item1-content">
								<div class="item1-media">
									<img src="/upload/${tbPersonalData2.image}"
										style="padding-top:0.1rem;width: 4.8rem;height:4.8rem;border-radius: 2.4rem;">
								</div>
								<div class="item1-inner">
									<div class="item1-title-row">
										<div class="item1-title">会员姓名：&nbsp;${tbPersonalData2.name}</div>
										<div class="item1-after">
											<a
												href="<%=basePath%>/front1/WeixinLogin_OpenMentorHome.action"><img
												src="/images/return.png"
												style='width: 1.1rem;height:1.0rem;vertical-align:middle;'></a>
										</div>
									</div>
									<div class="item1-title-row">
										<div class="item1-title">联系方式：&nbsp;${tbPersonalData2.mobilePhone}</div>
										<div class="item1-after"></div>
									</div>
									<div class="item1-title-row">
										<div class="item1-title">
											婚姻状况：&nbsp;
											<c:choose>
												<c:when test="${sessionScope.personaldata.maritalStatus==0}">
        											未婚
	        									</c:when>
												<c:when test="${sessionScope.personaldata.maritalStatus==1}">
	        										已婚
	       										 </c:when>
											</c:choose>
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
					<a href="#tab3" class="tab-link button1"><div align="left">以往咨询记录</div></a>
				</div>
			</div>
			<div class="div_main_main11">
				<div class="tabs">
					<div id="tab1" class="tab active">
						<div class="content-block">
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
											</s:iterator>
										</s:iterator>
										<s:iterator value="throughFeedbackList" id="back">
											<s:if test="#father.readmeId == #back.readmeId">
												<li class="item-content">
													<div class="item-innerc">
														<font style=" color:#fa770e;">效果反馈：</font>${back.feedbackContent}
													</div>
												</li>
												<li class="item-content1">
													<div class="item-inner1">
														<div class="item-title">${back.feedbackTime}</div>
														<div class="item-after1"></div>
													</div>
												</li>
											</s:if>
										</s:iterator>
										<li class="item-content">
											<div class="item-innerc"></div>
										</li>
										<div class="sa"></div>
										<%
											n = 0;
											m = 0;
										%>
									</s:iterator>
								</ul>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
