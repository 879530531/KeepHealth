<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>公司管理—新增</title>
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
<!-- 验证部门编码是否已存在 -->
<script type="text/javascript">
	$(function(){
		//验证用户名 
		$("#unitCod").blur(function(){//给用户编号添加失去焦点事件
			var url = "/front/SysJson_checkUnitName.action";
			var id = $(this).val();//获取用户编号的输入值 
			var inputValue = $(this).attr("unitCod");//获取原来部门编号
			id = $.trim(id);
			if(id != inputValue){//如果输入的和原来的不等，校验部门编号
				if(id != ""){
					$.post(url,{"checkName":id},function(data){//发送请求验证用户编号 
						if(data == "true"){//如果返回 true,提示已存在 
							$("#gradeInfo").html("<font color=\"red\">您输入的编号已存在！请重新输入！</font>"); 
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
                    "unitArea":{
                        required:true,
                        rangelength:[2,50]
                    },
                
                    "unitName":{
                        required:true,
                      
                      rangelength:[2,20] 
                    },
                      "unitType":{
                        required:true,
                      
                      rangelength:[1,5] 
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
                      "unitType":{
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
        <script type="text/javascript">
	$(function(){
		//验证用户名 
		$("#unitCod").blur(function(){//给用户编号添加失去焦点事件
			var url = "/front/SysJson_checkunitCod.action";
			var id = $(this).val();//获取用户编号的输入值 
			var inputValue = $(this).attr("unitCod");//获取原来的用户编号
			id = $.trim(id);
			if(id != inputValue){//如果输入的和原来的不等，校验用户编号
				if(id != ""){
					$.post(url,{"unitCod":id},function(data){//发送请求验证用户编号 
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
</head>
<body>
 
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">系统管理</a></li>
    <li><a href="#">公司管理</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>公司信息</span></div>
    <form action="<%= basePath%>/biz/SysUnit_add.action" method="post" id="commonform">
    <ul class="forminfo">
    <li><label>所属区域</label><input name="unitArea" id="unitArea" type="text"  class="dfinput"/><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
    
    <li><label>公司名称</label><input name="unitName" id="unitName" type="text" class="dfinput" /><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
    <li><label>公司类型</label><select class="dfinput" name="unitType" id="unitType">
    <option value ="机关">机关</option>  
    <option value ="事业">事业</option>  
    <option value="企业">企业</option>  
    <option value="其他">其他</option> </select><i><font color="#FF0000">*必填</font>请选择！</i></li>
    <li><label>公司隶属</label><input name="unitSubjection" id="unitSubjection" type="text"  class="dfinput"/><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
   
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
