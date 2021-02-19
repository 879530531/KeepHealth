<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>配方列表</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script>

<script type="text/javascript">
	//删除
	$(document).ready(function(){
			var formulaId;
			var formulaState;
			var url;
  			$(".tablelinkdelete").click(function(){
 			formulaId = $(this).attr("id_value");
 			
 			url =" <%= basePath%>/biz/TbFormula_deleteFormula.action?tbFormula.formulaId="+formulaId+"&queryText=${queryText}";
 			 $(".tip").fadeIn(200);
 			 });
 			 
 			 $(".tablelinkstate").click(function(){
 			 formulaId = $(this).attr("id_value");
 			 formulaState = $(this).attr("state_value");
 			
 			 url =" <%= basePath%>/biz/TbFormula_changeState.action?tbFormula.formulaId="+formulaId+"&queryText=${queryText}";
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
.tablelinkdelete {
	color: #056dae;
}

.tablelinkstate {
	color: #056dae;
	font-size: 14px;
}

.tablelink {
	color: #056dae;
}
</style>

<script>
         function submitForm(){
         var page = document.getElementById("page").value;
            this.queryForm.action="<%=basePath%>/biz/TbFormula_queryList.action?page="+page;
            this.queryForm.submit();
         }
         
         function querySubmit(){
            this.queryForm.action="<%=basePath%>/biz/TbFormula_queryList.action?page=1";
            this.queryForm.submit();
         }
</script>

<script> 
     $(function(){
     //不刷新标志
     var flag=true;
    //返回1删除成功，0删除失败，2配方上线成功，3配方上线失败，4配方下线成功，5配方下线失败
			if("1" == "${actionState}"){
				alert('删除成功！');				
			}else if("0" == "${actionState}"){
			   alert('删除失败！请联系相关管理员！');
			}else if("2" == "${actionState}"){
			   alert('配方上线成功！');
			}else if("3" == "${actionState}"){
			   alert('配方上线失败！');
			}else if("4" == "${actionState}"){
			   alert('配方下线成功！');
			}else if("5" == "${actionState}"){
			   alert('配方下线失败！');
			}else{
			   flag=false;
			}
			
			if(flag){
			   submitForm();
			  
			}
    });
</script>
</head>
<body>
	<!-- 隐藏页数 -->
	<input type="hidden" name="page" id="page"
		value="${pageResult.totalPage}" />
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">配方管理</a></li>
			<li><a href="#">配方列表</a></li>
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
						<p:permissions right="addFormula">
							<li class="clickk"><span><img
									src="<%=path%>/images/t01.png" /></span><a
								href="<%= basePath%>/biz/TbFormula_openAddFormula.action">添加新配方</a></li>
						</p:permissions>
					</ul>
				</form>
				<table class="tablelist">
					<thead>
						<tr>
							<th>序号</th>
							<th>编号</th>
							<th>配方内容</th>
							<th>类型</th>
							<th>症状简述</th>
							<%-- <th>症状详述</th>--%>
							<th>状态</th>

							<p:permissions menu="editFormula,deleteFormula">
								<th style="width:5%">操作</th>
							</p:permissions>
						</tr>
					</thead>
					<tbody>
						<%int i=1;%>
						<s:iterator value="pageResult.data" id="id">
							<tr>
								<td><%=i++%></td>
								<td>${formulaId}</td>
								<td>${formulaContext}</td>
								<td>${formulaType}</td>
								<td>${formulaSymptom}</td>
								<%-- <td>${formulaSymptomDetails}</td>--%>
								<c:choose>
									<c:when test="${formulaState==0}">
										<td style="color: red;">未上线</td>
									</c:when>

									<c:otherwise>
										<td style="color: green;">已上线</td>
									</c:otherwise>
								</c:choose>

								<p:permissions menu="editFormula,deleteFormula">
									<td style="width:12%"><p:permissions right="editFormula">
											<a
												href="<%= basePath%>/biz/TbFormula_openEditFormula.action?tbFormula.formulaId=${formulaId}"
												class="tablelink">修改</a>&nbsp;&nbsp;
								    </p:permissions> <p:permissions right="editFormula">

											<c:choose>
												<c:when test="${formulaState==0}">
													<a href="javascript:;" class="tablelinkstate"
														id_value="${formulaId}" state_value="" ${formulaState}>上线</a>
												</c:when>

												<c:otherwise>
													<a href="javascript:;" class="tablelinkstate"
														id_value="${formulaId}" state_value="" ${formulaState}>下线</a>
												</c:otherwise>
											</c:choose>
										    &nbsp;&nbsp;
                                   	</p:permissions> <p:permissions
											right="deleteFormula">
											<a href="javascript:;" class="tablelinkdelete"
												id_value="${formulaId}"> 删除</a>&nbsp;&nbsp;
	                               	</p:permissions></td>
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
