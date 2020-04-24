<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="com.component.Topay"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%

String urlname ="bl5/success.jsp";
String check=Topay.WxJsApiCheck3(urlname);

%>
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
        wx_share_title="<%=AllValus.pw_title%>";
        wx_share_desc="<%=AllValus.pw_desc%>";
        wx_share_link="<%=AllValus.pw_link%>";
        wx_share_imgUrl="<%=AllValus.pw_img%>";
        
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=AllValus.pw_title %></title>
<style type="text/css">
#outer{vertical-align: middle;}
#outer.yourcssclass{ display:block; width:640px; height:88px; font-family:'微软雅黑';margin-left:160px;margin-top:260px; text-align:center;padding-top:40px; font-size:40px; color:#fff; background-color:#e74c3c; text-decoration:none; line-height:41px;}
#outer.yourcssclass span.a1{ font-weight:bolder; font-size:30px; padding:0 10px; vertical-align:middle; }
#outer.yourcssclass span.a2{ font-size:20px; vertical-align:middle;}
</style>
</head>
<body>
<div  id="contentid" style="display:block">
<div id="outer" class="yourcssclass"  onclick="WeixinJSBridge.call('closeWindow');" >
点击关闭!
</div>
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