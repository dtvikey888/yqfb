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
    //����ʱ��
    int kz =0;
    String tt1=AllValus.zb_t1;
    String tt2=AllValus.zb_t2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //��ʼ�齱
    //2: //�齱�Ѿ�����,��л��ע��
    //3: //�齱��û��ʼ�أ�
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
         * ע�⣺
         * 1. ���е�JS�ӿ�ֻ���ڹ��ںŰ󶨵������µ��ã����ںſ�������Ҫ�ȵ�¼΢�Ź���ƽ̨���롰���ں����á��ġ��������á�����д��JS�ӿڰ�ȫ��������
         * 2. ��������� Android ���ܷ����Զ������ݣ��뵽�����������µİ����ǰ�װ��Android �Զ������ӿ��������� 6.0.2.58 �汾�����ϡ�
         * 3. �������⼰���� JS-SDK �ĵ���ַ��http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
         *
         * ������������������ĵ�����¼5-�������󼰽���취�����������δ�ܽ����ͨ����������������
         * �����ַ��weixin-open@qq.com
         * �ʼ����⣺��΢��JS-SDK��������������
         * �ʼ�����˵�����ü��������������������ڣ��������������������ĳ������ɸ��Ͻ���ͼƬ��΢���Ŷӻᾡ�촦����ķ�����
         */

        wx_share_title="<%=MyUtils27.GetWs2(openid)%>";
        wx_share_desc="<%=AllValus.zb_desc%>";
        wx_share_link="<%=AllValus.zb_link%>";
        wx_share_imgUrl="<%=AllValus.zb_img%>";

        wx.config({
                debug: false,
            <%=check%>,// ���ǩ��������¼1
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

        wx.ready(function () {   //�����û����ܵ������ťǰ���ȵ���


            //���������
            wx.onMenuShareAppMessage({
                title: wx_share_title,
                desc: wx_share_desc,
                link: wx_share_link,
                imgUrl: wx_share_imgUrl,
            }, function(res) {
                // console.log("test==========",res)
                //alert('123');
                //window.location.href="http://www.baidu.com";
                //�����ǻص�����
            }, function(err){
                // console.log('err:', err)
            });

            //��������Ȧ
            wx.onMenuShareTimeline({
                title: wx_share_title,
                link: wx_share_link,
                imgUrl: wx_share_imgUrl,
                success: function () {
                    // �û�����˷����ִ�еĻص�����
                    //alert('��������Ȧ�ɹ�������齱');
                    //window.location.href="http://www.baidu.com";
                    <%if((ZghTools.getPs(openid)>0) && MyUtils27.iscj_pd(openid)==false){%>
                    //alert('��������Ȧ�ɹ�������齱');
                    window.location.href="http://www.yqrb.com.cn/yqfb/bl7/cj.jsp?openid=<%=openid%>";
                    <%}%>

                },
                cancel: function (res) {
                    alert('��ȡ��');
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
            $("#mcover").css("display","block")    // ��������Ѱ�ť��������
        }
        function button2(){
            $("#mcover").css("display","block")  // ���������Ȧ��ť��������
        }

        function button3(){
            $("#mcover2").css("display","block")  // ���������Ȧ��ť��������
        }

        function button4(){
            $("#mcover3").css("display","block")  // ���������Ȧ��ť��������
        }

        function weChat2(){
            $("#mcover2").css("display","none");  // ��������㣬��������ʧ
        }

        function weChat(){
            $("#mcover").css("display","none");  // ��������㣬��������ʧ
        }

        function weChat3(){
            $("#mcover3").css("display","none");  // ��������㣬��������ʧ
        }

        /*$
        (function(){
           setTimeout(function () {
                $("#mcover").show();}, 6000);   // 6000ʱ�����ǵ�����
        setTimeout(function () {
                $("#mcover").hide(); }, 8000);    //8000���������ز�
        })
        */
    </script>


    <script src="js/jquery.js"></script>


    <style>
        /*divͨ����ʽ*/
        div{

        }




        /*���Ͻ�*/
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
           // ������ֹʱ���ж��Ƿ�رմ��� ���������Ѵ�
        // kz=1 ��ʼ�齱(����) kz=2 �齱����(�ر�) kz=3 �齱û��ʼ���رգ�

         if (kz==1){


        %>
        //alert("��ʼ");

        <%}else if(kz==2){


        %>

        alert('�ǳ���Ǹ������ʱ���ѹ�����л���Ĺ�ע�����´�������');
        window.location.href="<%=AllValus.errpage4%>";

        <%}else if(kz==3){


        %>

        alert('��û��ʼ�أ�"��ʼ����ʱ��<%=tt1%>"��"<%=tt2%>"��\n��ӭ��ʱ����룡');
        window.location.href="<%=AllValus.errpage4%>";

        <%}else{


         %>

        alert('��л��ע��');

        <%} %>

    </script>

    <script>

        function rule(){

            alert('���޲�����3����Ʒ��');

        }

    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
</head>
<body>


            <!--�����齱��ͼƬ-->
            <div id="mcover2"  onClick="weChat2()"  style="display:none;">
                <img src="img/tu5.png" />
            </div>
            <!--����ת���ٳ齱ͼƬ-->
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
                                                if(RS.wasNull())out.print("<br><font face=Arial color=navy size=2><b>��ǰ����������</b></font>");
                                            %>
                                            <%
                                                int intPageSize; //һҳ��ʾ�ļ�¼��
                                                int intRowCount; //��¼����
                                                int intPageCount; //��ҳ��
                                                int intPage; //����ʾҳ��
                                                java.lang.String strPage;
                                                int i;
//����һҳ��ʾ�ļ�¼��
                                                intPageSize = 100;
//ȡ�ô���ʾҳ��
                                                strPage = request.getParameter("page");
                                                if(strPage==null){//������QueryString��û��page��һ����������ʱ��ʾ��һҳ����
                                                    intPage = 1;
                                                }
                                                else{//���ַ���ת��������
                                                    intPage = java.lang.Integer.parseInt(strPage);
                                                    if(intPage<1) intPage = 1;
                                                }
                                                RS.last();
                                                intRowCount = RS.getRow();
//������ҳ��
                                                intPageCount = (intRowCount+intPageSize-1) / intPageSize;
//��������ʾ��ҳ��
                                                if(intPage>intPageCount) intPage = intPageCount;
                                                if(intPageCount>0){
//����¼ָ�붨λ������ʾҳ�ĵ�һ����¼��
                                                    RS.absolute((intPage-1) * intPageSize + 1);
//��ʾ����
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
                                            <!--ѭ����ʼ-->
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
                                                            <td nowrap bgcolor="#E42D58" class="style2">&nbsp;&nbsp;<span class="style3">��ʱ������<%=MyUtils27.GetPM(id)%>λ</span></td>
                                                        </tr>
                                                    </table></td>
                                                </tr>
                                                <tr>
                                                    <td><table width="95%" height="0"  border="0" align="right" cellspacing="0">
                                                        <tr>
                                                            <td><span class="style3 style4"><strong>��Ʒ���ƣ�</strong><%=title%></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="32"><span class="style3 style4"><strong>ֱ���۸�Χ��</strong><%=price%></span></td>
                                                        </tr>
                                                    </table></td>
                                                </tr>
                                            </table>
                                            <!--ѭ������-->
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
            //��΢���������������
        }else{
            // alert('not');
            //��΢��������������ʾ�б��
            var target=document.getElementById("contentid");
            target.style.display="none";
            alert('��΢���д�');
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