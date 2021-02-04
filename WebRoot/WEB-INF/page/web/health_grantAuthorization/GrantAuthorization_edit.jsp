<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改角色信息</title>
    <link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
    <script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=path %>/js/common.js"></script>

    <script type="text/javascript">
        $(function(){
            $(".dfinput1").each(function(){//循环获取所有权限编号
                rightId = $(this).attr("value");
                $(".roleRight").each(function(){//循环获取该角色拥有的权限编号
                    //判断权限表中的权限编号是否与角色拥有的权限编号是否相同
                    if(rightId == $(this).attr("value")){
                        //若相同,则选中
                        $("#rightId_"+rightId).attr("checked",true);
                    }
                });
            });

        });
    </script>

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
        <li><a href="#">学习园地</a></li>
        <li><a href="#">授权管理</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>授权信息</span></div>

    <form action="<%= basePath%>/biz/.action" method="post" id="commonform">
        <ul class="forminfo">
            <li><label>会员姓名</label><label><a href="<%= basePath%>/biz/TbPersonalData_openDetailWeb.action?personalId=${tbPersonalData.personalId}" ><font color="#056dae">${tbPersonalData.realName}</font></a></label></li>
            <li><label>课程名称</label><i>
            </li>
            <li>
                <ul style="margin-left:80px;">
                    <s:iterator value="sysRights" id="id">
                        <li style="display: inline;"><label for="rightId_${rightId}" style="width:150px;"><input name="rightId" id="rightId_${rightId}" type="checkbox" class="dfinput1" value="${rightId}" />${rightName}</label>
                        </li>
                    </s:iterator>
                </ul>
            </li>
            <li><br/><br/><label>&nbsp;</label><input name="add_btn" type="submit" class="btn" value="确认保存"/>
                <input name="add_btn" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='javascript:history.go(-1);'"/>
            </li>
        </ul>
    </form>
    <s:iterator value="roleRights" id="w">
        <li ><input  name="rightId"  type="hidden" class="roleRight" value="${rightId}" />

        </li>
    </s:iterator>
</div>

</body>

</html>
