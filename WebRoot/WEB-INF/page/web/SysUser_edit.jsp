<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改用户信息</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/common.js"></script>

<script type="text/javascript" src="<%= basePath%>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript" src="<%= basePath%>/third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>/third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="<%=path %>/js/select-ui.min.js"></script>
<script type="text/javascript">
       $(document).ready(function(){
              var type = $("#userType").val();
              if(type == 3){
                     $("input:radio").eq(0).attr("checked","true");
              }
              if(type == 2){
                     $("input:radio").eq(1).attr("checked","true");
              }
              if(type == 0){
                     $("input:radio").eq(2).attr("checked","true");
              }
       });
</script> 

<script type="text/javascript">
	//默认选中显示之前用户有的角色名称  
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
		$(".dfinput1").each(function(){//循环获取所有角色编号 
			roleId = $(this).attr("value");
			$(".userRole").each(function(){//循环获取该用户拥有的角色编号 
				//判断角色表中的角色编号是否与用户拥有的权限编号是否相同
				if(roleId == $(this).attr("value")){
					//若相同,则选中 
					$("#"+roleId).attr("checked",true);
				}
			});
		});
		
		//验证用户名 
		$("#userId").blur(function(){//给用户编号添加失去焦点事件
			var url = "/front/SysJson_checkUserName.action";
			var id = $(this).val();//获取用户编号的输入值 
			var inputValue = $(this).attr("userId");//获取原来的用户编号
			id = $.trim(id);
			if(id != inputValue){//如果输入的和原来的不等，校验用户编号
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

		
		//验证密码
		
		$("#oldPassword").blur(function(){//给旧密码添加失去焦点事件
			var url = "/front/SysJson_checkUserPasswd.action";
			var pwd = $(this).val();//获取用户输入的密码 
			pwd = $.trim(pwd);
			var rawPwd = $(this).attr("pwdValue");
			if(pwd != ""){
				$.post(url,{"checkName":pwd,"rawPassword":rawPwd},function(data){//发送请求验证输入旧密码
					if(data == "true"){//如果返回 true,提示密码输入有误  
						$("#oldPasswd").html("<font color=\"red\">您输入密码有误！请重新输入！</font>");
						i++;
					}else{
						$("#oldPasswd").html("");
					}
				},"json");
			}
			$("#oldPasswd").html("");
		});
		/**
		已在 jquery validate 中验证
		//验证两次输入的密码是否相同 
		$("#againPassword").blur(function(){
			var againPasswd = $(this).val();//第二次输入的密码
			var newPasswd = $("#newPassword").val();//第一次输入的密码 
			if(againPasswd != newPasswd ){
				$("#againPasswd").html("<font color=\"red\">您两次输入的密码不相同 ！请重新输入！</font>");
			}else{
				$("#againPasswd").html("");
			}
			
		});*/
		
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
                    "newPassword":{
                        rangelength:[6,16]
                    },
                    "sysUser.userPassword":{
                        equalTo:"#newPassword"
                    },
                    "sysUser.userTelephone":{
                    	required:true,
                    	number:true,
                    	rangelength:[10,12]
                    },
                    "sysUser.userQq":{
                    	number:true,
                    	rangelength:[4,20]
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
                    "newPassword":{
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userPassword":{
                    	equalTo:"两次输入密码不一致!"
                    },
                    "sysUser.userTelephone":{
	                    required:"必填",
                    	number:"请输入正确的手机号码！",
                    	rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userQq":{
                    	number:"请输入正确的QQ号！",
                    	rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    }
                }  
            });    
        });
</script>
<script type="text/javascript">
	$(function(){
		//省--市二级联动
		var url = "<%= basePath%>/biz/ComDistrict_queryCity.action";
		var cityVal = $("#cityVal").val();
		var id = $("#provinceId").find("option:selected").attr("id");
		queryCity(id);
		 $("#provinceId").change(function(){
			$("#shijiId option:not(:first)").remove();//清空市级选项
			id = $("#provinceId").find("option:selected").attr("id");
			queryCity(id);
		}); 
		function queryCity(id){
			$.post(url,{"id":id},function(data){
				for(var i = 0; i < data.length; i++){
					if(cityVal == data[i].name){
						$("#shijiId").append("<option  value='"+data[i].name+"' selected='selected'>"+data[i].name+"</option>");
					}else{
						$("#shijiId").append("<option  value='"+data[i].name+"'>"+data[i].name+"</option>");
					}
				}
			},"json"); 
		};
	});
</script>
<script type="text/javascript">
	$(document).ready(function(e){
		$(".select2").uedSelect({
			width:155
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
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">用户管理</a></li>
    <li><a href="#">基本信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>用户基本信息</span></div>
    <!-- <input type="hidden" name="sysUser.userType" value="${sysUser.userType}"  id="userType"/>  -->
    
    <form action="<%= basePath%>/biz/SysUser_update.action" method="post" id="commonform">
     <input type="hidden" name="sysUser.id" value="${sysUser.id}"/>
     <input name="oldPassword" type="hidden"  value="${sysUser.userPassword }" /> 
     <!-- <input type="hidden" name="sysUser.userSex" value="${sysUser.userSex}"/> -->
      <input type="hidden" name="sysUser.userAge" value="${sysUser.userAge}"/>
      <input type="hidden" name="telephone" value="${sysUser.userTelephone}"/>
      <input type="hidden" name="userN" value="${sysUser.userName}"/>
     
     
     
     
    <ul class="forminfo">
    <li><label>用户编号</label><input name="sysUser.userId" type="text" readonly="ture" id="userId" class="dfinput" value="${sysUser.userId}" userId="${sysUser.userId}"/><i><font color="#FF0000">*用户编号不可更改</font></i></li>
    <li><label>登录名</label><input name="sysUser.userName" type="text"  class="dfinput" id="checkName" value="${sysUser.userName}"/><i><font color="#FF0000">*必填</font>不能超过20个字符</i><span id="gradeInfo1"></span></li>
    <li><label>真实姓名</label><input name="sysUser.userRealName" type="text" class="dfinput" value="${sysUser.userRealName}" /><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
    <li><label>新密码</label><input id="newPassword" name="newPassword" type="password"  class="dfinput" /><i><font color="#FF0000">(若不修改可不填)</font>6-16位字母、数字或下滑线组成</i></li>
    <li><label>确认密码</label><input id="againPassword" name="sysUser.userPassword" type="password"  class="dfinput" /><span id="againPasswd"></span></li>
   
    <li ><label>性别：</label>
        <div class="radio">
        <input type="radio" name="sysUser.userSex" value="1" id="RadioGroup1_1"<c:if test="${sysUser.userSex==1}">checked="checked"</c:if>/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="sysUser.userSex" value="0" id="RadioGroup1_0"<c:if test="${sysUser.userSex==0}">checked="checked"</c:if>/>女
        </div>
    </li>
    <li><label>手机号</label><input name="sysUser.userTelephone" type="text" id="mobilePhone" class="dfinput" value="${sysUser.userTelephone}"/><i><font color="#FF0000">*必填</font></i><span id="gradeInfo"></span></li>
   <li><label>邮箱</label><input name="sysUser.userEmail" type="text" class="dfinput" value="${sysUser.userEmail}"></input></li>
    <li><label>QQ</label><input name="sysUser.userQq" type="text" class="dfinput" value="${sysUser.userQq}"></input></li> 
    
   
    
  
    <li><label>所属单位</label>
    <div class="vocation">
    	<select id="unitName" name="unitName" class="select2">
     <s:iterator value="sysUnitList" id="idd">
    <option value ="${idd.unitName}">${idd.unitName}</option> 
    </s:iterator>
  	</select>
    	</div>
    </li>
   <li><label><font style="font-weight: bold">类别</font></label>
        <div class="radio">
       <!--  <label><input class="radio1"  type ="radio" name="sysUser.userType"  value="3" ></input>管理公司</label> -->
        <input type ="radio" name="sysUser.userType" id="RadioGroup2_1" value="3"<c:if test="${sysUser.userType==3}">checked="checked"</c:if>/>超级管理员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type ="radio" name="sysUser.userType" id="RadioGroup2_0" value="2"<c:if test="${sysUser.userType==2}">checked="checked"</c:if>/> 导师 
        </div>
    </li>
    
    <li>
 <label><font style="font-weight: bold">角色名称</font></label>
 
   <!-- <input type="text" name="checkRoleId" readonly="readonly" />-->
  
    	<s:iterator value="roles" id="id">
    		<li style="display:inline"><input name="roleId" id="${roleId}" type="checkbox" class="dfinput1" value="${roleId}" />${roleName}</li>
    	</s:iterator>
             <input type="text" style="visibility: hidden;" />
    	  </li>
    </ul>
     <ul class="seachform">
     <br/>
     
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
  <li><label>&nbsp;</label><input name="add_btn" type="submit" class="btn" value="确认保存"/>
 <input name="add_btn" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='javascript:history.go(-1);'"/>
  </li>
    </ul>
    </form>
    <s:iterator value="userRoles" id="w">
     	 <li><input  name="roleId"  type="hidden" class="userRole" value="${roleId}" /></li>
     </s:iterator>
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
    
    	<div class="tip1">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo">
        <span><img src="<%= basePath%>images/ticon.png" /></span>
        <div class="tipright">
        <p>修改失败，您输入的登录名已存在！</p>
        <cite>请重新输入新的登录名！</cite>
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
	   };
   };
   function selectItem(){                           //当选择景点后赋值到文本框，并清除下拉框
        var strMerchantName= $("#tour_items").find("option:selected").text();                                   //获取被选中的option的文本
        var merchantId = $("#tour_items").find("option:selected").val();                                           //获取被选中的option的值
        $(" #merchant").val(strMerchantName);
        $(" #merchantId").val(merchantId);
        $("#items").html("");
   };
   
   function hideItems(){                        //当鼠标离开文本框时触发该函数清除下拉框
       $("#items").html("");                                        
   };
</script>
</html>
