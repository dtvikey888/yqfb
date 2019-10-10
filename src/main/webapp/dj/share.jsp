<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.liufeng.course.util.TimeString"%>
<%@page import="org.liufeng.course.util.DateDistance"%>
<%@page import="org.fjw.weixin.util.PublicFun"%>

<%
//关于回调
//如有朋友圈转发点开来的还是我自己点，那就不回调
//如果不是我自己点才回调
//回调后应该是调到另外一个助力页面
//String openid =request.getParameter("openid");

String bzlopenid =request.getParameter("bzlopenid");

//out.println("openid: "+openid);
//out.println("bzlopenid: "+bzlopenid);

String zlsession = (String)session.getAttribute("zlsession");

//out.println("zlsession: "+zlsession);
  
  
   if(zlsession!=null){
   
      if(zlsession.equals(bzlopenid)){
      
   	      //out.println("你是自己点的，不回调");
   	      
      }else{
        
          //out.println("其他人点了以后，不回调");
          //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx03c461977443af41&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqzgh%2foauthServlet&response_type=code&scope=snsapi_userinfo&state="+bzlopenid+"#wechat_redirect");        
   
          
      }
   
   }else{
   
  		//还没点要回调
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet11&response_type=code&scope=snsapi_userinfo&state="+bzlopenid+"#wechat_redirect");        
               
   
   }
   
   
  
 %>


<%




String fbsj = ZghTools.GetFbsjRd(bzlopenid);

//System.out.println("openid:="+openid);
System.out.println("bzlopenid:="+bzlopenid);

String str1=fbsj+" 00:00:00";
String str2=TimeString.nowTime();

String rd[] = PublicFun.split(fbsj,"-");


System.out.println("str1"+str1);
System.out.println("str1"+str2);

String dd=DateDistance.getDistanceTime3(str1,str2);
String dd2[] = PublicFun.split(dd,",");




//out.println(y1);
//out.println(m1);
//out.println(d1);
%>
<!DOCTYPE html>
<!-- saved from url=(0063)http://wx.qidong.me/71/ok.php?y=2007&m=1&d=1&from=singlemessage -->
<html lang="en" data-dpr="1" style="font-size: 33.75px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<meta name="HandheldFriendly" content="true">
	<title>不忘初心！ <%=ZghTools.GetNick(request.getParameter("bzlopenid")) %>已入党<%=dd2[0]%>年<%=dd2[1]%>月<%=dd2[2]%>日<%=dd2[3]%>时<%=dd2[4]%>分<%=dd2[5]%>秒</title>
	<link rel="stylesheet" type="text/css" href="index2_files/style.css">
	<script type="text/javascript" src="index2_files/font_resize.js"></script>
</head>
<body class="cansel_scrollbar">
	<audio preload="preload" id="car_audio" src="http://www.yqrb.com.cn/yqvod/bmwj/other/001.mp3" loop=""></audio>
	<div class="container">
		<section class="fix_top abs">
			<img src="img/08.png">
			
		</section> 
		<section class="content2">
			<div class="item1">
				<div>
					<p>&nbsp;</p>
				</div>
			
			<div class="t1">
                    <p><%=ZghTools.GetNick(bzlopenid) %>的入党日期为 <span><%=rd[0] %></span> 年 <span><%=rd[1] %></span> 月 <span><%=rd[2] %></span> 日</p>
				</div>
				<div class="t2">
                    <p>截止此时，<%=ZghTools.GetNick(bzlopenid) %>已经入党 <span><%=dd2[0]%></span> 年 <span><%=dd2[1]%></span> 月 <span><%=dd2[2]%></span> 天 <span id="showtimes"><%=dd2[3]%></span> 时 <span id="showtimesf"><%=dd2[4]%></span> 分 <span id="showtimesm"><%=dd2[5]%></span> 秒</p>
				</div>
			</div>


			
            <div class="share">
				<p>分享到朋友圈，让您的党员同志们一起来参加</p>
			</div>
			<div class="btn2">
				<input type="button" value="立即分享" class="join tojoin">
				<input type="button" value="重温党史" class="join" onClick="javascript:window.open('https://fileb39fa07b18e8.iamh5.cn/v3/idea/SuGqGbe1','_blank')">
				<input type="button" value="我要参加" class="join"  style="margin-top:20px;"  onClick="javascript:window.open('top.jsp','_blank')">
			</div>
			
			<div class="btn2">
				<img src="index2_files/logo.png" style="width:120px; height:36px; margin-top:20px;">
			</div>
			<div class="btn2">
				<img src="img/10.jpg" style="width:100%; height:100px; margin-top:20px;">
			</div>
			
			
		</section>
		
		<!--弹窗-->
		<section class="layout hide">
			<div class="maskpage">
				<img class="share" src="index2_files/share.png">
				<a class="ok">
					<img src="index2_files/ok.png">
				</a>
			</div>
		</section>
		<input type="hidden" id="size" name="size" value="2">
	
	</div>
	
	<script src="index2_files/jquery-1.8.3.min.js"></script>
	<script>
		setTimeout(function(){
			$(window).scrollTop(1);
		},0);
 
		/*音乐*/
		var audio = $('#car_audio');
		var isPlaying = false;
		function playAudio() {
			var audio = $('#car_audio');
			if (audio.attr('src') == undefined) {
				audio.attr('src', audio.data('src'));
			}
			audio[0].play();
			isPlaying = true;
		}
		
		$(function(){
			playAudio();
			document.addEventListener("WeixinJSBridgeReady", function () {
				WeixinJSBridge.invoke('getNetworkType', {}, function (e) {
					network = e.err_msg.split(":")[1];  //结果在这里
					playAudio();
				});
			}, false);
		})
	</script>
	
	<script language="javascript" type="text/javascript">
		jQuery(document).ready(function() {
			show_cur_times();
		});
		
		$(".tojoin").click(function(){
			$(".layout").removeClass("hide");
		});
		
		$(".ok").click(function(){
			$(".layout").addClass("hide");
		}); 
	</script>
	<script type="text/javascript">
		function show_cur_times(){
			//获取当前日期
			var date_time = new Date();
			
			//年
			var years = date_time.getFullYear();			
			//判断小于10，前面补0
			if(years<10){
				years="0"+years;
			}
			
			//月
			var months = date_time.getMonth()+1;
			//判断小于10，前面补0
			if(months<10){
				months="0"+months;
			}
			
			//日
			var days = date_time.getDate();
			//判断小于10，前面补0
			if(days<10){
				days="0"+days;
			}
			
			//时
			var hours =date_time.getHours();
			//判断小于10，前面补0
			if(hours<10){
				hours="0"+hours;
			}
			
			//分
			var minutes =date_time.getMinutes();
			//判断小于10，前面补0
			if(minutes<10){
				minutes="0"+minutes;
			}
			
			//秒
			var seconds=date_time.getSeconds();
			//判断小于10，前面补0
			if(seconds<10){
				seconds="0"+seconds;
			}

			//拼接年月日时分秒
			var date_str = hours;
			var date_fen = minutes;
			var date_miao = seconds;
			
			//显示在id为showtimes的容器里
			document.getElementById("showtimes").innerHTML= date_str;
			document.getElementById("showtimesf").innerHTML= date_fen;
			document.getElementById("showtimesm").innerHTML= date_miao; 
 
		}
		
		//设置1秒调用一次show_cur_times函数
		setInterval("show_cur_times()",100);
		
	</script>

<script src="index2_files/jweixin-1.1.0.js"></script>
<script>
    wx.config({
        debug: false,
        appId: 'wx2d52da4837093d05',
        timestamp: 1529983324,
        nonceStr: '8gvh9Y5X8dF3uXCx',
        signature: 'fae56e4aa35eb8bd39b0cacb2c46cc913c85b4f2',
        jsApiList: [
            // 所有要调用的 API 都要加到这个列表中
            'checkJsApi',
            'openLocation',
            'getLocation',
            'onMenuShareTimeline',
            'onMenuShareAppMessage'
          ]
    });
	
	wx.onMenuShareAppMessage({
          title: '不忘初心——入党那一天',
          desc: '查查您入党多久了',
          link: 'http://wx.qidong.me/71/index.php',
          imgUrl: 'http://wx.qidong.me/71/logo.jpg',
          trigger: function (res) {
            // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
            // alert('用户点击发送给朋友');
          },
          success: function (res) {
            // alert('已分享');
          },
          cancel: function (res) {
            // alert('已取消');
          },
          fail: function (res) {
            // alert(JSON.stringify(res));
          }
        });

        wx.onMenuShareTimeline({
          title: '不忘初心——入党那一天',
          link: 'http://wx.qidong.me/71/index.php',
          imgUrl: 'http://wx.qidong.me/71/logo.jpg',
          trigger: function (res) {
            // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
            // alert('用户点击分享到朋友圈');
          },
          success: function (res) {
            // alert('已分享');
          },
          cancel: function (res) {
            // alert('已取消');
          },
          fail: function (res) {
            // alert(JSON.stringify(res));
          }
        });
</script>
</html>