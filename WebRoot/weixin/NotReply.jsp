<%--
  Created by IntelliJ IDEA.
  User: 叶城廷
  Date: 2019/3/9 0009
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
<title>打赏取方-未回复</title>
<link href="css/dsqf.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.urla {
	text-decoration: none;
}
</style>
<script type="text/javascript">
pushHistory();
   window.addEventListener("popstate", function(e) {
     window.location = '<%= basePath%>/biz/TbTeacher_jumpHome.action';
   }, false);
   function pushHistory() {
     var state = {
       title: "title",
       url: "<%= basePath%>/biz/TbTeacher_jumpHome.action"
     };
     window.history.pushState(state, "title", "<%= basePath%>/biz/TbTeacher_jumpHome.action");
   }
</script>
</head>
<body>

	<table width="100%" height="10%" border="0">
	
		<tr>
		
			<td align="left"
				style="margin:3rem auto;font-size:22px;font-weight:400"><a
				href="<%=basePath%>/biz/TbTeacher_openhome.action" class="back"><img
					src="/images/back1.png" class="img"></a></td>
					
			<td align="left"
				style="margin:5rem auto;font-size:22px;font-weight:400">
				<div  style="font-size: 50pt ;padding-left:320px ;">
					<font face="宋体">未回复</font>
				</div>
			</td>
			 
		</tr>
  
	</table>

	<c:forEach items="${notReplyList}" var="var">
	<hr style="background-color:#696969;height:1px;border:none;width:1060px;margin-top:0px; ">
		<%--<div style="  width:999x;   height:700px;"> --%>
			<div style="  width:999x;   height:330px;">
				<div
					style="  width:230px;

	      height:230px;
	      border-radius:100%;
	      overflow:hidden;
	      margin-top:50px;
	      margin-left:60px;
	      display:inline-block;
          float:left;">
					<img src=${var.tbConsumer.consumerHeadImgUrl } width=230px
					height="230px" />
			</div>

			<div style="float:left;padding-top:100px;margin-left:210px;">
                <div> <a style="font-weight:bold;font-size:72px;">${var.tbConsumer.consumerName}</a></div>
               <div> <a style="font-size:37px; padding-left: 10px;" >${var.consultTime}</a> </div>            
         
</div>
		</div>
		<a
			style="background-color:#696969;height:1px;border:none;width:1000px;margin-top:0px; "></a>
		<div>

			<div style="width:100%;"
				onclick="javascript:location.href='<%=basePath%>/biz/TbConsultationRecord_symptomDescription.action?TbConsultationRecord.recordId=${var.recordId}'">
				
					<a style="font-size:68px;font-weight:bold;line-height:210px;padding-left:5%;padding-right:4%;"> 主要症状：</a>
				
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div style="padding-left:12%;padding-right:4%;" >
					<a style="font-size:59px; ">${var.symptomDescription}</a>
					
				</div>
				</div>
		</div>
		
	</c:forEach>
</body>
</html>

