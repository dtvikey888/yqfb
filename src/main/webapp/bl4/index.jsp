<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils25"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
    <%
        //控制时间
        int kz =0;
        String tt1=AllValus.daf_p1;
        String tt2=AllValus.daf_p2;
        Date c1=MyUtils7.CharDate(tt1);
        Date c2=MyUtils7.CharDate(tt2);
        kz= MyUtils7.TimeKZ(c1,c2);
        //1: //开始抽奖!
        //2: //抽奖已经结束,感谢关注!
        //3: //抽奖还没开始呢!
        //out.println(kz);
    %>

    <%

        String urlname ="bl4/index.jsp";
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
                    response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet31&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

                }

                //out.println("你是自己点的，不回调");

            }else{

                //out.println("其他人点了以后，不回调");

                //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect");

                response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet31&response_type=code&scope=snsapi_base&state=1#wechat_redirect");



            }

        }else{

            //还没点要回调
            //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect");
            response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet31&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

        }
        //前一天没中奖的第二天可以接着答题抽奖
        ZghTools.upyt8(openid);

        ZghTools.ClearNull();

        String check="";

        if(from!=null){
            check=Topay.WxJsApiCheck48(urlname,openid,from);
            //out.println("from");
        }else{
            check=Topay.WxJsApiCheck4(urlname,openid);
            // out.println("nofrom");
        }

        // out.println(check);

        //这个随时准备启动
        //session.removeAttribute("twbsession2");
        //session.invalidate();
    %>

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
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
            wx_share_title="<%=AllValus.daf_lp_title%>";
            wx_share_desc="<%=AllValus.daf_lp_desc%>";
            wx_share_link="<%=AllValus.daf_lp_link%>";
            wx_share_imgUrl="<%=AllValus.daf_lp_img%>";

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


        <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
        <title><%=AllValus.daf_lp_title %></title>
        <meta name="description" content=""/>
        <meta name="viewport" content="initial-scale=0.3, width=device-width, maximum-scale=0.3, user-scalable=no"/>
        <meta name="viewport" content="initial-scale=0.3,user-scalable=no,maximum-scale=0.3" media="(device-height: 568px)"/>
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

        <style>
            body{font-size:45px;color:#3f3e3d;line-height:35px;font-family:微软雅黑;background-color:#e7f0f7;padding:0px;margin:0px;}
            a{color:#3f3e3d; text-decoration:none;}
            a:hover{ color:#C1262C; text-decoration:none;}
            p{text-indent:2em;line-height:40px;}
            h1{font-size:40px; color:#6b6b6b;}
            h2{font-size:20px; color:#315E01;}
            m{color:#a6a6a6;}
            c{font-size:30px; font-family:Arial; color:#ffb400;}
            d{color:#fff;}
        </style>

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
            window.location.href="<%=AllValus.errpage2%>";

            <%}else if(kz==3){


            %>

            alert('还没开始呢，"开始答题时间<%=tt1%>"到"<%=tt2%>"！\n欢迎到时候参与！');
            window.location.href="<%=AllValus.errpage2%>";

            <%}else{


             %>

            alert('感谢关注！');

            <%} %>

        </script>

        <style>
            #mcover2 {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.7);
                display: none;
                z-index: 20000;
            }
            #mcover2 img {
                position: fixed;
                right: 18px;
                top: 5px;
                width: 96%!important;
                height: 98%!important;
                z-index: 20001;
            }


            .text {
                margin: 15px 0;
                font-size: 14px;
                word-wrap: break-word;
                color: #727272;
            }
            #mess_share {
                margin: 15px 0;
                display: block;
            }
            #share_1 {
                float: left;
                width: 49%;
                display: block;
            }
            #share_2 {
                float: right;
                width: 49%;
                display: block;
            }
            .clr {
                display: block;
                clear: both;
                height: 0;
                overflow: hidden;
            }
            .button2 {
                font-size: 16px;
                padding: 8px 0;
                border: 1px solid #adadab;
                color: #000000;
                background-color: #e8e8e8;
                background-image: linear-gradient(to top, #dbdbdb, #f4f4f4);
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.45), inset 0 1px 1px #efefef;
                text-shadow: 0.5px 0.5px 1px #fff;
                text-align: center;
                border-radius: 3px;
                width: 100%;
            }
            #mess_share img {
                width: 22px!important;
                height: 22px!important;
                vertical-align: top;
                border: 0;
            }
            .STYLE1 {color: #FFFFFF}
        </style>

        <script type="text/javascript">
            function button1(){
                $("#mcover").css("display","block")    // 分享给好友按钮触动函数
            }
            function button2(){
                $("#mcover").css("display","block")  // 分享给好友圈按钮触动函数
            }

            function button3(){
                $("#mcover2").css("display","block")  // 分享给好友圈按钮触动函数
            }

            function weChat2(){
                $("#mcover2").css("display","none");  // 点击弹出层，弹出层消失
            }

            function weChat(){
                $("#mcover").css("display","none");  // 点击弹出层，弹出层消失
            }

            /*$
            (function(){
               setTimeout(function () {
                    $("#mcover").show();}, 6000);   // 6000时毫秒是弹出层
            setTimeout(function () {
                    $("#mcover").hide(); }, 8000);    //8000毫秒是隐藏层
            })
            */
        </script>


        <script src="js/jquery.js"></script>

        <style>
            p{
                line-height:1.8;
            }
            /*div通用样式*/
            div{

            }

            /*右上角*/
            div.right_top{
                overflow: hidden;
                z-index: 2000;
                position:absolute;
                right: 10px;
                top: 190px;
            }

            /*右下角*/
            div.right_bottom{
                position:absolute;
                bottom:0px;
                right:0px

            }


            /*屏幕中间*/
            div.center_{
                right: 45%;
                top: 50%;
            }


            /*左上角*/
            div.left_top{
                left: 10px;
                top: 10px;
            }


            /*左下角*/
            div.left_bottom{
                left: 10px;
                bottom: 10px;
            }
        </style>

        <script>
            //表单验证
            function processForm(form)
            {

                var ids = document.getElementsByName("c1");
                var flag = false ;
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请选择！");
                    return false ;
                }

                var ids = document.getElementsByName("c2");
                var flag = false ;
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请选择！");
                    return false ;
                }

                var ids = document.getElementsByName("c3");
                var flag = false ;
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请选择！");
                    return false ;
                }

                var ids = document.getElementsByName("c4");
                var flag = false ;
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请选择！");
                    return false ;
                }

                var ids = document.getElementsByName("c5");
                var flag = false ;
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请选择！");
                    return false ;
                }

                var ids = document.getElementsByName("c6");
                var flag = false ;
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请选择！");
                    return false ;
                }

                var ids = document.getElementsByName("c7");
                var flag = false ;
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请选择！");
                    return false ;
                }

                var ids = document.getElementsByName("c8");
                var flag = false ;
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请选择！");
                    return false ;
                }

                var ids = document.getElementsByName("c9");
                var flag = false ;
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请选择！");
                    return false ;
                }

                var ids = document.getElementsByName("c10");
                var flag = false ;
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请选择！");
                    return false ;
                }

                var ids = document.getElementsByName("c11");
                var flag = false ;
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请选择！");
                    return false ;
                }


            }
        </script>


    </head>
    <body>
    <%int cs = MyUtils25.GetCsForDt(openid);%>
    <%if(cs>100000){%>
    <div id="mcover" onClick="weChat()" style="display: block;">
        <img src="js/tip.png"/>
    </div>
    <%}else{%>
    <div id="mcover" onClick="weChat()" style="display: none;">
        <img src="js/tip.png"/>
    </div>
    <%}%>

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

                <div id="mcover2" onClick="weChat2()" style="display:none;">
                    <img src="img/tip6.png"/>
                </div>

                <form name="form1" method="get" action="tp.jsp">
                    <input type="hidden" name="quesnum" value="7" />
                    <table width="100%" height="302" border="0" cellpadding="0" cellspacing="0" style="background-color:#ececee">
                        <tr>
                            <td height="600" align="center" valign="top" bgcolor="#FFFFFF" style="background:url(img/IMG_TOP3.png) no-repeat top center;background-size: 100% 100%;"><table width="95%" cellspacing="2" cellpadding="0">
                                <tr>
                                    <td height="10" colspan="2" align="right">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right"><div onClick="button2();"></div></td>
                                </tr>

                            </table></td>
                        </tr>
                        <tr>
                            <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="30">
                                <tr>
                                    <td colspan="2" align="left"><p><strong><div style="line-height:1.8;text-indent:2em;">为进一步推动公共文化服务全覆盖、高效能，构建基本完善的公共文化服务体系。乐清大力推进国家公共文化服务体系示范区创建工作，不断满足人民日益增长的美好生活需要，提升人民群众的幸福感和获得感，乐清市国家公共文化服务体系示范区创建办开展有奖问答活动。</div></strong></P></td>
                                </tr>
                                <tr>
                                    <td height="50" colspan="2">
                                        <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#CC0001; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">活动奖励</button>
                                        <div align="center" style="margin-top:50px;margin-bottom:25px;line-height:1.8">特等奖1名:价值4999元华为手机</div>
                                        <div align="center" style="margin-top:25px;margin-bottom:25px;line-height:1.8">一等奖2名:价值1299元小米扫地机器</div>
                                        <div align="center" style="margin-top:25px;margin-bottom:25px;line-height:1.8">二等奖10名:价值99元九阳多功能料理机</div>
                                        <div align="center" style="margin-top:25px;margin-bottom:50px;line-height:1.8">三等奖10名:价值79元天猫精灵方糖智能音箱</div>
                                        <div align="center" style="margin-top:25px;margin-bottom:50px;line-height:1.8">参与奖300名:充电宝、小米背包、飞科电吹风</div>
                                        <div align="center" style="margin-top:25px;margin-bottom:50px;line-height:1.8">特别奖20名:价值249元小米旅行箱</div>
                                        <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#CC0001; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">活动规则</button>
                                        <div style="margin-top:50px;padding-left:12px;line-height:1.8">1、  共7道乐清创建国家公共文化服务体系示范区相关题目，有单选与多选，答对所有题目即可参与刮刮卡抽奖活动。</div>
                                        <div style="margin-top:25px;padding-left:12px;margin-bottom:25px;line-height:1.8">2、  如答题错误，可继续答题，直至答题全部正确。</div>
                                        <div style="margin-top:25px;padding-left:12px;margin-bottom:50px;line-height:1.8">3、	如当天未抽中奖品，次日还可以继续答题抽奖。</div>
                                        <div style="margin-top:25px;padding-left:12px;margin-bottom:50px;line-height:1.8">4、	每个手机号仅限获奖一次，请实名参与。</div>
                                        <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#CC0001; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">选择题</button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>

                                        <table width="103%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
                                            <tbody id="tbName" >
                                            <tr>
                                                <td height="20"><p></p><div style="line-height:1.8"><strong>1、温州正在创建国家公共文化服务体系示范区，创建时间是()（单选题）</strong></div>
                                                    <p><input type="radio" name="c1" value="1" style="width:55px; height:55px;"/>
                                                        A. 2019年到 2020 年</p>
                                                    <p>
                                                        <input type="radio" name="c1" value="2" style="width:55px; height:55px;"/>
                                                        B. 2018 年到 2020 年</p>
                                                    <p style="line-height:1.8">
                                                        <input type="radio" name="c1" value="3" style="width:55px; height:55px;"/>
                                                        C. 2019 年到 2021 年</p>
                                                    <p style="line-height:1.8">
                                                        <input type="radio" name="c1" value="4" style="width:55px; height:55px;"/>
                                                        D. 2020年</p>
                                                </td>
                                            </tr>
                                            </tbody>


                                            <tbody id="tbName">
                                            <tr>
                                                <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>2、乐清的公共文化设施有哪些 。()（多选题）</strong></div>
                                                    <p><input type="checkbox" name="c2" value="1" style="width:55px; height:55px;"/>
                                                        A. 图书馆、文化馆、博物馆、非遗馆、大剧院</p>
                                                    <p>
                                                        <input type="checkbox" name="c2" value="2" style="width:55px; height:55px;"/>
                                                        B. 市民活动中心 、体育中心</p>
                                                    <p>
                                                        <input type="checkbox" name="c2" value="3" style="width:55px; height:55px;"/>
                                                        C. 客运中心、购物中心、推拿理疗中心</p>
                                                    <p>
                                                        <input type="checkbox" name="c2" value="4" style="width:55px; height:55px;"/>
                                                        D. 乡镇综合文化站</p>
                                                    <p>
                                                        <input type="checkbox" name="c2" value="5" style="width:55px; height:55px;"/>
                                                        E. 文化礼堂、文化家园</p>
                                                </td>
                                            </tr>
                                            </tbody>


                                            <tbody id="tbName">
                                            <tr>
                                                <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>3、乐清市图书馆位于 （ ）。（单选题）。</strong></div>
                                                    <p> <input type="radio" name="c3" value="1" style="width:55px; height:55px;"/>
                                                        A. 乐清市胜利路与千帆东路交叉口。</p>
                                                    <p>
                                                        <input type="radio" name="c3" value="2" style="width:55px; height:55px;"/>
                                                        B. 乐清市旭阳路与伯乐东路交叉口。</p>
                                                    <p>
                                                        <input type="radio" name="c3" value="3" style="width:55px; height:55px;"/>
                                                        C. 乐清市人民路与县前路交叉口。</p>
                                                    <p>
                                                        <input type="radio" name="c3" value="4" style="width:55px; height:55px;"/>
                                                        D. 乐清市伯乐东路与晨曦路交叉口。</p>
                                                </td>
                                            </tr>
                                            </tbody>

                                            <tbody id="tbName">
                                            <tr>
                                                <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>4、从哪些渠道可以获取公共文化服务信息？（ ）（多选题）。</strong></div>
                                                    <p> <input type="checkbox" name="c4" value="1" style="width:55px; height:55px;"/>
                                                        A. 各村、社区宣传公示栏上有服务信息公示。</p>
                                                    <p>
                                                        <input type="checkbox" name="c4" value="2" style="width:55px; height:55px;"/>
                                                        B. 每个公共文化设施门口都有服务信息公示，有免费开放时间、服务项目和活动内容等。</p>
                                                    <p>
                                                        <input type="checkbox" name="c4" value="3" style="width:55px; height:55px;"/>
                                                        C. 各个场馆网站、 微信公众号上有服务信息。</p>
                                                    <p>
                                                        <input type="checkbox" name="c4" value="4" style="width:55px; height:55px;"/>
                                                        D. 各街道路口广告牌上有服务信息公示。</p>
                                                </td>
                                            </tr>
                                            </tbody>

                                            <tbody id="tbName">
                                            <tr>
                                                <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>5、创建国家公共文化服务体系示范区“两法”宣传，是哪两法？ （ ）（单选题）</strong></div>
                                                    <p> <input type="radio" name="c5" value="1" style="width:55px; height:55px;"/>
                                                        A. 《文物保护法》和《非物质文化遗产法》</p>
                                                    <p>
                                                        <input type="radio" name="c5" value="2" style="width:55px; height:55px;"/>
                                                        B. 《著作权法》和《互联网信息服务管理办法》</p>
                                                    <p>
                                                        <input type="radio" name="c5" value="3" style="width:55px; height:55px;"/>
                                                        C. 《公共文化服务保障法》和《公共图书馆法》</p>
                                                    <p>
                                                        <input type="radio" name="c5" value="4" style="width:55px; height:55px;"/>
                                                        D. 《文物保密法》和《公共文化馆法》</p>
                                                </td>
                                            </tr>
                                            </tbody>

                                            <tbody id="tbName">
                                            <tr>
                                                <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>6、《公共文化服务保障法》自（ ）起施行。(单选题)</strong></div>
                                                    <p><input type="radio" name="c6" value="1" style="width:55px; height:55px;"/>
                                                        A. 2016年12月25日</p>
                                                    <p>
                                                        <input type="radio" name="c6" value="2" style="width:55px; height:55px;"/>
                                                        B. 2017年11月4日</p>
                                                    <p>
                                                        <input type="radio" name="c6" value="3" style="width:55px; height:55px;"/>
                                                        C. 2017年3月1日</p>
                                                    <p>
                                                        <input type="radio" name="c6" value="4" style="width:55px; height:55px;"/>
                                                        D. 2018年1月1日</p>
                                                </td>
                                            </tr>
                                            </tbody>



                                            <tbody id="tbName">
                                            <tr>
                                                <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>7、《公共图书馆法》自（ ）起开始实施。(单选题)</strong></div>
                                                    <p><input type="radio" name="c7" value="1" style="width:55px; height:55px;"/>
                                                        A. 2017年10月30日</p>
                                                    <p>
                                                        <input type="radio" name="c7" value="2" style="width:55px; height:55px;"/>
                                                        B. 2017年11月4日</p>
                                                    <p>
                                                        <input type="radio" name="c7" value="3" style="width:55px; height:55px;"/>
                                                        C. 2017年12月1日</p>
                                                    <p>
                                                        <input type="radio" name="c7" value="4" style="width:55px; height:55px;"/>
                                                        D. 2018年1月1日</p>
                                                </td>
                                            </tr>
                                            </tbody>

                                            <tbody id="tbName">
                                            <tr>
                                                <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>8、《公共文化服务保障法》所称公共文化服务，是指由政府主导、社会力量参与，以满足公民（ ）为主要目的而提供的（ ）、文化产品、文化活动以及其他相关服务。（ ）（单选题）</strong></div>
                                                    <p><input type="radio" name="c8" value="1" style="width:55px; height:55px;"/>
                                                        A. 高端文化需求 公共文化设施</p>
                                                    <p>
                                                        <input type="radio" name="c8" value="2" style="width:55px; height:55px;"/>
                                                        B. 高端文化需求 公共文化人才</p>
                                                    <p>
                                                        <input type="radio" name="c8" value="3" style="width:55px; height:55px;"/>
                                                        C. 基本文化需求 公共文化设施</p>
                                                    <p>
                                                        <input type="radio" name="c8" value="4" style="width:55px; height:55px;"/>
                                                        D. 基本文化需求 公共文化人才</p>
                                                </td>
                                            </tr>
                                            </tbody>

                                            <tbody id="tbName">
                                            <tr>
                                                <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>9、《公共图书馆法》所称公共图书馆，是指向社会公众（ ）开放，收集、整理、保存文献信息并提供查询、借阅及相关服务，开展（ ）的公共文化设施。（ ）（单选题）</strong></div>
                                                    <p><input type="radio" name="c9" value="1" style="width:55px; height:55px;"/>
                                                        A. 免费 社会教育</p>
                                                    <p>
                                                        <input type="radio" name="c9" value="2" style="width:55px; height:55px;"/>
                                                        B. 有偿 国民教育</p>
                                                    <p>
                                                        <input type="radio" name="c9" value="3" style="width:55px; height:55px;"/>
                                                        C. 免费 国民教育</p>
                                                    <p>
                                                        <input type="radio" name="c9" value="4" style="width:55px; height:55px;"/>
                                                        D. 有偿 社会教育</p>
                                                </td>
                                            </tr>
                                            </tbody>

                                            <tbody id="tbName">
                                            <tr>
                                                <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>10、哪些不是乐清公共文化服务领域“品牌项目” （ ）。（单选题）</strong></div>
                                                    <p><input type="radio" name="c10" value="1" style="width:55px; height:55px;"/>
                                                        A. 影视城、足球杯</p>
                                                    <p>
                                                        <input type="radio" name="c10" value="2" style="width:55px; height:55px;"/>
                                                        B. 城市书房、百姓书屋</p>
                                                    <p>
                                                        <input type="radio" name="c10" value="3" style="width:55px; height:55px;"/>
                                                        C. 文化驿站、乡村艺术团、市民文化节</p>
                                                    <p>
                                                        <input type="radio" name="c10" value="4" style="width:55px; height:55px;"/>
                                                        D. 百姓舞台、萧台艺苑、梅溪讲堂</p>
                                                </td>
                                            </tr>
                                            </tbody>

                                            <tbody id="tbName">
                                            <tr>
                                                <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>11、哪些行为是参与公共文化服务项目？ （ ）（多选题）</strong></div>
                                                    <p><input type="checkbox" name="c11" value="1" style="width:55px; height:55px;"/>
                                                        A. 读书看报、观看演出</p>
                                                    <p>
                                                        <input type="checkbox" name="c11" value="2" style="width:55px; height:55px;"/>
                                                        B. 看电视看电影、参加声乐比赛活动</p>
                                                    <p>
                                                        <input type="checkbox" name="c11" value="3" style="width:55px; height:55px;"/>
                                                        C. 参加舞蹈大赛活动、报名参加文化馆公益课堂</p>
                                                    <p>
                                                        <input type="checkbox" name="c11" value="4" style="width:55px; height:55px;"/>
                                                        D. 在手机上看文章看视频、在图书馆公众号上借阅电子书籍</p>
                                                    <div style="float:right" onClick="window.location.href='memo.jsp'"><img src="img/xxzl2.png" border="0"></div>
                                                </td>
                                            </tr>
                                            </tbody>





                                        </table>
                                    </td>
                                </tr><tr>

                            </tr>



                            </table></td>
                        </tr>



                        <tr>
                            <td height="115" align="center" valign="middle"><table width="95%" height="75" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center">
                                        <%if(!MyUtils25.iscj_pd(openid)){%>
                                        <!--
                                        <input target="_self" type="image" border="0" name="sub22" src="img/tp3.png" width=100% height=80  onclick="return processForm(this.form);"/>
                                        -->
                                        <button onclick="return processForm(this.form);" type="submit" style="width:100%;padding:15px 15px;border-radius:15px; background:#FDCB03; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交&nbsp;&nbsp;&nbsp;&nbsp;</button>
                                        <p></p>
                                        <%}else{ %>
                                        <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#CC0001; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">您已经参与过,<%="您是第"+MyUtils25.GetWs(openid)+"位参与者,"+MyUtils25.zsm(openid) %></button>
                                        <%} %>
                                        <p></p>
                                        <input name="openid" type="hidden" id="openid" value="<%=openid%>"/>	<div></div></td>
                                </tr>
                            </table></td>
                        </tr>
                    </table>
                </form>
            </div>

    </body>
    </html>


    <script type="text/javascript">
        window.onload = function(){
            if(isWeiXin()){
                //是微信浏览器不做操作




            }else{
                //alert('not');
                //非微信浏览器就因此显示列表等
                var target=document.getElementById("contentid");
                target.style.display="none";
                //alert('请先关注微信');


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

