<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils27"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.liufeng.course.util.AdvancedUtil"%>
<%@page import="org.liufeng.course.util.ZghTools"%>

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

            //out.println("�����Լ���ģ����ص�");

        }else{

            //out.println("�����˵����Ժ󣬲��ص�");

            //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect");

            response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet35&response_type=code&scope=snsapi_base&state=1#wechat_redirect");



        }

    }else{

        //��û��Ҫ�ص�
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

    //�����ʱ׼������
    //session.removeAttribute("twbsession2");
    //session.invalidate();
%>


<%
    //����ʲô��
    int zj = MyUtils27.zsm2(openid);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
            'updateTimelineShareData',
            'updateAppMessageShareData'
        ]
        });

        wx.ready(function () {   //�����û����ܵ������ťǰ���ȵ���
            wx.updateTimelineShareData({
                title: wx_share_title,
                link: wx_share_link,
                imgUrl: wx_share_imgUrl,
                trigger: function (res) {
                    // ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���
                    //alert('�û������������Ȧ');
                },
                success: function (res) {
                    //  alert('�ѷ���');
                },
                cancel: function (res) {
                    // alert('��ȡ��');
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
                    // ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���
                    // alert('�û�������͸�����');
                },
                success: function (res) {
                    // alert('�ѷ���');
                },
                cancel: function (res) {
                    //alert('��ȡ��');
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
           // ������ֹʱ���ж��Ƿ�رմ��� ���������Ѵ�
        // kz=1 ��ʼ�齱(����) kz=2 �齱����(�ر�) kz=3 �齱û��ʼ���رգ�

         if (kz==1){


        %>
        //alert("��ʼ");

        <%}else if(kz==2){


        %>

        alert('�ǳ���Ǹ��ʱ���ѹ�����л���Ĺ�ע�����´�������');
        window.location.href="<%=AllValus.errpage4%>";

        <%}else if(kz==3){


        %>

        alert('��û��ʼ�أ�"��ʼʱ��<%=tt1%>"��"<%=tt2%>"��\n��ӭ��ʱ����룡');
        window.location.href="<%=AllValus.errpage4%>";

        <%}else{


         %>

        alert('��л��ע��');

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


