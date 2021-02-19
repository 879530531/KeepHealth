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
.replycontent{
	border: 1px solid #ccc;
	width: 94%;
	-moz-border-radius: .5rem;
	-o-border-radius: .5rem;
	-webkit-border-radius: .5rem;
	border-radius: .5rem;
	margin-top: 1rem;
	padding: 1rem;
	text-align: left;
}
</style>
<script type="text/javascript">
pushHistory();
   window.addEventListener("popstate", function(e) {
     window.location = '<%= basePath%>/biz/TbConsultationRecord_record.action';
   }, false); 
   function pushHistory() { 
     var state = { 
       title: "title", 
       url: "<%= basePath%>/biz/TbConsultationRecord_record.action"
     }; 
     window.history.pushState(state, "title", "url"); 
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
						<div class="content-block">
							<div class="list-block" style="padding-top: .5rem;">
								<div class="replycontent">
									<div>
										<div style="letter-spacing: .2rem;margin-top: .2rem;">
											<span style="color:#6E6E6E;font-weight: bold;color: #333">${tbConsultationRecord.advice}</span>
										</div>
										<c:if test="${tbConsultationRecord.additionalAdvice != null}">
											<div style="letter-spacing: .1rem;margin-top: .5rem;">
												<span style="color:#0894ec;font-size: .8rem;">[追加]</span><br>
												<span style="font-size: .8rem;"><font style="color: #333;">${tbConsultationRecord.additionalAdvice}</font></span>
											</div>
										</c:if>
									</div>
									<div style="height: 2rem;margin-top: 1.5rem;font-size: .7rem;">
										<span>注：得方后试念10分钟如无不适请继续持念（默念），若有不适请及时联系咨询老师调方。</span>
										<span style="color: #0894ec;">${tbTeacher.teacherName}老师电话：${tbTeacher.teacherPhone}</span>
									</div>
								</div>
								<div class="content-block" style="margin-top: .6rem;margin-bottom: 1rem;">
									<div class="row">
										<div style="width: 40%;float:left;">
						
											<a style="margin-top: .6rem;" class="button button-big1 button-fill button-success"
												href="<%=basePath %>/biz/TbConsultationRecord_openReadNumber.action">使用念数机</a>
										</div>
											<div style="width: 40%;float:right;">
											
												<a style="margin-top: .6rem;" class="button button-big1 button-fill button-success"
												href="<%=basePath %>/biz/TbConsultationRecord_record.action">返回</a>
										
										
										
										</div>
									
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>

