<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>个人资料</title>

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
	<%
		int i = 1;
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
											<span style="font-size:0.9rem;">&nbsp;${sessionScope.Name}</span>&nbsp;&nbsp;
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
												style='width: 1.1rem;height:1rem;vertical-align:middle;'></a>
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
			<div class="div_main_main11">
				<div class="list-block">
					<ul>
						<a href="<%=basePath%>/weixin/Change_Img.jsp"
							class="item-content item-link">
							<div class="item-media">
								<i class="icon icon-f7"></i>
							</div>
							<div class="item-inner">
								<div class="item-title">
									<img src="/images/edit_image.png"
										style='width: 1.0rem;height:1.0rem;vertical-align:middle;'>&nbsp;修改头像
								</div>
								<div class="item-after"></div>
							</div>
						</a>
						<a href="<%=basePath%>/weixin/Change_password.jsp"
							class="item-content item-link">
							<div class="item-media">
								<i class="icon icon-f7"></i>
							</div>
							<div class="item-inner">
								<div class="item-title">
									<img src="/images/edit_pw1.png"
										style='width: 1.05rem;height:1.0rem;vertical-align:middle;'>&nbsp;修改密码
								</div>
								<div class="item-after"></div>
							</div>
						</a>

						<a href="<%=basePath%>/front1/TbPersonalData_find.action"
							class="item-content item-link">
							<div class="item-media">
								<i class="icon icon-f7"></i>
							</div>
							<div class="item-inner">
								<div class="item-title">
									<img src="/images/edit_data.png"
										style='width: 0.9rem;height:0.9rem;vertical-align:middle;'>&nbsp;个人信息
								</div>
								<div class="item-after"></div>
							</div>
						</a>

						<li class="item-content item-link"></li>
					</ul>
				</div>
				<div class="content-blockk">
					<div class="row3">
						<a href="/front1/WeixinLogin_LoginOut.action" class="buttonn">退出登录</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
