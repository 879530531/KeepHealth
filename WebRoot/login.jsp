<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<base href="<%= basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        
<title>欢迎登录易道象数养生之家</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/pan.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 
  <script src="js/jquery-2.1.4.min.js"></script>
  <script type="text/javascript" src="layer/layer.js"></script>
</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录易道象数养生之家</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo" style="background:url(../images/loginlogo.png) no-repeat center;" ></span><!-- style="background:url(../images/loginlogo.png) no-repeat center;" -->
       
    <div class="loginbox">
    
    <form action="${path}/front/Login_webLogin.action" method="post">
	    <ul>
	    <li><input name="userName" id="userName" type="text" class="loginuser" placeholder="用户名"  onclick="JavaScript:this.value=''"/></li>
	    <li><input name="userPassword" id="userPassword" type="password" class="loginpwd" placeholder="密码" onclick="JavaScript:this.value=''"/></li>
	    <li><input name="" type="submit" class="loginbtn" value="登录" />
	        <label><input name="" type="checkbox" value="" checked="checked" />记住密码</label>
	        <label><a href="#">忘记密码？</a></label>
	    </li>
	    </ul>
    </form>
    
    </div>
    
    </div>
    
        <div class="tip3">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo">
        <span><img src="<%= basePath%>images/ticon.png" /></span>
        <div class="tipright">
        <p>登录失败！</p>
        <p>请检查您的账号密码是否正确</p>
        </div>
        </div>

       
        </div>
 
 <%
          String fail = (String)request.getAttribute("fail");
          String fail1 =new String(fail == null || "".equals(fail)?"ff":fail);
           if(fail1.equals("fail1")){ %>
           
				<script type="text/javascript">
				      $(".tip3").fadeIn(200);
				      $(".tiptop a").click(function(){
				         $(".tip3").fadeOut(200);
				});
				</script>
			<%}%>
    
   
    <div class="loginbm">技术支持：梧州学院软件开发中心 </div>
    </body></html>