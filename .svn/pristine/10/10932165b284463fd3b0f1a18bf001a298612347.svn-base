<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>设置会员</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script>
 
<script language="javascript" type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
/*
 *_contextPath:上下文路径
 *_modulePath: 模块路径
 */
var  _contextPath="<%=path%>";
var  _modulePath=_contextPath+"/sys/";
$(document).ready(function(){
  $(".clicks").click(function(){
   _open(_modulePath+"textures_open.action?view=add");
  });
});
</script>
<!--  -->
<script type="text/javascript">
    //删除
    $(document).ready(function(){
            var id;
            var userId;
            var url;
              $(".tablelinkdelete").click(function(){
             id = $(this).attr("id_value");
             userId = $(this).attr("userId");
             url =" <%= basePath%>/biz/SysUser_delete.action?id="+id+"&userId="+userId;
              $(".tip").fadeIn(200);
              });
  
              $(".tiptop a").click(function(){
              $(".tip").fadeOut(200);
            });
 
              $(".sure").click(function(){
              $(".tip").fadeOut(100);
                      window.location.href=url;
            });
 
                  $(".cancel").click(function(){
                  $(".tip").fadeOut(100);
                });
        
    });
     function CheckForm(form) {
                if(form.payMoney.value == "") {
                     return false;
                }
                else if(form.startTime.value==""){
                return false;
                }
                else if(form.endTime.value==""){
                 return false;
                }
          
            }
</script>
<style type="text/css">
.tablelinkdelete{color:#056dae;}
 
.find{height:31px;margin-top:-5px;margin-left:-10px;
 
}
.find1{height:31px;margin-right:-14px;margin-top:-5px;
 
}
 
</style>
</head>
<body>
    <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">健康卡管理</a></li>
    <li><a href="#">会员管理</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div id="usual1" class="usual">
      <div id="tab2" class="tabson">
            <div class="formtitle"><span>设置会员</span></div>
    <form action="<%= basePath%>/biz/TbPayNotes_add.action" method="post" id="commonform" onsubmit="return CheckForm(this) ">
     <table class="tablelist">
        <tbody>
        <tr>
        <td width="50%" style="text-align:right">会员级别：</td>
        <td><input type="radio" name="level" value="0" id="RadioGroup1_0" checked="checked"/>VIP会员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="level" value="1" id="RadioGroup1_1" />高级会员
        </td>
        </tr> 
        <tr style="background:#f5f8fa">
        <td style="text-align:right">起始时间：</td>
        <td><input class="Wdate" name="startTime" id="startTime" type="text" value="${tbPersonalData.startTime}" onClick="WdatePicker({lang:'zh-cn',minDate:new Date(),maxDate:'#F{$dp.$D(\'endTime\'),{d:31}||\'2020-00-01\'}'});" autocomplete="off" readonly="readonly"/><font color="#FF0000">*必填</font></td>
        </tr>         
        <tr>
        <td style="text-align:right">终止时间：</td>
        <td><input class="Wdate" name="endTime" id="endTime" type="text" value="${tbPersonalData.endTime}" onClick="WdatePicker({lang:'zh-cn',minDate:'#F{$dp.$D(\'startTime\')}'});" autocomplete="off" readonly="readonly"/><font color="#FF0000">*必填</font></td>
        </tr>
        <tr style="background:#f5f8fa">
        <td style="text-align:right">会员费用：</td>
        <td><input name="payMoney" id="payMoney"  type="text" class="dfinput" style="width:127px;height:20px"></input>元
        <input type="hidden" value="${tbPersonalData.personalId }" name="idd"/><font color="#FF0000">*必填</font>
        </td>
        </tr> 
        </tbody>
    </table><br/><br/>
    
   <center>
     <ul class="forminfo">
    <tr><td>
    <label>&nbsp;</label><input name="save" type="submit" class="btn" value="确认保存"/></td>
    <td><input name="add_btn" type="button" class="btn" style="background:gray" value="取消" onclick="location.href='javascript:history.go(-1);'"/>
    </td></tr>
    </ul>
    </center>
    </form>
    </div>
  </div>  
       
    </div>
</body>
 
</html>
