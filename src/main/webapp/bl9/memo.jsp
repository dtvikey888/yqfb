<%@page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.AllValus" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <%

        String urlname ="bl9/memo.jsp";
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
        wx_share_title="<%=AllValus.jk_title%>";
        wx_share_desc="<%=AllValus.jk_desc%>";
        wx_share_link="<%=AllValus.jk_link%>";
        wx_share_imgUrl="<%=AllValus.jk_img%>";

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
    <title><%=AllValus.jk_title %></title>
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
        body{height: 1800px;font-size:45px;color:#3f3e3d;line-height:35px;font-family:微软雅黑;background-color:#e7f0f7;padding:0px;margin:0px;}
        a{color:#3f3e3d; text-decoration:none;}
        a:hover{ color:#C1262C; text-decoration:none;}
        p{text-indent:2em;line-height:40px;}
        h1{font-size:40px; color:#6b6b6b;}
        h2{font-size:20px; color:#315E01;}
        m{color:#a6a6a6;}
        c{font-size:30px; font-family:Arial; color:#ffb400;}
        d{color:#fff;}
    </style>

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
        /*div通用样式*/
        div{

        }

        /*右上角*/
        div.right_top{
            position:fixed;
            bottom:0;
            right:0;
            width:100%;
            height:0;
            top: 0%;
            /*top: 50%;*/
            z-index: 99999999 !important;

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

            var ids = document.getElementsByName("c12");
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

            var ids = document.getElementsByName("c13");
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

            var ids = document.getElementsByName("c14");
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

            var ids = document.getElementsByName("c15");
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

            var ids = document.getElementsByName("c16");
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

            var ids = document.getElementsByName("c17");
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

            var ids = document.getElementsByName("c18");
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

            var ids = document.getElementsByName("c19");
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

            var ids = document.getElementsByName("c20");
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





<div id="contentid"  style="display:block">

            <div id="mcover2" onClick="weChat2()" style="display:none;">
                <img src="img/tip9.png"/>
            </div>

            <form name="form1" method="get" action="tp.jsp">
                <table width="100%" height="302" border="0" cellpadding="0" cellspacing="0" style="background-color:#ececee">
                    <tr>
                        <td height="600" align="center" valign="top" bgcolor="#FFFFFF" style="background:url(img/IMG_TOP3.png) no-repeat top center;background-size: 100% 100%;"><table width="95%" cellspacing="2" cellpadding="0">
                            <tr>
                                <td height="10" colspan="2" align="left">
                                    <div class="right_top" style="margin-top: 0px;">
                                        <a href="javascript:history.back(-1)"><img src="img/ICO_return.png" width="200" /></a>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right"><div onClick="button2();"></div></td>
                            </tr>

                        </table></td>
                    </tr>
                    <tr>
                        <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="30">
                            <%--<tr>--%>
                                <%--<td colspan="2" align="left"><p><strong><div style="line-height:1.8;text-indent:2em;">4月26日是世界知识产权日，今年的活动主题是“强化版权治理，优化版权生态”，为了树立尊重知识、崇尚科学和保护知识产权的意识，营造鼓励知识创新的法律环境，中共乐清市委宣传部（市新闻出版局）举办版权知识网络有奖问答活动。</div></strong></P></td>--%>
                            <%--</tr>--%>
                            <tr>

                                <td height="50" colspan="2">
                                    <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#82CBE8; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">答案提示</button>

                                </td>
                            </tr>

                            <tr>
                                <td>

                                    <table width="103%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
                                        <tbody id="tbName" >
                                        <tr>
                                            <td height="20"><p></p><div style="line-height:1.8"><strong>1、计划生育协会属于什么组织？（  ）</strong></div>
                                                <p style="line-height:1.8">
                                                    答：群团组织</p>

                                            </td>
                                        </tr>
                                        </tbody>


                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>2、计生协的“会员活动日”是每年的（  ）。</strong></div>
                                                <p style="line-height:1.8">
                                                    答：5月29日 </p>

                                            </td>
                                        </tr>
                                        </tbody>


                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>3、今年5月29日是中国计生协成立（  ）周年纪念日，也是计生协第（  ）个“会员活动日”。</strong></div>
                                                <p style="line-height:1.8">
                                                    答：40  22</p>

                                            </td>
                                        </tr>
                                        </tbody>

                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>4、从国际通用的老龄化标准来看，如果一个国家或地区60岁以上的老年人口，占到了该国家和地区人口总数的（  ），就意味着这个国家和地区的人口整体处于老龄化的阶段。</strong></div>
                                                <p style="line-height:1.8">
                                                    答：10%</p>

                                            </td>
                                        </tr>
                                        </tbody>

                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>5、男、女法定结婚年龄分别是多少？（  ） </strong></div>
                                                <p style="line-height:1.8">
                                                    答：男22周岁，女20周岁</p>

                                            </td>
                                        </tr>
                                        </tbody>

                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>6、两癌筛查指的是（  ）检查。</strong></div>
                                                <p style="line-height:1.8">
                                                    答：宫颈癌、乳腺癌</p>

                                            </td>
                                        </tr>
                                        </tbody>


                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>7、有习惯性流产史的夫妇，再次怀孕前应进行遗传咨询。出现不明原因习惯性流产的夫妇双方应做（  ）</strong></div>
                                                <p style="line-height:1.8">
                                                    答：染色体检查</p>

                                            </td>
                                        </tr>
                                        </tbody>


                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>8、如何预防新型冠状病毒肺炎？（  ）</strong></div>
                                                <p style="line-height:1.8">
                                                    答：戴口罩、勤洗手、少聚集</p>

                                            </td>
                                        </tr>
                                        </tbody>



                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>9、世界卫生组织建议每人每天的盐摄入量不应超过多少？（  ）</strong></div>
                                                <p style="line-height:1.8">
                                                    答：5克</p>

                                            </td>
                                        </tr>
                                        </tbody>



                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>10、爬楼梯有助于孕妇生产吗？（  ）</strong></div>
                                                <p style="line-height:1.8">
                                                    答：孕妇适度上楼梯，减少下楼梯。</p>

                                            </td>
                                        </tr>
                                        </tbody>




                                    </table>
                                </td>
                            </tr><tr>

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
