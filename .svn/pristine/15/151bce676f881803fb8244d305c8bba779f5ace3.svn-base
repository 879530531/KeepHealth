<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品列表</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script>
<script>
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
<script>
         function submitForm(){
         var page = document.getElementById("page").value;
            this.queryForm.action="<%= basePath%>/biz/TbConsultationRecord_serviceStatistics.action?page="+page;
            this.queryForm.submit();
         }
         
         function querySubmit(){
            this.queryForm.action="<%= basePath%>/biz/TbConsultationRecord_serviceStatistics.action?page=1";
            this.queryForm.submit();
         }
        
</script>

<style type="text/css">
.tablelinkdelete{color:#056dae;}
</style>
</head>
<body>

    <%int i=1;%>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">咨询管理</a></li>
    <li><a href="#">服务统计</a></li>
    </ul>
    </div>
<div class="formbody">
    <div id="usual1" class="usual">
      <div id="tab2" class="tabson">
      
     	<form id="queryForm" action="" method="post" target="rightFrame">

					<ul class="seachform">
						<li><label>综合查询：</label><input class="scinput"
							name="queryText" placeholder="输入查询内容" value="${queryText}" /></li>

						<li><input type="button" class="scbtn"
							onclick="querySubmit()" value="查询" /></li>
						
					</ul>
				</form>  
    <table class="tablelist" id="table10">
    	<thead>
	    	<tr>
	    		<th>序号</th>
		        <th>老师编号</th>
		        <th>咨询老师</th>
		        <th>已服务</th>
		        <th>未服务</th>
		        <th>已打赏</th>
		        <th>未打赏</th>
		   
	        </tr>
        </thead>
        <tbody>
       <%-- <s:iterator value="pageResult2.data" var="list">
         	<tr>
         	 <td><%=i++%></td>
	         <td><s:property value="#list.teacherId"/></td>
	         <td><s:property value="#list.teacherName"/></td>
	         
	        <td><s:iterator value="#serveList"  var="serve">
	         	         <s:if test='#list.teacherName==#serve[0]'>  <s:property value="#serve[1]"/></s:if>
	      	         </s:iterator>
	      	         </td>
	      	         
	         <td>
	      	         <s:iterator value="#unserveList"  var="unserve">
	         	         <s:if test='#list.teacherName==#unserve[0]'>   <s:property value="#unserve[1]"/></s:if>
	      	         </s:iterator>
	      	 </td>
	      	         
	      <td>  
	       <s:iterator value="#awardList"  var="award">
	         	       <s:if test='#award[0]==#list.teacherName'><s:property value="#award[1]"/></s:if>
	      	         </s:iterator>
	         </td>
	         
	         <td> 
	      	         <s:iterator value="#unawardList"  var="unaward">
	         	       <s:if test='#unaward[0]==#list.teacherName'><s:property value="#unaward[1]"/></s:if>
	      	         </s:iterator>
	      	   </td>      
	          
	                </tr>
        </s:iterator>--%>
	   <s:iterator value="statisList" var="list">
		   <tr>
			   <td><%=i++%></td>
			   <td><s:property value="#list[1]"/></td>
			   <td><s:property value="#list[0]"/></td>
			   <td><s:property value="#list[4]"/></td>
			   <td><s:property value="#list[5]"/></td>
			   <td><s:property value="#list[2]"/></td>
			   <td><s:property value="#list[3]"/></td>
		   </tr>
	   </s:iterator>

		</tbody>
    </table>
  </div>  
       
	</div>
    
    <!-- 分页菜单组件--------------------------开始 -->
<%
//查询的url地址，统一写
String listActionURL = basePath+"/biz/TbConsultationRecord_serviceStatistics.action";
%>
 
    <script type="text/javascript">
//分页组件
function change()
  {
 	var textfield=document.getElementById("textfield").value;
 	var totalPage="${pageResult2.totalPage}";
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
var url = "<%= basePath%>/biz/TbConsultationRecord_serviceStatistics.action"; //获取表单url
//首页
function first(){
	
   window.location.href  = url+"?page=1";
}
//上一页
function previous(){
    window.location.href  = url+"?page=${pageResult2.previousPageNumber}";
}
//下一页
function next(){
    window.location.href  = url+"?page=${pageResult2.nextPageNumber}";
}
//尾页
function last(){
  window.location.href  = url+"?page=${pageResult2.totalPage}";
}
</script>
    <div class="pagin">
    	<div class="message">共<i class="blue">${pageResult2.total}</i>条记录 	<i class="blue">${pageResult2.totalPage}</i>页， 	当前显示第&nbsp;<i class="blue">${pageResult2.page}</i>页</div>
        <ul class="paginList">
           <c:choose>
			   <c:when test="${pageResult2.isFirst==true}"><li class="paginItem current"><a href="javascript:;">首页</a></li></c:when>
		       <c:otherwise>
			       <li class="paginItem"><a href="javascript:first()" target="rightFrame">首页&nbsp;</a></li>
		       </c:otherwise>
		   </c:choose>
           <c:choose>
		      <c:when test="${pageResult2.isFirst==true}"><li class="paginItem current"><a href="javascript:;">上一页</a></li></c:when>
		      <c:otherwise>
			      <li class="paginItem"><a href="javascript:previous()" target="rightFrame">上一页&nbsp;</a></li>
		      </c:otherwise>
		   </c:choose>
           <c:choose>
			   <c:when test="${pageResult2.hasNext==true}">
				   <li class="paginItem"><a href="javascript:next()" target="rightFrame">下一页&nbsp;</a></li>
			   </c:when>
		       <c:otherwise><li class="paginItem current"><a href="javascript:;">下一页</a></li></c:otherwise>
		   </c:choose>
           <c:choose>
			   <c:when test="${pageResult2.isLast==true}"><li class="paginItem current"><a href="javascript:;">尾页</a></li></c:when>
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