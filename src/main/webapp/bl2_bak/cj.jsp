<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils22"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.liufeng.course.util.AdvancedUtil"%>
<%
String urlname ="bl2/cj.jsp";
String openid =request.getParameter("openid");
String check=Topay.WxJsApiCheck4(urlname,openid);
%>

<%
    //����ʱ��
    int kz =0;
    String tt1=AllValus.daf_t1;
    String tt2=AllValus.daf_t2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //��ʼ�齱
    //2: //�齱�Ѿ�����,��л��ע��
    //3: //�齱��û��ʼ�أ�
    //out.println(kz);
%>
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
            wx_share_title="<%=AllValus.daf_title%>";
            wx_share_desc="<%=AllValus.daf_desc%>";
            wx_share_link="<%=AllValus.daf_link%>";
            wx_share_imgUrl="<%=AllValus.daf_img%>";

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
	 <title><%=AllValus.daf_title %></title>

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
            window.location.href="<%=AllValus.errpage%>";

            <%}else if(kz==3){


            %>

            alert('��û��ʼ�أ�"��ʼ����ʱ��<%=tt1%>"��"<%=tt2%>"��\n��ӭ��ʱ����룡');
            window.location.href="<%=AllValus.errpage%>";

            <%}else{


             %>

            alert('��л��ע��');

            <%} %>

        </script>

<%
//����������ʣ��
int t1 = MyUtils22.sy1(); //һ�Ƚ�����ʣ������
int t2 = MyUtils22.sy2(); //���Ƚ�����ʣ������
int t3 = MyUtils22.sy3(); //���Ƚ�����ʣ������
int t4 = MyUtils22.sy4(); //�ĵȽ�����ʣ������
//int t5 = MyUtils22.sy5();

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

	</head>
  <body onload="sharefriendRound6()">
  

    <div  id="contentid" style="display:block">
    
  

    <header>
        <div class="left-box"></div>
        <h1>��д��ϵ��ʽ</h1>
    </header>
	
	
<!-- 
<div style=" margin-left:5px; margin-right:5px; padding-bottom:6px; padding-top:8px; line-height:25px;"> 
<SPAN style="COLOR: #ff0000"><B>�齱����</B></SPAN>
<P>1��<SPAN style="COLOR: #0000ff"> ��ע���й�����������yq3535������΢�ź�</SPAN>
</P>
<P>2��<SPAN style="color:#0000FF">�ظ��ؼ���"����"</SPAN></P>
<P>3��<SPAN style="color:#0000FF">������뱾ҳ�棬��д����+�绰������ύ��ť����齱��</SPAN></P>
<P><SPAN style="COLOR: #ff0000"><B>�齱ʱ�䣺</B></SPAN></P>
<P><=AllValus.jg1 %>-<=AllValus.jg2 %></P>
  </div>
 -->	


<div id="tips"></div>

<div class="body p-10 address-edit">

    <form id="form1" name="form1" method="post" action="cj_chk.jsp">
       
   
       <input type="hidden" name="openid" value="<%=openid %>">
		
	 
		<table width="100%" border="0" cellpadding="3" cellspacing="1">
      <tr>
        <td height="20"  bgcolor="#E8F0F7">&nbsp;<span class="STYLE20">��������д�û���Ϣ</span></td>
        </tr>
    
		
		  
		
      <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><input  id="xm" name="xm" type="text" class="input-common" placeholder="����" pattern=".{2,}"  maxlength="10"  data-err="����ȷ��д����" value=""></td>
        </tr>
	  </tbody>
	
	  
	 <tbody id="tbTel">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><input id="tel" name="tel" type="tel" class="input-common" placeholder="�ֻ�����" pattern="\d{3}[\d\*]{4,}"   maxlength="20" /></td>
        </tr>
	  </tbody>
	  
	  
	  
	
	  
	
      <tr>
        <td height="20" bgcolor="#FFFFFF">	<!--
		if (s1<=0 and s2<=0 and s3<=0 and s4<=0 and s5<=0) then%>
		<div class="form-btn">
<span gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" );">��������Ѿ�û�˱���������</span>
        </div>
		
		else%>
		-->
          <div class="form-btn">
          <% if(t1<=0 && t2<=0 && t3<=0 && t4<=0){ %>
              <div class="btn btn-block" id="btn-login" onclick="WeixinJSBridge.call('closeWindow');">��Ʒ�ѳ���</div>

              <%}else{ %>
  <button type="submit" gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" onClick="document.form1.action='cj_chk.jsp';if(DataLength(form1.xm.value)<2){alert('��������2����');form1.xm.focus();return false};if(DataLength(form1.tel.value)<11){alert('����д��ȷ����ϵ��ʽ');form1.tel.focus();return false};document.form1.submit();">�� ��</button>
          <%} %>
          
          </div>
          <!--
		end if%>
		-->          </td>
        </tr>
    </table>
		
    </form>
</div>
<!--  
<footer>
    <div class="ft-wrap">
  </div>
    <nav class="ft-nav"></nav>
  <div class="ft-partner"></div>
    <div class="ft-copyright"><span class="ft-copyright-text">2015�й������� <a href="#" target="_blank">��ICP��05000063��</a></span></div>
</footer>
-->

 
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


