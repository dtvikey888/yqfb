<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils2"%>
<%@page import="org.fjw.weixin.util.MyUtils22"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.liufeng.course.util.AdvancedUtil"%>
<%
String urlname ="bl3/cj.jsp";
String openid =request.getParameter("openid");
String check=Topay.WxJsApiCheck4(urlname,openid);
%>
<html>
	<head>
	
	 <title><%=AllValus.daf_title %></title>
	 
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
	 
	 <%
	//控制时间
	int kz =0;
	String cc1=AllValus.daf_t1;
	String cc2=AllValus.daf_t2;
    Date c1=MyUtils2.CharDate(cc1);
    Date c2=MyUtils2.CharDate(cc2);
    kz= MyUtils2.TimeKZ(c1,c2);
    //1: //开始抽奖
    //2: //抽奖已经结束,感谢关注！
    //3: //抽奖还没开始呢
	 %>
	 
<%
//是否已经抽奖
//boolean iscj = MyUtils22.iscj_pd3(tel);
//中了什么奖
//String zsm = MyUtils21.zsm(openid);
%>

<%
//各个奖项总剩余
int t1 = MyUtils22.sy1(); //一等奖总数剩余名额
int t2 = MyUtils22.sy2(); //二等奖总数剩余名额
//int t3 = MyUtils22.sy3(); //三等奖总数剩余名额
//int t4 = MyUtils22.sy4(); //四等奖总数剩余名额
//int t5 = MyUtils22.sy5();

System.out.println(t1);
System.out.println(t2);
//System.out.println(t3);
//System.out.println(t4);
//System.out.println(t5);
%>
	  
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
		   	  //wx.hideOptionMenu();
		   
		     <%
		     
		   //String accessToken = WeixinChaOpenId.GetDBAccessToken(""+AllValus.memo+"");

		   %>
		   
		   

		   <%
		   //判断全部名额剩余
		   if(t1<=0 && t2<=0){
		   //if(t1<0){
		            // 组装文本客服消息
		 //  String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "全部奖品已抽完,感谢您对\"中国乐清网\"的关注，请下次再来！");
		// 发送客服消息
		 //  AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		   
		   %>
		   
		        alert('全部奖品已抽完,感谢您的关注，请下次再来！');
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
		 //  String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "还没开始呢，\"开始抽奖时间"+cc1+"\"到\""+cc2+"\"！\n欢迎到时候参与！");
		// 发送客服消息
		  // AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		  
		  %>
		  
           alert('还没开始呢，"开始抽奖时间<%=cc1%>"到"<%=cc2%>"！\n欢迎到时候参与！');
           //关闭当前网页窗口接口
           wx.closeWindow();
		 
		  <%}else{
		       // 组装文本客服消息
		//   String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "感谢关注！");
		// 发送客服消息
		 //  AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		  
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
      // wx.showOptionMenu();
	   
    wx.onMenuShareTimeline({
      title: '中国乐清网邀您来抽奖',
      link: 'http://www.yqrb.com.cn/yqcnwx2/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo9.jpg',
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
       //wx.showOptionMenu();
	   
    wx.onMenuShareAppMessage({
      title: '中国乐清网邀您来抽奖',
      desc: '快来参加抽奖',
      link: 'http://www.yqrb.com.cn/yqcnwx2/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo9.jpg',
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
      // wx.showOptionMenu();
	   
    wx.onMenuShareQQ({
      title: '中国乐清网邀您来抽奖',
      desc: '快来参加抽奖',
      link: 'http://www.yqrb.com.cn/yqcnwx2/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo9.jpg',
     
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
       //wx.showOptionMenu();
	   
    wx.onMenuShareWeibo({
      title: '中国乐清网邀您来抽奖',
      desc: '快来参加活动',
      link: 'http://www.yqrb.com.cn/yqcnwx2/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo9.jpg',
     
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
       //alert(JSON.stringify(res)); 
      } 
    }); 
	
    //alert('已注册获取“分享到朋友圈”状态事件');
	//alert('您知道乐清正在开展生态环境整治吗?');
  };		


		</script>
	</head>
  <body onload="sharefriendRound6()">
  

    <div  id="contentid" style="display:block">
    
  

    <header>
        <div class="left-box"></div>
        <h1>填写联系方式</h1>
    </header>
	
	
<!-- 
<div style=" margin-left:5px; margin-right:5px; padding-bottom:6px; padding-top:8px; line-height:25px;"> 
<SPAN style="COLOR: #ff0000"><B>抽奖规则：</B></SPAN>
<P>1、<SPAN style="COLOR: #0000ff"> 关注“中国乐清网”（yq3535）公众微信号</SPAN>
</P>
<P>2、<SPAN style="color:#0000FF">回复关键字"变脸"</SPAN></P>
<P>3、<SPAN style="color:#0000FF">点击进入本页面，填写姓名+电话，点击提交按钮进入抽奖。</SPAN></P>
<P><SPAN style="COLOR: #ff0000"><B>抽奖时间：</B></SPAN></P>
<P><=AllValus.jg1 %>-<=AllValus.jg2 %></P>
  </div>
 -->	


<div id="tips"></div>

<div class="body p-10 address-edit">

    <form id="form1" name="form1" method="post" action="cj_chk.jsp">
       
   
       <input type="hidden" name="openid" value="<%=openid %>">
		
	 
		<table width="100%" border="0" cellpadding="3" cellspacing="1">
      <tr>
        <td height="20"  bgcolor="#E8F0F7">&nbsp;<span class="STYLE20">请认真填写用户信息</span></td>
        </tr>
    
		
		  
		
      <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><input  id="xm" name="xm" type="text" class="input-common" placeholder="姓名" pattern=".{2,}"  maxlength="10"  data-err="请正确填写姓名" value=""></td>
        </tr>
	  </tbody>
	
	  
	 <tbody id="tbTel">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><input id="tel" name="tel" type="tel" class="input-common" placeholder="手机号码" pattern="\d{3}[\d\*]{4,}"   maxlength="20" /></td>
        </tr>
	  </tbody>
	  
	  
	  
	
	  
	
      <tr>
        <td height="20" bgcolor="#FFFFFF">	<!--
		if (s1<=0 and s2<=0 and s3<=0 and s4<=0 and s5<=0) then%>
		<div class="form-btn">
<span gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" );">这次名额已经没了报名结束！</span>
        </div>
		
		else%>
		-->
          <div class="form-btn">
          <% if(t1<=0 && t2<=0){ %>
          
          <%}else{ %>
  <button type="submit" gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" onClick="document.form1.action='cj_chk.jsp';if(DataLength(form1.xm.value)<2){alert('姓名最少2个字');form1.xm.focus();return false};if(DataLength(form1.tel.value)<2){alert('请填写正确的联系方式');form1.tel.focus();return false};document.form1.submit();">提 交</button>
          <%} %>
          
          </div>
          <!--
		end if%>
		-->          </td>
        </tr>
    </table>
		
    </form>
</div>
<!--  
<footer>
    <div class="ft-wrap">
  </div>
    <nav class="ft-nav"></nav>
  <div class="ft-partner"></div>
    <div class="ft-copyright"><span class="ft-copyright-text">2015中国乐清网 <a href="#" target="_blank">浙ICP备05000063号</a></span></div>
</footer>
-->

 
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


