<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VIP管理</title>
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
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">健康卡管理</a></li>
    <li><a href="#">VIP管理</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div id="usual1" class="usual">
      <div id="tab2" class="tabson">
        
     	<form action="<%= basePath%>/biz/TbPersonalData_listVip.action"  method="post"  target="rightFrame">
    	<ul class="seachform">
    	    <li><label>会员编号：</label><input class="scinput" name="vip.personalNumber"   placeholder="请输入会员编号"/></li>
    	     <li><label>会员名称：</label><input class="scinput" name="vip.realName"   placeholder="请输入会员姓名"/></li>
            <li><input name="" type="submit" class="scbtn" value="查询"/></li>
        </ul>
        </form> 
    <table class="tablelist">
    	<thead>
    	<tr>
    	<th>序号</th>
        <th>会员编号</th>
         <th>会员名称</th>
        <th>手机号</th>
        <th>起始时间</th>
        <th>终止时间</th>
        <th>剩余有效天数</th>
    
        </tr>
        </thead>
        <tbody>
         <%int i=1;%>
        <s:iterator value="pageResult3.data">
        <tr>
        <td><%=i++%></td>
        <td>${personalNumber}</td>
        <td>${realName}</td>
        <td>${mobilePhone}</td>
        <td>${startTime}</td>
        <td>${endTime}</td>
        <td>${surplusDay}</td>
        </tr> 
        </s:iterator>
        </tbody>
    </table>
    
  </div>  
       
	</div>
    
    <!-- 分页菜单组件--------------------------开始 -->
<%
//查询的url地址，统一写
String listActionURL = basePath+"/biz/TbPersonalData_listVip.action";
%>
    
    <script type="text/javascript">
//分页组件
function change()
  {
 	var textfield=document.getElementById("textfield").value;
 	var totalPage="${pageResult3.totalPage}";
 	var pageNum = 0;
 	if(totalPage*1 >= textfield*1 ){
 		pageNum = textfield; 
 		window.location.href="<%=listActionURL%>?page="+pageNum+"";
 	}else{
 		pageNum = totalPage; 
 		alert("当前只有"+totalPage+"页");
 	}
  	
  }
</script>
<script type="text/javascript">
var url = "<%= basePath%>/biz/TbPersonalData_listVip.action";                 //获取表单url
//首页
function first(){
	
   window.location.href  = url+"?page=1";
}
//上一页
function previous(){
    window.location.href  = url+"?page=${pageResult3.previousPageNumber}";
}
//下一页
function next(){
    window.location.href  = url+"?page=${pageResult3.nextPageNumber}";
}
//尾页
function last(){
  window.location.href  = url+"?page=${pageResult3.totalPage}";
}
</script>
    <div class="pagin">
    	<div class="message">共<i class="blue">${pageResult3.total}</i>条记录 	<i class="blue">${pageResult3.totalPage}</i>页， 	当前显示第&nbsp;<i class="blue">${pageResult3.page}</i>页</div>
        <ul class="paginList">
           <c:choose>
			   <c:when test="${pageResult3.isFirst==true}"><li class="paginItem current"><a href="javascript:;">首页</a></li></c:when>
		       <c:otherwise>
			       <li class="paginItem"><a href="javascript:first()" target="rightFrame">首页&nbsp;</a></li>
		       </c:otherwise>
		   </c:choose>
           <c:choose>
		      <c:when test="${pageResult3.isFirst==true}"><li class="paginItem current"><a href="javascript:;">上一页</a></li></c:when>
		      <c:otherwise>
			      <li class="paginItem"><a href="javascript:previous()" target="rightFrame">上一页&nbsp;</a></li>
		      </c:otherwise>
		   </c:choose>
           <c:choose>
			   <c:when test="${pageResult3.hasNext==true}">
				   <li class="paginItem"><a href="javascript:next()" target="rightFrame">下一页&nbsp;</a></li>
			   </c:when>
		       <c:otherwise><li class="paginItem current"><a href="javascript:;">下一页</a></li></c:otherwise>
		   </c:choose>
           <c:choose>
			   <c:when test="${pageResult3.isLast==true}"><li class="paginItem current"><a href="javascript:;">尾页</a></li></c:when>
		       <c:otherwise>
			       <li class="paginItem"><a href="javascript:last()" target="rightFrame">尾页&nbsp;</a></li>
		       </c:otherwise>
		   </c:choose>
        <li class="paginItem-page">
           跳转到：&nbsp;
           <input name="textfield" type="text" size="4" class="page-input" id="textfield" onchange="change()"/>&nbsp;页
        </li>
        </ul>
    </div>
<!-- 分页菜单组件--------------------------结束 -->
<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</div>
	
	<div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo">
        <span><img src="<%= basePath%>images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认删除信息 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>

</body>

</html>
