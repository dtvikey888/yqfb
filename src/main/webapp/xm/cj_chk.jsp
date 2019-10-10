<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.MyUtils2"%>
<%@page import="org.fjw.weixin.util.MyUtils4"%>
<%

//cj.jsp 是答题 cj_chk.jsp 是填写用户信息
String urlname ="xm/cj_chk.jsp";
String openid =request.getParameter("openid");
String check=Topay.WxJsApiCheck4(urlname,openid);

 int fid = new Integer(request.getParameter("fid"));
 int c1=new Integer(request.getParameter("c1"));
 String xm = new String (request.getParameter("xm").getBytes("ISO-8859-1"),"UTF-8");
 String tel = request.getParameter("tel");
 int bz=0;  //答题错误标志是1

//这里判断如果是完全答题正确，本页处理，否则写入openid 并 cs+1 如果是cs=4次 关闭页面 提醒当天答题超过3次请明天再来，否则调转到前一页继续答题
if(MyUtils4.iszq(c1)){
    
    
     out.println("<script>window.location.href='cj_chk2.jsp?fid="+fid+"&c1="+c1+"&xm="+xm+"&tel="+tel+"&openid="+openid+"'</script>");


}else{
   //不正确的情况下 写入用户数据 直接退出
    
     MyUtils4.qoc(openid,fid,c1,xm,tel);
        
     //out.println("<script>alert('答题错误,谢谢参与!');window.location.href='cj.jsp?openid="+openid+"'</script>");
    bz=1;     
    
}

%>


<html>
	<head>
	
	 <title></title>
	 
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
	 
	  
	 

	   
	 
	  
	<script>
function DataLength(fData) 
{ 
    var intLength=0 
    for (var i=0;i<fData.length;i++) 
    { 
        if ((fData.charCodeAt(i) < 0) || (fData.charCodeAt(i) > 255)) 
            intLength=intLength+2 
        else 
            intLength=intLength+1    
    } 
    return intLength 
} 
</script>

	 
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript" charset="gb2312"></script>
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
		   //判断答题是否正确
		   if(bz==1){
		   
		            // 组装文本客服消息
		  // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "全部奖品已抽完,感谢您的关注，请下次再来！");
		// 发送客服消息
		//   AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		   
		   %>
		   
		        alert('答题错误,谢谢参与!');
              
                wx.closeWindow();
                
           <%}%>
		   	  
			  wx.checkJsApi({
           jsApiList: [
             'hideMenuItems',
           ],
           success: function (res) {
             //alert(JSON.stringify(res));
             
           }
          });
          
		});
		wx.error(function(res){
			//alert(res);
		    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		});
		
		
			
			// 2.2 监听分享到朋友圈按钮点击、自定义分享内容及分享结果接口
  function  sharefriendRound2() {
     //显示右上角菜单接口
       wx.showOptionMenu();
	   
    wx.onMenuShareTimeline({
      title: '邀您来答题',
      link: 'http://www.yqrb.com.cn/CreatWs/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg',
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
       // alert('用户点击分享到朋友圈');
      },
      success: function (res) {
        alert('已分享');
      },
      cancel: function (res) {
        alert('已取消');
      },
      fail: function (res) {
       // alert(JSON.stringify(res));
      }
    });
	
    //alert('已注册获取“分享到朋友圈”状态事件');
	//alert('现在去分享给朋友吧，叫他们也来参加预约报名!');
  };
  

	// 2.2 监听“发送给朋友”按钮点击、自定义分享内容及分享结果接口
  function  sharefriendRound3() {
     //显示右上角菜单接口
       wx.showOptionMenu();
	   
    wx.onMenuShareAppMessage({
      title: '邀您来答题',
      desc: '快来参加答题',
      link: 'http://www.yqrb.com.cn/CreatWs/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg',
      type: '', // 分享类型,music、video或link，不填默认为link
      dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
       // alert('用户点击发送给朋友');
      },
      success: function (res) {
        alert('已分享');
      },
      cancel: function (res) {
        alert('已取消');
      },
      fail: function (res) {
       // alert(JSON.stringify(res));
      }
    });
	
    //alert('已注册获取“分享到朋友圈”状态事件');
	//alert('现在去发送给朋友吧，叫他们也来参加预约报名!');
  };
  			
	// 2.2 监听“发送给qq朋友”按钮点击、获取“分享到QQ”按钮点击状态及自定义分享内容接口
  function  sharefriendRound4() {
     //显示右上角菜单接口
       wx.showOptionMenu();
	   
    wx.onMenuShareQQ({
      title: '邀您来答题',
      desc: '快来参加答题',
      link: 'http://www.yqrb.com.cn/CreatWs/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg',
     
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
       // alert('用户点击发送给QQ朋友');
      },
      success: function (res) {
        alert('已分享');
      },
      cancel: function (res) {
        alert('已取消');
      },
      fail: function (res) {
      //  alert(JSON.stringify(res));
      }
    });
	
    //alert('已注册获取“分享到朋友圈”状态事件');
	//alert('现在去发送给QQ朋友吧，叫他们也来参加预约报名!');
  };	
		
		
		
				
	// 2.2 监听“分享到腾讯微博”按钮点击、获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口
  function  sharefriendRound5() {
     //显示右上角菜单接口
       wx.showOptionMenu();
	   
    wx.onMenuShareWeibo({
      title: '邀您来答题',
      desc: '快来参加答题',
      link: 'http://www.yqrb.com.cn/CreatWs/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg',
     
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
       // alert('用户点击发送给腾讯微博');
      },
      success: function (res) {
        alert('已分享');
      },
      cancel: function (res) {
        alert('已取消');
      },
      fail: function (res) {
       // alert(JSON.stringify(res));
      }
    });
	
    //alert('已注册获取“分享到朋友圈”状态事件');
	//alert('现在去发送给腾讯微博吧，叫他们也来参加预约报名!');
  };	
			
				
	// 2.2 监听“提交”按钮点击、获取“批量隐藏菜单项 ”
  function  sharefriendRound6() {
     //显示右上角菜单接口
      // wx.showOptionMenu();
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
      //  alert('已隐藏一系列按钮'); 
      }, 
      fail: function (res) { 
        alert(JSON.stringify(res)); 
      } 
    }); 
	
    //alert('已注册获取“分享到朋友圈”状态事件');
	//alert('现在去发送给。。。，叫他们也来参加预约报名!');
  };		
  

		</script>
	</head>
  <body onload="sharefriendRound6()">
  

    <div  id="contentid" style="display:block">
    
  

    <header>
        <div class="left-box">        </div>
        <h1></h1>
    </header>
	


<div id="tips"></div>



<footer>
    <div class="ft-wrap">
  </div>
    <nav class="ft-nav"></nav>
  <div class="ft-partner"></div>
    <div class="ft-copyright"><span class="ft-copyright-text">2015中国乐清网 <a href="#" target="_blank">浙ICP备05000063号</a></span></div>
</footer>


 
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


