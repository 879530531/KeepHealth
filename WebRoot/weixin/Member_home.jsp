<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>会员中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="icon" href="http://host/favicon.ico" type="image/x-icon" />

<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<!-- <script type="text/javascript" src="/source/js/mui.js"></script>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/party.js"></script> -->
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/sm.css">
<link rel="stylesheet" href="css/sm-extend.min.css">

</head>

<body>
	<%
		int i = 1, n = 0, m = 0;
	%>
	<!-- 网页内容开始 -->
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
											<a href="<%=basePath%>/weixin/Member_data.jsp"> <span
												style="font-size:0.9rem;">${sessionScope.Name}</span>&nbsp;&nbsp;
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
											</a>
										</div>
										<div class="item1-after">
											<a href="<%=basePath%>/weixin/Member_data.jsp"><img
												src="/images/edit1.png"
												style='width: 1.0rem;height:1.0rem;vertical-align:middle;'></a>
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
			<div class="div_main_main">
				<div class="buttons-tab">
					<a href="#tab1" style="display:none" class="tab-link active button">健康咨询</a>
					<div class="maina">
						<a href="#tab2" class="tab-link button">健康咨询</a>
					</div>
					<c:choose>
						<c:when test="${sessionScope.time==0}">
							<div></div>
						</c:when>
						<c:when test="${sessionScope.personaldata.level==3}">
							<div></div>
						</c:when>
						<c:when test="${sessionScope.time!=0 && sessionScope.overdue>0}">
							<div class="maina">
								<a href="#tab4" class="tab-link button">学习园地</a>
							</div>
						</c:when>
					</c:choose>
					<div class="mainb">
						<a href="#tab3" class="tab-link button">以往记录</a>
					</div>
				</div>
			</div>
			<div class="div_main_main1">
				<div class="tabs">
					<div id="tab1" class="tab active">
						<div class="content-block">
							<table width="100%" border="0">
								<tr>
									<td align="center" width="50%">已咨询：</td>
									<td align="center" width="50%"><a
										href="<%=basePath%>/front1/TbAdvice_openRefered.action">${consult_number}条</a></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td align="center">未反馈：</td>
									<td align="center"><a
										href="<%=basePath%>/front1/TbReadme_listFK.action">${feedback_nember}条</a></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td align="center">已答复：</td>
									<td align="center"><a
										href="<%=basePath%>/front1/TbReadme_listAR.action">${answer_number}条</a></td>
								</tr>
							</table>

						</div>
						<div class="div_main_main2" align="center">----------------导师简介----------------</div>
						<div class="div_main_bottom">
							<!-- 内容开始 -->
							<s:iterator value="#session.personalDataa" id="id">
								<div class="list-block media-list">
									<ul>
										<li><a href="/front1/TbPersonalData_openTeatherInformation.action?personalId=${id.personalId}"
											class="item-link item-content">
												<div class="item-media">
													<img src="/upload/${id.image}"
														style='width: 3.4rem;height:3.4rem;border-radius: 1.75rem;'>
												</div>
												<div class="item-inner">
													<div class="item-title-row">
														<div class="item-title1">${realName}&nbsp;&nbsp;
															<c:choose>
																<c:when test="${level==0}">
																	<!-- <div class="item-after">导师</div> -->
																	<img src="/images/mentor.png"
																		style='width: 1.0rem;height:0.9rem;vertical-align:middle;'>
																</c:when>
																<c:when test="${level==1}">
																	<!-- <div class="item-after">普通导师</div> -->
																	<img src="/images/mentor2.png"
																		style='width: 1.0rem;height:0.9rem;vertical-align:middle;'>
																</c:when>
																<c:when test="${level==2}">
																	<!-- <div class="item-after">高级导师</div> -->
																	<img src="/images/mentor1.png"
																		style='width: 1.0rem;height:0.9rem;vertical-align:middle;'>
																</c:when>
															</c:choose>
														</div>
													</div>
													<div class="item-text">${introduction}</div>
												</div>
										</a></li>
									</ul>
									<div class="sa"></div>
								</div>
							</s:iterator>
							<!-- 内容结束 -->
						</div>
					</div>
					<div id="tab4" class="tab">
						<div class="content-block">
							<!-- 内容开始 -->
							<div class="common-container">
								<div id="wrapper">
									<ul id="scroller">
										<s:iterator value="contentList.data" var="i">
											<li class="section clearfix"><a
												href="${path}/front1/ContentWeiXin_show.action?id=${i.id}">
													<div class="my-article-img">
														<s:if test='#i.cover!=null || #i.cover.trim() !="" '>
															<img src="${i.cover}" style="height:3.2rem;">
														</s:if>
													</div>
													<div class="my-article-info">
														<div class="my-article-title">
															<span>${i.title }</span>
														</div>
														<div class="my-article-desc clearfix">
															<div class="desc-l">
																<span class="my-article-channel"> <s:if
																		test="#i.type==1">图文</s:if> <s:elseif
																		test="#i.type==2">视频</s:elseif>
																</span><span class="my-article-time">${i.operateTime}</span>
															</div>
															<div class="desc-r">易道象数</div>
														</div>
													</div>
											</a></li>
										</s:iterator>
									</ul>
								</div>
								<!-- <div class="loading">
			<em></em><span>加载中...</span>
		</div>  -->
								<div id="nomore"
									style="text-align: center;	color: #fff; font-size: 0.8rem; line-height: 1.0rem;margin-top:0.2rem;display: none;">
									<span>—— 没有更多了 ——</span>
								</div>
							</div>
							<!-- 内容结束 -->
						</div>
					</div>
					<div id="tab2" class="tab">
						<div class="content-block">
							<form action="<%=basePath%>/front1/TbReadme_add.action"
								name="form" id="ww" method="post">
								<div class="xiala">
									导师： <select class="B9" name="mentorId" id="mentorId">
										<option value="0">${sessionScope.tip}</option>
										<s:iterator value="#session.personalData1" id="idd">

											<option value="${personalId}">${realName}</option>
										</s:iterator>
									</select> &nbsp; <select class="B9" name="flagType" id="flagType">
										<option value="0">健康咨询</option>
										<option value="1">亲友咨询</option>
									</select>
								</div>
								<table width="100%" height="160" border="0">
									<tr>
										<td align="center">
										<c:choose>
										<c:when test="${sessionScope.personaldata.level==3 || sessionScope.overdue<0}">
											<textarea class="B8" name="readmeContent" id="readmeContent" readonly='readonly' placeholder="缴费/续费后方可输入内容进行咨询"></textarea>
										</c:when>
										 <c:otherwise>
											<textarea class="B8" name="readmeContent" id="readmeContent"  placeholder="健康咨询:"></textarea>
   										</c:otherwise>
										</c:choose>
											<input type="hidden" value="${tbPersonalData.personalId}"
											name="personalId" id="personalId"> <input
											type="hidden" value="${tbPersonalData.realName}"
											name="memberName" id="memberName"></td>
									</tr>
								</table>
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
														<a href="/front1/WeixinLogin_ReturnMemberHome.action"
															class="button button-big1 button-fill button-danger">取消</a>
													</div>
												</div>
											</div> <input type="hidden" id="tip" value="${sessionScope.aler1}">
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
					<div id="tab3" class="tab">
						<div class="content-block">
							<div class="list-block">
								<ul>
									<s:iterator value="fatherHealthList" id="father">
										<li class="item-content">
											<%-- <div class="item-innerb"><%=i++ %>. </div> --%>
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
													<!-- <div class="item-innerb"></div> -->
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
													<!-- <div class="item-innerb"></div> -->
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
														<!-- <div class="item-innerb"></div> -->
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
													<!-- <div class="item-innerb"></div> -->
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
											<div class="item-inner">
												<div class="item-title"></div>
												<div class="item-after">
													<div class="content-block11">
														<%
															n = 0;
																m = 0;
														%>
														<c:choose>
															<c:when test="${sessionScope.time==0 || sessionScope.overdue<0}">
																<div></div>
															</c:when>
															<c:when test="${sessionScope.time!=0 && sessionScope.overdue>0}">
																<div class="row">
																	<div class="col-50">
																		<a
																			href="<%= basePath%>/front1/TbAdvice_OpenFeedbackkk.action?mentorId=${father.mentorId}&idd=${father.readmeId}"
																			class="button button-big button-fill button-success">效果反馈</a>
																	</div>
																	<div class="col-50">
																		<a
																			href="weixin/Additional_questions.jsp?mentorId=${father.mentorId}&fatherId=${father.readmeId}"
																			class="button button-big button-fill button-success">追加提问</a>
																	</div>
																</div>
															</c:when>
														</c:choose>
													</div>
												</div>
											</div>
										</li>
										<li class="item-content2"></li>
									</s:iterator>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='http://g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='http://g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js'
		charset='utf-8'></script>
	<%
		String fail = (String) request.getAttribute("tishi");
		String fail2 = (String) request.getAttribute("tishi1");
		String faill = (String) request.getAttribute("alert");
		//System.out.println("用户不存在，登录失败"+fail);
		//System.out.println("用户不存在，登录失败1"+fail2);
		String fail1 = new String(fail == null || "".equals(fail)
				? "ff"
				: fail);
		String fail3 = new String(fail2 == null || "".equals(fail2)
				? "ff"
				: fail2);
		String fail4 = new String(faill == null || "".equals(faill)
				? "ff"
				: faill);
		if (fail1.equals("fail")) {
	%>
	<script type="text/javascript">
		$.alert('您已对该次咨询进行过反馈', '无须多次反馈');
	</script>
	<%
		}
		if (fail3.equals("fail1")) {
	%>
	<script type="text/javascript">
		$.alert('请您耐心等候导师的回复后再进行反馈', '导师尚未回复');
	</script>
	<%
		}
		if (fail4.equals("success")) {
	%>
	<script type="text/javascript">
		$.showPreloader('操作成功！')
		setTimeout(function() {
			$.hidePreloader();
		}, 2000);
	</script>
	<%
		}
	%>
</body>
<script type="text/javascript">
	function validate() {
		var a = document.getElementById("ww").readmeContent.value;
		var tip = document.getElementById("tip").value;
		var mentorId = document.getElementById("mentorId").value;
		if (a == "") {
			$.alert('咨询内容不能为空', '咨询失败!');
			return;
		} else if (tip != "") {
			$.alert('您尚未成为正式会员或会员身份已过期', '请缴费后重新尝试');
			return;

		} else if (mentorId == "1") {

			$.alert('普通会员无法对高级导师进行咨询', '您的会员等级过低');
			return;

		} else {
			document.getElementById("ww").submit();
		}
	}
</script>
</html>
