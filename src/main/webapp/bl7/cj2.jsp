<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.MyUtils27"%>
<%@page import="org.fjw.weixin.util.AllValus"%>

<%

    String openid = request.getParameter("openid");
    String urlname = "bl7/cj2.jsp";

//String xm = MyUtils2.codetoString(request.getParameter("xm"));
//String xm = request.getParameter("xm");
    String tel = request.getParameter("tel");
    String zsm = request.getParameter("zsm");

    System.out.println("urlname="+urlname);
    System.out.println("openid="+openid);
    System.out.println("zsm="+zsm);

    String check=Topay.WxJsApiCheck5(urlname,openid,zsm);

%>

<%
    //���￪ʼ�ύ�û�����
    int fhz = MyUtils27.StartCJLR2(tel,openid,zsm);
    //1 �Ѿ������(�ύ����ʧ�ܣ�Ȼ��ر�ҳ��) 2.�ύ���ݳɹ�,Ȼ��ر�ҳ��.
%>

<%
    //����ʲô��
    String zsm22 = MyUtils27.zsm(openid);
%>



<html>
<head>

    <title><%=AllValus.pw_title %></title>

    <meta name="description" content="">
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1" media="(device-height: 568px)">
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

    <link type="text/css" rel="stylesheet" href="../css/other10.css">

    <script type="text/javascript"  src="js/jquery-1.9.1.js"></script>
    <style type="text/css">
        *{margin:0;padding:0;list-style-type:none;}
        a,img{border:0;}
        body{position:relative;background:url(img/guaguaka_bg.png) no-repeat 50% 0;height:640px;overflow:hidden;}

        #bg2{width:295px;height:195px;margin:0 auto;}
        #gua1{width:295px;;margin:0 auto;}
        #notify{width:295px;height:101px;margin:0 auto;}
        #nImg_div{position:absolute;color:white;font-size:17px;font-family:'����';}
        #nImg_div div{width:245px;height:101px;padding:20px 0px 0px 50px;}
        #di{width:295px;margin:0 auto;}
        #bg1{display:none;position:fixed;top:0%;left:0%;width:100%;height:100%;background-color:black;z-index:1001;-moz-opacity:0.7;opacity:.70;filter:alpha(opacity=70);}
        #show{display:none;position:absolute;top:222px;left:50%;margin-left:-148px;text-align:center;background-color:#fff;z-index:1002;overflow:auto;}
        #show div{margin-top:-145px;margin-left:40px;padding-right:40px;line-height:1.5;color:#000000;font-size:17px;font-family:'����';}
    </style>



    <script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
    <script type="text/javascript">
        wx.config({
                debug: false, // ��������ģʽ,���õ�����api�ķ���ֵ���ڿͻ���alert��������Ҫ�鿴����Ĳ�����������pc�˴򿪣�������Ϣ��ͨ��log���������pc��ʱ�Ż��ӡ��
            <%=check%>,// ���ǩ��������¼1
            jsApiList: ['hideMenuItems']// �����Ҫʹ�õ�JS�ӿ��б�����JS�ӿ��б����¼2
        });
        wx.ready(function(){
            //alert("config ok...");

            //�������Ͻǲ˵��ӿ�
            wx.hideOptionMenu();

            <%
             //String accessToken = WeixinChaOpenId.GetDBAccessToken(""+AllValus.memo+"");
             %>

            <% if(fhz==1){
            // ��װ�ı��ͷ���Ϣ
           // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "���Ѿ��������"+zsm22+"");
         // ���Ϳͷ���Ϣ
           // AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
            
            %>

            //alert('���ĳ齱������ȫ�����꣬���γ齱��Ч����л���Ա���Ĵ���֧�֣�');
            // alert('ͬһ���ֻ�����ֻ�ܳ齱һ�Σ���л���Ա���Ĵ���֧�֣�');
            alert('<%=zsm22%>');
            //�رյ�ǰ��ҳ���ڽӿ�
            wx.closeWindow();


            <%}else{
            
            // ��װ�ı��ͷ���Ϣ
           // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, ""+zsm22+"");
          // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "���Ѿ��������"+zsm22+"");
         // ���Ϳͷ���Ϣ
          // AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
            
            
            %>

            alert('<%=zsm22%>');
            //�رյ�ǰ��ҳ���ڽӿ�
            wx.closeWindow();

            <%}%>


            //�������Ͻǲ˵��ӿ�
            wx.hideOptionMenu();
            wx.checkJsApi({
                jsApiList: [
                    'hideMenuItems',
                ],
                success: function (res) {
                    // alert(JSON.stringify(res));

                }
            });

        });
        wx.error(function(res){
            //alert(res);
            // config��Ϣ��֤ʧ�ܻ�ִ��error��������ǩ�����ڵ�����֤ʧ�ܣ����������Ϣ���Դ�config��debugģʽ�鿴��Ҳ�����ڷ��ص�res�����в鿴������SPA�������������ǩ����
        });

        // 2.2 ����ҳ�� body onload����ȡ���������ز˵��� ��
        function  sharefriendRound6() {

            //�������Ͻǲ˵��ӿ�
            wx.hideOptionMenu();

            wx.hideMenuItems({
                menuList: [
                    'menuItem:readMode', // �Ķ�ģʽ 
                    'menuItem:openWithQQBrowser', // ��	QQ������д�
                    'menuItem:openWithSafari', //��Safari�д�
                    'menuItem:share:email', //�ʼ�
                    'menuItem:copyUrl', // �������� 
                    'menuItem:favorite', //�ղ�
                    'menuItem:share:brand', //һЩ���⹫�ں�
                    'menuItem:jsDebug',  //����:
                    'menuItem:editTag', //�༭��ǩ:
                    'menuItem:delete',  //ɾ��:
                    'menuItem:originPage', //ԭ��ҳ:
                    'menuItem:share:qq',  //����QQ:
                    'menuItem:share:weiboApp',  //����Weibo:
                    'menuItem:favorite',  //�ղ�:
                    'menuItem:share:facebook', //����FB:
                    'menuItem:share:QZone'  //���� QQ �ռ�

                ],
                success: function (res) {
                    alert('������һϵ�а�ť');
                },
                fail: function (res) {
                    alert(JSON.stringify(res));
                }
            });

            //alert('��ע���ȡ����������Ȧ��״̬�¼�');
            //alert('��ת����������΢������Ȧ����ö���齱����');
        };


    </script>
</head>
<body onload="sharefriendRound6()">

<div  id="contentid" style="display:block">


</div>

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


