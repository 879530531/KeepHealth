<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>个人信息修改</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="icon" href="http://host/favicon.ico" type="image/x-icon" />

<link rel="shortcut icon" href="http://host/favicon.ico"
	type="image/x-icon" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="css/sm.min.css">
<link rel="stylesheet" href="css/sm-extend.min.css">
<script type="text/javascript"
	src="<%= basePath%>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript"
	src="<%= basePath%>/third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript"
	src="<%= basePath%>/third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript">
        $(function(){
        $("#4").validate({
                errorClass: "errorInfo", //默认为错误的样式类为：error
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
                onkeyup: false,   
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
					checkFrom();
                    form.submit();   //提交表单   
                },   
                rules:{
                	"professional":{
                        required:true,
                     },
                    "name":{
                        required:true,
                        rangelength:[2,20]
                    },
                    
                    "mobilePhone":{
                        required:true,
                        number:true,
                        rangelength:[10,12]
                    },
                    "address":{
                       required:true,
                        rangelength:[2,150]
                    },
                    "email":{
                   		required:true,
                        email:true
                    },
                    "qq":{
                    	required:true,
                        digits:true,
                        rangelength:[4,20]
                    }
                },
                messages:{
                	"professional":{
                        required:"必填",
                        
                    },
                    "name":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    
                    "mobilePhone":{
                        required:"必填",
                        number:"请输入正确的手机号",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "address":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")

                    },
                    "email":{
                    	required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                     "qq":{
                     	required:"必填",
                        digits: "请输入正确的qq号",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    }
                }  
            });   
        });
</script>
</head>

<body>
	<form action="<%= basePath%>/front1/TbPersonalData_update.action"
		name="form" id="4" method="post">
		<div class="page-group">
			<div class="page page-current">
				<header class="bar bar-nav">
				<h1 class='title'>个人信息修改</h1>
				</header>
				<input type="hidden" name="birthday"
					value="${tbPersonalData.birthday}" />
				<div class="content">
					<div class="list-block">
						<ul>
							<!-- Text inputs -->
							<li>
								<div class="item-content">
									<div class="item-media">
										<i class="icon icon-form-name"></i>
									</div>
									<div class="item-innerp">
										<div class="item-title label">昵称：</div>
										<div class="item-input">
											<input type="text" id="name" name="name" placeholder="Name"
												value="${sessionScope.Name}">
										</div>
									</div>
								</div>
							</li>

							<li>
								<div class="item-content">
									<div class="item-media">
										<i class="icon icon-form-name"></i>
									</div>
									<div class="item-innerp">
										<div class="item-title label">职业：</div>
										<div class="item-input">
											<input type="text" name="professional"
												placeholder="Professional"
												value="${tbPersonalData.professional}">
										</div>
									</div>
								</div>
							</li>
							<!-- Date -->
							<li>
								<div class="item-content">
									<div class="item-media">
										<i class="icon icon-form-password"></i>
									</div>
									<div class="item-innerp">
										<div class="item-title label">QQ号码：</div>
										<div class="item-input">
											<input type="text" name="qq" placeholder="QQ Number"
												value="${tbPersonalData.qq}">
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="item-content">
									<div class="item-media">
										<i class="icon icon-form-name"></i>
									</div>
									<div class="item-innerp">
										<div class="item-title label">手机号码：</div>
										<div class="item-input">
											<input type="text" name="mobilePhone" id="mobilePhone"
												placeholder="Mobile phone"
												value="${tbPersonalData.mobilePhone}"> <span
												id="gradeInfo"></span>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="item-content">
									<div class="item-media">
										<i class="icon icon-form-name"></i>
									</div>
									<div class="item-innerp">
										<div class="item-title label">现居地址：</div>
										<div class="item-input">
											<input type="text" name="address"
												placeholder="Present address"
												value="${tbPersonalData.address}">
										</div>
									</div>
								</div>
							</li>

							<li>
								<div class="item-content">
									<div class="item-media">
										<i class="icon icon-form-email"></i>
									</div>
									<div class="item-innerp">
										<div class="item-title label">电子邮箱：</div>
										<div class="item-input">
											<input type="email" name="email" placeholder="E-mail"
												value="${tbPersonalData.email}">
										</div>
									</div>
								</div>
							</li>
							<li class="item-content" style="align-top">
								<div class="item-media">
									<i class="icon icon-form-email"></i>
								</div>
								<div class="item-innerp">
									<div class="item-title label">导师简介：</div>
									<div class="item-input">
										<textarea name="introduction">${tbPersonalData.introduction}</textarea>

									</div>

								</div>
							</li>
						</ul>
					</div>
					<div class="content-block">
						<div class="row">
							<input type='submit' style='display:none' id='tijiao' />
							<div class="col-50">
								<a class="button button-big button-fill button-success"
									href='javascript:' onclick='$("#tijiao").click()'>修改</a>
							</div>
							<div class="col-50">
								<a onclick="location.href='javascript:history.go(-1);'"
									class="button button-big button-fill button-danger">取消</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!--  <script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script> -->
	<script type="text/javascript">
	$(function(){
		//验证手机号
		$("#mobilePhone").blur(function(){//给用户编号添加失去焦点事件
			var url = "/front/SysJson_checkMobilePhone.action";
			var id = $(this).val();//获取用户编号的输入值 
			var inputValue = $(this).attr("mobilePhone");//获取原来的用户编号
			id = $.trim(id);
			if(id != inputValue){//如果输入的和原来的不等，校验用户编号
				if(id != ""){
					$.post(url,{"mobilePhone":id},function(data){//发送请求验证用户编号 
						if(data == "true"){//如果返回 true,提示已存在 
							$("#gradeInfo").html("<div align=\"left\" ><font size=\"3\" color=\"red\">该手机号已被注册</font></div>"); 
						}else{
							$("#gradeInfo").html("");
						}
					},"json");
				}
			}
			$("#gradeInfo").html("");
		});
	});

</script>
	<%    String faill = (String)request.getAttribute("tib");
          String fail4 =new String(faill == null || "".equals(faill)?"ff":faill);
           if(fail4.equals("fail")){ 
         %>
	<script type="text/javascript">
      $(function () {
            //弹出层
            $("#show").show();
		    $("#hide").click(function (event) {
		         $("#show").hide();})
            });
		</script>
	<%} %>

	<div class="modal modal-in" style="display: none; margin-top: -89px;"
		id="show">
		<div class="modal-inner">
			<div class="modal-title">修改失败!</div>
			<div class="modal-text">您输入的手机号已被注册</div>
		</div>
		<div class="modal-buttons " id="hide">
			<span class="modal-button modal-button-bold">确定</span>
		</div>
	</div>
</body>
</html>
