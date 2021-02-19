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


	<style>
		.tixing1 {
			border-bottom: 30px solid #2299ff;
			border-left: 15px solid transparent;
			border-right: 15px solid transparent;
			height: 0;
			width: 120px;
		}
		.tixing2 {
			border-top: 30px solid #2299ff;
			border-left: 15px solid transparent;
			border-right: 15px solid transparent;
			height: 0;
		}
		.buttonzuo {
			width:60px;
			height:40px;
			text-align:center;
			line-height:100%;
			padding:0.3em;
			margin: 0.5rem 1.0rem 0.5rem 1.0rem;
			font:16px Arial,sans-serif bold;
			font-style:normal;
			text-decoration:none;

			vertical-align:text-bottom;
			zoom:1;
			outline:none;
			font-size-adjust:none;
			font-stretch:normal;
			border-radius:50px;
			box-shadow:0px 1px 2px rgba(0,0,0,0.2);
			text-shadow:0px 1px 1px rgba(0,0,0,0.3);
			color:#000000;
			border:0.2px solid #FFFFFF;
			background-repeat:repeat;
			background-size:auto;
			background-origin:padding-box;
			background-clip:padding-box;
			background-color:#FFFFFF;
			/*#3399ff*/
		    /*background: linear-gradient(to bottom, #eeeff9 0%,#3399ff 100%);*/
		}

		.buttonzuo:hover {
			background: #FFFFFF;
		}
	</style>


	<script type="text/javascript" src="js/jquery.js"></script>
	<!-- <script type="text/javascript" src="js/readNumber.js"></script> -->
	<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<script>
     function play() {
		 console.info("重写play方法");
	 }

	</script>
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

		//切换倍速，倍速规律 1→1.5→2→0.5→1
		function changePlaybackRate(){
			if(PlaybackRate==1){
				PlaybackRate=1.5;
			}else if(PlaybackRate==1.5){
				PlaybackRate=2;
			}else if(PlaybackRate==2){
				PlaybackRate=0.5;
			}else if(PlaybackRate==0.5){
				PlaybackRate=1;
			}else{
				//倍速出现错误，初始为1
				PlaybackRate=1;
			}
			console.info("当前语速："+PlaybackRate);
		}

		//切换音源标识
		function changeAudio(){
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
			//控制台记录
			console.info("当前音源切换为"+Audio);
		}

		var flag = true;
		//打印数字至荧屏
		function readNum(obj){
			flag = false;
            var myAuto=document.getElementById("numberPlay");
			console.info("触发"+obj+"数字");
			var digit=null;
			if(obj=='·'){
				digit= String('·');
                myAuto.src=SystemUrl+"dian/"+"dian.mp3";
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
			//同步请求后台拼接音频并返回播放地址
			console.info("数字串："+num);

			var replaceNum = num.replace("<br>","").replace("<br>","");
			console.info("replaceNum:"+replaceNum);
			var playNumgberList = replaceNum.split("");
		    for ( i in playNumgberList){
		    	var audio=document.createElement('AUDIO');
				var sampleNumber=playNumgberList[i];
		    	 if(!isNaN(sampleNumber)){
					audio.src=SystemUrl+Audio+"/"+sampleNumber+".mp3";
				}else {

		    		audio.src=SystemUrl+"dian-0-5.mp3";
				}

				document.getElementById("audioGroup").appendChild(audio);
			}
		    var audios=document.getElementsByTagName("audio");
            console.info(audios);
            console.info(audios.length);
		    for (var j=1;j<playNumgberList.length+1;j++){
				console.info("正在添加第"+j+"个监听器");
				audios[j].addEventListener('ended',function () {
					var nextAudio=this.nextSibling;
					if(flag == false){
						return true;
					}
					if(nextAudio==null){
						playAudio()
						//playAudio();
					}else {
						if (nextAudio.tagName == 'AUDIO') {
							if (PlaybackRate==1){
								nextAudio.play();
							} else  if (PlaybackRate==1.5){
								setTimeout(function(){nextAudio.play()},200);
							} else  if (PlaybackRate==2){
								setTimeout(function(){nextAudio.play()},400);
							}else  if (PlaybackRate==0.5){
								setTimeout(function(){nextAudio.play()},600);
							}
							//nextAudio.play();
						}
					}
				});
			}
		    flag=true;
			audios[1].play();
			//标识位
			//解析数字串
		audio11.pause();
			audio11.play();
			return false;
		}


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
	<div class="page page-current">
		<header class="bar bar-nav">
			<h1 class='title'  style="font-size: 22px ;font-face:宋体;">易道念数机</h1>
		</header>
		<div class="content" style="background-color: #d7ee8f">

			<audio type="audio/mp3" src="" id="numberPlay"></audio>

			<!-- 荧屏 -->
			<div class="neirong" align="center"><div id="display"></div></div>


			<div>
				<button type="button" class="buttonzuo" onclick="cancelNum();" style="width:38px; height:60px;border-radius:25px;margin-top: 1.8rem;margin-right: 3.8rem">取消</button>

				<%--<span style="border-radius:25px;width: 170px">
					<button type="button" class="" onclick="" style=""></button>
					<div style="float: left;margin-left: 2rem;margin-right: 2rem">
						<button type="button" class="tixing2" onclick="" style="">上一首</button>

						<button type="button" class="tixing1" onclick="" style="">下一首</button>
					</div>

					<button type="button" class="" onclick="" style=""></button>

				</span>--%>

				<button type="button" class="buttonzuo" onclick="playAudio();" style="width:38px; height:60px;border-radius:25px;margin-top: 1.8rem;margin-left: 3.8rem">播放</button>
			</div>

			<div style="text-align:center;">
				<button type="button" class="buttonzuo" onclick="changePlaybackRate()" >语速</button>
				<button type="button" class="buttonzuo" onclick="readNum('·');" style="font-size: 30px;">•</button>
				<button type="button" class="buttonzuo" onclick="changeAudio();" >切换</button>


				<button type="button" class="buttonzuo" onclick="readNum(1)" >1</button>
				<button type="button" class="buttonzuo" onclick="readNum(2)" >2</button>
				<button type="button" class="buttonzuo" onclick="readNum(3)" >3</button>
				<button type="button" class="buttonzuo" onclick="readNum(4)" >4</button>
				<button type="button" class="buttonzuo" onclick="readNum(5)" >5</button>
				<button type="button" class="buttonzuo" onclick="readNum(6)" >6</button>
				<button type="button" class="buttonzuo" onclick="readNum(7)" >7</button>
				<button type="button" class="buttonzuo" onclick="readNum(0)" >0</button>
				<button type="button" class="buttonzuo" onclick="readNum(8)" >8</button>
			</div>

			<div class="anniu">
				<div class="row1">
					<a class="button button-big button-fill button-success"
					   href="javascript:window.location = 'weixin/Classification.jsp'"
					  style="background-color:#FFFFFF;color:#000000;">常用配方查询</a>
				</div>
			</div>
			<div class="anniu">
				<div class="row1">
					<a href="javascript:window.location = 'weixin/Reward_formula.jsp'"
					   class="button button-big button-fill button-success"
					   style="background-color:#FFFFFF;color:#000000;">配方咨询</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="audioGroup"></div>
</body>
</html>
