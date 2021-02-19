<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">

	<title>自助念数机</title>

	<!-- 使用Edge最新的浏览器的渲染方式 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
	<!-- <script type="text/javascript" src="js/readNumber.js"></script> -->
	<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>

	<script type="text/javascript">
		var num =""; //使用数字键输入的数字

		var PlaybackRate=1;//倍速，初始为1，正常倍速

		var Audio=0;//默认使用音源，0为没有初始音源，使用异步初始化

		var AudioList=new Array();//音源列表

		var SystemUrl="";
		//异步初始音源列表
		$.ajax({
			data : {
				//无数据提交
			},
			url : "<%=basePath%>biz/TbSoundSource_queryUpSoundSource.action",
			type : "post",
			dataType : "text",
			async: false,
			success : function(data) {
				console.info("初始化音源"+data);
				if(data=="null"){
					console.info("暂无音源可用，敬请期待！");
				}else{
					var AudioListStr=new String();
					//拆分加密数据并覆盖音源列表
					AudioList=data.split(",");
					//从音源列表中初始化默认音源
					Audio=AudioList[0];
					console.info("初始化默认音源"+Audio);
				}
			},
			error:function (data) {
				console.info("初始化音源失败，返回信息："+data);
			}
		});

		//异步请求服务器域名
		$.ajax({
			data : {
				//无数据提交
			},
			url : "<%=basePath%>biz/TbSoundSource_requestSystemUrl.action",
			type : "post",
			dataType : "text",
			async: false,
			success : function(data) {
				console.info("初始化服务器网址"+data);
				if(data=="null"){
					console.info("服务器地址请求错误！");
				}else{
					SystemUrl=data;
				}
			},
			error:function (data) {
				console.info("服务器地址请求失败，返回信息："+data);
			}
		});



		// 屏幕对象
		var display = {text:""};

		display.refresh = function refresh(text){
			this.text = text;
			$("#display").html(this.text);
		};
		function show(text){
			$("#display").html(text);
		}

		//获取url中的参数
		function getUrlParam(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
			var r = window.location.search.substr(1).match(reg); //匹配目标参数
			if(r != null) return decodeURI(r[2]); //decodeURI参数内容。
			return null; //返回参数值
		}

		//读取是否带有从免费取方进来的配方
		window.onload = function() {
			if(getUrlParam("display")!=null){
				num=getUrlParam("display");
				show(num);
			}
		};


		var flag = true;
		//切换倍速，倍速规律 1→1.5→2→0.5→1
		function changePlaybackRate(){
			flag = false;
			var myAuto=document.getElementById("numberPlay");
			if(PlaybackRate==1){
				myAuto.src=SystemUrl+"shuzi/zj0.2.mp3";
				PlaybackRate=1.5;
			}else if(PlaybackRate==1.5){
				myAuto.src=SystemUrl+"shuzi/zj0.4.mp3";
				PlaybackRate=2;
			}else if(PlaybackRate==2){
				myAuto.src=SystemUrl+"shuzi/zj0.6.mp3";
				PlaybackRate=0.5;
			}else if(PlaybackRate==0.5){
				myAuto.src=SystemUrl+"shuzi/zcbf.mp3";
				PlaybackRate=1;
			}else{
				//倍速出现错误，初始为1
				PlaybackRate=1;
			}
			myAuto.play();
			console.info("当前语速："+PlaybackRate);
			playAudio();
			//return;
		}


		//切换音源标识
		function changeAudio(){
			flag = false;
			//初始化当前音源位置
			var nowPostion=0;
			//读取当前音源列表个数
			var size=AudioList.length;
			//获得当前音源信息
			var id =Audio;
			//识别当前音源位置，更换音源
			// 遍历数组比对值
			for(var i=0,k=AudioList.length;i<k;i++){
				if(id==AudioList[i]){
					//取出当前音源位置
					nowPostion=i;
				}
			}
			//切换音源新位置
			//如果只有一个音源
			if(nowPostion==0&&size==1){
				alert("没有音源可切换");
				//如果当前音源位置为最大值，则切换为第一音源
			}else if(nowPostion+1==size){
				nowPostion=0;
			}else{
				nowPostion=nowPostion+1;
			}


			//使用新位置覆盖新音源信息
			Audio=AudioList[nowPostion];
			var myAuto=document.getElementById("numberPlay");
			if(nowPostion==0){
				myAuto.src=SystemUrl+"shuzi/qhns.mp3";
			}else{
				myAuto.src=SystemUrl+"shuzi/qhnvs.mp3";
			}
			myAuto.play();
			//控制台记录
			console.info("当前音源切换为"+Audio);
			playAudio();
			//return;
		}

		//打印数字至荧屏
		function readNum(obj){
			flag = false;
			var myAuto=document.getElementById("numberPlay");
			console.info("触发"+obj+"数字");
			var digit=null;
			if(obj=='·'){
				digit= String('·');
				myAuto.src=SystemUrl+"dian/"+"deng.mp3";
			}else {
				digit = Number(obj);
				myAuto.src=SystemUrl+"shuzi/"+obj+".mp3";
			}
			myAuto.play();
			var size=num.toString().length;
			if(size==18||size==40){
				num=num+"<br>"+digit;
			}else if (size==62){
				alert("输入已达上限");
			}else{
				num = num + digit;
			}
			var display=document.getElementById("display");
			show(num);
			console.info("size:"+size);
			console.info("digit:"+digit);
			console.info("num:"+num);
			return;
		}


		//检查是否停止
		function isPause(myAudio) {
			var Audio =document.getElementById(myAudio);
			if(myAudio.ended){
				return true;
			}else{
				isPause(myAudio);
			}
		}

		//提交播放
		function playAudio(){
			//移除标签
			var box = document.getElementById("audioGroup");
			box.innerHTML="";

			//读取当前倍速
			console.info("当前倍速:"+PlaybackRate);
			//读取当前音源
			console.info("当前使用音源编号:"+Audio);
			//读取当前音频数字
			//var display=document.getElementById("display").toString;
			//同步请求后台拼接音频并返回播放地址
			console.info("数字串："+num);
			//var myAudio=document.getElementById("musicPlay");

			var replaceNum = num.replace("<br>","").replace("<br>","");
			console.info("replaceNum:"+replaceNum);
			var playNumgberList = replaceNum.split("");
			for ( i in playNumgberList){
				var audio=document.createElement('AUDIO');
				var sampleNumber=playNumgberList[i];
				if(!isNaN(sampleNumber)){
					audio.src=SystemUrl+Audio+"/"+sampleNumber+".mp3";
				}else {
					/*if (PlaybackRate==1){
                        audio.src=SystemUrl+"dian-1.mp3";
                    } else  if (PlaybackRate==1.5){
                        audio.src=SystemUrl+"dian-1-5.mp3";
                    } else  if (PlaybackRate==2){
                        audio.src=SystemUrl+"dian-2.mp3";
                    }else  if (PlaybackRate==0.5){
                        audio.src=SystemUrl+"dian-0-5.mp3";
                    }*/
					audio.src=SystemUrl+"kongbai.mp3";
				}

				document.getElementById("audioGroup").appendChild(audio);
			}
			var audios=document.getElementsByTagName("audio");
			console.info(audios);
			console.info(audios.length);
			for (var j=1;j<playNumgberList.length+1;j++){
				console.info("正在添加第"+j+"个监听器");
				audios[j].addEventListener('ended',function () {
					var nextAudio = this.nextElementSibling || this.nextSibling;
					//var previousAudio = this.previousSibling;
					if(flag == false){
						return true;
					}
					var u = navigator.userAgent;
				    var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
				    var isIOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
					if(this.src==SystemUrl+"kongbai.mp3"){
						console.log("当前为点，不延迟");
						if(!nextAudio){
							if (isAndroid) {
						       setTimeout(function(){playAudio();},800);
						    }else if(isIOS){
						    	WeixinJSBridge.invoke('getNetworkType', {}, function(e) {
					                // 在这里拿到 e.err_msg, 这里面就包含了所有的网络类型
					                // alert(e.err_msg);
					                setTimeout(function(){playAudio();},800);
					            });
						    }
						}else{
							nextAudio.play();
						}
					}else{
						console.log("nextAudio:"+nextAudio);
						if(!nextAudio){
						    if (isAndroid) {
						       setTimeout(function(){playAudio();},800);
						    }else if(isIOS){
						    	WeixinJSBridge.invoke('getNetworkType', {}, function(e) {
					                // 在这里拿到 e.err_msg, 这里面就包含了所有的网络类型
					                // alert(e.err_msg);
					                setTimeout(function(){playAudio();},800);
					            });
						    }
							//playAudio();
						}else {
							if (nextAudio.tagName == 'AUDIO') {
								if(nextAudio.src==SystemUrl+"kongbai.mp3"){
									console.log("下一个为点，不延迟");
									nextAudio.play();
								}else{
									if (PlaybackRate==1){
										nextAudio.play();
									} else if (PlaybackRate==1.5){
										setTimeout(function(){nextAudio.play();},200);
									} else if (PlaybackRate==2){
										setTimeout(function(){nextAudio.play();},400);
									} else if (PlaybackRate==0.5){
										setTimeout(function(){nextAudio.play();},600);
									}
								}
								//nextAudio.play();
							}
						}
					}

				});
			}
			flag=true;
			audios[1].play();
			//标识位
			//解析数字串addEventListener
			/*	myAudio.addEventListener('ended',function () {
                    if (flag==null) {
                        flag = 0;
                }
                myAudio.src=SystemUrl+Audio+"/"+playNumgberList[flag]+".mp3";
                myAudio.play();


                },false);*/
			/* myAudio.src=SystemUrl+Audio+"/"+split[0]+".mp3";
             myAudio.play();
             while (myAudio.addEventListener('ended',function () {
                       myAudio.pause();
                       flag++;
                       console.info("flag"+flag);
                       return true;
             },false)){
                 console.info("进入while");
                 myAudio.src=SystemUrl+Audio+"/"+split[flag]+".mp3";
                 myAudio.play();
             }*/

			/*$.ajax({
				// async:false,
				data : {
					"tbAudio.audioId" : Audio,
					"display" : num,
					"playbackRate" : PlaybackRate,
				},
				url : "biz/TbSoundSource_playAudio.action",
				type : "post",
				dataType : "text",
				async:false,
				success : function(data) {
					if (data == "error") {
						alert("播放文件出现错误，请联系相关管理员！");
					} else {
						var myAuto = document.getElementById("musicPlay");
						//默认倍速
						//console.info("当前倍数"+PlaybackRate);
						console.info("异步获得路径：" + data);
						//document.getElementById("musicPlay").defaultPlaybackRate=PlaybackRate;
						myAuto.src = data;
						//二次封闭下载按钮
						myAuto.controlsList = "nodownload";
						/!*   document.getElementById("musicPlay").autoplay=true;
                           document.getElementById('musicPlay').play();
                           audioAutoPlay('musicPlay');*!/
						// var Media = new Audio(data);
						// Media.play();loadedmetadata

						/!*if (window.WeixinJSBridge) {
							WeixinJSBridge.invoke("getNetworkType", {}, playAuto());   // 这句话是在微信中可以自动播放的核心
						} else {
							document.addEventListener("WeixinJSBridgeReady",function () {
								WeixinJSBridge.invoke("getNetworkType", {}, playAuto());
							});
						}*!/
						myAuto.preload='none';
						myAuto.load();
						if (typeof WeixinJSBridge == "object" && typeof WeixinJSBridge.invoke == "function") {
							WeixinJSBridge.invoke('getNetworkType', {}, function (res) {
								// 在这里拿到 e.err_msg, 这里面就包含了所有的网络类型
								// alert(res.err_msg);

								myAuto.play();
							});
						}else {
							myAuto.play();
						}

						/!*WeixinJSBridge.invoke('getNetworkType', {}, function () {
							myAuto.load();
							//audioAutoPlay('musicPlay');
							myAuto.play();
							return;
						});*!/
						//$("#clickPlay").click();


					}
				}
			});*/
		}
		//停止播放
		/*	function pausePlay() {
                var myAuto = document.getElementById('musicPlay').pause();
            }
            $('#myBtn').on('touchstart',function(){
                var audio11 = $('#musicPlay')[0];
                audio11.load();
                audio11.pause();
                audio11.play();
            })*/
		/*function playAuto() {
			var audio = document.getElementById('musicPlay').get(0);

			if (window.WeixinJSBridge) {
				WeixinJSBridge.invoke('getNetworkType', {}, function (e) {
					audio.play();
					return;
				}, false);
			} else {
				document.addEventListener("WeixinJSBridgeReady", function () {
					WeixinJSBridge.invoke('getNetworkType', {}, function (e) {
						audio.play();
						return;
					});
				}, false);
			}
			//myAuto.play();
			WeixinJSBridge.invoke('getNetworkType', {}, function (res) {
				audio.load();
				audioAutoPlay('musicPlay');
				audio.play();
				return;
			});

			var audio11 = $('#musicPlay')[0];
			audio11.load();
			audio11.pause();
			audio11.play();
			return false;
		}*/

		//document.addEventListener('click',playAuto(),false);

		/*	function audioAutoPlay(id) {
                // var audio = document.getElementById(id);
                //
                // document.addEventListener("WeixinJSBridgeReady", function () {
                //     audio.load();
                // }, false);
                // //audio.play();
                //
                // document.addEventListener("WeixinJSBridgeReady", function() {
                // 	audio.play();
                // }, false);
                // document.addEventListener('YixinJSBridgeReady', function() {
                // 	audio.play();
                // }, false);


                //  var audio = document.getElementById(id);
                //  var play = function() {
                //      document.removeEventListener("WeixinJSBridgeReady", play);
                //      document.removeEventListener("YixinJSBridgeReady", play);
                //
                //      audio.play();
                //
                //      document.removeEventListener("touchstart", play, false);
                //  };
                // //
                // // audio.play();
                //  //weixin
                //  document.addEventListener("WeixinJSBridgeReady", play, false);
                //  //yixin
                //  document.addEventListener('YixinJSBridgeReady', play, false);
                //  document.addEventListener("touchstart", play, false);



                var audio = document.getElementById(id).get(0),
                        play =function(){
                            audio.play();
                            document.removeEventListener("touchstart",play,false);
                        };
                //audio.play();
                document.addEventListener("WeixinJSBridgeReady",function() {
                    play();
                    return;
                },false);
                document.addEventListener('YixinJSBridgeReady',function() {
                    play();return;
                },false);
                document.addEventListener("touchstart",play,false);
                return;
            }
    */
		//取消输入
		function cancelNum() {
			flag = false;
			console.info("取消输入");
			var size = num.toString().length;
			if (size == 23|| size == 45) {
				num = num.substring(0, size - 5);
			} else if (size == 0) {
				alert("数字已经删减到尾");
			} else {
				num = num.substring(0, size - 1);
			}

			var display = document.getElementById("display");
			show(num);
			console.info("size:" + size);
			console.info("num:" + num);
			console.info("display:" + display.toString);
			return;
		}
	</script>
	<link href="css/readNumber.css" rel="stylesheet" type="text/css" />

	<css>
		audio::-internal-media-controls-download-button {
		display:none;
		}
		audio::-webkit-media-controls-enclosure {
		overflow:hidden;
		}
		audio::-webkit-media-controls-panel {
		width: calc(100% + 35px);
		}
	</css>

</head>
<body>
<div class="page-group">
	<div class="page page-current" style="background-color:#ffcc33;">
		<header class="bar bar-nav">


			<h1 class='title'  style="font-size: 22px ;font-face:宋体;background-color:#ffcc33;">
				<font style="margin-right: -1.8rem;">易道念数机</font><a href="<%=basePath%>/biz/TbTeacher_openwkf.action" class="back">
				<img src="/images/wh.png" style='width:1.4rem;height:1.4rem;float:right;margin:.5rem .4rem'></a>
			</h1>

		</header>
		<div class="content">
			<!-- 播放器 --c69a20 #fbbc0c> -->
			<%--<audio type="audio/mp3" src="" id="musicPlay" controls="controls"   controlsList="nodownload" ></audio>--%>

			<audio type="audio/mp3" src="" id="numberPlay"></audio>
			<%--<embed type="audio/mp3" src="" id="musicPlay" controls="controls"  autoplay onclick="playAuto()"  controlsList="nodownload"  loop="loop" />--%>
			<!-- 荧屏 -->
			<div style="background-color:#ffffff;" class="neirong"align="center"><div id="display"></div></div>
			<center>
				<%--<button type="button" id="b14" class="textNumber"  onclick="cancelNum();">取消输入</button>
                    <button type="button" id="b15" class="textNumber" value=""></button>
                    <button type="button" id="b16" class="textNumber" value="播放" onclick="playAudio();">播放</button>
                    <button type="button" id="b11" class="number" value="语速" onclick="changePlaybackRate();">语速</button>
                    <button type="button" id="b12" class="number" value="·" onclick="readNum('·');">*</button>
                    <button type="button" id="b13" class="number" value="切换" onclick="changeAudio();">切换</button> --%>
				<div style="margin:5rem 0rem 0rem orem; ">
					<img src="../images/readNumber-qx.png"  style="margin:0.6rem;" class="" onclick="cancelNum();">
					<img src="../images/readNumber-tb.png" style="margin-top: 0rem;" class="">
					<img src="../images/readNumber-bf.png"  style="margin:0.6rem;" class="" onclick="playAudio();">
				</div>
				<%--<input type="hidden" id="clickPlay" onclick="playAuto()">--%>
				<div style="margin-top: .2rem;">
					<img src="../images/readNumber-ys.png" class="" onclick="changePlaybackRate();">
					<img src="../images/readNumber-d.png" class="" onclick="readNum('·');">
					<img src="../images/readNumber-qh.png" class="" onclick="changeAudio();">
				</div>
				<%--<button type="button" id="b1" class="number" value="1" onclick="readNum(1);">1</button>
                    <button type="button" id="b2" class="number" value="2" onclick="readNum(2);">2</button>
                    <button type="button" id="b3" class="number" value="3" onclick="readNum(3);">3</button>
                    <button type="button" id="b4" class="number" value="4" onclick="readNum(4);">4</button>
                    <button type="button" id="b5" class="number" value="5" onclick="readNum(5);">5</button>
                    <button type="button" id="b6" class="number" value="6" onclick="readNum(6);">6</button>
                    <button type="button" id="b7" class="number" value="7" onclick="readNum(7);">7</button>
                    <button type="button" id="b0" class="number" value="0" onclick="readNum(0);">0</button>
                    <button type="button" id="b8" class="number" value="8" onclick="readNum(8);">8</button>--%>
				<div>
					<img src="../images/readNumber-1.png" class="" onclick="readNum(1);">
					<img src="../images/readNumber-2.png" class="" onclick="readNum(2);">
					<img src="../images/readNumber-3.png" class="" onclick="readNum(3);">
				</div>
				<div>
					<img src="../images/readNumber-4.png" class="" onclick="readNum(4);">
					<img src="../images/readNumber-5.png" class="" onclick="readNum(5);">
					<img src="../images/readNumber-6.png" class="" onclick="readNum(6);">
				</div>
				<div>
					<img src="../images/readNumber-7.png" class="" onclick="readNum(7);">
					<img src="../images/readNumber-0.png" class="" onclick="readNum(0);">
					<img src="../images/readNumber-8.png" class="" onclick="readNum(8);">
				</div>
			</center>
			<div class="anniu">
				<div class="row1">
					<a  style="background-color:#ffffff;color:#000000" class="button button-big button-fill button-success"
						href="javascript:window.location = 'weixin/Classification.jsp'"
					>常用配方查询</a>
				</div>
			</div>
			<div class="anniu">
				<div class="row1">
					<a href="javascript:window.location = 'weixin/Reward_formula.jsp'"
					   style="background-color:#ffffff;color:#000000" class="button button-big button-fill button-success">配方咨询</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="audioGroup"></div>
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
