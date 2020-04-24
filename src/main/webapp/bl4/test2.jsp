<%--<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>--%>
<%--<%@page import="com.component.Topay"%>--%>
<%--<%@page import="org.fjw.weixin.util.MyUtils7"%>--%>
<%--<%@page import="org.fjw.weixin.util.MyUtils25"%>--%>
<%--<%@page import="org.fjw.weixin.util.AllValus"%>--%>
<%--<%@page import="org.liufeng.course.util.ZghTools"%>--%>
<%--<%--%>
	<%--//控制时间--%>
	<%--int kz =0;--%>
	<%--String tt1=AllValus.daf_t1;--%>
	<%--String tt2=AllValus.daf_t2;--%>
    <%--Date c1=MyUtils7.CharDate(tt1);--%>
    <%--Date c2=MyUtils7.CharDate(tt2);--%>
    <%--kz= MyUtils7.TimeKZ(c1,c2);--%>
    <%--//1: //开始抽奖--%>
    <%--//2: //抽奖已经结束,感谢关注！--%>
    <%--//3: //抽奖还没开始呢！--%>
    <%--//out.println(kz);--%>
<%--%>--%>

<%--<%--%>

<%--String urlname ="bl2/test2.jsp";--%>
<%--String openid =request.getParameter("openid");--%>

   <%--String from="";--%>
   <%--String check="";--%>
   <%----%>
<%--if(from!=null){--%>
  <%--check=Topay.WxJsApiCheck48(urlname,openid,from);--%>
<%--}else{--%>
  <%--check=Topay.WxJsApiCheck4(urlname,openid);--%>
<%--}--%>
   <%----%>

<%--%>--%>


<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<%--<head>--%>

<%--<script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js"></script>--%>
		<%--<script type="text/javascript">--%>
		<%--wx.config({--%>
		    <%--debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。--%>
		    <%--<%=check%>,// 必填，签名，见附录1--%>
		    <%--jsApiList: [--%>
        <%--'updateTimelineShareData',--%>
        <%--'updateAppMessageShareData'--%>
      <%--]// 必填，需要使用的JS接口列表，所有JS接口列表见附录2--%>
		<%--});--%>
		<%----%>
		<%----%>
		<%----%>
		<%----%>
		<%--wx.ready(function(){--%>
		   <%--//alert("config ok...");--%>
		   <%--//隐藏右上角菜单接口--%>
		   	  <%--//wx.hideOptionMenu();--%>
		   <%----%>

		   <%--wx.checkJsApi({--%>
           <%--jsApiList: [--%>
              <%--'updateTimelineShareData',--%>
        <%--'updateAppMessageShareData'--%>
           <%--],--%>
           <%--success: function (res) {--%>
             <%--//alert(JSON.stringify(res));--%>
           <%--}--%>
          <%--});--%>
          <%----%>
		<%--});--%>
		<%--wx.error(function(res){--%>
			<%--//alert(res);--%>
		    <%--// config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。--%>
		<%--});--%>
		<%----%>
		<%----%>
			<%----%>
			<%--// 2.2 监听分享到朋友圈按钮点击、自定义分享内容及分享结果接口--%>
  <%--function  sharefriendRound2() {--%>
     <%--//显示右上角菜单接口--%>
      <%--// wx.showOptionMenu();--%>
	   <%----%>
    <%--wx.onMenuShareTimeline({--%>
      <%--title: '中国乐清网邀您来抽奖',--%>
      <%--link: 'http://www.yqrb.com.cn/yqcnwx2/err.jsp',--%>
      <%--imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo9.jpg',--%>
      <%--trigger: function (res) {--%>
        <%--// 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回--%>
       <%--// alert('用户点击分享到朋友圈');--%>
      <%--},--%>
      <%--success: function (res) {--%>
        <%--alert('已分享');--%>
      <%--},--%>
      <%--cancel: function (res) {--%>
        <%--alert('已取消');--%>
      <%--},--%>
      <%--fail: function (res) {--%>
       <%--// alert(JSON.stringify(res));--%>
      <%--}--%>
    <%--});--%>
	<%----%>
    <%--//alert('已注册获取“分享到朋友圈”状态事件');--%>
	<%--//alert('现在去分享给朋友吧，叫他们也来参加预约报名!');--%>
  <%--};--%>
  <%----%>

	<%--// 2.2 监听“发送给朋友”按钮点击、自定义分享内容及分享结果接口--%>
  <%--function  sharefriendRound3() {--%>
     <%--//显示右上角菜单接口--%>
       <%--//wx.showOptionMenu();--%>
	   <%----%>
    <%--wx.onMenuShareAppMessage({--%>
      <%--title: '中国乐清网邀您来抽奖',--%>
      <%--desc: '快来参加抽奖',--%>
      <%--link: 'http://www.yqrb.com.cn/yqcnwx2/err.jsp',--%>
      <%--imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo9.jpg',--%>
      <%--type: '', // 分享类型,music、video或link，不填默认为link--%>
      <%--dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空--%>
      <%--trigger: function (res) {--%>
        <%--// 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回--%>
       <%--// alert('用户点击发送给朋友');--%>
      <%--},--%>
      <%--success: function (res) {--%>
        <%--alert('已分享');--%>
      <%--},--%>
      <%--cancel: function (res) {--%>
        <%--alert('已取消');--%>
      <%--},--%>
      <%--fail: function (res) {--%>
       <%--// alert(JSON.stringify(res));--%>
      <%--}--%>
    <%--});--%>
	<%----%>
    <%--//alert('已注册获取“分享到朋友圈”状态事件');--%>
	<%--//alert('现在去发送给朋友吧，叫他们也来参加预约报名!');--%>
  <%--};--%>
  			<%----%>
	<%--// 2.2 监听“发送给qq朋友”按钮点击、获取“分享到QQ”按钮点击状态及自定义分享内容接口--%>
  <%--function  sharefriendRound4() {--%>
     <%--//显示右上角菜单接口--%>
      <%--// wx.showOptionMenu();--%>
	   <%----%>
    <%--wx.onMenuShareQQ({--%>
      <%--title: '中国乐清网邀您来抽奖',--%>
      <%--desc: '快来参加抽奖',--%>
      <%--link: 'http://www.yqrb.com.cn/yqcnwx2/err.jsp',--%>
      <%--imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo9.jpg',--%>
     <%----%>
      <%--trigger: function (res) {--%>
        <%--// 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回--%>
       <%--// alert('用户点击发送给QQ朋友');--%>
      <%--},--%>
      <%--success: function (res) {--%>
        <%--alert('已分享');--%>
      <%--},--%>
      <%--cancel: function (res) {--%>
        <%--alert('已取消');--%>
      <%--},--%>
      <%--fail: function (res) {--%>
      <%--//  alert(JSON.stringify(res));--%>
      <%--}--%>
    <%--});--%>
	<%----%>
    <%--//alert('已注册获取“分享到朋友圈”状态事件');--%>
	<%--//alert('现在去发送给QQ朋友吧，叫他们也来参加预约报名!');--%>
  <%--};	--%>
		<%----%>
		<%----%>
		<%----%>
				<%----%>
	<%--// 2.2 监听“分享到腾讯微博”按钮点击、获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口--%>
  <%--function  sharefriendRound5() {--%>
     <%--//显示右上角菜单接口--%>
       <%--//wx.showOptionMenu();--%>
	   <%----%>
    <%--wx.onMenuShareWeibo({--%>
      <%--title: '中国乐清网邀您来抽奖',--%>
      <%--desc: '快来参加活动',--%>
      <%--link: 'http://www.yqrb.com.cn/yqcnwx2/err.jsp',--%>
      <%--imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo9.jpg',--%>
     <%----%>
      <%--trigger: function (res) {--%>
        <%--// 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回--%>
       <%--// alert('用户点击发送给腾讯微博');--%>
      <%--},--%>
      <%--success: function (res) {--%>
        <%--alert('已分享');--%>
      <%--},--%>
      <%--cancel: function (res) {--%>
        <%--alert('已取消');--%>
      <%--},--%>
      <%--fail: function (res) {--%>
       <%--// alert(JSON.stringify(res));--%>
      <%--}--%>
    <%--});--%>
	<%----%>
    <%--//alert('已注册获取“分享到朋友圈”状态事件');--%>
	<%--//alert('现在去发送给腾讯微博吧，叫他们也来参加预约报名!');--%>
  <%--};	--%>
			<%----%>
				<%----%>
	<%--// 2.2 监听“提交”按钮点击、获取“批量隐藏菜单项 ”--%>
  <%--function  sharefriendRound6() {--%>
     <%--//显示右上角菜单接口--%>
      <%--// wx.showOptionMenu();--%>
      <%--//隐藏右上角菜单接口--%>
	 <%--wx.hideOptionMenu();--%>
	   <%----%>
   <%--wx.hideMenuItems({ --%>
      <%--menuList: [ --%>
        <%--'menuItem:readMode', // 阅读模式 --%>
        <%--'menuItem:openWithQQBrowser', // 在	QQ浏览器中打开--%>
        <%--'menuItem:openWithSafari', //在Safari中打开--%>
        <%--'menuItem:share:email', //邮件--%>
        <%--'menuItem:copyUrl', // 复制链接 --%>
        <%--'menuItem:favorite', //收藏--%>
        <%--'menuItem:share:brand', //一些特殊公众号--%>
        <%--'menuItem:jsDebug',  //调试:--%>
		<%--'menuItem:editTag', //编辑标签: --%>
	    <%--'menuItem:delete',  //删除:--%>
 		<%--'menuItem:originPage', //原网页:--%>
 		<%--'menuItem:share:qq',  //分享到QQ:--%>
 		<%--'menuItem:share:weiboApp',  //分享到Weibo:--%>
		<%--'menuItem:favorite',  //收藏: --%>
 		<%--'menuItem:share:facebook', //分享到FB:--%>
		<%--'menuItem:share:QZone'  //分享到 QQ 空间--%>
	<%----%>

      <%--], --%>
      <%--success: function (res) { --%>
      <%--//  alert('已隐藏一系列按钮'); --%>
      <%--}, --%>
      <%--fail: function (res) { --%>
       <%--//alert(JSON.stringify(res)); --%>
      <%--} --%>
    <%--}); --%>
	<%----%>
    <%--//alert('已注册获取“分享到朋友圈”状态事件');--%>
	<%--//alert('您知道乐清正在开展生态环境整治吗?');--%>
  <%--};		--%>


		<%--</script>--%>
