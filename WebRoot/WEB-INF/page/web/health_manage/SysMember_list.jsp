<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员列表</title>
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
			var personalId;
			var flagType;
			var url;
  			$(".tablelinkdelete").click(function(){
 			personalId = $(this).attr("id_value");
 			flagType =  $(this).attr("value");
 			url =" <%= basePath%>/biz/TbPersonalData_delete.action?personalId="+personalId+"&flagType="+flagType;
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
<script type="text/javascript">
	//重置
	$(document).ready(function(){
		var id;
		$(".tablelinkdelete1").click(function(){
		
		 	id = $(this).attr("idValue");
		
		  	$(".tip2").fadeIn(200);
		 });
		  
	  	$(".tiptop a").click(function(){
	  	$(".tip2").fadeOut(200);
	});
		
	$(".sure1").click(function(){
		$(".tip2").fadeOut(100);
		window.location.href="<%= basePath%>/biz/TbPersonalData_changePwd.action?personalId="+id;
	});
		
	  	$(".cancel1").click(function(){
	  		$(".tip2").fadeOut(100);
		});

	});
</script>
<style type="text/css">
.tablelinkdelete{color:#056dae;}
.tablelinkdelete1{color:#056dae;font-size:14px;}

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
        
     	<form action="<%= basePath%>/biz/TbPersonalData_list.action?flagType=0" method="post"  target="rightFrame">
    	<ul class="seachform">
    	    <li><label>会员编号：</label><input class="scinput" name="tbPersonalData.personalNumber"   placeholder="请输入会员编号"/></li>
    	    <li><label>姓名：</label><input class="scinput" name="tbPersonalData.realName"   placeholder="请输入会员姓名"/></li>
    	    <li><label>联系号码：</label><input class="scinput" name="tbPersonalData.mobilePhone"   placeholder="请输入会员联系号码"/></li>
            <li><input name="" type="submit" class="scbtn" value="查询"/></li>
            <p:permissions right="addMumber" >
           	 	<li class="clickk"><span><img src="<%=path%>/images/t01.png" /></span><a href="<%= basePath%>/biz/TbPersonalData_openAdd.action" >添加</a></li>
            </p:permissions>
        </ul>
        </form> 
    <table class="tablelist">
    	<thead>
    	<tr>
    	<th>序号</th>
        <th>会员编号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>联系号码</th>
        <th>婚姻状况</th>
        <th>职业</th>
        <th>会员级别</th>
        <p:permissions menu="deleteMumber,editMumber,editPassword">
        <th style="width:14%">操作</th>
        </p:permissions>
        </tr>
        </thead>
        
        <tbody>
        <%int i=1;%>
        <s:iterator value="pageResult.data">
        <tr>
        <td><%=i++%></td>
        <td>${personalNumber}</td>
        <td><a href="<%= basePath%>/biz/TbPersonalData_openDetailWeb.action?personalId=${personalId}" ><font color="#056dae">${realName}</font></a></td>
        <c:choose>
        	<c:when test="${0 == sex}">
        		<td>女</td>
	        </c:when>
	        <c:when test="${1 == sex}">
	        	<td>男</td>
	        </c:when>
	        <c:otherwise>
	        	<td></td>
	        </c:otherwise>
        </c:choose>
        <td>${mobilePhone}</td>
        <c:choose>
        	<c:when test="${0 == maritalStatus}">
        		<td>未婚</td>
	        </c:when>
	        <c:when test="${1 == maritalStatus}">
	        	<td>已婚</td>
	        </c:when>
	        <c:otherwise>
	        	<td></td>
	        </c:otherwise>
        </c:choose>
        <td>${professional}</td>
        <c:choose>
        	<c:when test="${0 == level}">
        		<td>vip会员</td>
	        </c:when>
	        <c:when test="${1 == level}">
	        	<td>高级会员</td>
	        </c:when>
	        <c:otherwise>
	        	<td></td>
	        </c:otherwise>
        </c:choose>
        <p:permissions menu="deleteMumber,editMumber,editPassword">
        <td width="18%">
        	<p:permissions right="editUser">
	     		<a href="<%= basePath%>/biz/TbPersonalData_openSetWeb.action?personalId=${personalId}" class="tablelink">设置会员</a>&nbsp;&nbsp;
	     	</p:permissions>
	     	
        	<p:permissions right="deleteMumber">
	     		<a href="javascript:;" class="tablelinkdelete" id_value = "${personalId}"  value = "${flagType}"> 删除</a>&nbsp;&nbsp;
	     	</p:permissions>
	  
	     	<p:permissions right="editMumber">
	        	<a href="<%= basePath%>/biz/TbPersonalData_openEditWeb.action?personalId=${personalId}" class="tablelink">修改</a>&nbsp;&nbsp;
	        </p:permissions>
	        
	        	<p:permissions right="editPassword">
	        <a href="javascript:;" class="tablelinkdelete1" idValue="${personalId}">重置密码</a>
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
String listActionURL = basePath+"/biz/TbPersonalData_list.action";
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
 		window.location.href="<%=listActionURL%>?page="+pageNum+"&flagType=0";
 	}else{
 		pageNum = totalPage; 
 		alert("当前只有"+totalPage+"页");
 	}
  	
  }
</script>

<script type="text/javascript">
var url = "<%= basePath%>/biz/TbPersonalData_list.action?flagType=0"; //获取表单url
//首页
function first(){
	
   window.location.href  = url+"&page=1";
}
//上一页
function previous(){
    window.location.href  = url+"&page=${pageResult.previousPageNumber}";
}
//下一页
function next(){
    window.location.href  = url+"&page=${pageResult.nextPageNumber}";
}
//尾页
function last(){
  window.location.href  = url+"&page=${pageResult.totalPage}";
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
           <input  type="hidden" id="totalPage" value="${pageResult.totalPage}"/>
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
    
    	<div class="tip1">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo">
        <span><img src="<%= basePath%>images/ticon.png" /></span>
        <div class="tipright">
        <p>已重置密码</p>
        <p>密码为：0774123</p>
        </div>
        </div>

       
        </div>
         <div class="tip2">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo">
        <span><img src="<%= basePath%>images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认重置密码？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure1" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel1" value="取消" />
        </div>
    
    </div>
 
 <%
          String fail = (String)request.getAttribute("tip");
          String fail1 =new String(fail == null || "".equals(fail)?"ff":fail);
           if(fail1.equals("fail")){ %>
     <script type="text/javascript">
           $(".tip1").fadeIn(200);
 			
  
 			 $(".tiptop a").click(function(){
 			 $(".tip1").fadeOut(200);
			});
		</script>
				 <%} %>
</body>

</html>
