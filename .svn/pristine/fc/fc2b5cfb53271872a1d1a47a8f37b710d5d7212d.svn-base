<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加配方信息</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script> 
<script type="text/javascript">
        $(function(){
			
			//返回1成功，0输入有误，2数据库已有相同配方
			if("1" == "${actionState}"){
				alert('新增配方成功，如需上线请到列表开启上线！');
			}else if("0" == "${actionState}"){
			   alert('添加失败，请联系相关管理员！');
			}else if("2" == "${actionState}"){
			   alert('已有相同配方！');
			}else if("3" == "${actionState}"){
                alert('配方规则不规范，请仔细检查配方规则后提交！');
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
                
                    "tbFormula.formulaContext":{
                        required:true,
                      
                        rangelength:[1,600]
                    },
                    "tbFormula.formulaRemark":{
                        required:false,
                      
                        rangelength:[0,50]
                    },
                    "tbFormula.formulaSymptom":{
                        required:false,

                        rangelength:[0,30]
                    },
                },
                messages:{
               
                    "tbFormula.formulaContext":{
                        required: "必填",
                        
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{30}。")
                    },
                    "tbFormula.formulaSymptomDetails":{
                        //required: "必填",
                        
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{50}。")
                    },
                    "tbFormula.formulaSymptom":{
                        //required: "必填",

                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{30}。")
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
    <li><a href="#">配方管理</a></li>
    <li><a href="#">新增配方信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>配方信息</span></div>
    <form action="<%= basePath%>/biz/TbFormula_addFormula.action" method="post" id="commonform">
     
    <ul class="forminfo">
    <input name="tbFormula.formulaId" type="hidden" value="${tbFormula.formulaId}"/>
    <input name="tbFormula.formulaState" type="hidden"  class="dfinput" value="${tbFormula.formulaState}"/>
    <li><label>配方内容</label><input name="tbFormula.formulaContext" type="text"  class="dfinput" value=""/><i><font color="#FF0000">*必填(数字1-8，多个配方请统一以英文逗号或中文逗号分隔)</font>每个配方不能超过30个数字</i></li>
    <li><label>类型</label>
        <select name="tbFormula.formulaType" class="dfinput">
            <option >乾卦（大肠、首）</option>
            <option >兑卦（肺、口）</option>
            <option >离卦（心、小肠、目）</option>
            <option >震卦（肝、足）</option>
            <option >巽卦（胆、股）</option>
            <option >坎（肾、耳）</option>
            <option >艮卦（胃、手）</option>
            <option >坤卦（脾、腹）</option>
            <%-- <option >胆</option>
            <option >股</option>
            <option >肾</option>
            <option >胃</option>
            <option >手</option>
            <option >脾</option>
            <option >腹</option>--%>
        </select>
    <li><label>症状简述</label><input name="tbFormula.formulaSymptom" type="text"  class="dfinput" value="${tbFormula.formulaSymptom}"/><i><font color="#FF0000">*必填</font>不能超过30个文字</i></li>
   <%--  <li><label>针对症状详述</label><textarea name="tbFormula.formulaSymptomDetails"  class="dfinput"  cols="5" rows="5">${tbFormula.formulaSymptomDetails}</textarea><i><font color="#FF0000">*</font>不得超过50个汉字</i></li>--%>

    <li><label>&nbsp;</label><input name="add_btn" type="submit" class="btn" value="确认保存"/>
    <input name="add_btn" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='<%=basePath%>/biz/TbFormula_openList.action;'"/>
    </li>
    </ul>
    </form>
    </div>

</body>

</html>