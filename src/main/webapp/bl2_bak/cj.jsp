<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils22"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.liufeng.course.util.AdvancedUtil"%>
<%
String urlname ="bl2/cj.jsp";
String openid =request.getParameter("openid");
String check=Topay.WxJsApiCheck4(urlname,openid);
%>

<%
    //控制时间
    int kz =0;
    String tt1=AllValus.daf_t1;
    String tt2=AllValus.daf_t2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //开始抽奖
    //2: //抽奖已经结束,感谢关注！
    //3: //抽奖还没开始呢！
    //out.println(kz);
%>
<html>
	<head>
        <script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
        <script>
            /*
             * 注意：
             * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
             * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
             * 3. 常见问题及完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
             *
             * 开发中遇到问题详见文档“附录5-常见错误及解决办法”解决，如仍未能解决可通过以下渠道反馈：
             * 邮箱地址：weixin-open@qq.com
             * 邮件主题：【微信JS-SDK反馈】具体问题
             * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
             */
            wx_share_title="<%=AllValus.daf_title%>";
            wx_share_desc="<%=AllValus.daf_desc%>";
            wx_share_link="<%=AllValus.daf_link%>";
            wx_share_imgUrl="<%=AllValus.daf_img%>";

            wx.config({
                    debug: false,
                <%=check%>,// 必填，签名，见附录1
                jsApiList: [
                'updateTimelineShareData',
                'updateAppMessageShareData'
            ]
            });

            wx.ready(function () {   //需在用户可能点击分享按钮前就先调用
                wx.updateTimelineShareData({
                    title: wx_share_title,
                    link: wx_share_link,
                    imgUrl: wx_share_imgUrl,
                    trigger: function (res) {
                        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
                        //alert('用户点击分享到朋友圈');
                    },
                    success: function (res) {
                        //  alert('已分享');
                    },
                    cancel: function (res) {
                        // alert('已取消');
                    },
                    fail: function (res) {
                        //alert(JSON.stringify(res));
                    }
                });


                wx.updateAppMessageShareData({
                    title: wx_share_title,
                    desc: wx_share_desc,
                    link: wx_share_link,
                    imgUrl: wx_share_imgUrl,
                    trigger: function (res) {
                        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
                        // alert('用户点击发送给朋友');
                    },
                    success: function (res) {
                        // alert('已分享');
                    },
                    cancel: function (res) {
                        //alert('已取消');
                    },
                    fail: function (res) {
                        //alert(JSON.stringify(res));
                    }
                });

            });

        </script>
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

        <script type="text/javascript">

            <%
               // 根据起止时间判断是否关闭窗口 ，弹出提醒窗
            // kz=1 开始抽奖(不关) kz=2 抽奖结束(关闭) kz=3 抽奖没开始（关闭）

             if (kz==1){


            %>
            //alert("开始");

            <%}else if(kz==2){


            %>

            alert('非常抱歉，答题时间已过。感谢您的关注，请下次再来！');
            window.location.href="<%=AllValus.errpage%>";

            <%}else if(kz==3){


            %>

            alert('还没开始呢，"开始答题时间<%=tt1%>"到"<%=tt2%>"！\n欢迎到时候参与！');
            window.location.href="<%=AllValus.errpage%>";

            <%}else{


             %>

            alert('感谢关注！');

            <%} %>

        </script>

<%
//各个奖项总剩余
int t1 = MyUtils22.sy1(); //一等奖总数剩余名额
int t2 = MyUtils22.sy2(); //二等奖总数剩余名额
int t3 = MyUtils22.sy3(); //三等奖总数剩余名额
int t4 = MyUtils22.sy4(); //四等奖总数剩余名额
//int t5 = MyUtils22.sy5();

System.out.println(t1);
System.out.println(t2);
System.out.println(t3);
System.out.println(t4);
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
          <% if(t1<=0 && t2<=0 && t3<=0 && t4<=0){ %>
              <div class="btn btn-block" id="btn-login" onclick="WeixinJSBridge.call('closeWindow');">奖品已抽完</div>

              <%}else{ %>
  <button type="submit" gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" onClick="document.form1.action='cj_chk.jsp';if(DataLength(form1.xm.value)<2){alert('姓名最少2个字');form1.xm.focus();return false};if(DataLength(form1.tel.value)<11){alert('请填写正确的联系方式');form1.tel.focus();return false};document.form1.submit();">提 交</button>
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


