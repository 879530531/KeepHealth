<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导师服务统计</title>
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
    <% int i = 1,j=0,k=0; %>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">健康数据中心</a></li>
    <li><a href="#">导师服务统计</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div id="usual1" class="usual">
      <div id="tab2" class="tabson">
        
     	<form action="<%= basePath%>/biz/TbFeedback_openMentorServicesStatistics.action" method="post"  target="rightFrame" id="myForm">
    	<ul class="seachform">
    	    <li><label>导师编号：</label><input class="scinput" name="tbPersonalData.personalNumber"   placeholder="请输入导师编号"/></li>
    	     <li><label>导师姓名：</label><input class="scinput" name="tbPersonalData.realName"   placeholder="请输入导师姓名"/></li>
    	     <li><label>起止时间：</label><input class="scinput" name="mentorServicesStatistics.time1" onClick="WdatePicker()" placeholder="点击输入起始时间"/>
    	     <input class="scinput" name="mentorServicesStatistics.time2" onClick="WdatePicker()" placeholder="点击输入终止时间"/>
    	     </li>
            <li><input name="" type="submit" class="scbtn" value="查询"/></li>
            <p:permissions right="servicesStatistics" >
           	 	<%-- <li class="clickk"><a  onclick="document.getElementById('myForm').submit()"><span><img src="<%=path%>/images/f05.png" /></span><input name="mark" type="submit" class="asd" value="查询并导出Excel"/></a></li> --%>           
           	 	<li class="clickk"><span><img src="<%=path%>/images/f05.png" /></span><a href="<%= basePath%>/excel/ExportExcel_Exports.action" >导出Excel</a></li>
           	  </p:permissions>
        </ul>
        </form> 
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>序号</th>
        <th>导师编号</th>
         <th>导师姓名</th>
        <th>服务数量</th>
        <th>差</th>
        <th>一般</th>
        <th>满意</th>
        <th>很满意</th>
        <th>非常满意</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="pageResult.data" id="a">
        
        <tr>
        <td><%=i++ %></td>
        <td>${a.personalNumber}</td>
        <td>${a.realName}</td>
        <s:iterator value="pageResult1" id="b">
        <s:if test="#a.personalId== #b.personalId">
        <td>${b.serviceNumber}</td>
        <%j++; %>
        </s:if>
        </s:iterator>
        <%if(j!=1){ %>
        <td>0</td>
        <%} %>
        <s:iterator value="pageResult2" id="c">
        <s:if test="#a.personalId== #c.personalId">
        <td>${c.badNumber}</td>
        <td>${c.generalNumber}</td>
        <td>${c.goodNumber}</td>
        <td>${c.bettergoodNumber}</td>
         <td>${c.satisfaction}</td>
         <%k++; %>
         </s:if>
        </s:iterator>
         <%if(k!=1){ %>
        <td>0</td>
        <td>0</td>
        <td>0</td>
        <td>0</td>
        <td>0</td>
        <%} %>
        </tr> 
        <%j=0;k=0; %>
        </s:iterator>
        </tbody>
    </table>
    
  </div>  
       
	</div>
    
    <!-- 分页菜单组件--------------------------开始 -->
<%
//查询的url地址，统一写
String listActionURL = basePath+"/biz/TbFeedback_openMentorServicesStatistics.action";
%>
    
    <script type="text/javascript">
//分页组件
function change()
  {
 	var textfield=document.getElementById("textfield").value;
 	var totalPage="${pageResult.totalPage}";
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
var url = "<%= basePath%>/biz/TbFeedback_openMentorServicesStatistics.action";                 //获取表单url
//首页
function first(){
	
   window.location.href  = url+"?page=1";
}
//上一页
function previous(){
    window.location.href  = url+"?page=${pageResult.previousPageNumber}";
}
//下一页
function next(){
    window.location.href  = url+"?page=${pageResult.nextPageNumber}";
}
//尾页
function last(){
  window.location.href  = url+"?page=${pageResult.totalPage}";
}
</script>
    <div class="pagin">
    	<div class="message">共<i class="blue">${pageResult.total}</i>条记录 	<i class="blue">${pageResult.totalPage}</i>页， 	当前显示第&nbsp;<i class="blue">${pageResult.page}</i>页</div>
        <ul class="paginList">
           <c:choose>
			   <c:when test="${pageResult.isFirst==true}"><li class="paginItem current"><a href="javascript:;">首页</a></li></c:when>
		       <c:otherwise>
			       <li class="paginItem"><a href="javascript:first()" target="rightFrame">首页&nbsp;</a></li>
		       </c:otherwise>
		   </c:choose>
           <c:choose>
		      <c:when test="${pageResult.isFirst==true}"><li class="paginItem current"><a href="javascript:;">上一页</a></li></c:when>
		      <c:otherwise>
			      <li class="paginItem"><a href="javascript:previous()" target="rightFrame">上一页&nbsp;</a></li>
		      </c:otherwise>
		   </c:choose>
           <c:choose>
			   <c:when test="${pageResult.hasNext==true}">
				   <li class="paginItem"><a href="javascript:next()" target="rightFrame">下一页&nbsp;</a></li>
			   </c:when>
		       <c:otherwise><li class="paginItem current"><a href="javascript:;">下一页</a></li></c:otherwise>
		   </c:choose>
           <c:choose>
			   <c:when test="${pageResult.isLast==true}"><li class="paginItem current"><a href="javascript:;">尾页</a></li></c:when>
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
