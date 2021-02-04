<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>音源添加</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script language="javascript" type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path %>/js/uploadPreview.js"></script>
<script type="text/javascript" src="<%=path %>/js/uploadPreview.min.js"></script>
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
//设置jQuery Validate插件在name属性相同时，以id值判断
$(function() {
    if ($.validator) {
        $.validator.prototype.elements = function() {
            var validator = this,
            rulesCache = {};
            return $([]).add(this.currentForm.elements).filter(":input").not(":submit, :reset, :image, [disabled]").not(this.settings.ignore).filter(function() {
                // 这里加入ID判断
                var elementIdentification = this.id || this.name; ! elementIdentification && validator.settings.debug && window.console && console.error("%o has no id nor name assigned", this); 
                if (elementIdentification in rulesCache || !validator.objectLength($(this).rules())) return false;
                rulesCache[elementIdentification] = true;
                return true;
            });
        };
    }
});

//jQuery Validate中添加判断文件后缀名的方法
jQuery.validator.addMethod("checkPic", function(value, element,params) {
  var filepath = value;
  //获得上传文件名
  var fileArr=filepath.split("\\");
  var fileTArr=fileArr[fileArr.length-1].toLowerCase().split(".");
  var filetype=fileTArr[fileTArr.length-1];
  //切割出后缀文件名
  for(i in params){
	  if (filetype == params[i]) {
	    return true;
	  }
  }
}, "上传文件格式不适合");

</script>

<script type="text/javascript">
        $(function(){
            $("#commonform").validate({
                errorClass: "errorInfo", //默认为错误的样式类为：error
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
                onkeyup: false,   
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
					//checkFrom();
                    form.submit();   //提交表单   
                    $("#gradeInfo1").html("<font color=\"red\">音频正在转码为mp3并上传，请耐心等待...</font>");
                },   
                rules:{
                    "soundName":{
                        required:true,
                        rangelength:[1,20]
                    },
                    "audio":{
                        required:true,
                        checkPic:["mp3","m4a","wav","ogg"]
                    },

                },
                messages:{
                    "soundName":{
                        required:"必填",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "audio":{
                        required:"必选",
                        checkPic: "文件格式必须为mp3,m4a,wav,ogg"
                    },
                    
                  }
            });    
        });
</script>
<script type="text/javascript">
	$(function(){
		//验证音源名字
		$("#soundName").blur(function(){//给音源名字添加失去焦点事件
			var url = "/biz/TbSoundSource_checkSoundName.action";
			var id = $(this).val();//获取音源名字的输入值 
			var inputValue = $(this).attr("soundName");//获取原来的音源名字
			id = $.trim(id);
			if(id != inputValue){//如果输入的和原来的不等，校验音源名字
				if(id != ""){
					$.post(url,{"soundName":id},function(data){//发送请求验证音源名字
						if(data == "true"){//如果返回 true,提示已存在 
							$("#gradeInfo").html("<font color=\"red\">您输入的音源名字已存在！请重新输入！</font>");
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
    <li><a href="#">念数机管理</a></li>
    <li><a href="#">音源管理</a></li>
    <li><a href="#">添加音源</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>添加音源</span></div>
    <form action="<%= basePath%>/biz/TbSoundSource_add.action" method="post" id="commonform" enctype="multipart/form-data">

    <ul class="forminfo">
    <li><label>名字：</label><input name="soundName" id="soundName" type="text" class="dfinput" /><i><font color="#FF0000">*必填</font>不能超过20个汉字</i><span id="gradeInfo"></span></li>
    <li ><label>性别声：</label>
        <div class="radio">
        <input type="radio" name="soundSex" value="1" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="soundSex" value="0"/>女
        </div>
    </li>
    <li ><label>状态：</label>
        <div class="radio">
        <input type="radio" name="soundState" value="1" checked="checked"/>上线&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="soundState" value="0"/>下线
        </div>
    </li>
    
    <li style="position: relative;"><label>数字0：</label><input type="file" name="audio" id="audio1" class="dfinput" accept=".mp3,.m4a,.wav,.ogg"/><i><font color="#FF0000">*必选</font></i></li>
    <li style="position: relative;"><label>数字1：</label><input type="file" name="audio" id="audio2" class="dfinput" accept=".mp3,.m4a,.wav,.ogg"/><i><font color="#FF0000">*必选</font></i></li>
    <li style="position: relative;"><label>数字2：</label><input type="file" name="audio" id="audio3" class="dfinput" accept=".mp3,.m4a,.wav,.ogg"/><i><font color="#FF0000">*必选</font></i></li>
    <li style="position: relative;"><label>数字3：</label><input type="file" name="audio" id="audio4" class="dfinput" accept=".mp3,.m4a,.wav,.ogg"/><i><font color="#FF0000">*必选</font></i></li>
    <li style="position: relative;"><label>数字4：</label><input type="file" name="audio" id="audio5" class="dfinput" accept=".mp3,.m4a,.wav,.ogg"/><i><font color="#FF0000">*必选</font></i></li>
    <li style="position: relative;"><label>数字5：</label><input type="file" name="audio" id="audio6" class="dfinput" accept=".mp3,.m4a,.wav,.ogg"/><i><font color="#FF0000">*必选</font></i></li>
    <li style="position: relative;"><label>数字6：</label><input type="file" name="audio" id="audio7" class="dfinput" accept=".mp3,.m4a,.wav,.ogg"/><i><font color="#FF0000">*必选</font></i></li>
    <li style="position: relative;"><label>数字7：</label><input type="file" name="audio" id="audio8" class="dfinput" accept=".mp3,.m4a,.wav,.ogg"/><i><font color="#FF0000">*必选</font></i></li>
    <li style="position: relative;"><label>数字8：</label><input type="file" name="audio" id="audio9" class="dfinput" accept=".mp3,.m4a,.wav,.ogg"/><i><font color="#FF0000">*必选</font></i></li>
    <li style="position: relative;"><span id="gradeInfo1"></span></li>
    <li><br/><br/><label>&nbsp;</label><input name="edit_btn" type="submit" class="btn" value="确认保存"/>
    <input name="asd" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='javascript:history.go(-1);'"/></li>
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
