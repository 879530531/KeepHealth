<%@page import="com.gxuwz.KeepHealth.business.entity.TbTeacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>咨询记录</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script>
<script language="javascript" type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
	//删除
	$(document).ready(function(){
		var id;
		$(".tablelinkdelete").click(function(){
		
		 	id = $(this).attr("idValue");
		
		  	$(".tip").fadeIn(200);
		 });
		  
	  	$(".tiptop a").click(function(){
	  	$(".tip").fadeOut(200);
	});
		
	$(".sure").click(function(){
		$(".tip").fadeOut(100);
		window.location.href="<%= basePath%>/biz/TbConsultationRecord_deleteOne.action?recordId="+id;
	});
		
	  	$(".cancel").click(function(){
	  		$(".tip").fadeOut(100);
		});

	});
</script>


<script>
         function submitForm(){
         var page = document.getElementById("page").value;
            this.queryForm.action="<%=basePath%>/biz/TbConsultationRecord_toRecordList.action?page="+page;
            this.queryForm.submit();
         }
         
         function querySubmit(){
            this.queryForm.action="<%=basePath%>/biz/TbConsultationRecord_toRecordList.action?page=1";
            this.queryForm.submit();
         }
</script>



<script type="text/javascript">
 function validate()
     {
      var a = document.getElementById("aa").value;
      var b = document.getElementById("bb").value;
     
      if(a==""&&b!=""||a!=""&&b=="")
      {
       $(".tip").fadeIn(200);
       }else
      {
      document.getElementById("listUntreated").submit();
	 }
	  $(".cancel").click(function(){
				  $(".tip").fadeOut(100);
				});
	 }
	
</script>

</head>
<body>
	<!-- 隐藏页数 -->
	<input type="hidden" name="page" id="page"
		value="${pageList.totalPage}" />
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">咨询管理</a></li>
			<li><a href="#">咨询记录</a></li>
		</ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab2" class="tabson">
				<form id="queryForm" action="" method="post" target="rightFrame">

					<ul class="seachform">
						<li><label>起止时间：</label><input id="aa" class="scinput" name="consultTime2" onClick="WdatePicker()"  placeholder="咨询起始时间" value="${consultTime2}"/>
    	      				<input id="bb"  class="scinput" name="consultTime3" onClick="WdatePicker()"  placeholder="咨询终止时间" value="${consultTime3}"/>
    	     			</li>
						<li><label>咨询老师：</label><input class="scinput"
							name="teacherName" placeholder="输入咨询老师" value="${teacherName}" /></li>

						<li><input type="button" class="scbtn"
							onclick="querySubmit()" value="查询" /></li>
						
					</ul>
				</form>
				<table class="tablelist">
					<thead>
						<tr>
							<th style="width:3%">序号</th>
							<th style="width:5%">编号</th>
							<th>咨询用户唯一码</th>
							<th style="width:8%">老师姓名</th>
							<th style="width:14%">症状描述</th>
							<th style="width:9%">咨询时间</th>
							<th style="width:14%">调理建议</th>
							<th style="width:9%">建议时间</th>
							<th style="width:14%">追加建议</th>
							<th style="width:9%">追加时间</th>
							<th style="width:7%">打赏情况</th>
							<th style="width:11%">操作</th>
							
						</tr>
					</thead>
					<tbody>

					
						<%int i=1;%>
						<s:if test="#pageList.data != null">
						<s:iterator value="#pageList.data" var="list" >
						  	 
							<tr>
								<td><%=i++%></td>
								<td>${list[10] }</td>
								<td>${list[0] }</td>
								<td>${list[1] }</td>
								<td>${list[2] }</td>
								<td>${list[3] }</td>
								<td>${list[4] }</td>
								<td>${list[5] }</td>
								<td>${list[6] }</td>
								<td>${list[7] }</td>
								<td>
									<s:if test="#list[8]==1">
										<font color="green">已打赏</font>
									</s:if>
									<s:else>
										<font color="red">未打赏</font>
									</s:else>
								</td>
								<td>&nbsp;&nbsp;&nbsp;
									<s:if test="#list[8]==1">
	        							<a href="<%=basePath%>/biz/TbExceptional_openList2.action?prepayId=${list[9]}" class="tablelink">查看流水</a>
	        						</s:if>
	        						<s:else>
	        							<a href="#" style="display: none"/>
	        						</s:else>

									<s:if test="#list[4]==null">
										<br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" class="tablelinkdelete" idValue="${list[10]}">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
									</s:if>
								</td>
							</tr>
								
						</s:iterator>
						</s:if>
					</tbody>
				</table>
			</div>

		</div>
	</div>		
<!-- 分页菜单组件--------------------------开始 -->
<script type="text/javascript">
//分页组件
function change()
  {
 	var textfield=document.getElementById("textfield").value;
 	var totalPage="${pageList.totalPage}";
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
    document.getElementById("page").value=${pageList.previousPageNumber};
    submitForm();
}
//下一页
function next(){   
    document.getElementById("page").value=${pageList.nextPageNumber};
    submitForm();
}
//尾页
function last(){
 
  document.getElementById("page").value=${pageList.totalPage};
  submitForm();
}
</script>
		<div class="pagin">
			<div class="message">
				共<i class="blue">${pageList.total}</i>条记录 <i class="blue">${pageList.totalPage}</i>页，
				当前显示第&nbsp;<i class="blue">${pageList.page}</i>页
			</div>
			<ul class="paginList">
				<c:choose>
					<c:when test="${pageList.isFirst==true}">
						<li class="paginItem current"><a href="javascript:;">首页</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem"><a href="javascript:first()"
							target="rightFrame">首页&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageList.isFirst==true}">
						<li class="paginItem current"><a href="javascript:;">上一页</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem"><a href="javascript:previous()"
							target="rightFrame">上一页&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageList.hasNext==true}">
						<li class="paginItem"><a href="javascript:next()"
							target="rightFrame">下一页&nbsp;</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem current"><a href="javascript:;">下一页</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageList.isLast==true}">
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
					value="${pageList.totalPage}" />
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
				<p>是否确认删除信息 ？</p>
				<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
			</div>
		</div>

		<div class="tipbtn">
			<input name="" type="button" class="sure" value="确定" />&nbsp; <input
				name="" type="button" class="cancel" value="取消" />
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
