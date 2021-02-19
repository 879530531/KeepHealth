<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改会员信息</title>
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
                        rangelength:[1,20]
                    },
                    "sysRole.roleSortOrder":{
                        required:true,
                        rangelength:[1,4]
                    },
                    "rightId":{
                    	required:true
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
                    },
                    "tbPersonalData.birthday":{
                         required:true,
                        rangelength:[2,150]
                    }
                    
                },
                messages:{
                "sysRole.roleId":{
                		required:""
                	},
                    "tbPersonalData.name":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "tbPersonalData.realName":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "rightId":{
                    	required:""
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
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "tbPersonalData.birthday":{
                        required:"必填",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
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

</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">健康卡管理</a></li>
    <li><a href="#">会员管理</a></li>
     <li><a href="#">基本信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>会员基本信息</span></div>
   <%--会员编号和联系方式不用改，但要输出值，value的值除了密码也要输出 --%> 
    <form action="<%= basePath%>/biz/TbPersonalData_updateWeb.action" method="post" id="commonform" enctype="multipart/form-data">  
    <ul class="forminfo">
    <li><input name="tbPersonalData.flagType" type="hidden" value="${tbPersonalData.flagType}"/></li>
    <li><input name="tbPersonalData.password" type="hidden" value="${tbPersonalData.password}"/></li>
    <li><input name="tbPersonalData.personalId" type="hidden" value="${tbPersonalData.personalId}"/></li>
    <li><label>会员编号：</label><input name="tbPersonalData.personalNumber"  type="text"  class="dfinput" value="${tbPersonalData.personalNumber}" readonly="readonly"/></li>
     <li><label>联系号码：</label><input name="tbPersonalData.mobilePhone" type="text"  class="dfinput" value="${tbPersonalData.mobilePhone}" readonly="readonly"/></li>
    <li><label>会员昵称：</label><input name="tbPersonalData.name" type="text" id="tbPersonalData.name" class="dfinput" value="${tbPersonalData.name}"/><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
    <li><label>真实姓名：</label><input name="tbPersonalData.realName" type="text" id="tbPersonalData.realName" class="dfinput" value="${tbPersonalData.realName}" /><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
    <li ><label>性别：</label>
        <div class="radio">
        <input type="radio" name="tbPersonalData.sex" value="1" id="RadioGroup1_1"<c:if test="${tbPersonalData.sex==1}">checked="checked"</c:if>/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="tbPersonalData.sex" value="0" id="RadioGroup1_0"<c:if test="${tbPersonalData.sex==0}">checked="checked"</c:if>/>女
        </div>
    </li>
    <li><label>QQ号码：</label><input name="tbPersonalData.qq" type="text" class="dfinput" value="${tbPersonalData.qq}"></input></li>
    <li><label>电子邮箱：</label><input name="tbPersonalData.email" type="text" class="dfinput" id="email" value="${tbPersonalData.email}"></input><i><font color="#FF0000">*必填</font></i></li>
    <li><label>出生日期：</label><input name="tbPersonalData.birthday" type="text" class="dfinput" value="${tbPersonalData.birthday}" onClick="WdatePicker({lang:'zh-cn',maxDate:new Date()});"></input><i><font color="#FF0000">*必填</font></i></li>
    <li><label>身份证号码：</label><input name="tbPersonalData.idCard" type="text" class="dfinput" id="idCard" value="${tbPersonalData.idCard}"></input><i><font color="#FF0000">*必填</font></i></li>
    <li><label>婚姻状况：</label>
        <div class="radio">
        <input type="radio" name="tbPersonalData.maritalStatus" value="0" <c:if test="${tbPersonalData.maritalStatus==0}">checked="checked"</c:if>/>未婚&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="tbPersonalData.maritalStatus" value="1" <c:if test="${tbPersonalData.maritalStatus==1}">checked="checked"</c:if>/>已婚
        </div>
    </li>
    <li><label>职业：</label><input name="tbPersonalData.professional" type="text" class="dfinput" value="${tbPersonalData.professional}"></input></li>
    <li><label>现居住地址：</label><input name="tbPersonalData.address" type="text" class="dfinput"  value="${tbPersonalData.address}"></input><i><font color="#FF0000">*必填</font></i></li>
    <li><label>户籍所在地：</label><input name="tbPersonalData.placeDomicile" type="text" class="dfinput" value="${tbPersonalData.placeDomicile}"></input></li>
    <li><label>会员级别：</label><input name="tbPersonalData.level" type="hidden" value="${tbPersonalData.level}"/>
    <div class="radio">
        <c:choose>
        	<c:when test="${0 == tbPersonalData.level}">
        		<td>vip会员</td>
	        </c:when>
	        <c:when test="${1 == tbPersonalData.level}">
	        	<td>高级会员</td>
	        </c:when>
	        <c:otherwise>
	        	<td></td>
	        </c:otherwise>
        </c:choose>
    </div>
    </li>
    <li><label>会员开始时间：</label><input name="tbPersonalData.startTime" type="text"  class="dfinput" value="${tbPersonalData.startTime}" readonly="readonly"/></li>
    <li><label>会员结束时间：</label><input name="tbPersonalData.endTime" type="text"  class="dfinput" value="${tbPersonalData.endTime}" readonly="readonly"/></li>
    <li><label>头像：</label>
    	<input type="hidden" name="strImageType" id="strImageType"/>
    	<label style="width: 200px; clear:right;">
  			<div id="imgdiv" class="imageDiv"><img src="/upload/${tbPersonalData.image}" alt="${tbPersonalData.name}的头像" id="imgShow" width="150" height="150"/></div>
			<input type="file" name="upload" id="up_img"><input type="hidden" value="${tbPersonalData.image}" name="tbPersonalData.image" />
			<span id="msgUp_img" class="msgRed">(图片大小必须小于10M)</span>
    </li>
    
    <li><br/><br/><label>&nbsp;</label><input name="edit_btn" type="submit" class="btn" value="确认保存"/>
    <input name="asd" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='javascript:history.go(-1);'"/></li>
    </ul>
    </form>
    
   
    </div>

</body>

</html>
