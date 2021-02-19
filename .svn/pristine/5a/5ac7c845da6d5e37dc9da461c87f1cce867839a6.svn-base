<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健康记录</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/common.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
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
.tablelinkdelete {
	color: #056dae;
}

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
	<%int i=1;%>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">健康数据中心</a></li>
			<li><a href="#">健康数据</a></li>
			<li><a href="#">健康记录</a></li>
		</ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab2" class="tabson">
				<ul class="seachform">
					<li><b><font style="font-size:16px">${name}</font></b>的健康记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li class="clickk"><span><img
							src="<%=path%>/images/f05.png" /></span><a
						href="<%= basePath%>/excel/ExportExcel_ExportHealthRecord.action?personalid=${personalid}">导出Excel</a></li>

				</ul>

				<table class="tablelist">
					<thead>
						<tr>

							<th>序号</th>
							<th>健康自述</th>
							<th>自述时间</th>
							<th>调理建议</th>
							<th>建议时间</th>
							<th>导师</th>
							<th>效果反馈</th>
							<th>反馈时间</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="fatherHealthResult.data" id="father">
							<tr>
								<td style="width:4%"><%=i++ %></td>
								<td style="width:15%" title="${readmeContent}"><div
										class="textoverr">
										<a
											href="<%= basePath%>biz/TbReadme_openHealthRecordDetail.action?readmeId=${readmeId}&name=${Name}&personalid=${personalid}"><font
											color="#056dae">${readmeContent}</font></a>
									</div></td>
								<td style="width:13%">${readmeTime}</td>
								<td style="width:25%" title="${adviceContent}"><s:iterator
										value="fatherAdviceList" id="advice">
										<s:if test="#father.readmeId == #advice.readmeId">
											<div class="textoverr">${adviceContent}</div>
										</s:if>
									</s:iterator></td>
								<td style="width:13%"><s:iterator value="fatherAdviceList"
										id="advice">
										<s:if test="#father.readmeId == #advice.readmeId">
								        ${adviceTime}
								        </s:if>
									</s:iterator></td>
								<td style="width:7%"><s:iterator value="fatherAdviceList"
										id="advice">
										<s:if test="#father.readmeId == #advice.readmeId">
								        ${mentorName}
								        </s:if>
									</s:iterator></td>

								<td style="width:10%" title="${feedbackContent}"><s:iterator
										value="throughFeedbackList" id="back">
										<s:if test="#father.readmeId == #back.readmeId">
											<div class="textoverr">${feedbackContent}</div>
										</s:if>
									</s:iterator></td>
								<td style="width:28%" title="${feedbackTime}"><s:iterator
										value="throughFeedbackList" id="back">
										<s:if test="#father.readmeId == #back.readmeId">
								        ${feedbackTime}
								        </s:if>
									</s:iterator></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>

			</div>

		</div>

		<!-- 分页菜单组件--------------------------开始 -->
		<%
//查询的url地址，统一写
String listActionURL = basePath+"/biz/TbReadme_openHealthRecord.action?personalid=${personalId}&name=${name}";
%>

		<script type="text/javascript">
//分页组件
function change()
  {
    var url = "<%= basePath%>/biz/TbReadme_openHealthRecord.action?personalid=${personalid}&name=${name}";    
 	var textfield=document.getElementById("textfield").value;
 	var totalPage="${fatherHealthResult.totalPage}";
 	var pageNum = 0;
 	if(totalPage*1 >= textfield*1 ){
 		pageNum = textfield; 
 		window.location.href=""+url+"&page="+pageNum+"";
 	}else{
 		pageNum = totalPage; 
 		alert("当前只有"+totalPage+"页");
 	}
  	
  }
</script>
		<script type="text/javascript">
var url = "<%= basePath%>/biz/TbReadme_openHealthRecord.action?personalid=${personalid}&name=${name}";                 //获取表单url
//首页
function first(){
	
   window.location.href  = url+"&page=1";
}
//上一页
function previous(){
    window.location.href  = url+"&page=${fatherHealthResult.previousPageNumber}";
}
//下一页
function next(){
    window.location.href  = url+"&page=${fatherHealthResult.nextPageNumber}";
}
//尾页
function last(){
  window.location.href  = url+"&page=${fatherHealthResult.totalPage}";
}
</script>
		<div class="pagin">
			<div class="message">
				共<i class="blue">${fatherHealthResult.total}</i>条记录 <i class="blue">${fatherHealthResult.totalPage}</i>页，
				当前显示第&nbsp;<i class="blue">${fatherHealthResult.page}</i>页
			</div>
			<ul class="paginList">
				<c:choose>
					<c:when test="${fatherHealthResult.isFirst==true}">
						<li class="paginItem current"><a href="javascript:;">首页</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem"><a href="javascript:first()"
							target="rightFrame">首页&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${fatherHealthResult.isFirst==true}">
						<li class="paginItem current"><a href="javascript:;">上一页</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem"><a href="javascript:previous()"
							target="rightFrame">上一页&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${fatherHealthResult.hasNext==true}">
						<li class="paginItem"><a href="javascript:next()"
							target="rightFrame">下一页&nbsp;</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem current"><a href="javascript:;">下一页</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${fatherHealthResult.isLast==true}">
						<li class="paginItem current"><a href="javascript:;">尾页</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem"><a href="javascript:last()"
							target="rightFrame">尾页&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
				<li class="paginItem-page">跳转到：&nbsp; <input name="textfield"
					type="text" size="4" class="page-input" id="textfield"
					onchange="change()" />&nbsp;页
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
