<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.MyUtils2"%>
<%@page import="org.fjw.weixin.util.MyUtils4"%>
<%@page import="org.liufeng.course.util.AdvancedUtil"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%

String openid = request.getParameter("openid");
String urlname = "xm/cj2.jsp";

String zsm = request.getParameter("zsm");

System.out.println("urlname="+urlname);
System.out.println("openid="+openid);
System.out.println("zsm="+zsm);


String check=Topay.WxJsApiCheck5(urlname,openid,zsm);


int fid = MyUtils4.GetFid();

%>

 <%
 //这里开始提交用户数据
   int fhz = MyUtils4.StartCJLR(MyUtils2.codetoString(openid),MyUtils2.codetoString(zsm),fid);
    //1 已经抽过奖(提交数据失败，然后关闭页面) 2.提交数据成功,然后关闭页面.
  %>
  
   <%
	 
	 //中了什么奖
	 String zsm22 = MyUtils4.zsm(openid,fid);
	  %>

<html>
	<head>
	
	 <title>抽奖活动</title>
	 
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
 
	 <link type="text/css" rel="stylesheet" href="css/other5.css">
	 
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
	
	

		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    <%=check%>,// 必填，签名，见附录1
		    jsApiList: ['hideMenuItems'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		wx.ready(function(){
		   //alert("config ok...");

		  <%
		//   String accessToken = WeixinChaOpenId.GetDBAccessToken(""+AllValus.memo+"");

		   %>

 		  <% if(fhz==1){
 		  // 组装文本客服消息
		  // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "您已经抽过奖，"+zsm22+"");
		// 发送客服消息
		  // AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
 		  %>
 		  
		        alert('您已经抽过奖，<%=zsm22%>');
               //关闭当前网页窗口接口
                wx.closeWindow();
                
		   <%}else{
		   
		   // 组装文本客服消息
		  // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, ""+zsm22+"");
		 // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "您已经抽过奖，"+zsm22+"");
		// 发送客服消息
		  // AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		   
		   %>
		   
		        alert('<%=zsm22%>');
               //关闭当前网页窗口接口
                wx.closeWindow();

		   <%}%>
		   
		   //隐藏右上角菜单接口
		   	  wx.hideOptionMenu();
		   	  
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
	alert('现在去发送给。。。，叫他们也来参加答题!');
  };		


		</script>
	</head>
  <body onload="sharefriendRound6()">
  
 
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


