<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils27"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
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

    String urlname ="bl7/index.jsp";
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
                response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet33&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

            }

            //out.println("�����Լ���ģ����ص�");

        }else{

            //out.println("�����˵����Ժ󣬲��ص�");

            //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect");

            response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet33&response_type=code&scope=snsapi_base&state=1#wechat_redirect");



        }

    }else{

        //��û��Ҫ�ص�
        //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect");
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet33&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

    }

    //ZghTools.upyt6(openid);

    ZghTools.ClearNull();

    String check="";

    if(from!=null){
        check=Topay.WxJsApiCheck48(urlname,openid,from);
        out.println("<div style=display:none>1</div>");
    }else{
        check=Topay.WxJsApiCheck4(urlname,openid);
        out.println("<div style=display:none>2</div>");
    }

     //out.println(check);

    //�����ʱ׼������
    //session.removeAttribute("twbsession2");
    //session.invalidate();
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
        wx_share_title="<%=AllValus.zb_title%>";
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
    <style type="text/css">
        <!--
        body {
            background-color: #C0DEE1;
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
        -->
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
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
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
<table width="101%"  border="0" cellspacing="0">
    <tr>
        <td><img src="img/03.png" width="100%"></td>
    </tr>
    <tr>
        <td align="center"><table width="40%"  border="0" cellspacing="15">
            <tr>
                <td><a href="index2.jsp?openid=<%=openid%>"><img src="img/01.png" width="100%" border="0"></a></td>
            </tr>
        </table>      </td>
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