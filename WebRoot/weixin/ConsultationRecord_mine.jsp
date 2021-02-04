<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>我的咨询</title>
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
<title>我的咨询</title>
<style type="text/css">
.back{
	float: left;
}
.add{
	float: right;
}
.neirong{
	padding: .1rem 0;
	color: #404040;
}
.img{
	width:1.4rem;
	height:1.4rem;
}
</style>
</head>
<body>
	<div class="content">
		<div class="div_main" align="center">
			<div class="div_main_top2" style="height: 1.4rem;padding-top:.4rem;">
				<div style="font-size:1rem;align:left">
				<a href="javascript:history.go(-1)" class="back"><img src="/images/back1.png" class="img"></a>
				我的咨询
				<a href="<%=basePath %>/biz/TbTeacher_queryTeacherList.action" class="add"><img src="/images/add1.png" class="img"></a>
				</div>
			</div>
			<div class="div_main_main11" style="border-top: 1px solid #EFEFF4;margin-top: .7rem;">
				<s:iterator value="recordList" id="record">
				<div class="list-block">
					<a href="<%=basePath %>/biz/TbConsultationRecord_recordDetails.action?recordId=${recordId}" class="item-content1 item-link">
					<div class="div_main_main_right">
						<div style="text-align: left;font-size: 1rem;padding: .3rem 0;border-bottom: 1px solid #EFEFF4;">
							<div>
								<div>主要症状:</div>
								<div class="overflow neirong"><span style="padding-left: 2rem;">${symptomDescription}</span></div>
							</div>
							<div class="overflow neirong">调理建议:<br><span style="padding-left: 2rem;">
								<c:choose>
									<c:when test="${advice==null}"><font color="#08AEF3">导师暂未回复</font></c:when>
									<c:when test="${exceptionalStatus == 0 && advice!=null}">********</c:when>
									<c:otherwise>${advice}</c:otherwise>
								</c:choose>
							</span>
							<div>
								<span style="float: right;font-size: .8rem;color: #ABABAB;margin-top: .2rem;">
									<fmt:formatDate value="${consultTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</span>
							</div>
							</div>
						</div>
					</div>
					</a>
				</div>
				</s:iterator>
			</div>
		</div>
	</div>
</body>
</html>