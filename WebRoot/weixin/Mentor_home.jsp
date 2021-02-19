<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>导师中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="http://host/favicon.ico" type="image/x-icon" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<!--     <script type="text/javascript" src="/source/js/mui.js"></script>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/party.js"></script> -->
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/sm.css">
<link rel="stylesheet" href="css/sm-extend.min.css">
</head>

<body>
	<%int i=1,j=1; %>
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
											<a
												href="<%= basePath%>/front1/WeixinLogin_OpenMentorData.action">
												<span style="font-size:0.9rem;">${sessionScope.Name}
													&nbsp;</span> <c:choose>
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
												href="<%= basePath%>/front1/WeixinLogin_OpenMentorData.action"><img
												src="/images/edit1.png"
												style='width: 1.0rem;height:1.0rem;vertical-align:middle;'></a>
										</div>

									</div>
									<div class="item1-title-row">
										<div class="item1-title">联系电话：&nbsp;&nbsp;${sessionScope.personaldata.mobilePhone }</div>
										<div class="item1-after"></div>
									</div>
									<div class="item1-title-row">
										<div class="item1-title">
											已作答：&nbsp;&nbsp;<a
												href="<%= basePath%>/front1/TbReadme_listPQ.action">${advice_nember}
												<img src="/images/done.png"
												style='width: 0.9rem;height:1.0rem;vertical-align:middle;'>
											</a>
										</div>
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
					<div class="maina">
						<c:choose>
							<c:when test="${sessionScope.myAppointment_number1>0}">
								<div class="mainc_2">
									<div id="mainc_1">${sessionScope.myAppointment_number1}</div>
								</div>
							</c:when>
						</c:choose>
						<div class="mainc">
							<a href="#tab1" class="tab-link active button">我的预约</a>
						</div>
					</div>
					<div class="maina">
						<a href="#tab4" class="tab-link button">学习园地</a>
					</div>
					<div class="maina">
						<c:choose>
							<c:when test="${sessionScope.otherAppointment_number1>0}">
								<div class="mainc_2">
									<div id="mainc_1">${sessionScope.otherAppointment_number1}</div>
								</div>
							</c:when>
						</c:choose>
						<div class="mainc">
							<a href="#tab2" class="tab-link button">其他预约</a>
						</div>
					</div>
				</div>
			</div>
			<div class="div_main_main1">
				<div class="tabs">
					<div id="tab1" class="tab active">
						<div class="content-block">
							<div class="list-block">
								<ul>
									<s:iterator value="#request.myAppointment" id="pd">
										<li class="item-content">
											<div class="item-innerv">
												<img src="/upload/${pd.image}"
													style="width: 0.9rem;height:0.9rem;border-radius: 0.9rem;">&nbsp;&nbsp;${pd.memberName}&nbsp;&nbsp;${pd.readmeTime}
												
											</div>
										</li>
										<li class="item-content">
											<div class="item-inners">
												<a
													href="<%= basePath%>/front1/TbReadme_OpenRegulateAdvice.action?personalId=${pd.personalId}&readmeId=${pd.readmeId}">
													<span style=" color:#f6be37;">健康自述：</span>${pd.readmeContent}
												</a>
											</div>
										</li>
										<li class="item-content">
											<div class="item-inners1"></div>
										</li>
									</s:iterator>
								</ul>
							</div>
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
		</div> -->
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
							<div class="list-block">
								<ul>
									<s:iterator value="#request.tbReadmeList1" id="pr">
										<li class="item-content">
											<div class="item-innerv">
												<img src="/upload/${pr.image}"
													style="width: 0.9rem;height:0.9rem;border-radius: 0.9rem;vertical-align:middle;">&nbsp;&nbsp;${pr.memberName}&nbsp;&nbsp;${pr.readmeTime}
												
											</div>
										</li>
										<li class="item-content">
											<div class="item-inners">
												<a
													href="<%= basePath%>/front1/TbReadme_OpenRegulateAdvice.action?personalId=${pr.personalId}&readmeId=${pr.readmeId}">
													<span style=" color:#f6be37;">健康自述：</span>
													${pr.readmeContent}
												</a>
											</div>

										</li>
										<li class="item-content">
											<div class="item-inners1"></div>
										</li>
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
	<script type='text/javascript' src='js/sm.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='http://g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js'
		charset='utf-8'></script>
	<%    String faill = (String)request.getAttribute("alert");
          System.out.println("用户不存在asasas"+faill);
          String fail4 =new String(faill == null || "".equals(faill)?"ff":faill);
           if(fail4.equals("success")){ 
         %>
	<script type="text/javascript">
      $.showPreloader('操作成功！')
			    setTimeout(function () {
			        $.hidePreloader();
			    }, 2000);
		</script>
	<%} %>
</body>
</html>
