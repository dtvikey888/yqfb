<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils27"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.liufeng.course.util.AdvancedUtil"%>
<%@page import="org.liufeng.course.util.ZghTools"%>

<%
    //控制时间
    int kz =0;
    String tt1=AllValus.zb_t1;
    String tt2=AllValus.zb_t2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //开始抽奖
    //2: //抽奖已经结束,感谢关注！
    //3: //抽奖还没开始呢！
    //out.println(kz);
%>

<%

    String urlname ="bl7/myzj.jsp";
    String openid =request.getParameter("openid");
//out.println("openid="+openid);


    String from=request.getParameter("from");

    String ympath=AllValus.ympath;
    String appid=AllValus.appid;

    String twbsession2 = (String)session.getAttribute("twbsession2");

//out.println("dafsession="+dafsession);

    if(twbsession2!=null){

        if(twbsession2.equals(openid)){


            if(from!=null){
                response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet35&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

            }

            //out.println("你是自己点的，不回调");

        }else{

            //out.println("其他人点了以后，不回调");

            //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect");

            response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet35&response_type=code&scope=snsapi_base&state=1#wechat_redirect");



        }

    }else{

        //还没点要回调
        //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect");
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet35&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

    }

    //ZghTools.upyt6(openid);

    ZghTools.ClearNull();

    String check="";

    if(from!=null){
        check=Topay.WxJsApiCheck48(urlname,openid,from);
        // out.println("from");
    }else{
        check=Topay.WxJsApiCheck4(urlname,openid);
        // out.println("nofrom");
    }


    out.println("<div style=\"font-size:0.1px;color:#C2D9DD;\">1</div>");
    //out.println(check);

    //这个随时准备启动
    //session.removeAttribute("twbsession2");
    //session.invalidate();
%>


<%
    //中了什么奖
    int zj = MyUtils27.zsm2(openid);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        wx_share_title="<%=MyUtils27.GetWs2(openid)%>";
        wx_share_desc="<%=AllValus.zb_desc%>";
        wx_share_link="<%=AllValus.zb_link%>";
        wx_share_imgUrl="<%=AllValus.zb_img%>";

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
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <title><%=AllValus.zb_title %></title>

    <script type="text/javascript">

        <%
           // 根据起止时间判断是否关闭窗口 ，弹出提醒窗
        // kz=1 开始抽奖(不关) kz=2 抽奖结束(关闭) kz=3 抽奖没开始（关闭）

         if (kz==1){


        %>
        //alert("开始");

        <%}else if(kz==2){


        %>

        alert('非常抱歉，时间已过。感谢您的关注，请下次再来！');
        window.location.href="<%=AllValus.errpage4%>";

        <%}else if(kz==3){


        %>

        alert('还没开始呢，"开始时间<%=tt1%>"到"<%=tt2%>"！\n欢迎到时候参与！');
        window.location.href="<%=AllValus.errpage4%>";

        <%}else{


         %>

        alert('感谢关注！');

        <%} %>

    </script>

    <style type="text/css">
        <!--
        body {
            background-color: #E5F1F2;
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
        .style23 {color: #333333; font-size: 14px; }
        a:link {
            text-decoration: none;
        }
        a:visited {
            text-decoration: none;
        }
        a:hover {
            text-decoration: none;
        }
        a:active {
            text-decoration: none;
        }
        .style45 {
            font-size: 16px;
            font-weight: bold;
            color: #FFFFFF;
        }
        .style47 {color: #FF9900; font-size: 18px; }
        -->
    </style><meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>

<body >
<%if(twbsession2!=null){%>
<%if(twbsession2.equals(openid)){%>
<div id="contentid"  style="display:block">
        <%}else{%>
    <!--
    <img src="http://v.yqcn.com/bmwj/asp/sxbook/download3/no.png" width="100%" height="100%"/>-->
    <div id="contentid"  style="display:none">
            <%}%>
            <%}else{%>
        <!--
        <img src="http://v.yqcn.com/bmwj/asp/sxbook/download3/no.png" width="100%" height="100%"/>-->
        <div id="contentid"  style="display:none">
            <%}%>
<table width="100%"  border="0" cellspacing="0">
    <tr>
        <td>
            <%if(zj==1){%>
            <img src="img/001.jpg" width="100%">
            <%}else if(zj==2){%>
            <img src="img/002.jpg" width="100%">
            <%}else if(zj==3){%>
            <img src="img/003.jpg" width="100%">
            <%}else if(zj==4){%>
            <img src="img/004.jpg" width="100%">
            <%}else if(zj==5){%>
            <img src="img/005.jpg" width="100%">
            <%}else{%>
            <img src="img/006.jpg" width="100%">
            <%}%>

        </td>
    </tr>
</table>
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


