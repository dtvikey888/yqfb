<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils27"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<jsp:useBean id="sqlbean" scope="page" class="org.fjw.weixin.util.MysqlDB"/>
<%@page import="java.sql.ResultSet"%>
<%@ page import="org.fjw.weixin.util.MyUtils26" %>
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
    String urlname ="bl7/index2.jsp";
    String openid =request.getParameter("openid");
    String check=Topay.WxJsApiCheck4(urlname,openid);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
            'onMenuShareAppMessage',
            'onMenuShareTimeline',
            'chooseWXPay',
            'showOptionMenu',
            "updateAppMessageShareData",
            "hideMenuItems",
            "showMenuItems",
            "onMenuShareTimeline",
            'onMenuShareAppMessage'
        ]
        });

        wx.ready(function () {   //需在用户可能点击分享按钮前就先调用


            //分享给朋友
            wx.onMenuShareAppMessage({
                title: wx_share_title,
                desc: wx_share_desc,
                link: wx_share_link,
                imgUrl: wx_share_imgUrl,
            }, function(res) {
                // console.log("test==========",res)
                //alert('123');
                //window.location.href="http://www.baidu.com";
                //这里是回调函数
            }, function(err){
                // console.log('err:', err)
            });

            //分享到朋友圈
            wx.onMenuShareTimeline({
                title: wx_share_title,
                link: wx_share_link,
                imgUrl: wx_share_imgUrl,
                success: function () {
                    // 用户点击了分享后执行的回调函数
                    //alert('分享朋友圈成功，进入抽奖');
                    //window.location.href="http://www.baidu.com";
                    <%if((ZghTools.getPs(openid)>0) && MyUtils27.iscj_pd(openid)==false){%>
                    //alert('分享朋友圈成功，进入抽奖');
                    window.location.href="http://www.yqrb.com.cn/yqfb/bl7/cj.jsp?openid=<%=openid%>";
                    <%}%>

                },
                cancel: function (res) {
                    alert('已取消');
                },
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
        .style2 {
            font-size: 18px;
            color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style3 {font-size: 16px}
        .style4 {color: #666666}
        .style5 {font-size: 16px; color: #666666; }
        -->
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
            margin-top: 50%;
            margin-left: 10px;
            width: 75%!important;
            height: 28%!important;
            z-index: 20001;
        }

        #mcover3 {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            display: none;
            z-index: 20000;
        }
        #mcover3 img {
            position: fixed;
            margin-top: 50%;
            margin-left: 10px;
            width: 75%!important;
            height: 28%!important;
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

        function button4(){
            $("#mcover3").css("display","block")  // 分享给好友圈按钮触动函数
        }

        function weChat2(){
            $("#mcover2").css("display","none");  // 点击弹出层，弹出层消失
        }

        function weChat(){
            $("#mcover").css("display","none");  // 点击弹出层，弹出层消失
        }

        function weChat3(){
            $("#mcover3").css("display","none");  // 点击弹出层，弹出层消失
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
            /*width:100%;*/
            /*height:0;*/

            top: 50%;
            z-index: 99999999 !important;

        }


    </style>

    <style>

        .d1 {
            position:relative;

        }
        .d2 {
            position:absolute;
            bottom:-10px;
            left:-2px;
        }

        .f1 {
            position:relative;

        }
        .f2 {
            position:absolute;
            font-size: 12px;
            color: #A5A5A5;
            bottom:10px;
            right:4%;
        }
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

    <script>

        function rule(){

            alert('点赞不超过3种商品！');

        }

    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
</head>
<body>


            <!--分享后抽奖的图片-->
            <div id="mcover2"  onClick="weChat2()"  style="display:none;">
                <img src="img/tu5.png" />
            </div>
            <!--点赞转发再抽奖图片-->
            <div id="mcover3"  onClick="weChat3()"  style="display:none;">
                <img src="img/tu7.png" />
            </div>

            <%if(MyUtils27.iscj_pd(openid)){%>
            <div  class="right_top" onClick="window.location.href='myzj.jsp?openid=<%=openid%>'"><img src="img/tu4.png" border="0" width="80px" height="98px"></div>
            <%}else{%>
            <%if(ZghTools.getPs(openid)==0){%>
            <div  class="right_top" onClick="button4();"><img src="img/tu4.png" border="0" width="80px" height="98px"></div>
            <%}else{%>
            <div  class="right_top" onClick="button3();"><img src="img/tu4.png" border="0" width="80px" height="98px"></div>
            <%}%>
            <%}%>



            <table width="100%"  border="0" cellspacing="0">
                <tr>
                    <td align="center" valign="top" bordercolor="0"><table width="100%" align="center" cellspacing="0">
                        <tr>
                            <td align="center"><img src="img/234.png" width="100%">
                                <table width="100%" height="600"  border="0" cellspacing="0">
                                    <tr>
                                        <td valign="top" bgcolor="#FFFFFF">

                                            <%
                                                String sql="select * from yqcnwx_szzl ORDER BY id asc";
                                                ResultSet RS=sqlbean.executeQuery(sql);
                                                if(RS.wasNull())out.print("<br><font face=Arial color=navy size=2><b>当前暂无新内容</b></font>");
                                            %>
                                            <%
                                                int intPageSize; //一页显示的记录数
                                                int intRowCount; //记录总数
                                                int intPageCount; //总页数
                                                int intPage; //待显示页码
                                                java.lang.String strPage;
                                                int i;
//设置一页显示的记录数
                                                intPageSize = 100;
//取得待显示页码
                                                strPage = request.getParameter("page");
                                                if(strPage==null){//表明在QueryString中没有page这一个参数，此时显示第一页数据
                                                    intPage = 1;
                                                }
                                                else{//将字符串转换成整型
                                                    intPage = java.lang.Integer.parseInt(strPage);
                                                    if(intPage<1) intPage = 1;
                                                }
                                                RS.last();
                                                intRowCount = RS.getRow();
//记算总页数
                                                intPageCount = (intRowCount+intPageSize-1) / intPageSize;
//调整待显示的页码
                                                if(intPage>intPageCount) intPage = intPageCount;
                                                if(intPageCount>0){
//将记录指针定位到待显示页的第一条记录上
                                                    RS.absolute((intPage-1) * intPageSize + 1);
//显示数据
                                                    i = 0;%>

                                            <%while((i<intPageSize && !RS.isAfterLast()))
                                            {
                                                String id,title,price,images2;
                                                int ps=0;

                                                id = RS.getString("id");
                                                title = RS.getString("title");
                                                price = RS.getString("price");
                                                ps=RS.getInt("ps");

                                                String images ="";
                                                images = RS.getString("img1");

                                                if(images.length()>0 && !images.equals("no.png") ){

                                                    images2 = AllValus.videopath+images;

                                                }else{

                                                    images2 = AllValus.videopath+"no.png";

                                                }

                                            %>
                                            <!--循环开始-->
                                            <table width="98%"  border="0" align="center" cellspacing="10">
                                                <tr>
                                                    <td width="45%" rowspan="2">

                                                        <div class="d1">
                                                            <img src="<%=images2%>" width="100%">
                                                            <div class="d2">
                                                                <div class="f1">
                                                                    <%if(ZghTools.Isdz4(id,openid)){%>
                                                                    <img src="img/dz2.png" width="101%" height="100%">
                                                                    <%}else{%>
                                                                    <%if(ZghTools.getPs(openid)>=3){%>
                                                                    <a href="#"  onClick="rule();">
                                                                        <img src="img/dz1.png" width="101%" height="100%">
                                                                    </a>
                                                                    <%}else{%>
                                                                    <a href="/yqfb/del?action=10&id=<%=id%>&openid=<%=openid%>&uprl=index2.jsp&openid=<%=openid%>">
                                                                        <img src="img/dz1.png" width="101%" height="100%">
                                                                    </a>
                                                                    <%}%>
                                                                    <%}%>
                                                                    <div class="f2">
                                                                        <%=ZghTools.getPsForHtml(id,openid)%>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                    </td>
                                                    <td><table width="100%"  border="0">
                                                        <tr>
                                                            <td nowrap bgcolor="#E42D58" class="style2">&nbsp;&nbsp;<span class="style3">暂时排名第<%=MyUtils27.GetPM(id)%>位</span></td>
                                                        </tr>
                                                    </table></td>
                                                </tr>
                                                <tr>
                                                    <td><table width="95%" height="0"  border="0" align="right" cellspacing="0">
                                                        <tr>
                                                            <td><span class="style3 style4"><strong>产品名称：</strong><%=title%></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="32"><span class="style3 style4"><strong>直播价格范围：</strong><%=price%></span></td>
                                                        </tr>
                                                    </table></td>
                                                </tr>
                                            </table>
                                            <!--循环结束-->
                                            <%
                                                        RS.next();
                                                        i++;}
                                                }
                                                RS.close();
                                            %>

                                            <table width="50%"  border="0" cellspacing="20">
                                                <tr>
                                                    <td><a href="index.jsp"><img src="img/tb1.png" width="100%"></a></td>
                                                    <td></td>
                                                </tr>
                                            </table></td>
                                    </tr>
                                </table>      </td>
                        </tr>
                    </table>
                    </td>
                </tr>
            </table>

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