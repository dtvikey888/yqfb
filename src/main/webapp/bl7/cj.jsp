<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils26"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.liufeng.course.util.AdvancedUtil"%>
<%
    String urlname ="bl7/cj.jsp";
    String openid =request.getParameter("openid");
    String check=Topay.WxJsApiCheck4(urlname,openid);
%>

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
        wx_share_title="<%=AllValus.zb_title%>";
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
    </style>

    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>

<body style="background:url(img/21.png) no-repeat top center;background-size:100%;">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="80%"  border="0" align="center">
    <form action="tp1.php?act=1" method="post" name="frm2" id="frm2" onsubmit="return check();">
        <tr>
            <td height="180" align="center"><table width="90%" height="0%" align="center" cellspacing="15">
                <tr>
                    <th width="15%" height="23" align="center" nowrap="nowrap" bordercolor="#FFCC00" scope="row"><span class="style47">姓名</span></th>
                    <th bordercolor="#EC6941" scope="row"><input name="name12" type="text" class="style23" style="border:2px solid #FF9900;border-radius:10px;border-color:#FF9900;width:100%;height:25px" /></th>
                </tr>
            </table>
                <table width="90%" height="0%" align="center" cellspacing="15">
                    <tr>
                        <th width="15%" height="23" align="center" nowrap="nowrap" bordercolor="#EC6941" scope="row"><span class="style47">电话</span></th>
                        <th width="0" bordercolor="#EC6941" scope="row"><input name="tel13" type="text" class="style23" style="border:2px solid #FF9900;border-radius:10px;border-color:#FF9900;width:100%;height:25px" /></th>
                    </tr>
                </table>      </td>
        </tr>
        <tr>
            <td align="center">&nbsp;</td>
        </tr>
        <tr>
            <td align="center"><table width="90%"  border="0" cellspacing="10">
                <tr>
                    <td align="center"><table width="60%" height="0"  border="0" align="center" style="border:1px solid #FF6600;border-radius:10px;background-color:#FF6600;border-color:#FF6600">
                        <tr>
                            <td height="34" align="center" bgcolor="#FF6600" class="style38 style39 style45" scope="row">提交</td>
                        </tr>
                    </table></td>
                </tr>
            </table>
            </td>
        </tr>
    </form>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
