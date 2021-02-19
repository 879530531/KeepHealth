<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>交易对账</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
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
            this.queryForm.action="<%=basePath%>/biz/TbExceptional_queryList.action?page="+page;
            this.queryForm.submit();
         }
         
         function querySubmit(){
            this.queryForm.action="<%=basePath%>/biz/TbExceptional_queryList.action?page=1";
            this.queryForm.submit();
         }

		 function exportSubmit(){
			 this.queryForm.action="<%= basePath%>/excel/ExportExcel_Exceptional.action";
			 this.queryForm.submit();
		 }
</script>
<style type="text/css">
.find {
	height: 31px;
	margin-top: -5px;
	margin-left: -10px;
}

.find1 {
	height: 31px;
	margin-right: -14px;
	margin-top: -5px;
}
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
			<li><a href="#">交易对账</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab2" class="tabson">

				<form id="queryForm" action="" method="post" target="rightFrame">
					<ul class="seachform">
						<li><label>交易时间：</label> <input class="scinput" type="date" id="a"
							name="queryText1" value="${queryText1}" />&nbsp;--&nbsp;
							<input class="scinput" type="date" name="queryText2"
							value="${queryText2}" /></li>
						<li><input type="button" class="scbtn"
							onclick="querySubmit()" value="查询" /></li>
						<li class="clickk"><span><img src="<%=path%>/images/f05.png" /></span><a href="javascript:exportSubmit()" >导出Excel</a></li>

					</ul>
				</form>
				<table class="tablelist">
					<thead>
						<tr>
							<th>序号</th>
							<th>流水单号</th>
							<th>时间</th>
							<th>老师姓名</th>
							<th>用户（openId）</th>
							<th>金额</th>
							<th>交易状态</th>

						</tr>
					</thead>
					<tbody>
						<%
							int i = 1;
						%>
						<s:iterator value="pageResult.data">
							<tr>
								<td><%=i++%></td>
								<td>${waterNumber}</td>
								<td>${exceptionalTime}</td>
								<td>${teacherName}</td>
								<td>${teacherOpenId}</td>
								<td>${exceptionalMoney}</td>
								<c:choose>
									<c:when test="${dealStatus==0}">
										<td style="color: red;">交易失败</td>
									</c:when>
									<c:when test="${dealStatus==2}">
										<td style="color: yellow;">交易中...</td>
									</c:when>
									<c:when test="${dealStatus==1}">
										<td style="color: green;">交易成功</td>
									</c:when>
								</c:choose>
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

</body>

</html>
