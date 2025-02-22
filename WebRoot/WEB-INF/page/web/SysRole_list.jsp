<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色管理</title>
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

<script type="text/javascript">
	//删除
	$(document).ready(function(){
		var roleId;
		$(".tablelinkdelete").click(function(){
			roleId = $(this).attr("roleId");
		  	$(".tip").fadeIn(200);
		});
	  	$(".tiptop a").click(function(){
	  	$(".tip").fadeOut(200);
	});
	$(".sure").click(function(){
		$(".tip").fadeOut(100);
		window.location.href="<%= basePath%>/biz/SysRole_delete.action?roleId="+roleId;
	});
	  	$(".cancel").click(function(){
	  		$(".tip").fadeOut(100);
		});

	});
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
    <li><a href="#">系统管理</a></li>
    <li><a href="#">角色管理</a></li>
    </ul>
    </div>
    
<div class="formbody">
    <div id="usual1" class="usual">
      <div id="tab2" class="tabson">
        
     	<form action="<%= basePath%>/biz/SysRole_list.action" method="post"  target="rightFrame">
    	<ul class="seachform">
    	    <li><label>综合查询</label><input class="scinput" name="sysRole.roleName"   placeholder="请输入角色名称"></li>
            <li><input name="" type="submit" class="scbtn" value="查询"/></li>
            <p:permissions right="addRole" >
            	<li class="clickk"><span><img src="<%=path%>/images/t01.png" /></span><a href="<%= basePath%>/biz/SysRole_openAdd.action">添加</a></li>
            </p:permissions>
            <%-- <li class="clickk"><span><img src="<%=path%>/images/t02.png" /></span>修改</li>
            <li class="clickk"><span><img src="<%=path%>/images/t03.png" /></span>删除</li> --%>
        </ul>
        </form> 
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>序号</th>
        <th>角色编号</th>
        <th>角色名称</th>
        <th>排序序号</th>
        <p:permissions menu="deleteRole,editRole">
        <th>操作</th>
        </p:permissions>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="pageResult.data" id="id">
            
        <tr>
         <td><%=i++%></td>
        <td>${roleId}</td>
        <td>${roleName}</td>
        <td>${roleSortOrder}</td>
        <p:permissions menu="deleteRole,editRole">
        <td width="100px">
        	<p:permissions right="deleteRole" >
        		<a href="javascript:;" class="tablelinkdelete" roleId="${roleId}"> 删除</a>&nbsp;&nbsp;
        	</p:permissions>
        	<p:permissions right="editRole" >
        		<a href="<%= basePath%>/biz/SysRole_openEdit.action?roleId=${roleId}" class="tablelink">修改</a>
        	</p:permissions>
        </td>
        </p:permissions>
        </tr> 
        </s:iterator>
        </tbody>
    </table>
  </div>  
       
	</div>
    
    <!-- 分页菜单组件--------------------------开始 -->
<%
//查询的url地址，统一写
String listActionURL = basePath+"/biz/SysRole_list.action";
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
var url = "<%= basePath%>/biz/SysRole_list.action";                 //获取表单url
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
