<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>老师回复</title>

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
<style type="text/css">
.img{
	width:1.4rem;
	height:1.4rem;
}
.back{
	float: left;
}
textarea:disabled {
	background-color: #fff;
}
</style>
<script type="text/javascript">
		function validate(data){
			window.location.href="<%=basePath %>weixin/Wx_pay.jsp?recordId="+data;
			return;
		}
</script>
</head>

<body>
	<div class="content">
		<div class="div_main" align="center">
			<div class="div_main_top2" style="height: 2rem;padding-top:.4rem;">
				<div style="font-size:1rem;align:left">
				<a href="javascript:history.go(-1)" class="back"><img src="/images/back1.png" class="img"></a>
				<font style="margin-left: -1rem;">老师回复</font>
				</div>
			</div>
			<div class="div_main_main1" style="border-top: 1px solid #EFEFF4;margin-top: .2rem;">
				<div class="list-block media-list1">
					<ul>
						<li>
							<div class="item1-link item1-content" style="margin:1px">
								<div class="item1-media">
									<img src="/upload/${tbTeacher.image }"
										style="padding-top:0.1rem;width: 4.8rem;height:4.8rem;border-radius: 2.4rem;">
								</div>
								<div class="item1-inner" style="top: 30%;">
									<div class="item1-title-row">
										<div class="item1-title"></div>
										<div class="item1-after"></div>
									</div>
									<div class="item1-title-row">
										<a href="javascript:;" style="margin: auto"><span style="font-size:0.9rem;color: #000;">${tbTeacher.teacherName}老师</span>&nbsp;&nbsp;</a>
										<div class="item1-after"></div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="tabs">
					<div id="tab1" class="tab active">
						<div class="div_main_bottom">
							<form
								action="<%=basePath %>biz/TbConsultationRecord_saveConsultationRecord.action"
								name="form" id="ww" method="post">
								<div class="xiala" id="Id"></div>
								<table width="100%" height="160" border="0">
									<tr>
										<td align="center">
											<c:choose>
												<c:when test="${tbConsultationRecord.advice == null}">
													<textarea class="B8" disabled style="overflow:hidden;height: 15rem;line-height: 15rem;text-align: center;color: #08AEF3;">导师暂未回复，请耐心等待</textarea>
												</c:when>
												<c:otherwise>
													<textarea class="B8" disabled style="overflow:hidden;height: 15rem;line-height: 15rem;text-align: center;color: orange;">导师已回复，打赏后可见</textarea>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</table>
								<table width="100%" border="0"
									style="height:5rem;margin-left:-0.66rem">
									<tr>
										<td width="100%" align="center">
											<div class="content-block">
												<div class="row">
													<div style="width: 40%">
														<c:choose>
															<c:when test="${tbConsultationRecord.advice == null}"><a class="button button-big1 button-fill button-success"
															href="javascript:history.go(-1)">返回</a></c:when>
															<c:otherwise><a class="button button-big1 button-fill button-success"
															onClick="validate(${tbConsultationRecord.recordId})">打赏</a></c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>

