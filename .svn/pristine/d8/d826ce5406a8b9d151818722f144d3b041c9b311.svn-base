<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>音源修改</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/select.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%= basePath%>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript" src="<%= basePath%>/third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>/third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="<%=path %>/js/select-ui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/uploadPreview.js"></script>
<script type="text/javascript" src="<%=path %>/js/uploadPreview.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
var  _contextPath="<%=path%>";
var  _modulePath=_contextPath+"/sys/";

$(function(){
	if("alreadyHave" == "${tib}"){
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
});
</script>

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
                    "soundNmae":{
                        required:true,
                        rangelength:[1,20]
                    },
                },
                messages:{
                    "soundName":{
                        required:"必填",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
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
    <li><a href="#">念数机管理</a></li>
    <li><a href="#">音源管理</a></li>
    <li><a href="#">编辑音源</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>商品信息</span></div>
    <form action="<%= basePath%>/biz/TbSoundSource_edit.action" method="post" id="commonform"  enctype="multipart/form-data">
    <ul class="forminfo">
	    <input name="soundId" type="hidden" value="${tbSoundSource.soundId}"/>
	    <li><label>名字：</label><input name="soundName" type="text"  class="dfinput" value="${tbSoundSource.soundName}"/><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
		<li ><label>性别声：</label>
	        <div class="radio">
	        <input type="radio" name="soundSex" value="1" <c:if test="${tbSoundSource.soundSex==1}">checked="checked"</c:if>/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <input type="radio" name="soundSex" value="0" <c:if test="${tbSoundSource.soundSex==0}">checked="checked"</c:if>/>女
	        </div>
    	</li>
    	<li ><label>状态：</label>
	        <div class="radio">
	        <input type="radio" name="soundState" value="1" <c:if test="${tbSoundSource.soundState==1}">checked="checked"</c:if>/>上线&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <input type="radio" name="soundState" value="0" <c:if test="${tbSoundSource.soundState==0}">checked="checked"</c:if>/>下线
	        </div>
    	</li>
    	<li><label>&nbsp;</label><input name="add_btn" type="submit" class="btn" value="确认保存"/>
    	<input name="add_btn" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='javascript:history.go(-1);'"/>
    </li>
    </ul>
    </form>
    </div>
	<div class="tip">
		<div class="tiptop">
			<span>提示信息</span><a></a>
		</div>
		<div class="tipinfo">
			<span><img src="<%=basePath%>images/ticon.png" /></span>
			<div class="tipright">
				<p>您输入的音源名字已存在！</p>
				<cite>请重新输入新的音源名字！</cite>
			</div>
		</div>

		<div class="tipbtn">
			<input name="" type="button" class="sure" value="确定" />&nbsp; <input
				name="" type="button" class="cancel" value="取消" />
		</div>
	</div>

</body>

</html>
