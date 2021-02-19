<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色-新增</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script language="javascript" type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path %>/js/uploadPreview.js"></script>
<script type="text/javascript" src="<%=path %>/js/uploadPreview.min.js"></script>
<script type="text/javascript">
        $(function(){
		if("have" == "${tib}"){
			$(".tip").fadeIn(100);
			$(".tiptop a").click(function(){
 			$(".tip").fadeOut(200);
				});

  			$(".sure").click(function(){
  			$(".tip").fadeOut(100);
				});

			$(".cancel").click(function(){
			$(".tip").fadeOut(100);
				});
			}
			//当没有添加角色时使用验证
			jQuery.validator.addMethod("checkRole", function(value, element) {   
			    if($("#roleId").attr("value")==undefined){
            		return false;
            	}else{
            		return true;
            	}
			}, ""),
			
            $("#commonform").validate({
                errorClass: "errorInfo", //默认为错误的样式类为：error
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
                onkeyup: false,   
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
					checkFrom();
                    form.submit();   //提交表单   
                },   
                rules:{
                    "tbPersonalData.name":{
                        required:true,
                        rangelength:[2,20]
                    },
                    "tbPersonalData.realName":{
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
                        email:true
                    },
                    "idCard":{
                        required:true,
                        rangelength:[18,18]
                    },
                    "qq":{
                        digits:true,
                        rangelength:[4,20]
                    }
                },
                messages:{
                    "tbPersonalData.name":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "tbPersonalData.realName":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "mobilePhone":{
                        required:"必填",
                        number:"请输入正确的手机号!",
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
                    "idCard":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "qq":{
                        digits: "请输入正确的qq号",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    }
                }  
            });   
        });
</script>

<script type="text/javascript">
	$(function(){
		//验证用户名 
		$("#mobilePhone").blur(function(){//给用户编号添加失去焦点事件
			var url = "/front/SysJson_checkMobilePhone.action";
			var id = $(this).val();//获取用户编号的输入值 
			var inputValue = $(this).attr("mobilePhone");//获取原来的用户编号
			id = $.trim(id);
			if(id != inputValue){//如果输入的和原来的不等，校验用户编号
				if(id != ""){
					$.post(url,{"mobilePhone":id},function(data){//发送请求验证用户编号 
						if(data == "true"){//如果返回 true,提示已存在 
							$("#gradeInfo").html("<font color=\"red\">您输入的手机号已存在！请重新输入！</font>"); 
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

<!-- 调用预览图片文件 -->
<script type="text/javascript">  
        $(function () {  
            new uploadPreview({ UpBtn: "up_img", DivShow: "imgdiv", ImgShow: "imgShow" });
        });  
</script>

<script type="text/javascript">  
        //多行文本输入框剩余字数计算  
        function checkMaxInput(obj, maxLen) {  
            if (obj == null || obj == undefined || obj == "") {  
                return;  
            }  
            if (maxLen == null || maxLen == undefined || maxLen == "") {  
                maxLen = 1000;  
            }  
  
            var strResult;  
            var $obj = $(obj);  
            var newid = $obj.attr("id") + 'msg';  
  
            if (obj.value.length > maxLen) { //如果输入的字数超过了限制  
                obj.value = obj.value.substring(0, maxLen); //就去掉多余的字  
                strResult = '<span id="' + newid + '" class=\'Max_msg\' ><br/>剩(' + (maxLen - obj.value.length) + ')字</span>'; //计算并显示剩余字数  
            }  
            else {  
                strResult = '<span id="' + newid + '" class=\'Max_msg\' ><br/>剩(' + (maxLen - obj.value.length) + ')字</span>'; //计算并显示剩余字数  
            }  
  
            var $msg = $("#" + newid);  
            if ($msg.length == 0) {  
                $obj.after(strResult);  
            }  
            else {  
                $msg.html(strResult);  
            }  
        }  
  
        //清空剩除字数提醒信息  
        function resetMaxmsg() {  
            $("span.Max_msg").remove();  
        }  
</script>  

</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">健康卡管理</a></li>
    <li><a href="#">导师管理</a></li>
    <li><a href="#">添加导师</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>添加导师</span></div>
    <form action="<%= basePath%>/biz/TbPersonalData_addWeb.action" method="post" id="commonform" enctype="multipart/form-data">

    <ul class="forminfo">
    <li><input name="flagType" id="flagType" type="hidden" value="1"/></li>
    <li><input name="roleId" id="roleId" type="hidden" class="dfinput1" value="teacher_admin" /></li>
    <li><label>用户昵称：</label><input name="tbPersonalData.name" id="tbPersonalData.name" type="text" class="dfinput" /><i><font color="#FF0000">*必填</font>不能超过20个字母</i></li>
    <li><label>真实姓名：</label><input name="tbPersonalData.realName" id="tbPersonalData.realName" type="text" class="dfinput" /><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
    <li ><label>性别：</label>
        <div class="radio">
        <input type="radio" name="sex" value="1" id="RadioGroup1_1"  checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="sex" value="0" id="RadioGroup1_0"/>女
        </div>
    </li>
    <li ><label>导师级别：</label>
        <div class="radio">
        <input type="radio" name="level" value="0" id="RadioGroup1_1"  checked="checked"/>导师&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="level" value="1" id="RadioGroup1_2"  checked="checked"/>普通导师&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="level" value="2" id="RadioGroup1_0"/>高级导师
        </div>
    </li>
<li><label>手机号：</label><input name="mobilePhone" id="mobilePhone" type="text" class="dfinput" /><i><font color="#FF0000">*必填</font></i><span id="gradeInfo"></span></li>
    <li><label>QQ号码：</label><input name="qq" type="text" class="dfinput"  /></li>
    <li><label>电子邮箱：</label><input name="email" id="email" type="text" class="dfinput"/><i><font color="#FF0000">*必填</font></i></li>
    <li><label>婚姻状况：</label>
        <div class="radio">
        <input name="maritalStatus" id="RadioGroup2_0" type="radio" value="0" checked="checked"/>未婚&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="maritalStatus" id="RadioGroup2_1" type="radio" value="1"/>已婚
        </div>
    </li>
    <li><label>职业：</label><input name="professional" id="professional" type="text" class="dfinput"/></li>
    <li><label>身份证号：</label><input name="idCard" id="idCard" type="text" class="dfinput" /><i><font color="#FF0000">*必填</font></i></li>
    <li><label>出生年月日时：</label><input name="birthday" id="birthday" type="text" class="dfinput" onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></li>
    <li><label>现居住地：</label><input name="address" id="address" type="text" class="dfinput" /><i><font color="#FF0000">*必填</font></i></li>
    <li><label>户籍所在地：</label><input name="placeDomicile"type="text" class="dfinput" /></li>
    <li><label>指导方向：</label><input name="direction"type="text" class="dfinput" /></li>
    <li><label>导师简介：</label><textarea name="introduction" style="overflow:visible;"  onkeydown="checkMaxInput(this,1000)"  
            onkeyup="checkMaxInput(this,1000)" onfocus="checkMaxInput(this,1000)" onblur="checkMaxInput(this,1000);resetMaxmsg()"onpropertychange="if(value.length>1000) value=value.substr(0,1000)"></textarea></li>
    
    <li>
    	<label><font style="font-weight: bold">头像</font></label>
    	<input type="hidden" name="strImageType" id="strImageType"/>
    	<label style="width: 200px; clear:right;">
  			<div id="imgdiv" class="imageDiv"><img id="imgShow" width="150" height="150"/></div>
			<input type="file" name="upload" id="up_img">
			<span id="msgUp_img" class="msgRed">(图片大小必须小于10M)</span>
    	</label>
    </li>
    
    <li><br/><br/><label>&nbsp;</label><input name="edit_btn" type="submit" class="btn" value="确认保存"/>
    <input name="asd" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='javascript:history.go(-1);'"/></li>
    </ul>
    </form>
    </div>
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo">
        <span><img src="<%= basePath%>images/ticon.png" /></span>
        <div class="tipright">
        <p>您输入的手机号已存在！</p>
        <cite>请重新输入新的手机号！</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
</body>

</html>
