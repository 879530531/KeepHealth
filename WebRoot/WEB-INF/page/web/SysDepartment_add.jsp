<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色权限-新增</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script>
<script>
var  _contextPath="<%=path%>";
var  _modulePath=_contextPath+"/sys/";

$(document).ready(function(e) {
    $(".btn").click(function(){
		_sbmForm(_modulePath+"textures_add.action?view=list","");
		});
});

</script>
<!-- 验证权限编号是否已存在 -->
<script type="text/javascript">
	$(function(){
		var url = "/front/SysJson_checkRightName.action";
		$("#deptId").blur(function(){//给角色编号添加失去焦点事件
			var id = $("input[name='deptId']").val();//获取角色编号值 
			$.post(url,{"checkName":id},function(data){//发送请求验证角色编号 
				if(data == "no"){//如果返回 no,提示已存在 
					$("#gradeInfo").html("<font color=\"red\">您输入的编号存在！请重新输入！</font>"); 
				}else{//否则隐藏 
					$("#gradeInfo").hide();
				}
			},"json");
		});
	});
</script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript">
        $(function(){
			
			//如果是新增成功，会返回1，如果是1，则提示保存成功
			if("1" == "${actionState}"){
				alert('保存成功！');
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
                   
                    "deptCod":{
                        required:true,
                        rangelength:[4,10]
                    },
                    "deptName":{
                        required:true,
                        rangelength:[4,10]
                    },
                    "deptUnit":{
                        required:true,
                        
                        rangelength:[4,10] 
                    },
                
                messages:{
                  
                   "deptCod":{
                        required:"必填",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "deptName":{
                        required:"必填",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "deptUnit":{
                        required: "必填",
                        
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                   
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
    <li><a href="#">系统管理</a></li>
    <li><a href="#">新增部门</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>部门信息</span></div>
    <form action="<%= basePath%>/biz/SysDepartment_add.action" method="post" id="commonform">
    <ul class="forminfo"> 
   
    <li><label>部门名称</label><input name="deptName" id="deptName" type="text" class="dfinput" /><i><font color="#FF0000">*必填</font>不能超过10个汉字</i></li>
   
    <li><label>所属部门</label><input name="deptUnit" id="deptUnit" type="text" class="dfinput" /><i><font color="#FF0000">*必填</font>不能超过10个汉字</i></li>
    
    <li><label>&nbsp;</label><input name="add_btn" type="submit" class="btn" value="确认保存"/>
    <input name="add_btn" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='javascript:history.go(-1);'"/>
    </li>
    </ul>
    </form>
    
    </div>


</body>

</html>