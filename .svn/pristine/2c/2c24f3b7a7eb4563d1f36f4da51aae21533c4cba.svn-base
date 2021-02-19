
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">

	<title>服务详情</title>

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

<%
	int i = 1, n = 0, m = 0;
%>
<!-- 网页内容开始 -->
<div class="content">
	<div class="div_main" align="center">
		<div class="div_main_top2" style="height: 1.4rem;padding-top:.4rem;">
			<div style="font-size:1rem;align:left">
				<a href="javascript:history.go(-1)" class="back"><img src="/images/back1.png" class="img"></a>
				服务详情
			</div>
		</div>

		<div class="div_main_main11">
			<div class="list-block" style='margin-top: 0px;margin-bottom: 0px; width: 100%;height: 5rem'>
				<ul>
					<a href="<%= basePath%>/biz/TbTeacher_OpenTeacherData.action" class="item-content item-link " tyle="width: 100%;high：30%">
						<div class="item-media" >
							<i class="icon icon-f7"></i>
						</div>
						<div class="item-inner"  style="height: 3rem">
							<div class="item-title" >&nbsp;&nbsp;&nbsp;
								<img src="/images/edit_data.png"
									 style='width: 1.5rem;height:1.5rem;vertical-align:middle;'>&nbsp;&nbsp;&nbsp;<span style="margin:8rem auto;font-size:22px;font-weight:500" >修改密码</span>
							</div>
							<div class="item-after"></div>
						</div>
					</a>
				</ul>
			</div>

		</div>
		<div class="div_main_main1">
			<div class="tabs">
				<div id="tab1" class="tab active">
					<div class="content-block">
						<form action="<%=basePath%>/biz/TbConsultationRecord_count.action?"
							  name="form" id="ww" method="post">
							<table width="100%" height="100%" border="0">
								<tr class="a" >
									<td align="center" width="50%" style="margin:8rem auto;font-size:22px;font-weight:500">已回复：</td>
									<td align="center" width="50%" style="margin:8rem auto;font-size:28px;font-weight:500"><a
											href="<%=basePath%>/biz/TbConsultationRecord_readyReply.action">${yhf_number}条</a></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td align="center" style="margin:8rem auto;font-size:22px;font-weight:500">未回复：</td>
									<td align="center" style="margin:8rem auto;font-size:28px;font-weight:500"><a
											href="<%=basePath%>/biz/TbConsultationRecord_openNotReply.action">${whf_number}条</a></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td align="center" style="margin:8rem auto;font-size:22px;font-weight:500">已打赏：</td>
									<td align="center" style="margin:8rem auto;font-size:28px;font-weight:500"><a
											href="<%=basePath%>/biz/TbConsultationRecord_openReward.action">${yds_number}条</a></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td align="center" style="margin:8rem auto;font-size:22px;font-weight:500">未打赏：</td>
									<td align="center" style="margin:8rem auto;font-size:28px;font-weight:500"><a
											href="<%=basePath%>/biz/TbConsultationRecord_openNotReward.action">${wds_number}条</a></td>
								</tr>

							</table>
						</form>
					</div>

				</div>
			</div>

			<!-- <div class="loading">
<em></em><span>加载中...</span>
</div>  -->

		</div>
		<!-- 内容结束 -->
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
