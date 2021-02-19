<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改老师信息</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script> 
<script type="text/javascript" src="<%=path %>/js/uploadPreview.js"></script>
<script type="text/javascript" src="<%=path %>/js/uploadPreview.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>



<script type="text/javascript">
        $(function(){
        
        if("fail" == "${tib}"){
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
			
            $("#commonform").validate({
                errorClass: "errorInfo", //默认为错误的样式类为：error
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
                onkeyup: false,   
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
					checkFrom();
                    form.submit();   //提交表单   
                },   
                rules:{
                	"tbTeacher.teacherName":{
                		required:true,
                		rangelength:[2,20]
                	},
                    "tbPersonalData.realName":{
                        required:true,
                        rangelength:[2,20]
                    },
                     "tbPersonalData.address":{
                    	required:true,
                    	rangelength:[2,150]
                    },
                    "tbPersonalData.email":{
                        required:true,
                        email:true                        
                    },
                    "tbPersonalData.idCard":{
                    	required:true,
                    	rangelength:[18,18]
                    }
                   
                    
                },
                messages:{
                "tbTeacher.teacherName":{
                		required:"必填",
                	    rangelength: $.validator.format("最小长度:{2}, 最大长度:{11}。")
                	},
                    "tbPersonalData.realName":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    
                     "tbPersonalData.address":{
                    	required:"必填",
                    	rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "tbPersonalData.email":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "tbPersonalData.idCard":{
                    	required:"必填",
                    	 rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    }
                 }
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
    <li><a href="#">咨询管理</a></li>
    <li><a href="#">咨询老师</a></li>
     <li><a href="#">修改信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>老师基本信息</span></div>
   <%--会员编号和联系方式不用改，但要输出值，value的值除了密码也要输出 --%> 
    <form action="<%= basePath%>/biz/TbTeacher_updateWeb.action" method="post" id="commonform" enctype="multipart/form-data">  
    <ul class="forminfo">
   
    <li><input name="tbTeacher.teacherId" type="hidden" value="${tbTeacher.teacherId}"/></li>
   
     <li><label>老师名称：</label><input name="tbTeacher.teacherName" type="text"  class="dfinput" value="${tbTeacher.teacherName}" /><i><font color="#FF0000">*必填</font></i></li>

    <li><input name="tbTeacher.teacherPasswork" type="hidden" value="${tbTeacher.teacherPasswork}"/></li>
   <li><input name="tbTeacher.openId" type="hidden" value="${tbTeacher.openId}"/></li>
   
    <li ><label>性别：</label>
        <div class="radio">
        <input type="radio" name="tbTeacher.teacherSex" value="1" id="RadioGroup1_1"<c:if test="${tbTeacher.teacherSex==1}">checked="checked"</c:if>/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="tbTeacher.teacherSex" value="0" id="RadioGroup1_0"<c:if test="${tbTeacher.teacherSex==0}">checked="checked"</c:if>/>女
        </div>
    </li>
        <li>
            <label>老师电话：</label><input name="tbTeacher.teacherPhone" type="text" class="dfinput" value="${tbTeacher.teacherPhone}"/>
        </li>


        <li><label>QQ号码：</label><input name="tbTeacher.teacherQq" type="text" class="dfinput" value="${tbTeacher.teacherQq}"></input></li>
    <li><label>电子邮箱：</label><input name="tbTeacher.teacherEmail" type="text" class="dfinput" value="${tbTeacher.teacherEmail}"></input><i><font color="#FF0000"></font></i></li>
    
    <li><label>婚姻状况：</label>
        <div class="radio">
        <input type="radio" name="tbTeacher.maritalStatus" value="0" <c:if test="${tbTeacher.maritalStatus==0}">checked="checked"</c:if>/>未婚&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="tbTeacher.maritalStatus" value="1" <c:if test="${tbTeacher.maritalStatus==1}">checked="checked"</c:if>/>已婚
        </div>
    </li>
    <li><label>职业：</label><input name="tbTeacher.professional" id="professional" type="text" class="dfinput" value="${tbTeacher.professional}" id="professional}"></input></li>
    <li><label>现居住地址：</label><input name="tbTeacher.address" type="text" class="dfinput" value="${tbTeacher.address}"></input><i><font color="#FF0000"></font></i></li>
    <li><label>户籍所在地：</label><input name="tbTeacher.placeDomicile" type="text" class="dfinput" value="${tbTeacher.placeDomicile}"></input></li>
    <li><label>老师级别：</label>
        <div class="radio">
        <input type="radio" name="tbTeacher.teacherLevel" value="1" <c:if test="${tbTeacher.teacherLevel==1}">checked="checked"</c:if>/>一级导师&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="tbTeacher.teacherLevel" value="2" <c:if test="${tbTeacher.teacherLevel==2}">checked="checked"</c:if>/>二级导师
        <input type="radio" name="tbTeacher.teacherLevel" value="3" <c:if test="${tbTeacher.teacherLevel==3}">checked="checked"</c:if>/>三级导师
       <input type="radio" name="tbTeacher.teacherLevel" value="4" <c:if test="${tbTeacher.teacherLevel==4}">checked="checked"</c:if>/>四级导师
       <input type="radio" name="tbTeacher.teacherLevel" value="5" <c:if test="${tbTeacher.teacherLevel==5}">checked="checked"</c:if>/>五级导师
       
       
        </div>
    </li>   
     <li><label>指导方向：</label><input name="tbTeacher.guidanceDirection" type="text"  class="dfinput" value="${tbTeacher.guidanceDirection}"/></li>
    <li><label>导师简介：</label><textarea name="tbTeacher.teacherIntroduction" style="overflow:visible;" onkeydown="checkMaxInput(this,1000)"  
            onkeyup="checkMaxInput(this,1000)" onfocus="checkMaxInput(this,1000)" onblur="checkMaxInput(this,1000);resetMaxmsg()"onpropertychange="if(value.length>1000) value=value.substr(0,1000)">${tbTeacher.teacherIntroduction}</textarea></li>
    <li><label>头像：</label>
    	<input type="hidden" name="strImageType" id="strImageType"/>
    	<label style="width: 200px; clear:right;">
  			<div id="imgdiv" class="imageDiv"><img src="/upload/${tbTeacher.image}" alt="${tbTeacher.teacherName}的头像" id="imgShow" width="150" height="150"/></div>
			<input type="file" name="upload" id="up_img"><input type="hidden" value="${tbTeacher.image}" name="tbTeacher.image" />
			<span id="msgUp_img" class="msgRed">(图片大小必须小于10M)</span>
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
        <p>修改失败，您输入的手机号已存在！</p>
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
