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
                	"sysRole.roleId":{
                		required:true
                	},
                    "sysRole.roleName":{
                        required:true,
                        rangelength:[1,20]
                    },
                    "sysRole.roleSortOrder":{
                        required:true,
                        rangelength:[1,4]
                    },
                    "rightId":{
                    	required:true
                    }
                    
                },
                messages:{
                "sysRole.roleId":{
                		required:""
                	},
                    "sysRole.roleName":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysRole.roleSortOrder":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "rightId":{
                    	required:""
                    }
                }  
            });    
        });
</script>
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">健康卡管理管理</a></li>
    <li><a href="#">会员管理</a></li>
     <li><a href="#">基本信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>会员信息</span></div>
   <%--会员编号和联系方式不用改，但要输出值，value的值除了密码也要输出 --%>
    <table > 
   <tr><td align='right' height="30">会员编号：</td><td> ${tbPersonalData.personalNumber}</td></tr> 
     <tr><td align='right' height="30"> 联系号码：</td><td> ${tbPersonalData.mobilePhone}</td></tr> 
    <tr><td align='right' height="30"> 会员昵称： </td><td>${tbPersonalData.name}</td></tr> 
    <tr><td align='right' height="30">  真实姓名：</td><td> ${tbPersonalData.realName}</td></tr> 
   <tr><td align='right' height="30">     性别： </td><td>
        <c:choose>
        	<c:when test="${0 == tbPersonalData.sex}">
        		女
	        </c:when>
	        <c:when test="${1 == tbPersonalData.sex}">
	        	男
	        </c:when>
	        
        </c:choose>
    </td></tr> 
    <tr><td align='right' height="30">  QQ号码：</td><td> ${tbPersonalData.qq}</td></tr> 
    <tr><td align='right' height="30">  电子邮箱：</td><td> ${tbPersonalData.email}</td></tr>
    <tr><td align='right' height="30">  出生日期： </td><td>${tbPersonalData.birthday}</td></tr> 
    <tr><td align='right' height="30"> 身份证号码： </td><td>${tbPersonalData.idCard}</td></tr> 
    <tr><td align='right' height="30">  婚姻状况： </td><td>
        <c:choose>
        	<c:when test="${0 == tbPersonalData.maritalStatus}">
        		未婚
	        </c:when>
	        <c:when test="${1 == tbPersonalData.maritalStatus}">
	        	已婚
	        </c:when>
	        <c:otherwise>
	        	其他
	        </c:otherwise>
        </c:choose>
    </td></tr> 
   <tr><td align='right' height="30"> 职业：</td><td> ${tbPersonalData.professional}</td></tr> 
    <tr><td align='right' height="30">现居住地址：</td><td> ${tbPersonalData.address}</td></tr> 
    <tr><td align='right' height="30"> 户籍所在地：</td><td> ${tbPersonalData.placeDomicile}</td></tr> 
    <tr><td align='right' height="30">会员级别： </td><td>
        <c:choose>
        	<c:when test="${0 == tbPersonalData.level}">
        		vip会员
	        </c:when>
	        <c:when test="${1 == tbPersonalData.level}">
	        	高级会员
	        </c:when>
	        <c:otherwise>
	        	
	        </c:otherwise>
        </c:choose>
    </td></tr> 
    <tr><td align='right' height="30">会员开始时间： </td><td>${tbPersonalData.startTime}</td></tr> 
   <tr><td align='right' height="30">会员结束时间： </td><td>${tbPersonalData.endTime}</td></tr>
     <tr><td align='right' height="30" valign="top">头像：</td><td><img src="/upload/${tbPersonalData.image}"  alt="${tbPersonalData.name}的头像" width="150" /></td></tr>
     
     
     <tr>    
    <td colspan="2" align='center'>
    <br />
    <br />
       <input  name="asd" type="button" class="btn"  value="返回" onclick="location.href='javascript:history.go(-1);'"/>   
       </td>   
     </tr>
     
   </table>
      </div>

</body>

</html>
