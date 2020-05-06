<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.component.Topay"%>
<%@ page import="org.fjw.weixin.util.AllValus" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <%

        String urlname ="bl5/memo.jsp";
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


    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title><%=AllValus.pw_title %></title>
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
                                            <td height="20"><p></p><div style="line-height:1.8"><strong>1、问：根据《固定污染源排污许可分类管理名录（2019年版）》规定了纳入排污许可管理的固定污染源行业范围和管理类别。排污许可管理分为排污许可重点管理、简化管理和登记管理三种类别。所有纳入《管理名录》的现有排污单位，应于什么时候前申请并取得排污许可证或完成排污登记？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：2020年9月30日前</p>

                                            </td>
                                        </tr>
                                        </tbody>


                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>2、问：什么工序不属于《固定污染源排污许可分类管理名录（2019年版）》中涉及通用工序中的表面处理？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：烘干 </p>

                                            </td>
                                        </tr>
                                        </tbody>


                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>3、问：全国排污许可证管理信息平台公开端网址是什么？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：http://permit.mee.gov.cn/</p>

                                            </td>
                                        </tr>
                                        </tbody>

                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>4、问：生态环境部部署2020年排污许可证核发覆盖所有固定污染源的工作总目标，开展清理整顿和做好排污许可发证登记工作，通过“摸、排、分、清”四个步骤，首批需要清理整顿33个行业需在什么时候完成？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：2020年4月30日前</p>

                                            </td>
                                        </tr>
                                        </tbody>

                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>5、问：根据《固定污染源排污许可分类管理名录（2019年版）》规定了纳入排污许可管理的固定污染源行业范围和管理类别。排污许可管理包含哪些？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：包含：重点管理、简化管理、登记管理</p>

                                            </td>
                                        </tr>
                                        </tbody>

                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>6、问：按照“摸、排、分、清”四项工作任务，完成固定污染源清理整顿、2020年排污许可发证和登记，其中排指什么？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：排查无证</p>

                                            </td>
                                        </tr>
                                        </tbody>


                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>7、问：实行登记管理的排污单位，不需要申请取得排污许可证，应当在全国排污许可证管理信息平台填报排污登记表，哪项不需填写？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：自行监测数据</p>

                                            </td>
                                        </tr>
                                        </tbody>


                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>8、问：通用工序中，除纳入重点排污单位名录的，除以天然气或者电为能源的加热炉、热处理炉、干燥炉以外的其他工业炉窑，按《固定污染源排污许可分类管理名录（2019年版）》规定，属于？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：简化管理</p>

                                            </td>
                                        </tr>
                                        </tbody>



                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>9、问：根据《固定污染源排污许可分类管理名录（2019年版）》规定，家具制造业，属于简化管理的范围：除重点管理外年使用 多少吨及以上溶剂型涂料或者胶粘剂（含稀释剂、固化剂）的、年使用20吨及以上水性涂料或者胶粘剂的，有磷化表面处理工艺的。</strong></div>
                                                <p style="line-height:1.8">
                                                    答：10吨</p>

                                            </td>
                                        </tr>
                                        </tbody>



                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>10、问：根据《固定污染源排污许可分类管理名录（2019年版）》规定，有色金属压延加工行业，有轧制或者退火工艺的，属于?</strong></div>
                                                <p style="line-height:1.8">
                                                    答：简化管理。</p>

                                            </td>
                                        </tr>
                                        </tbody>


                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>11、问：什么是排污许可？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：排污许可是环境管理的一种制度，是指需要向环境排放特定污染物的单位和个人，必须事先向主管机关申请，经批准后才能排放污染物的制度。</p>

                                            </td>
                                        </tr>
                                        </tbody>

                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>12、问：为什么要办理排污许可证？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：《中华人民共和国环境保护法》第四十五条规定：国家依照法律规定实行排污许可管理制度。实行排污许可管理的企业事业单位和其他生产经营者应当按照排污许可证的要求排放污染物；未取得排污许可证的，不得排放污染物。</p>

                                            </td>
                                        </tr>
                                        </tbody>

                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>13、问：哪些单位需要办理排污许可发证登记？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：纳入《固定污染源排污许可分类管理名录（2019年版）》的排放大气污染物、水污染物及其他污染物的企事业单位和其他生产经营者。</p>

                                            </td>
                                        </tr>
                                        </tbody>


                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>14、哪些企业需要申请排污许可证？哪些企业需要排污登记？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：根据《固定污染源排污许可分类管理名录（2019年版）》进行分类判断，根据污染物产生量、排放量、对环境的影响程度等因素，实行排污许可重点管理、简化管理和登记管理。</p>

                                            </td>
                                        </tr>
                                        </tbody>

                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>15、问：排污许可证办理时限？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：环境保护行政主管部门应当自受理排污许可证申请之日起20个工作日内，依法对申请材料和有关情况进行核实和审查，及时做出颁发或者不予颁发排污许可证的决定。</p>

                                            </td>
                                        </tr>
                                        </tbody>

                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>16、属于2019名录中登记管理的企业在平台进行填报后，需要当地生态环境局确认吗？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：排污登记采取网上填报方式。排污单位在全国排污许可证管理信息平台（http://permit.mee.gov.cn/permitExt）上填报排污登记表后，自动即时生成登记编号和回执，排污单位可以自行打印留存。即无须当地生态环境局确认。</p>

                                            </td>
                                        </tr>
                                        </tbody>


                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>17、问：企事业单位未办理排污许可证应受到什么处罚？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：《中华人民共和国环境保护法》规定：企业事业单位和其他生产经营者未取得排污许可证排放污染物，被责令停止排污，拒不执行，尚不构成犯罪的，除依照有关法律法规规定予以处罚外，由县级以上人民政府环境保护主管部门或者其他有关部门将案件移送公安机关，对其直接负责的主管人员和其他直接责任人员，处十日以上十五日以下拘留；情节较轻的，处五日以上十日以下拘留。</p>

                                            </td>
                                        </tr>
                                        </tbody>

                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>18、对于已登记的排污单位，有效期多久？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：自其登记日起5年，满5年的，排污许可证登记信息管理平台会自动发送登记更新信息提醒。</p>

                                            </td>
                                        </tr>
                                        </tbody>


                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>19、排污许可证的有效期是多长？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：排污许可证自作出许可决定之日起生效，首次发放的排污许可证有效期为三年，延续换发的排污许可证有效期为五年.</p>

                                            </td>
                                        </tr>
                                        </tbody>

                                        <tbody id="tbName">
                                        <tr>
                                            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>20、请问个体工商户是否应申领排污许可证？</strong></div>
                                                <p style="line-height:1.8">
                                                    答：对照《名录》规定的行业类型进行识别。根据《环境保护法》《水污染防治法》《大气污染防治法》及《排污许可管理办法（试行）》等有关要求，如果纳入《名录》中的企业事业单位和其他生产经营者，应当按照规定的时限申请并取得排污许可证；未纳入《名录》的排污单位，暂不需申请排污许可证。</p>

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
