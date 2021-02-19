<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/18 0018
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
    <title>易道养生微信支付</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
    <script>
       var orderInfo;
       var recordId;

        //读取是否带有从免费取方进来的配方
        window.onload = function() {
            //获取url中的参数
            function getUrlParam(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
                var r = window.location.search.substr(1).match(reg); //匹配目标参数
                if(r != null) return decodeURI(r[2]); //decodeURI参数内容。
                return null; //返回参数值
            }

            if(getUrlParam("recordId")!=null){
                recordId=getUrlParam("recordId");
                unifiedOrder();
            }
        };

    </script>
    <script>
        //查单
        function orderQuery() {
            window.location.href="<%=basePath%>/front/WeixinPay_queryOrder.action?recordId="+recordId;
        }
        //统一下单
        function unifiedOrder() {//放置咨询记录编号
            $.ajax({
                data : {
                    "recordId" : recordId,
                },
                url : "<%=basePath%>/front/WeixinPay_unifiedOrder.action",
                type : "post",
                dataType : "text",
                success : function(data) {
                    //返回下单编制json信息
                    if(data==null){
                        alert("支付出现错误！请联系相关商家");
                    }else{
                        //拉起支付
                        orderInfo=data;
                        onBridgeReady();
                    }
                },
                error:function () {
                    alert("支付出现错误！请联系相关商家");
                }
            });
        }
        //拉起支付
        function onBridgeReady(){
            //拆分信息
            var obj=JSON.parse(orderInfo);
            WeixinJSBridge.invoke(
                'getBrandWCPayRequest', {
                    "appId":obj.appId,     //公众号名称，由商户传入
                    "timeStamp":obj.timeStamp,         //时间戳，自1970年以来的秒数
                    "nonceStr":obj.nonceStr, //随机串
                    "package":"prepay_id="+obj.packages,
                    "signType":obj.signType,         //微信签名方式：
                    "paySign":obj.paySign //微信签名
                },
                function(res){
                    if(res.err_msg == "get_brand_wcpay_request:ok" ){
                        orderQuery();
                    }else {
                        if (res.err_desc=="该订单已过期，请重新下单") {
                            alert("订单已过期，请重新支付！");
                        }else{
                            alert("支付取消！");
                            window.history.go(-1);
                        }
                    }
                });
        }

        if (typeof WeixinJSBridge == "undefined"){
            if( document.addEventListener ){
                document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
            }else if (document.attachEvent){
                document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
            }
        }else{
            onBridgeReady();
        }
    </script>
</head>
<body>
</body>
</html>
