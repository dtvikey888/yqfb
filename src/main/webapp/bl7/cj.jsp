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
                    <th width="15%" height="23" align="center" nowrap="nowrap" bordercolor="#FFCC00" scope="row"><span class="style47">����</span></th>
                    <th bordercolor="#EC6941" scope="row"><input name="name12" type="text" class="style23" style="border:2px solid #FF9900;border-radius:10px;border-color:#FF9900;width:100%;height:25px" /></th>
                </tr>
            </table>
                <table width="90%" height="0%" align="center" cellspacing="15">
                    <tr>
                        <th width="15%" height="23" align="center" nowrap="nowrap" bordercolor="#EC6941" scope="row"><span class="style47">�绰</span></th>
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
                            <td height="34" align="center" bgcolor="#FF6600" class="style38 style39 style45" scope="row">�ύ</td>
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
