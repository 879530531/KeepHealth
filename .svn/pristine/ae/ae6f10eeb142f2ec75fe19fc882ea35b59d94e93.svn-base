<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>未反馈记录</title>

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
<!--<link rel="stylesheet" href="css/sm.min2.css">-->
<link rel="stylesheet" href="css/sm-extend.min.css">

</head>

<body>
	<%
		int i = 1, n = 0, m = 0;
	%>
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
											<span style="font-size:0.9rem;">${sessionScope.Name}</span>
											<c:choose>
												<c:when test="${sessionScope.time==0}">
													<span
														style=" color:#FFF;font-size:0.75rem;padding-bottom:0.05rem;padding-top:0.08rem; background-color:#bbb9b9">&nbsp;VIP&nbsp;</span>
												</c:when>
												<c:when test="${sessionScope.personaldata.level==0  && sessionScope.overdue>0}">
														<span
															style=" color:#FFF;font-size:0.75rem; background-color:#f6383a">&nbsp;VIP&nbsp;</span>
													</c:when>
													<c:when test="${sessionScope.personaldata.level==1  && sessionScope.overdue>0}">
														<span
															style=" color:#d81e06;font-size:0.75rem; background-color:#f4ea2a">&nbsp;SVIP&nbsp;</span>
													</c:when>
													<c:when test="${sessionScope.personaldata.level==3  || sessionScope.overdue<0}">
														<span
															style="color:#FFF;font-size:0.75rem; background-color:#bbb9b9">&nbsp;VIP&nbsp;</span>
													</c:when>
											</c:choose>
										</div>
										<div class="item1-after">
											<a
												href="<%=basePath%>/front1/WeixinLogin_ReturnMemberHome.action"><img
												src="/images/return.png"
												style='width: 1.1rem;height:1.0rem;vertical-align:middle;'></a>
										</div>
									</div>
									<div class="item1-title-row">
										<div class="item1-title">到期时间：&nbsp;${sessionScope.EndTime}</div>
									</div>
									<div class="item1-title-row">
										<div class="item1-title">手机号码：&nbsp;${sessionScope.personaldata.mobilePhone}</div>
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
					<div align="left">
						<a href="#tab3" class="tab-link button1">未反馈记录</a>
					</div>
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
												<div class="item-title">${readmeTime}</div>
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
														<div class="item-title">${mentorName}&nbsp;&nbsp;${adviceTime}</div>
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
														<div class="item-title">${readmeTime}</div>
														<div class="item-after1"></div>
													</div>
												</li>


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
										<%
											n = 0;
												m = 0;
										%>
										<li class="item-content">
											<div class="item-innerq">
												<div class="item-title"></div>
												<div class="item-after">
													<div class="content-block11">
														<c:choose>
															<c:when test="${sessionScope.time==0 && sessionScope.overdue<0}">
																<div></div>
															</c:when>
															<c:when test="${sessionScope.time!=0 && sessionScope.overdue>0}">
																<div class="row">
																	<div class="col-100">
																		<a
																			href="<%= basePath%>/biz/TbAdvice_OpenFeedback.action?mentorId=${id.mentorId}&idd=${id.readmeId}"
																			class="button button-big button-fill button-success">效果反馈</a>
																	</div>
																</div>
															</c:when>
														</c:choose>
													</div>
												</div>
											</div>
										</li>
									</ul>
								</s:iterator>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
