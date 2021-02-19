<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户-新增</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/select.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%= basePath%>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript" src="<%= basePath%>/third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>/third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="<%=path %>/js/select-ui.min.js"></script>
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
		if("have1" == "${tib}"){
			$(".tip1").fadeIn(100);
			$(".tiptop a").click(function(){
 			$(".tip1").fadeOut(200);
				});

  			$(".sure1").click(function(){
  			$(".tip1").fadeOut(100);
				});

			$(".cancel1").click(function(){
			$(".tip1").fadeOut(100);
				});
			}
			//如果是新增成功，会返回1，如果是1，则提示保存成功
			if("1" == "${actionState}"){
				alert('保存成功！');
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
                    "sysUser.userId":{
                        required:true,
                        rangelength:[1,20]
                    },
                    "sysUser.userName":{
                        required:true,
                        rangelength:[2,20]
                    },
                    "sysUser.userRealName":{
                        required:true,
                        rangelength:[2,20]
                    },
                    "sysUser.userPassword":{
                        required:true,
                        rangelength:[6,16]
                    },
                    "sysUser.userTelephone":{
                        required:true,
                        number:true,
                        rangelength:[10,12]
                    },
                    "sysUser.userAddress":{
                        required:true,
                        rangelength:[2,150]
                    },
                    "sysUser.userEmail":{
                        email:true
                    },
                    "sysUser.userWeixin":{
                        rangelength:[2,30]
                    },
                    "sysUser.userWeibo":{
                        rangelength:[2,30]
                    },
                    "sysUser.userQq":{
                        digits:true,
                        rangelength:[4,20]
                    },
                    "sysUser.userAge":{
                        digits:true,
                        rangelength:[1,3]
                    }
                },
                messages:{
                    "sysUser.userId":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userName":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userRealName":{
                        required: "必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userPassword":{
                    	required: "必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userTelephone":{
                        required:"必填",
                        number:"请输入正确的手机号!",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userAddress":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")

                    },
                    "sysUser.userEmail":{
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userWeixin":{
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userWeibo":{
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userQq":{
                        number: "请输入正确的qq号",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                     "sysUser.userAge":{
                        number: "请输入正确的年龄",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    }
                }  
            });   
        });
</script>
 
<script type="text/javascript">
	$(function(){
		//验证手机号 
		$("#checkName").blur(function(){//给用户编号添加失去焦点事件
			var url = "/front/SysJson_checkUser.action";
			var id = $(this).val();//获取用户编号的输入值 
			var inputValue = $(this).attr("checkName");//获取原来的用户编号
			id = $.trim(id);
			if(id != inputValue){//如果输入的和原来的不等，校验用户编号
				if(id != ""){
					$.post(url,{"checkName":id},function(data){//发送请求验证用户编号 
						if(data == "true"){//如果返回 true,提示已存在 
							$("#gradeInfo1").html("<font color=\"red\">您输入的登录名已被使用！</font>"); 
						}else{
							$("#gradeInfo1").html("");
						}
					},"json");
				}
			}
			$("#gradeInfo1").html("");
		});
	});

</script>

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
							$("#gradeInfo").html("<font color=\"red\">您输入的手机号已有会员或导师使用！</font>"); 
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

<script type="text/javascript">
	$(document).ready(function(e){
		$(".select2").uedSelect({
			width:155
		});
	});
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">系统管理</a></li>
    <li><a href="#">新增用户</a></li>
    </ul>
    </div>
    
    <div class="formbody"  id="tab1">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form action="<%= basePath%>/biz/SysUser_add.action" method="post" id="commonform">
    <ul class="forminfo">
    <li><label>登录名</label><input name="sysUser.userName" type="text" id="checkName" class="dfinput" /><i><font color="#FF0000">*必填</font>不能超过20个字符</i><span id="gradeInfo1"></span></li>
    <li><label>真实姓名</label><input name="sysUser.userRealName" type="text" class="dfinput" /><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
 	<li><label>密码</label><input name="sysUser.userPassword" type="password" class="dfinput" /><i><font color="#FF0000">*必填</font>6-16位字母、数字或下滑线组成</i></li>
    <li><label>手机号</label><input name="sysUser.userTelephone" id="mobilePhone" type="text" class="dfinput"  /><i><font color="#FF0000">*必填</font>11位大陆手机号</i><span id="gradeInfo"></span></li>
  
    
     <li><label>性别</label>
        <label><input class="radio1"  type ="radio" name="sysUser.userSex"  value="1" checked="checked"></input>男</label> 
        <label><input class="radio1"  type ="radio" name="sysUser.userSex"  value="2" ></input>女</label> 
        
    </li>
    <li><label>年龄</label><input name="sysUser.userAge"type="text" class="dfinput" ></input></li>
    <li><label>邮箱</label><input name="sysUser.userEmail"type="text" class="dfinput" ></input></li>
  
    <li><label>QQ</label><input name="sysUser.userQq"type="text" class="dfinput" ></input></li>
        
    <li><label>所属单位</label>
    <div class="vocation">
    	<select id="unitName" name="sysUser.unitName" class="select2">
     <s:iterator value="sysUnitList" id="idd">
    <option value ="${idd.unitName}">${idd.unitName}</option> 
    </s:iterator>
  	</select>
    	</div>
</li>
  <li><label>类别</label>
        <label><input class="radio1"  type ="radio" name="sysUser.userType"  value="3" checked="checked"></input>超级管理员</label>
        <label><input class="radio1"  type ="radio" name="sysUser.userType"  value="2" checked="checked" ></input>导师 </label> 
        <!-- <label><input class="radio1" type ="radio" name="sysUser.userType"  value="0" ></input> 用户 </label>  -->
    </li>
    <li><label>角色名称</label>
    	<input type="text" name="checkRoleId" readonly="readonly" />
    	<s:iterator value="roles" id="id">
    		<li style="display:inline"><input name="roleId" id="roleId" type="checkbox" class="dfinput1" value="${roleId}" />${roleName}</li>
    	</s:iterator>
    </li>
     </ul>
     <ul class="seachform">
     
    <li><label>&nbsp;&nbsp;&nbsp;</label><label>地址</label></li>
       <li><label></label>
    	<div class="vocation">
    	<select id="s_province" name="province" class="select2">
  	</select>
  	<script  src="/js/area.js" type="text/javascript"></script>
<script type="text/javascript">_init_area();</script>
    	</div>
    	</li>
    	<li><label></label>
    	<div class="vocation">
    	<select id="s_city" name="city"  class="select2">
    	</select>
    	 	<script  src="/js/area.js" type="text/javascript"></script>
<script type="text/javascript">_init_area();</script>
    	</div>
    	</li>
    	    	<li><label></label>
    	<div class="vocation">
    	<select id="s_county" name="county"  class="select2">
    	</select>
    	 	<script  src="/js/area.js" type="text/javascript"></script>
<script type="text/javascript">_init_area();</script>
    	</div>
    	</li>
    </ul>
    <ul class="forminfo">
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/>
    <input name="add_btn" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='javascript:history.go(-1);'"/>
    </li>
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
    
    	<div class="tip1">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo">
        <span><img src="<%= basePath%>images/ticon.png" /></span>
        <div class="tipright">
        <p>您输入的用户名已存在！</p>
        <cite>请重新输入新的用户名！</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure1" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel1" value="取消" />
        </div>
    
    </div>
</body>


<script type="text/javascript">

    function find(){
        var strMerchantName = $("#merchant").val();             //获取搜索条件
        if(strMerchantName.trim() !="" || strMerchantName != null){                        
            $.ajax({
			   type: "POST",
			   url: "<%= basePath%>/biz/SysMerchantUnit_findByMerchantName.action",
			   data: {"strMerchantName":strMerchantName},
			   dataType: "json",				   
			   success: function(msg){    
	              var content = "<select id='tour_items' onclick=\"selectItem()\">";              //根据返回的json来生成景点列表下拉框
	              for(var i=0; i< msg.length; i++){
	                    content  = content + "<option value='"+msg[i].merchantId+"'>"+msg[i].merchantName+"</option>";
	              }
	              content  = content + "</select>"; 
	              $("#items").html(content);
	              itemsLength(msg.length);                          //根据json数组的长度来定义下拉框的长度
		     }
           });
       }
    }
    function itemsLength(len){                                  //根据json数组的长度来定义下拉框的长度
	    if(len <=5 && len > 1){
	         $("#tour_items").attr("size", len);
	    }else if(len == 1){
	         $("#tour_items").attr("size", 2);
	    }else if(len == 0){
	        $("#items").html("");
	        $("#merchant").val("-----该商家不存在-----");
	        setTimeout(function(){ $(' #merchant').val(''); }, 2000);
	    }else{
	        $("#tour_items").attr("size",5);
	   }   
   }
   function selectItem(){                           //当选择景点后赋值到文本框，并清除下拉框
        var strMerchantName= $("#tour_items").find("option:selected").text();                                   //获取被选中的option的文本
        var merchantId = $("#tour_items").find("option:selected").val();                                           //获取被选中的option的值
        $(" #merchant").val(strMerchantName);
        $(" #merchantId").val(merchantId);
        $("#items").html("");
   } 
   
   function hideItems(){                        //当鼠标离开文本框时触发该函数清除下拉框
       $("#items").html("");                                        
   }
</script>
</html>
