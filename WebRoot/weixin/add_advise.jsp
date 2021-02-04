<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>调理建议</title>

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


	<script type="text/javascript">
			pushHistory();
	window.addEventListener("popstate", function(e) {
		window.location = '<%= basePath%>/biz/TbConsultationRecord_openNotReply.action';
	}, false);
	function pushHistory() {
		var state = {
			title: "title",
			url: "<%= basePath%>/biz/TbConsultationRecord_openNotReply.action"
		};
		window.history.pushState(state, "title", "<%= basePath%>/biz/TbConsultationRecord_openNotReply.action");
	}

</script>
</head>

<body>
	<%
		int i = 1, n = 0, m = 0;
	%>
	<!-- 网页内容开始 -->
	
	<div class="content">
		<div class="div_main" align="center">
			<div class="div_main_top">
					<div style="font-size:1rem;align:left">
					
					调理建议
					</div>
				<div class="list-block media-list1">
					<ul>
						<li>
							<div class="item1-link item1-content" style="margin:1px">
								<div class="item1-media">
									<img src="${requestScope.photo }"
										style="padding-top:0.1rem;width: 4.8rem;height:4.8rem;border-radius: 2.4rem;">
									&nbsp;&nbsp;&nbsp;
									
									<p >${requestScope.username}</p>
								</div>
								 	
								<div class="item1-inner">
								<p>${requestScope.time}</p>
									<div class="item1-title-row" style="text-align: center;">
										<div class="item1-title">
											
										</div>
										<div  style="text-align: center;">
										
											
										</div>
									</div>
									<div class="item1-title-row">
									<a href="#"> <span style="font-size:0.9rem;"></span>&nbsp;&nbsp;
												
									</a>
										
										<div class="item1-after"></div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="div_main_main1">
				<div class="tabs">
					<div id="tab1" class="tab active">
						<div class="content-block">							
						</div>
						<br>
			
						<div class="div_main_main2" align="left" style="margin:10px">
						主要症状
						</div>
						<div class="div_main_bottom">
							<form action="<%=basePath%>/biz/TbConsultationRecord_addTeacherAdvise.action?TbConsultationRecord.recordId=${requestScope.recordid}" name="form"
									id="a" method="post">
								<div class="xiala" id="Id">	
									<p align="left">
										${requestScope.symptom }
									</p>																		
								</div>
								
								<br>
								<br>
								<table width="100%" height="160" border="0">
									<tr>
										<td align="center">
										<c:choose>
										<c:when test="">
												</c:when>
										 <c:otherwise>
											<textarea class="B8" name="additionalAdvice" id="additionalAdvice"  placeholder="请输入追加内容："></textarea>
   										</c:otherwise>
										</c:choose>
											<input type="hidden" value=""
											name="" id=""> <input
											type="hidden" value="}"
											name="" id=""></td>
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
														<a href="javascript:;" onclick="cancel()"
															class="button button-big1 button-fill button-danger">取消</a>
													</div>
												</div>
											</div> <input type="hidden" id="tip" value="">
										</td>
									</tr>
								</table>
							</form>
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
	<%--var a = document.getElementById("a").advice.value;--%>
	if (a == "") {
		$.alert('反馈内容不能为空', '反馈失败！');
		return;
	} else {
		document.getElementById("a").submit();
		return;
	}
}
</script>

</html>

