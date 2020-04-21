<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.MyUtils2"%>
<%@page import="org.fjw.weixin.util.MyUtils25"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MathRandom6"%>
<%

String openid = request.getParameter("openid");
String urlname = "bl4/cj_chk.jsp";
//String xm = MyUtils2.codetoString(request.getParameter("xm"));
String xm = request.getParameter("xm");
String tel = request.getParameter("tel");
String bh = MyUtils25.GetNextBH();

System.out.println("openid="+openid);
System.out.println("urlname="+urlname);

String check=Topay.WxJsApiCheck3(urlname);

%>

 <%
    //这里开始提交用户数据
     int bz = MyUtils25.StartCJBM(openid,xm,tel,bh);
    //1 已经抽过奖(提交数据失败，然后关闭页面) 2.提交数据成功,留在本页面 就是抽奖页面. 3.已经存在相同手机号
     if(bz==3){

         out.print("<script type=\"text/javascript\">alert('"+AllValus.error_lan2+"');history.back();window.location.href=document.referrer;</script>");

     }
  %>




<html>
	<head>

	 <title><%=AllValus.daf_lp_title %></title>

	<meta name="description" content="">
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1" media="(device-height: 568px)">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="full-screen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="http://ms0.meituan.net/touch/img/startup/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="http://ms0.meituan.net/touch/img/startup/apple-touch-icon-120x120-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="196x196" href="http://ms0.meituan.net/touch/img/startup/apple-touch-icon-196x196-precomposed.png">
    <link rel="apple-touch-startup-image" href="http://ms0.meituan.net/touch/img/startup/apple-touch-startup-image-640x1096.png" media="(device-height:568px)">
    <link rel="apple-touch-startup-image" href="http://ms0.meituan.net/touch/img/startup/apple-touch-startup-image-640x920.png" media="(device-height:480px)">

	 <link type="text/css" rel="stylesheet" href="../css/other10.css">

	 <script type="text/javascript"  src="js/jquery-1.9.1.js"></script>
	 <style type="text/css">
	*{margin:0;padding:0;list-style-type:none;}
	a,img{border:0;}
	body{position:relative;background:url(img/guaguaka_bg.png) no-repeat 50% 0;height:640px;overflow:hidden;}

	#bg2{width:295px;height:195px;margin:0 auto;}
	#gua1{width:295px;;margin:0 auto;}
	#notify{width:295px;height:101px;margin:0 auto;}
	#nImg_div{position:absolute;color:white;font-size:17px;font-family:'黑体';}
	#nImg_div div{width:245px;height:101px;padding:20px 0px 0px 50px;}
	#di{width:295px;margin:0 auto;}
	#bg1{display:none;position:fixed;top:0%;left:0%;width:100%;height:100%;background-color:black;z-index:1001;-moz-opacity:0.7;opacity:.70;filter:alpha(opacity=70);}
	#show{display:none;position:absolute;top:222px;left:50%;margin-left:-148px;text-align:center;background-color:#fff;z-index:1002;overflow:auto;}
	#show div{margin-top:-145px;margin-left:40px;padding-right:40px;line-height:1.5;color:#000000;font-size:17px;font-family:'黑体';}
	</style>

	 <%
	//控制时间
	int kz =0;
	String cc1=AllValus.daf_p1;
	String cc2=AllValus.daf_p2;
    Date c1=MyUtils2.CharDate(cc1);
    Date c2=MyUtils2.CharDate(cc2);
    kz= MyUtils2.TimeKZ(c1,c2);
    //1: //开始抽奖
    //2: //抽奖已经结束,感谢关注！
    //3: //抽奖还没开始呢

	 %>

	 <%

	 //中了什么奖
	// String zsm = MyUtils25.zsm(openid);
	  %>

	   <%

//各个奖项总剩余

int t1 = MyUtils25.sy1(); //一等奖总数剩余名额
int t2 = MyUtils25.sy2(); //二等奖总数剩余名额
int t3 = MyUtils25.sy3(); //三等奖总数剩余名额
int t4 = MyUtils25.sy4(); //四等奖总数剩余名额
int t5 = MyUtils25.sy5();
int t6 = MyUtils25.sy6();


//System.out.println(t1);
//System.out.println(t2);
//System.out.println(t3);
//System.out.println(t4);
//System.out.println(t5);
//System.out.println(t6);

   %>


    <%

//各个奖项每天的剩余 <=0 表示没了

int day_sy1 = MyUtils25.TodaySY(1); //一等奖当天剩余名额
int day_sy2 = MyUtils25.TodaySY(2); //二等奖当天剩余名额
int day_sy3 = MyUtils25.TodaySY(3); //三等奖当天剩余名额
int day_sy4 = MyUtils25.TodaySY(4);
int day_sy5 = MyUtils25.TodaySY(5);
int day_sy6 = MyUtils25.TodaySY(6);


//System.out.println(day_sy1);
//System.out.println(day_sy2);
//System.out.println(day_sy3);

   %>

		<script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
		<script type="text/javascript">
		wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    <%=check%>,// 必填，签名，见附录1
		    jsApiList: ['hideMenuItems'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		wx.ready(function(){
		   //alert("config ok...");

		   //隐藏右上角菜单接口
		   	  wx.hideOptionMenu();

		   	    <%
		  // String accessToken = WeixinChaOpenId.GetDBAccessToken(""+AllValus.memo+"");

		   %>





		   <%
		   //判断全部名额剩余
		   if(t1<=0 && t2<=0 && t3<=0 && t4<=0 && t5<=0 && t6<=0){
		  //if(t1<0){

		     // 组装文本客服消息
		  // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "全部奖品已抽完,感谢您的参与，请关注我们下一期活动！");
		// 发送客服消息
		 //  AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);

		   %>

		        alert('全部奖品已抽完,感谢您的参与，请关注我们下一期活动！');
               //关闭当前网页窗口接口
                wx.closeWindow();

           <%}%>


		  <%
		     // 根据起止时间判断是否关闭窗口 ，弹出提醒窗
		  // kz=1 开始抽奖(不关) kz=2 抽奖结束(关闭) kz=3 抽奖没开始（关闭）

		   if (kz==1){


		  %>
		 // alert("开始抽奖");

		  <%}else if(kz==2){
		   // 组装文本客服消息
		  // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "非常抱歉，抽奖时间已过。感谢您对\"中国乐清网\"的关注，请下次再来！");
		// 发送客服消息
		  // AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);


		  %>

            alert('非常抱歉，抽奖时间已过。感谢您的关注，请下次再来！');
            //关闭当前网页窗口接口
            wx.closeWindow();

		  <%}else if(kz==3){
		   // 组装文本客服消息
		   //String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "还没开始呢，\"开始抽奖时间"+cc1+"\"到\""+cc2+"\"！\n欢迎到时候参与！");
		// 发送客服消息
		  //AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);


		  %>

           alert('还没开始呢，"抽奖时间<%=cc1%>"到"<%=cc2%>"！\n欢迎到时候参与！');
           //关闭当前网页窗口接口
           wx.closeWindow();

		  <%}else{

		    // 组装文本客服消息
		//   String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "感谢关注！");
		// 发送客服消息
		//   AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);

		  %>

		     alert('感谢关注！');
            //关闭当前网页窗口接口
            wx.closeWindow();

		  <%} %>



			    wx.checkJsApi({
           jsApiList: [
             'hideMenuItems',
           ],
           success: function (res) {
            // alert(JSON.stringify(res));

           }
          });

		});
		wx.error(function(res){
			//alert(res);
		    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		});

// 2.2 监听页面 body onload、获取“批量隐藏菜单项 ”
  function  sharefriendRound6() {

   //隐藏右上角菜单接口
	wx.hideOptionMenu();


   wx.hideMenuItems({
      menuList: [
        'menuItem:readMode', // 阅读模式
        'menuItem:openWithQQBrowser', // 在	QQ浏览器中打开
        'menuItem:openWithSafari', //在Safari中打开
        'menuItem:share:email', //邮件
        'menuItem:copyUrl', // 复制链接
        'menuItem:favorite', //收藏
        'menuItem:share:brand', //一些特殊公众号
        'menuItem:jsDebug',  //调试:
		'menuItem:editTag', //编辑标签:
	    'menuItem:delete',  //删除:
 		'menuItem:originPage', //原网页:
 		'menuItem:share:qq',  //分享到QQ:
 		'menuItem:share:weiboApp',  //分享到Weibo:
		'menuItem:favorite',  //收藏:
 		'menuItem:share:facebook', //分享到FB:
		'menuItem:share:QZone'  //分享到 QQ 空间

      ],
      success: function (res) {
        alert('已隐藏一系列按钮');
      },
      fail: function (res) {
        alert(JSON.stringify(res));
      }
    });

    //alert('已注册获取“分享到朋友圈”状态事件');
	//alert('请转发原文链接至微信朋友圈，获得额外的抽奖机会。');
  };


		</script>
	</head>
  <body onLoad="sharefriendRound6()">

    <div  id="contentid" style="display:block">



  <input type="hidden" name="opp" id="opp" value="<%=openid %>">
  <input type="hidden" name="day_sy1" id="day_sy1" value="<%=day_sy1%>">
  <input type="hidden" name="day_sy2" id="day_sy2" value="<%=day_sy2%>">
  <input type="hidden" name="day_sy3" id="day_sy3" value="<%=day_sy3%>">
  <input type="hidden" name="day_sy4" id="day_sy4" value="<%=day_sy4%>">
  <input type="hidden" name="day_sy5" id="day_sy5" value="<%=day_sy5%>">
  <input type="hidden" name="day_sy6" id="day_sy6" value="<%=day_sy6%>">
  <!--
  <input type="hidden" name="day_sy2" id="day_sy2" value="<=day_sy2%>">
  <input type="hidden" name="day_sy3" id="day_sy3" value="<=day_sy3%>">
  <input type="hidden" name="day_sy4" id="day_sy4" value="<=day_sy4%>">
  <input type="hidden" name="day_sy5" id="day_sy5" value="<=day_sy5%>">-->

  <!-- 修改img.src时涂层也会自动适应新图片的尺寸.修改layer函数可更改涂层样式 -->
   <div id="bg2"><!-- <img id="bg2_img" src="img/guaguaka_word.png" width="295" height="195" style="position:absolute;"/>--></div>

<div id="gua1">
	<img id="gua1_img" src="img/gua_image.png" style="position: absolute;"/>
	<canvas id="front" style="position:absolute;" />
</div>

<div id="notify">
	<img id="nImg" src="img/notice_bg.png" style="position: absolute;"/>
	<div id="nImg_div">
		<div>刮开刮刮卡，看看您运气!</div>
	</div>
</div>
<!--
<div id="di"><img id="di_img" src="img/detail_declare_bg.png" style="position: absolute;"/></div>
-->
<div id="bg1"></div>

<div id="show">
	<img id="show_img" src="img/dialog_bg.png" width="100%" height="100%"/>
	<!--  <div>亲，您今天的机会已经用完了~明天再接再励！</div>-->
	<div>亲，您已经抽过奖了！</div>
	<img id="show_btn" src="img/btn_sure.png" style="margin-top: 30px;" onClick="hidediv()"/>
</div>


<script type="text/javascript">
var gua = 1,re = 2;  // 可设置刮奖次数
//var imgSrc = 'img/aa.png';
var imgSrc = ['img/z_1.jpg','img/z_2.jpg','img/z_3.jpg','img/z_4.jpg','img/z_5.jpg','img/z_6.jpg','img/z_7.jpg'];
//var imgSrc = ['img/z_1.jpg','img/z_2.jpg','img/z_3.jpg','img/z_4.jpg'];

//var num = Math.floor(Math.random()*4);
<%
MathRandom6  a = new MathRandom6();
int rds = a.PercentageRandom();
%>
var num = <%=rds%>

//alert(num);

//这里要判断中奖概率 根据得到的num 对比 传过来的标志如果 标志是0 ,变为没抽中，那就把 num=4 ，否则标志是1，那就 num不变让他抽中
//而且如果num=4不传入，只传入 0，1，2，3

var day_sy1 = document.getElementById("day_sy1").value;   //一等奖当天剩余<=0表示没有了
var day_sy2 = document.getElementById("day_sy2").value;   //二等奖当天剩余<=0表示没有了
var day_sy3 = document.getElementById("day_sy3").value;   //三等奖当天剩余<=0表示没有了
var day_sy4 = document.getElementById("day_sy4").value;   //四等奖当天剩余<=0表示没有了
var day_sy5 = document.getElementById("day_sy5").value; //五等奖当天剩余<=0表示没有了
var day_sy6 = document.getElementById("day_sy6").value; //6等奖当天剩余<=0表示没有了

//这里弄概率了
switch (num)
{

    case 0:
        if(day_sy1<=0){
            num2=6;
        }else{
            num2=0;
        }
        break;

    case 1:
        if(day_sy2<=0){
            num2=6;
        }else{
            num2=1;
        }
        break;

    case 2:
        if(day_sy3<=0){
            num2=6;
        }else{
            num2=2;
        }
        break;

    case 3:
        if(day_sy4<=0){
            num2=6;
        }else{
            num2=3;
        }
        break;

    case 4:
        if(day_sy5<=0){
            num2=6;
        }else{
            num2=4;
        }
        break;

    case 5:
        if(day_sy6<=0){
            num2=6;
        }else{
            num2=5;
        }
        break;

    case 6:
        num2=6;
        break;

}



function showdiv() {
	 document.getElementById("bg1").style.display ="block";
	 document.getElementById("show").style.display ="block";
}

function hidediv() {
	 document.getElementById("bg1").style.display ='none';
	 document.getElementById("show").style.display ='none';
}

$(function(){
	var width = $("#show_img").width();
	var height = $("#show_img").height();
	var winheight=$(window).height();
	var winwidth=$(window).width();
	$("#show").css({"width":300+"px","height":160+"px","overflow":"hidden"});
	$("#show_btn").css({"width":176*0.5+"px","height":76*0.5+"px"});
	$("#gua_div").html("x"+gua);
	$("#re_div").html("x"+re);

	if(gua == 0){
		showdiv();
	}
})

$("img").load(function(){
	var body_width = $(window).width();
	var body_height = $(window).height();
	$("#gua1_img").width(300).height(160);
	var height = 141;
	var width  = 285;
	var bg2_width = $("#bg2_img").width();
	var bg2_height = $("#bg2_img").height();

	$("#gua1").css({"margin-top":"20px"});

	$("#notify").css({"margin-top":"200px"});
	$("#nImg").width(300).height(101);

	$("#di").css({"margin-top":"50px"});
	$("#di_img").width(414*0.7).height(24*0.7);


	$("#gua").width(width/10).height(width/10);
	$("#gua_div").css({"line-height":width/10+"px","width":width/10+"px","height":width/10+"px","margin-top":"-"+($("#gua").height())+"px","margin-left":$("#gua").height()+5+"px","font-size": $("#gua").height()/1.6+"px"});
	$("#re").width(width/10).height(width/10);
	$("#re_div").css({ "line-height":width/10+"px","width":width/10+"px","height":width/10+"px","margin-top":"-"+($("#gua").height())+"px","margin-left":$("#gua").height()+5+"px","font-size": $("#gua").height()/1.6+"px"});
	var gua1_img_width = $("#gua1_img").width();
	$("#front").css({"margin-top":9.3+"px","margin-left":7.5+"px"});
	if(gua > 0){
		bodys(height,width);
	}
});
function bodys(height,width){
	var img = new Image();
	var canvas = document.querySelector('canvas');
	canvas.style.position = 'absolute';
	img.addEventListener('load',function(e){
		var ctx;
		var w = width, h = height;
		var offsetX = canvas.offsetLeft, offsetY = canvas.offsetTop;
		var mousedown = false;
		function layer(ctx){        //修改layer函数可更改涂层样式
			ctx.fillStyle = 'gray';
			ctx.fillRect(0, 0, w, h);
		}

		function eventDown(e){
			e.preventDefault();
			mousedown=true;

		}

		function eventUp(e){

			e.preventDefault();
			mousedown=false;

			//多次弹出的问题 不在别的 就在于 eventUP

			//这里增加的 需要判断是否刮完时用这段代码替换原代码的eventUp事件处理函数:
			//这段代码中的0.8是80%的意思,在涂层的面积小于等于80%时,就弹出窗口,表示刮完了,可以根据需求自行调整
			var data=ctx.getImageData(0,0,w,h).data;

			for(var i=0,j=0;i<data.length;i+=4){

			if(data[i] && data[i+1] && data[i+2] && data[i+3]){


				   j++;

			   }


			}


			if(j<=w*h*0.9){



					//alert(j);
					//alert('ok');

					//在这里把中什么奖发给数据库

					var zj1= num2+1;

					var opp = document.getElementById("opp").value;
				    //alert('中了,'+zj1+" openid ,"+opp);


		            //var day=new Date().getDay();

                switch (zj1)
                {
                    case 1:
                        x="恭喜您中了特等奖价值4999元华为手机";
                        break;
                    case 2:
                        x="恭喜您中了一等奖价值1299元小米扫地机器";
                        break;
                    case 3:
                        x="恭喜您中了二等奖价值99元九阳多功能料理机";
                        break;
                    case 4:
                        x="恭喜您中了三等奖价值79元天猫精灵方糖智能音箱";
                        break;
                    case 5:
                        x="恭喜您中了参与奖充电宝、小米背包、飞科电吹风等";
                        break;
                    case 6:
                        x="恭喜您中了特别奖价值249元小米旅行箱";
                        break;
                    case 7:
                        x="谢谢参与";
                        break;
                }

                  // alert(x);


                    //利用对话框返回的值 （true 或者 false）

                    location.href="<%=AllValus.propath%>bl4/cj2.jsp?tel=<%=tel%>&openid="+opp+"&zsm="+zj1+" ";

                    //var truthBeTold = window.confirm(x);
					//if (truthBeTold) {
						//window.alert("欢迎访问我们的 Web 页！");

					//	location.href="http://www.yqrb.com.cn/sxyqwx/cj2.jsp?openid="+opp+"&zsm="+zj1+" ";

					//}else{
					    //window.alert("再见啦！");

					//    location.href="http://www.yqrb.com.cn/sxyqwx/cj2.jsp?openid="+opp+"&zsm="+zj1+" ";

					//}



				}



		}

		function eventMove(e){
			e.preventDefault();
			if(mousedown){
				if(e.changedTouches){
					e=e.changedTouches[e.changedTouches.length-1];
				}
				var x = (e.clientX + document.body.scrollLeft || e.pageX) - offsetX || 0,
				y = (e.clientY + document.body.scrollTop || e.pageY) - offsetY || 0;
				with(ctx){
					beginPath()
					arc(x, y, 15, 0, Math.PI * 2);
					fill();
				}



			}



		}
		canvas.width=w;
		canvas.height=h;

		canvas.style.backgroundImage='url('+img.src+')';
		ctx=canvas.getContext('2d');
		ctx.fillStyle='b9b9b9';
		ctx.fillRect(0, 0, w, h);

		layer(ctx);
		ctx.globalCompositeOperation = 'destination-out';
		canvas.addEventListener('touchstart', eventDown);
		canvas.addEventListener('touchend', eventUp);
		canvas.addEventListener('touchmove', eventMove);
		canvas.addEventListener('mousedown', eventDown);
		canvas.addEventListener('mouseup', eventUp);
		canvas.addEventListener('mousemove', eventMove);
	});

	//img.src = imgSrc;
	img.src = imgSrc[num2];



	(document.body.style);
}
</script>
<!--
<footer>
    <div class="ft-wrap">
  </div>
    <nav class="ft-nav"></nav>
  <div class="ft-partner"></div>
    <div class="ft-copyright"><span class="ft-copyright-text">2015  <a href="#" target="_blank">浙ICP备05000063号</a></span></div>
</footer>
-->
 </div>
  </body>
</html>


<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //是微信浏览器不做操作

    }else{
	  // alert('not');
	  //非微信浏览器就因此显示列表等
	   var target=document.getElementById("contentid");
	   target.style.display="none";
	   alert('非微信中打开');


	}
}
function isWeiXin(){
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}
</script>