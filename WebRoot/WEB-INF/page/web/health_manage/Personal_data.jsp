<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商家（单位）列表</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script>
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
<%int i=0,j=0,k=0; %>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">健康数据中心</a></li>
    <li><a href="#">健康数据</a></li>
     <li><a href="#">健康记录</a></li>
      <li><a href="#">${name}</a></li>
    </ul>
    </div>
     
    <div class="formbody">
   <div class="formtitle"><span>${name}的健康记录</span></div>
    <div id="usual1" class="usual">
      <div id="tab2" class="tabson"> 
      <s:iterator value="personalDataDetailList">
  <table  class="tablelist" >
  <tbody>
  <tr>
    <td width="21%" align="right"  >用户昵称：</td>
    <td width="22%"  >${name }</td>
    <td width="21%" align="right"  >性别：</td>
    <td width="21%"  >${sex==0?"男":"女" }</td>
    <td colspan="2" rowspan="6" width="15%" style="margin-left:-10px"><img src="/upload/${image }" width="100%" height="100%" /></td>
  </tr>
  <tr>

    <td align="right">真实姓名：</td>
    <td>${realName }</td>
    <td align="right">手机号：</td>
    <td>${mobilePhone }</td>
  </tr>
  <tr>
    <td align="right"  >QQ号码：</td>
    <td  >${qq }</td>
    <td align="right"  >电子邮箱：</td>
    <td  >${email }</td>
  </tr>
  <tr>
    <td align="right">婚姻状况：</td>
    <td>${maritalStatus==0?"未婚":"已婚" }</td>
    <td align="right">职业：</td>
    <td>${professional }</td>
  </tr>
  <tr>
    <td align="right"  >身份证号：</td>
    <td  >${idCard }</td>
    <td align="right"  >出生年月日：</td>
    <td  >${birthday }</td>
  </tr>
  <tr>
    <td align="right">现居住地：</td>
    <td colspan="5">${address }</td>
  </tr>
  <tr>
    <td align="right">户籍所在地：</td>
    <td colspan="5">${placeDomicile }</td>
  </tr>
  <s:iterator value="fatherHealthList" id="father">
  <tr>
    <td align="right" height="69">健康自述：</td>
    <td colspan="5">${father.readmeContent }  --- ${father.readmeTime}</td>
  </tr>
  <s:iterator value="fatherAdviceList" id="advice">
  <s:if test="#father.readmeId == #advice.readmeId">
  <%if(0==i){ %>
  <tr>
  <%i++; %>
    <td align="right" height="69">调理建议：</td>
    <td colspan="5">${advice.adviceContent }  ---${advice.adviceTime}</td>
  </tr>
  <%}else{ %>
  <tr>
    <td align="right" height="69">追加建议：</td>
    <td colspan="5">${advice.adviceContent }  ---${advice.adviceTime}</td>
  </tr>
  <%} %>
  </s:if>
      </s:iterator>

    <s:iterator value="childHealthList" id="child">
    <s:if test="#father.readmeId == #child.fatherId">
  <tr>
    <td align="right" height="69">追加提问：</td>
    <td colspan="5">${child.readmeContent}   ---${child.readmeTime}</td>
  </tr>
  </s:if>
  <s:iterator value="fatherAdviceList" id="advice">
  <s:if test="#father.readmeId == #child.fatherId & #child.readmeId== #advice.readmeId">
  <%if(0==j){ %>
  <tr>
  <%j++; %>
    <td align="right" height="69">调理建议：</td>
    <td colspan="5">${advice.adviceContent }  ---${advice.adviceTime}</td>
  </tr>
  <%}else{ %>
  <tr>
    <td align="right" height="69">追加建议：</td>
    <td colspan="5">${advice.adviceContent }  ---${advice.adviceTime}</td>
  </tr>
  <%} %>
  </s:if>
      </s:iterator>


    </s:iterator> 
    <s:iterator value="throughFeedbackList" id="back">
      <s:if test="#father.readmeId == #back.readmeId">
  <tr>
    <td align="right" height="69">效果反馈：</td>
    <td colspan="5">${back.feedbackContent}  ---${back.feedbackTime}</td>
  </tr>
  </s:if>
      </s:iterator>
    <s:iterator value="fatherAdviceList" id="advice">
    <s:if test="#father.readmeId == #advice.readmeId">
    <%if(0==k){  %>
  <tr>
  <%k++; %>
    <td align="right" >导师签名：</td>
    <td colspan="2"  >${advice.mentorName }</td>
    <td align="right"  ></td>
    <td width="96"></td>
    <td width="46">&nbsp;</td>
  </tr>
  <%} %>
  </s:if></s:iterator>
  <s:iterator value="throughFeedbackList" id="back">
      <s:if test="#father.readmeId == #back.readmeId">
  <tr>
    <td align="right">评分：</td>
    <td colspan="5">${back.starEvaluation }星</td>
  </tr>
  </s:if></s:iterator>
  </s:iterator>
  </tbody>
</table>
    </s:iterator>
  </div>  
       
	</div>
  
    
   
    </div>
<div align="center">
  <table> 
    <tr>   
    <td>
       <input  name="asd" type="button" class="btn"  value="返回" onclick="location.href='javascript:history.go(-1);'"/>   
       </td>   
     </tr>
     </table> 
     </div>
</body>

</html>
