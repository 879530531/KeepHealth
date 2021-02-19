<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改头像</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="css/sm.min.css">
<link rel="stylesheet" href="css/sm-extend.min.css">
<script src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript" src="<%=path %>/js/uploadPreview.js"></script>
<script type="text/javascript" src="<%=path %>/js/uploadPreview.min.js"></script>
<link rel="stylesheet" href="//res.layui.com/layui/build/css/layui.css"
	media="all">

<!-- 调用预览图片文件 -->
<script type="text/javascript">  
        $(function () {  
            new uploadPreview({ UpBtn: "up_img", DivShow: "imgdiv", ImgShow: "imgShow" });
        });  
</script>
</head>

<body>
	<form action="<%= basePath%>/front1/TbPersonalData_changeImg.action"
		method="post" id="forma" enctype="multipart/form-data">
		<div class="page-group">
			<div class="page page-current">
				<header class="bar bar-nav">
				<h1 class='title'>修改头像</h1>
				</header>
				<div class="list-block1">&nbsp;</div>
				<div class="list-blocka">
					<ul>
						<!-- Text inputs -->
						<li>
							<div class="item-title label"></div>
							<div class="item-input">
								<input name="tbPersonalData.personalId" type="hidden"
									value="${sessionScope.personaldata.personalId}" /> <input
									type="hidden" name="strImageType" id="strImageType" /> <label
									style="width: 200px; clear:right;">
									<div id="imgdiv" class="imageDiv">
										<img src="/upload/${sessionScope.personaldata.image}" alt=""
											id="imgShow"
											style='width: 11.5rem;height:11.5rem;border-radius:11.5rem;' />
									</div> <input type="file" name="upload" id="up_img"
									style="opacity:0;"> <span id="msgUp_img" class="msgRed"></span>
								</label>
							</div>
						</li>
					</ul>
				</div>
				<div class="content-block">
					<div class="row">
						<div class="col-50">
							<a name="edit_btn" type="submit"
								class="button button-big button-fill button-success"
								onClick="validate()">修改</a>
						</div>
						<div class="col-50">
							<a onclick="location.href='javascript:history.go(-1);'"
								class="button button-big button-fill button-danger">取消</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<script type='text/javascript'
		src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='http://g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='http://g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js'
		charset='utf-8'></script>
	<script type="text/javascript">
		function validate() {
			document.getElementById("forma").submit();
		}
	</script>

</body>
</html>
