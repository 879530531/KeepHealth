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
		
		  	$(".tip").fadeIn(200);
		 });
		  
	  	$(".tiptop a").click(function(){
	  	$(".tip").fadeOut(200);
	});
		
	$(".sure").click(function(){
		$(".tip").fadeOut(100);
		window.location.href="<%= basePath%>/biz/TbGoods_delete.action?goodsId="+id;
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
		<li><a href="#">咨询管理</a></li>
		<li><a href="#">交易对账</a></li>
    </ul>
    </div>
<div class="formbody">
    <div id="usual1" class="usual">
      <div id="tab2" class="tabson">
        
     	
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
         <s:iterator value="pageResult.data" var="list">
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
									<c:otherwise>
										<td style="color: green;">交易成功</td>
									</c:otherwise>
								</c:choose>
							</tr> 
        </s:iterator>
        </tbody>
    </table>
  </div>  
       
	</div>
    
 
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