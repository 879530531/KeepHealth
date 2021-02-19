<%--
  User: zuofengwei
  Date: 2019/3/13
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">


    <link rel="stylesheet" href="css/sm.min.css">
    <link rel="stylesheet" href="css/sm-extend.min.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">

		function fun(id){
			window.location.href="<%=basePath %>/biz/TbTeacher_queryTeacher.action?teacherId="+id;
		}
		 
		
		

    </script>
    <style>
        .divbyzuo {
            align-content: center;
            width: 48%;
            height: 150px;
            margin: 1% 1% 1% 1% ;
            padding: 0.45rem 5% 0.3rem 5%;
            float: left;
            background-color: #ffffff;

        }

        .imgbyzuo {
            padding-top: 0.1rem;
            width: 4.8rem;
            height: 4.8rem;
            border-radius: 2.4rem;
            border-style: solid;
            border-color: #ffffff;
            border-width: 1px;
        }
    </style>
</head>
<body>


<div class="page-group">
    <div class="page page-current">
        <header class="bar bar-nav">
            <h1 class='title' style="font-face:宋体;font-size: 22px ;">咨询老师</h1>
        </header>

        <div class="content" >


            <div class="div_main_main11">
                <div class="list-block" style='margin-top: 0px;margin-bottom: 0px'>
                    <ul>
                        <a href="<%=basePath %>/biz/TbConsultationRecord_record.action" class="item-content item-link">
                            <div class="item-media">
                                <i class="icon icon-f7"></i>
                            </div>
                            <div class="item-inner">
                                <div class="item-title">&nbsp;&nbsp;&nbsp;
                                    <img src="/images/edit_data.png"
                                         style='width: 0.9rem;height:0.9rem;vertical-align:middle;'>&nbsp;&nbsp;&nbsp;我的咨询
                                </div>
                                <div class="item-after"></div>
                            </div>
                        </a>
                    </ul>
                </div>

            </div>


            <div class="div_main" align="center">



<s:iterator value="teacherList"  var="teacher">
                    <div class="divbyzuo"  onclick="fun(${teacherId})">
                        <img src="/upload/${image}"
                             class="imgbyzuo">


                        </br><font>${teacherName }老师</font>

                    </div>
</s:iterator>
                    <!-- 

                    <div class="divbyzuo">
                        <img src="/wxImage/teacher/Teacher-2.jpg"
                             class="imgbyzuo">
                        <br/> <font> 李四老师</font>
                    </div>

                    <div class="divbyzuo">
                        <img src="/wxImage/teacher/Teacher-3.jpg"
                             class="imgbyzuo">
                        <br/><font> 王五老师</font>
                    </div>

                    <div class="divbyzuo">

                        <img src="/wxImage/teacher/Teacher-4.jpg"
                             class="imgbyzuo">
                        <br/><font> 赵六老师</font>
                    </div>
 -->

            </div>


        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    // 对浏览器的UserAgent进行正则匹配，不含有微信独有标识的则为其他浏览器
    var useragent = navigator.userAgent;
    if (useragent.match(/MicroMessenger/i) != 'MicroMessenger') {
        // 这里警告框会阻塞当前页面继续加载
        alert('已禁止本次访问：您必须使用微信内置浏览器访问本页面！');
        // 以下代码是用javascript强行关闭当前页面
        var opened = window.open('about:blank', '_self');
        opened.opener = null;
        opened.close();
    }
</script>
</html>
