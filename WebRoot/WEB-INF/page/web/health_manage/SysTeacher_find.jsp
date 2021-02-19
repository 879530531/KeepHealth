<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导师信息</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script>

<script type="text/javascript">
	$(function(){
		var url = "/front/SysJson_checkRoleName.action";
		$("#roleId").blur(function(){//给角色编号添加失去焦点事件
			var id = $("input[name='roleId']").val();//获取角色编号值 
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
			//当没有添加权限时使用验证
			jQuery.validator.addMethod("checkRightId", function(value, element) {   
			    if($("input[name='rightId']").val()==undefined){
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
                    "roleId":{
                        required:true,
                        rangelength:[2,20]
                    },
                    "roleName":{
                        required:true,
                        rangelength:[2,20]
                    },
                    "roleSortOrder":{
                        required:true,
                        digits:true,
                        rangelength:[1,4] 
                    },
                    "checkRightId":{
                    	checkRightId:true
                    },
                    "rightId":{
                        required:true
                    }
                },
                messages:{
                    "roleId":{
                        required:"必填",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "roleName":{
                        required:"必填",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "roleSortOrder":{
                        required: "必填",
                        digits:"请输入整数",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
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
    <li><a href="#">健康卡管理</a></li>
    <li><a href="#">导师管理</a></li>
    <li><a href="#">查看导师信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>查看导师信息</span></div>
    <form action="#" method="post" id="commonform">
    <ul class="forminfo">
     <li><label>用户昵称：</label>${name}</li>
    <li><label>真实姓名：</label>${name}</li>
    <li><label>性别：</label>${name}</li>
    <li><label>手机号：</label>${name}</li>
    <li><label>QQ号码：</label>${name}</li>
    <li><label>电子邮箱：</label>${name}</li>
    <li><label>是否已婚：</label>${name}</li>
    <li><label>职业：</label>${name}</li>
    <li><label>身份证号：</label>${name}</li>
    <li><label>出生年月日时：</label>${name}</li>
    <li><label>导师级别：</label>${name}</li>
    <li><label>现居住地：</label>${name}</li>
    <li><label>户籍所在地：</label>${name}</li>
    <li><label>指导方向：</label>${name}</li>
    <li><label>导师简介：</label>${name}</li>
    </ul>
    </form>  
    </div>
</body>

</html>
