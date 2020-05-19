<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils27"%>
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
        window.location.href="<%=AllValus.errpage4%>";

        <%}else if(kz==3){


        %>

        alert('还没开始呢，"开始答题时间<%=tt1%>"到"<%=tt2%>"！\n欢迎到时候参与！');
        window.location.href="<%=AllValus.errpage4%>";

        <%}else{


         %>

        alert('感谢关注！');

        <%} %>

    </script>

    <%
        //各个奖项总剩余
        int t1 = MyUtils27.sy1(); //一等奖总数剩余名额
        int t2 = MyUtils27.sy2(); //二等奖总数剩余名额
        int t3 = MyUtils27.sy3(); //三等奖总数剩余名额
        int t4 = MyUtils27.sy4(); //四等奖总数剩余名额
//int t5 = MyUtils26.sy5();

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
<div  id="contentid" style="display:block">

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="80%"  border="0" align="center">
    <form id="form1" name="form1" method="post" action="cj_chk.jsp">

        <input type="hidden" name="openid" value="<%=openid%>">

        <tr>
            <td height="180" align="center"><table width="90%" height="0%" align="center" cellspacing="15">
                <tr>
                    <th width="15%" height="23" align="center" nowrap="nowrap" bordercolor="#FFCC00" scope="row"><span class="style47">姓名</span></th>
                    <th bordercolor="#EC6941" scope="row"><input id="xm" name="xm" type="text" class="style23" style="border:2px solid #FF9900;border-radius:10px;border-color:#FF9900;width:100%;height:25px" /></th>
                </tr>
            </table>
                <table width="90%" height="0%" align="center" cellspacing="15">
                    <tr>
                        <th width="15%" height="23" align="center" nowrap="nowrap" bordercolor="#EC6941" scope="row"><span class="style47">电话</span></th>
                        <th width="0" bordercolor="#EC6941" scope="row"><input id="tel" name="tel" type="tel" class="style23" style="border:2px solid #FF9900;border-radius:10px;border-color:#FF9900;width:100%;height:25px" /></th>
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
                            <td height="34" align="center" bgcolor="#FF6600" class="style38 style39 style45" scope="row">

                                <% if(t1<=0 && t2<=0 && t3<=0 && t4<=0){ %>
                                <div >奖品已抽完</div>

                                <%}else{ %>

                                <div onClick="document.form1.action='cj_chk.jsp';if(DataLength(form1.xm.value)<2){alert('姓名最少2个字');form1.xm.focus();return false};if(DataLength(form1.tel.value)!=11){alert('请填写正确的联系方式');form1.tel.focus();return false};document.form1.submit();">提交</div>

                                <%} %>
                            </td>
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


