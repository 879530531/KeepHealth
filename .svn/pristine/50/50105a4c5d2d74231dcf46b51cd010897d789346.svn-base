<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>音源列表</title>
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

<script>
         function submitForm(){
         	var page = document.getElementById("page").value;
            this.queryForm.action="<%= basePath%>/biz/TbSoundSource_list.action?page="+page;
            this.queryForm.submit();
         }
         
         function querySubmit(){
            this.queryForm.action="<%= basePath%>/biz/TbSoundSource_list.action?page=1";
            this.queryForm.submit();
         }
</script>
<script type="text/javascript">
        $(function(){
			
			//如果是新增成功，会返回1，如果是1，则提示添加成功
			if("1" == "${actionState}"){
				alert('添加音源成功！');
			}else if("2" == "${actionState}"){
				alert('修改音源成功！');
			}else if("3" == "${actionState}"){
				alert('音源已上线！');
			}else if("4" == "${actionState}"){
				alert('音源已下线！');
			}else if("5" == "${actionState}"){
				alert('删除音源成功！');
			}
		});
</script>
<script type="text/javascript">
	//删除
	$(document).ready(function(){
		var soundId;
		var url;
		$(".tablelinkdelete").click(function(){
			$("#tishi").html("是否确认删除信息 ？");
		 	soundId = $(this).attr("idValue");
		 	url = "<%= basePath%>/biz/TbSoundSource_delete.action?soundId="+soundId;
		  	$(".tip").fadeIn(200);
		});
		$(".tablelinkstate").click(function(){
			$("#tishi").html("是否确认修改上下架状态？");
		 	soundId = $(this).attr("idValue");
		 	url = "<%= basePath%>/biz/TbSoundSource_updateState.action?soundId="+soundId;
		  	$(".tip").fadeIn(200);
		});
		
	  	$(".tiptop a").click(function(){
	  		$(".tip").fadeOut(200);
		});
		$(".sure").click(function(){
			$(".tip").fadeOut(100);
			window.location.href = url;
		});
	  	$(".cancel").click(function(){
	  		$(".tip").fadeOut(100);
		});
	});
</script>

<style type="text/css">
.tablelinkdelete{color:#056dae;}
.tablelinkstate{color:#056dae;}
</style>
</head>
<body>
	<!-- 隐藏页数 -->
	<input type="hidden" name="page" id="page"
		value="${pageResult.totalPage}" />
    <%int i=1;%>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">念数机管理</a></li>
    <li><a href="#">音源管理</a></li>
    </ul>
    </div>
<div class="formbody">
    <div id="usual1" class="usual">
      <div id="tab2" class="tabson">
        
     	<form id="queryForm" action="" method="post"  target="rightFrame">
    	<ul class="seachform">
    		<li><label>综合查询：</label><input class="scinput" name="queryText" placeholder="请输入查询内容" value="${queryText}"/></li>
            <li><input type="submit" class="scbtn" onclick="querySubmit()" value="查询" /></li>
            <li class="clickk"><span><img src="<%=path%>/images/t01.png" /></span><a href="<%= basePath%>/biz/TbSoundSource_openAdd.action">添加</a></li>
        </ul>
        </form>  
    <table class="tablelist">
    	<thead>
	    	<tr>
		        <th>音源编号</th>
		      	<th>音源名称</th>
		      	<th>音源性别</th>
		      	<th>状态</th>
				<th>操作</th>
	        </tr>
        </thead>
        <tbody>
        <s:iterator value="pageResult2.data" id="id">
            
        <tr>
	        <td>${soundId}</td>
	        <td>${soundName}</td>
	      	<c:choose>
	        	<c:when test="${0 == soundSex}">
	        		<td>女</td>
		        </c:when>
		        <c:when test="${1 == soundSex}">
		        	<td>男</td>
		        </c:when>
		        <c:otherwise>
		        	<td></td>
		        </c:otherwise>
        	</c:choose>
        	<c:choose>
	        	<c:when test="${0 == soundState}">
	        		<td style="color: red;">未上线</td>
		        </c:when>
		        <c:when test="${1 == soundState}">
		        	<td style="color: green;">已上线</td>
		        </c:when>
		        <c:otherwise>
		        	<td></td>
		        </c:otherwise>
        	</c:choose>
	        <td width="150px">
	        	<a href="<%= basePath%>/biz/TbAudio_query.action?queryText=${soundName}" class="tablelink">查看</a>&nbsp;
	        	<a href="<%= basePath%>/biz/TbSoundSource_openEdit.action?soundId=${soundId}" class="tablelink">修改</a>&nbsp;
	        	<c:choose>
		        	<c:when test="${0 == soundState}">
		        		<a href="javascript:;" class="tablelinkstate" idValue="${soundId}">上线</a>&nbsp;
			        </c:when>
			        <c:otherwise>
			        	<a href="javascript:;" class="tablelinkstate" idValue="${soundId}">下线</a>&nbsp;
			        </c:otherwise>
        		</c:choose>
        		<a href="javascript:;" class="tablelinkdelete" idValue="${soundId}">删除</a>
	        </td>

        </tr> 
        </s:iterator>
        </tbody>
    </table>
  </div>  
       
	</div>
    
    <!-- 分页菜单组件--------------------------开始 -->
 
    <script type="text/javascript">
//分页组件
function change()
  {
 	var textfield=document.getElementById("textfield").value;
 	var totalPage="${pageResult2.totalPage}";
 	var pageNum = 0;
 	if(totalPage*1 >= textfield*1 ){
 		pageNum = textfield; 
 		document.getElementById("page").value=pageNum;
 		submitForm();
 	}else{
 		pageNum = totalPage; 
 		alert("当前只有"+totalPage+"页");
 	}
  	
  }
</script>
<script type="text/javascript">
//首页
function first(){ 
   document.getElementById("page").value=1;
   submitForm();
}
//上一页
function previous(){  
    document.getElementById("page").value=${pageResult2.previousPageNumber};
    submitForm();
}
//下一页
function next(){   
    document.getElementById("page").value=${pageResult2.nextPageNumber};
    submitForm();
}
//尾页
function last(){
 
  document.getElementById("page").value=${pageResult2.totalPage};
  submitForm();
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
           <input type="hidden" id="totalPage" value="${pageResult.totalPage}" />
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
		<div class="tiptop">
			<span>提示信息</span><a></a>
		</div>
		<div class="tipinfo">
			<span><img src="<%= basePath%>images/ticon.png" /></span>
			<div class="tipright">
				<p id="tishi">是否确认删除信息 ？</p>
				<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
			</div>
		</div>

		<div class="tipbtn">
			<input name="" type="button" class="sure" value="确定" />&nbsp; <input
				name="" type="button" class="cancel" value="取消" />
		</div>
	</div>


</body>

</html>