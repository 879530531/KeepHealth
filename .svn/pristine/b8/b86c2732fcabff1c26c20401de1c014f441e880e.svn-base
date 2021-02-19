<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta HTTP-EQUIV="nocache"   CONTENT="no-cache">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META   HTTP-EQUIV="Pragma"   CONTENT="no-cache">
	<META   HTTP-EQUIV="Cache-Control"   CONTENT="no-cache">
	<META   HTTP-EQUIV="Expires"   CONTENT="0">
<title>音频列表</title>
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
            this.queryForm.action="<%=basePath%>/biz/TbAudio_queryList.action?page="+page;
            this.queryForm.submit();
         }
         
         function querySubmit(){
            this.queryForm.action="<%=basePath%>/biz/TbAudio_queryList.action?page=1";
            this.queryForm.submit();
         }
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
		window.location.href="<%= basePath%>/biz/TbReadDevice_changePwd.action?personalId="+id;
	});
		
	  	$(".cancel1").click(function(){
	  		$(".tip2").fadeOut(100);
		});

	});
</script>

<style type="text/css">
.tablelinkdelete{color:#056dae;}
.tablelinkdelete1{color:#056dae;font-size:14px;}
</style>
</head>
<body>

<%response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);
	response.flushBuffer();
%>
    <input type="hidden" id="cache" name="cache" value="1">
	<input type="hidden" id="page" value="1"/>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">念数管理</a></li>
    <li><a href="#">音频管理</a></li>
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
						
					</ul>
    	
        </form> 
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>编号</th>
        <th>数字</th>
        <th>文件路径</th>
           <th>所属音源</th>
        
        <p:permissions menu="editAudio,audioDate">
        <th style="width:5%">操作</th>
        </p:permissions>
        
        
        </tr>
        </thead>
        
        <tbody>
        <%int i=1;%>
        <s:iterator value="pageResult.data" id="id">
        <tr>
        <td><%=i++%></td>
        <td>${audioNumber}</td>
        <td>${audioFilePath}</td>

	    <td>${audioSoundSource}</td>
        <p:permissions menu="editAudio,audioDate">
        <td style="width:15%">
    		<a href="javascript:;" onclick="control(this)" id="play" class="tablelink">播放
    		<audio src="${audioFilePath}" id="audio">
                                当浏览器不支持时，此处给出提示
    		</audio><font></font></a>
	     	<p:permissions right="editAudio" >
        		<a href="<%= basePath%>/biz/TbAudio_openEdit.action?tbAudio.audioId=${audioId}" class="tablelink" >修改</a>&nbsp;&nbsp;
        	</p:permissions>
	     	<script>
	     	function control(a){
     			var audio = a.children[0];
     			var font = a.children[1];
				if(audio!==null){
					if(audio.paused){ 
						audio.play();// 播放 
						audio.ontimeupdate = function () { font.innerHTML = timeFilter(audio.currentTime)+' | '+timeFilter(audio.duration); };
					}else{
						audio.pause();// 暂停
					}
					audio.addEventListener('ended', function () {
						font.innerHTML = '';
					}, false);
					audio.addEventListener('pause', function () {
						font.innerHTML = '';
					}, false);
				}
			}
			//将时间转为hh:mm:ss格式
			function timeFilter (seconds) {
		        var ss = parseInt(seconds);// 秒
		        var mm = 0;// 分
		        var hh = 0;// 小时
		        if (ss > 60) {
		            mm = parseInt(ss / 60);
		            ss = parseInt(ss % 60);
		        }
		        if (mm > 60) {
		            hh = parseInt(mm / 60);
		            mm = parseInt(mm % 60);
		        }
		        var result = ('00' + parseInt(ss)).slice(-2);
		        if (mm > 0) {
		            result = ('00' + parseInt(mm)).slice(-2) + ':' + result;
		        } else {
		            result = '00:' + result;
		        }
		        if (hh > 0) {
		            result = ('00' + parseInt(hh)).slice(-2) + ':' + result;
		        }
		        return result;
		    }
	     	</script>
        
        	
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

