<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改角色权限信息</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script> 
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
                    "unitArea":{
                        required:true,
                        rangelength:[2,50]
                    },
                 
                  
                    "unitName":{
                        required:true,
                   
                        rangelength:[2,20] 
                    },
                    "unitSubjection":{
                        required:true,
                       
                        rangelength:[2,20]
                    },
                   
                    "businessType":{
                        required:true,
                       
                        rangelength:[1,20]
                    }
                },
                messages:{
                     "unitArea":{
                        required:"必填",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                 
                    "unitName":{
                        required: "必填",
                     
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "UnitSubjection":{
                        required: "必填",
                     
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                
                     "businessType":{
                        required: "必填",
                     
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
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
    <li><a href="#">公司管理</a></li>
    <li><a href="#">基本信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>公司基本信息</span></div>
    <form action="<%= basePath%>/biz/SysUnit_update.action" method="post" id="commonform">
     
    <ul class="forminfo">
    <input name="sysUnit.UnitId" type="hidden" value="${sysUnit.unitId}"/>
    <input name="sysUnit.unitCod" type="hidden"  class="dfinput" value="${sysUnit.unitCod}"/>
    <li><label>所属区域</label><input name="sysUnit.unitArea" type="text"  class="dfinput" value="${sysUnit.unitArea}"/><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
    <li><label>部门名称</label><input name="sysUnit.unitName" type="text"  class="dfinput" value="${sysUnit.unitName}"/><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
    <li><label>部门类型</label><select class="dfinput" name="unitType" id="unitType">
    <option value ="机关">机关</option>  
    <option value ="事业">事业</option>  
    <option value="企业">企业</option>  
    <option value="其他">其他</option> </select><i><font color="#FF0000">*必填</font>请选择！</i></li>
    <li><label>单位隶属</label><input name="sysUnit.unitSubjection" type="text"  class="dfinput" value="${sysUnit.unitSubjection}"/><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
   
    <li><label>业务类型</label><select class="dfinput" name="businessType" id="businessType">
    <option value ="本管理部门">本管理部门</option>  
    <option value ="帮扶单位">帮扶单位</option>  
    <option value="企业">企业</option>  
   </select><i><font color="#FF0000">*必填</font>请选择</i></li>
    <li><label>&nbsp;</label><input name="add_btn" type="submit" class="btn" value="确认保存"/>
    <input name="add_btn" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='javascript:history.go(-1);'"/>
    </li>
    </ul>
    </form>
    </div>

</body>

</html>