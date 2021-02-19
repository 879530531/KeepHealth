<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>导师详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="icon" href="http://host/favicon.ico" type="image/x-icon" />

    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="css/style1.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/sma.css">
    <link rel="stylesheet" href="css/sm-extend.min.css">
  </head>
  
  <body>
    <% int i = 1;  %>
  <div class="content">
    <div class="div_main" align="center">
    <div class="div_main_top">
    <div class="list-block media-list1">
    <ul>
      <li>
        <div class="item1-link item1-content">
          <div class="item1-media"><img src="/upload/${tbPersonalData.image}" style="padding-top:0.1rem;width: 4.8rem;height:4.8rem;border-radius: 2.4rem;"></div>
          <div class="item1-inner">
            <div class="item1-title-row">
              <div class="item1-title"><span style="font-size:0.9rem;">${sessionScope.Name}</span>&nbsp;
              			<c:choose>
		              	<c:when test="${sessionScope.time==0}">
		        		<span style=" color:#FFF;font-size:0.65rem; background-color:#bbb9b9">&nbsp;VIP&nbsp;</span>
				        </c:when>
			        	<c:when test="${sessionScope.personaldata.level==0}">
			        		<img src="/images/mentor.png" style='width: 1.1rem;height:0.8rem;vertical-align:middle;'>
				        </c:when>
				        <c:when test="${sessionScope.personaldata.level==1}">
				        	<img src="/images/mentor2.png" style='width: 1.1rem;height:0.8rem;vertical-align:middle;'>
				        </c:when>
				        <c:when test="${sessionScope.personaldata.level==2}">
				        	<img src="/images/mentor1.png" style='width: 1.1rem;height:0.8rem;vertical-align:middle;'>
				        </c:when>
	                </c:choose>
                </div>
               <div class="item1-after1"><a  href="<%= basePath%>/front1/TbPersonalData_openMentorEdit.action"><img src="/images/edit1.png" style='width: 1.0rem;height:1.0rem;vertical-align:middle;'></a></div>
            </div>
            <div class="item1-title-row">
              <div class="item1-title">联系电话：&nbsp;${tbPersonalData.mobilePhone}</div>
              <div class="item1-after"></div>
            </div>
            <%-- <div class="item1-title-row">
              <div class="item1-title">指导方向：&nbsp;${tbPersonalData.direction}</div>
              <div class="item1-after"></div>
            </div> --%>
            <div class="item1-title-row">
              <div class="item1-title">导师级别：
              <c:choose>
        	<c:when test="${tbPersonalData.level==0}">
        		导师
	        </c:when>
	        <c:when test="${tbPersonalData.level==1}">
	        	普通导师
	        </c:when>
	        <c:when test="${tbPersonalData.level==2}">
	        	高级导师
	        </c:when>
        </c:choose></div>
              <div class="item1-after"></div>
          </div>
          </div>
        </div>
      </li>
    </ul>
  </div>

    </div>
    <div class="div_main_main11">
  <div class="list-block">
	    <ul>
	      <li class="item-content">
	        <div class="item-inner2">
	        <div class="item-title labelq">导师职业：</div>
            <div class="item-input">
              ${tbPersonalData.professional}
            </div>
	          
	        </div>
	      </li>
	      <li class="item-content">
	        <div class="item-inner2">
	        <div class="item-title labelq">导师编号：</div>
            <div class="item-input">
	          ${tbPersonalData.personalNumber}
            </div>
	        </div>
	      </li>
	      <li class="item-content">
	        <div class="item-inner2">
	        <div class="item-title labelq">电子邮箱：</div>
            <div class="item-input">
              ${tbPersonalData.email}
            </div>
	          
	        </div>
	      </li>
	      <li class="item-content">
	        <div class="item-inner2">
	        <div class="item-title labelq">QQ号码：</div>
            <div class="item-input">
              ${tbPersonalData.qq}
            </div>
	          
	        </div>
	      </li>
	      <li class="item-content" style="align-top">
	        <div class="item-inner2">
	        <div class="item-title labelq"> 导师简介：</div>
            <div class="item-input">
            <textarea disabled="disabled"> ${tbPersonalData.introduction}</textarea>
             
            </div>
	         
	        </div>
	      </li>

	    </ul>
	     
  </div>
    </div>
  </div></div>
  </body>
</html>
