<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>结算管理</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){

	
		var url;
		var settlementList=Array();
	
		$("#updateState").click(function(){
 			
 		//	var form = document.getElementById("formId");
 			//alert(form)
   			 obj = document.getElementsByName("tbSettlement.settlementId");
  			 url =" <%= basePath%>/biz/TbSettlement_updateSettlement.action";
  			  for(k in obj){
       		  if(obj[k].checked)
          		  settlementList.push(obj[k].value);
   		 }	
   			 
 			
 			 $(".tip").fadeIn(200);
 		 });
 			 
 			 
 			 
 			  $(".tiptop a").click(function(){
 			 $(".tip").fadeOut(200);
			});

  			$(".sure").click(function(){
  			$(".tip").fadeOut(100);
  					
  				//	window.location.href=url;
  					$.post(url,
  					{'settlementList': JSON.stringify(settlementList)},
  					function(settlementList){
  						alert("提交成功");
   						window.location.href="<%=basePath%>/biz/TbSettlement_list.action?page=1";
  						}
  					);
  					//form.submit();

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
            this.queryForm.action="<%=basePath%>/biz/TbSettlement_queryList.action?page="+page;
            this.queryForm.submit();
         }
         
         function querySubmit(){
            this.queryForm.action="<%=basePath%>/biz/TbSettlement_queryList.action?page=1";
            this.queryForm.submit();
         }
         
         function checkAll(){
				var checkAllEle = document.getElementById("checkAll");
				if(checkAllEle.checked==true){
					var checkOnes = document.getElementsByName("tbSettlement.settlementId");
					for(var i=0;i<checkOnes.length;i++){
						checkOnes[i].checked=true;
					}
				}else{
					var checkOnes = document.getElementsByName("tbSettlement.settlementId");
					for(var i=0;i<checkOnes.length;i++){
						checkOnes[i].checked=false;
					}
				}
			}
		
</script>

</head>
<body>
    <!--隐藏的回调radio -->
	<input type="hidden" id="radioType" value="${radio}">
	<!-- 隐藏页数 -->
	<input type="hidden" name="page" id="page"
		value="${pageResult.totalPage}" />
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">念数管理</a></li>
			<li><a href="#">结算管理</a></li>
		</ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab2" class="tabson">
				

					<ul class="seachform">
					<form id="queryForm" action="" method="post" target="rightFrame">
					<li><input type="radio" name="tbSettlement.settlementStatus" value="0"/>未结算&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="tbSettlement.settlementStatus" value="1" />已结算&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					
						<li><label>综合查询：</label><input class="scinput"
							name="queryText" placeholder="输入查询内容" value="${queryText}" /></li>

						<li><input type="button" class="scbtn"
							onclick="querySubmit()" value="查询" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</li>
						
						</form>
						<li ><a    id="updateState" ><button class="scbtn" >结算</button> </a></li>
					</ul>
				
				<table class="tablelist">
					<thead>
						<tr>
							<th><input type="checkbox" onclick="checkAll()"  id="checkAll"/></th>
							<th>序号</th>
							<th>咨询服务编号</th>
							<th>老师编号</th>
							<th>咨询老师</th>
							<th>金额</th>
							<th>结算时间</th>
							<th>结算状态</th>

							
						</tr>
					</thead>
					<tbody>
					<!--  <form  action="<%= basePath%>/biz/TbSettlement_updateSettlement.action" method="post" id="formId">
					-->
						<%int i=1;%>
						<s:iterator value="pageResult.data"  var="list"  >
							<tr>
							<c:choose>
									<c:when test="${settlementStatus==0}">
										<td><input type="checkbox" name="tbSettlement.settlementId" value="<s:property value='#list.settlementId' />" /></td>
									</c:when>

									<c:otherwise>
										<td> </td>
									</c:otherwise>
								</c:choose>
								
								<td><%=i++%></td>
								<td><s:property value="#list.recordId" /></td>
								<td><s:property value="#list.teacherId" /></td>
								<td><s:property value="#list.teacherName" /></td>
								<td><s:property value="#list.settlementMoney" /></td>
								<td><s:property value="#list.settlementDate" /></td>
								
								<c:choose>
									<c:when test="${settlementStatus==0}">
										<td style="color: red;">未结算</td>
									</c:when>

									<c:otherwise>
										
										<td style="color: green;">已结算</td>
									</c:otherwise>
								</c:choose>

									
							</tr>
						</s:iterator>
						<!--  </form>-->
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
				<p>是否确认结算信息 ？</p>
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

<script>
	var radio =document.getElementById("radioType").value;
	var radioType =document.getElementsByName("tbSettlement.settlementStatus");
	console.info(radio);
	if (radio==1){
		radioType[1].checked=true;
	}else if (radio==null||radio==""){
	}else if (radio==0) {
		radioType[0].checked=true;
	}
</script>
</html>
