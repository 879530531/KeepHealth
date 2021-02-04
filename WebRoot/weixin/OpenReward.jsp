<%--
  Created by IntelliJ IDEA.
  User: 董冰雪
  Date: 2019/4/2 
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
    <title>打赏取方--已打赏</title>

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
					<font face="宋体">已打赏</font>
				</div>
			</td>
			 
		</tr>
  
	</table>
 <c:forEach items="${readyReplyList}" var="var" >
 <hr style="background-color:#696969;height:1px;border:none;width:1060px;margin-top:0px; ">
   <div  style="  width:999x;   height:400px;">  
   
<div style="  width:230px;
	height:230px; 
	border-radius:100%; 
	overflow:hidden; 
	margin-top:50px;
	margin-left:60px;
	display:inline-block;
    float:left;" >

         <img src=${var.tbConsumer.consumerHeadImgUrl } width="230px" height="230px" />
          </div>
          <div style="float:left;padding-top:100px;margin-left:210px;">
                <div> <a style="font-weight:bold;font-size:72px;">${var.tbConsumer.consumerName}</a></div>
               <div> <a style="font-size:37px; padding-left: 10px;" >${var.consultTime}</a> </div>            
         
</div>
      <div style="padding-top:30px;padding-bottom:10px;" >
      <hr style="background-color:F0F0F0;height:1px;border:none;width:1060px;margin-top:0px; ">
      </div>
      <div>
        <div  style="width:100%; ">
        <a style="font-size:68px;font-weight:bold;line-height:210px;padding-left:5%;padding-right:4%;">主要症状：</a>
        
          <div style="padding-left:12%;padding-right:4%;" >
          <a style="font-size:59px; ">${var.symptomDescription}</a>
          </div>
          </div>
          
          <div  style="width:999px; height:160px;">
          <a style="font-size:68px;font-weight:bold; line-height:200px;padding-left:50px;">调理建议：</a>
          </div>
           <div style="width:999px; height:70px;padding-left:70px;">
           <font style="font-size:39px; ">${var.adviceTime}</font>
           </div>
           <div style="padding-left:12%;padding-right:4%;">
           <a style="font-size:59px;">${var.advice}</a>
           </div>
           
            <c:if test="${empty var.additionalAdvice}">
           		<div style="padding-left:12%;padding-right:4%;" onclick="javascript:location.href='<%=basePath%>/biz/TbConsultationRecord_addSymptomDescription.action?TbConsultationRecord.recordId=${var.recordId}'"><font style="color:blue;font-size:49px; " >[添加追加]</font>&emsp;</div>
           </c:if>
           
          <c:if test="${not empty var.additionalAdvice}">
           <div style="padding-left:12%;padding-right:4%;" ><font style="color:blue;font-size:49px; " >[追加]</font>&emsp;
            <font style="font-size:39px; " >${var.additionalAdviceTime}</font>
           </div>
            <div style="padding-left:12%;padding-right:4%;" ><font style="font-size:59px; " >${var.additionalAdvice}</font></div>
          </c:if>
          <c:choose>
            <c:when test="${var.exceptionalStatus==0}">
              <div style="width:999px; height:50px;text-align:right;padding-top:20px;"><img src="/wxImage/cuo.jpg" width="50px" height="50px" />&emsp;
                              <font style="font-size:50px; " > 未打赏</font>&emsp;&emsp;&emsp;
           </div>
            </c:when>
            <c:when test="${var.exceptionalStatus==1}">
               <div style="width:999px; height:50px;text-align:right;padding-top:20px;"><img src="/wxImage/dui.jpg" width="50px" height="50px" />&emsp;
                              <font style="font-size:50px; " > 已打赏</font>&emsp;&emsp;&emsp;
           </div>           
            </c:when>          
          </c:choose>
        
      </div>
      <div style="padding-top:15px;">
      
       </div>
   </c:forEach>
</body>
</html>
