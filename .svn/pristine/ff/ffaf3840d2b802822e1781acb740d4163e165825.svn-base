<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>咨询老师</title>
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
	var id;
		$(".tablelinkdelete").click(function(){
		
		 	id = $(this).attr("idValue");
		// 	console.log(id)

 			url =" <%= basePath%>/biz/TbTeacher_delete.action?teacherId="+id;
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

<script>
         function submitForm(){
         var page = document.getElementById("page").value;
            this.queryForm.action="<%=basePath%>/biz/TbTeacher_queryList.action?page="+page;
            this.queryForm.submit();
         }
         
         function querySubmit(){
            this.queryForm.action="<%=basePath%>/biz/TbTeacher_queryList.action?page=1";
            this.queryForm.submit();
         }
</script>
<script type="text/javascript">
	//重置
	$(document).ready(function(){
		var id;
		$(".tablelinkdelete1").click(function(){
		
		 	id = $(this).attr("idValue");
		// 	console.log(id)
		
		  	$(".tip2").fadeIn(200);
		 });
		  
	  	$(".tiptop a").click(function(){
	  	$(".tip2").fadeOut(200);
	});
		
	$(".sure1").click(function(){
		$(".tip2").fadeOut(100);
		window.location.href="<%= basePath%>/biz/TbTeacher_changePwd.action?teacherId="+id;

	});
		
	  	$(".cancel1").click(function(){
	  		$(".tip2").fadeOut(100);
		});

	});
</script>

<style type="text/css">
.tablelinkdelete{color:#056dae;}
.tablelinkdelete1{color:#056dae;font-size:14px;}
.tablelinkclear{color:#056dae;font-size:14px;}
</style>
</head>
<body>
<!-- 隐藏页数 -->
	<input type="hidden" name="page" id="page"
		value="${pageResult.totalPage}" />
	
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">咨询管理</a></li>
    <li><a href="#">咨询老师</a></li>
    </ul>
    </div>
    
<div class="formbody">
    <div id="usual1" class="usual">
      <div id="tab2" class="tabson">
       	<ul class="seachform">
					<form id="queryForm" action="" method="post" target="rightFrame">
									<li><label>综合查询：</label><input class="scinput"
							name="queryText" placeholder="输入查询内容" value="${queryText}" /></li>

						<li><input type="button" class="scbtn"
							onclick="querySubmit()" value="查询" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</li>
						
						</form>
            <p:permissions right="addConsultTeacher" >
            	<li class="clickk"><span><img src="<%=path%>/images/t01.png" /></span><a href="<%= basePath%>/biz/TbTeacher_openAdd.action">添加老师</a></li>
            </p:permissions>
            
        </ul>
         
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>序号</th>
        <th>老师编号</th>
        <th>老师名称</th>
        <th>微信唯一码</th>
        <th>老师手机号</th>
        <th>老师级别</th>
        <th>指导方向</th>
        <th>导师简介</th>
        <p:permissions menu="resetTeacherPwd,editConsultTeacher">
        <th style="width:5%">操作</th>
        </p:permissions>
        </tr>
        </thead>
        <tbody>
        <%int i=1;%>
        <s:iterator value="pageResult.data" id="id">
        <tr>
        <td><%=i++%></td>
        <td>${teacherId}</td>
        <td>${teacherName}</td>
        <td>${openId}</td>
        <td>${teacherPhone}</td>
        <c:choose>
        	
	        <c:when test="${1 == teacherLevel}">
	        	<td>一级导师</td>
	        </c:when>
	        <c:when test="${2 == teacherLevel}">
	        	<td>二级导师</td>
	        </c:when>
	        <c:when test="${3 == teacherLevel}">
	        	<td>三级导师</td>
	        </c:when>
	        <c:when test="${4 == teacherLevel}">
	        	<td>四级导师</td>
	        	</c:when>
	        	<c:when test="${5 == teacherLevel}">
        		<td>五级导师</td>
	        
	        </c:when>
	        <c:otherwise>
	        	<td></td>
	        </c:otherwise>
        </c:choose>
        <td>${guidanceDirection}</td>
        <td style="width:23%" title="${teacherIntroduction}"><div class="textoverr">${teacherIntroduction}</div></td>
        
        <p:permissions menu="resetTeacherPwd,editConsultTeacher">
        <td style="width:14%">
	     	
        	<p:permissions right="editConsultTeacher" >
        		<a href="<%= basePath%>/biz/TbTeacher_openEditWeb.action?tbTeacher.teacherId=${teacherId}" class="tablelink" >修改</a>&nbsp;&nbsp;
        	</p:permissions>
        	
        	<p:permissions right="resetTeacherPwd">
	        	 <a href="javascript:;" class="tablelinkdelete1" idValue="${teacherId}">重置密码</a>
	        </p:permissions>
	       
	        	 <a href="javascript:;" class="tablelinkdelete" idValue="${teacherId}">删除</a>

			<a href="<%= basePath%>/biz/TbTeacher_isTop.action?tbTeacher.teacherId=${teacherId}" class="tablelink" >置顶</a>&nbsp;&nbsp;
			<a href="<%= basePath%>/biz/TbTeacher_clearOpenId.action?tbTeacher.teacherId=${teacherId}" class="tablelink" >清除绑定</a>&nbsp;&nbsp;
        </td>
        </p:permissions>
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
 	var totalPage="${pageResult.totalPage}";
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
    document.getElementById("page").value=${pageResult.previousPageNumber};
    submitForm();
}
//下一页
function next(){   
    document.getElementById("page").value=${pageResult.nextPageNumber};
    submitForm();
}
//尾页
function last(){
 
  document.getElementById("page").value=${pageResult.totalPage};
  submitForm();
}
</script>
		<div class="pagin">
			<div class="message">
				共<i class="blue">${pageResult.total}</i>条记录 <i class="blue">${pageResult.totalPage}</i>页，
				当前显示第&nbsp;<i class="blue">${pageResult.page}</i>页
			</div>
			<ul class="paginList">
				<c:choose>
					<c:when test="${pageResult.isFirst==true}">
						<li class="paginItem current"><a href="javascript:;">首页</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem"><a href="javascript:first()"
							target="rightFrame">首页&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageResult.isFirst==true}">
						<li class="paginItem current"><a href="javascript:;">上一页</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem"><a href="javascript:previous()"
							target="rightFrame">上一页&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageResult.hasNext==true}">
						<li class="paginItem"><a href="javascript:next()"
							target="rightFrame">下一页&nbsp;</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem current"><a href="javascript:;">下一页</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageResult.isLast==true}">
						<li class="paginItem current"><a href="javascript:;">尾页</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem"><a href="javascript:last()"
							target="rightFrame">尾页&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
				<li class="paginItem-page">跳转到：&nbsp; <input name="textfield"
					type="text" size="4" class="page-input" id="textfield"
					onchange="change()" />&nbsp;页 <input type="hidden" id="totalPage"
					value="${pageResult.totalPage}" />
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
