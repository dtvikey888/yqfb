<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.liufeng.course.util.AdvancedUtil"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%

//dl.jsp �û�������д
String urlname ="gk/dl.jsp";
String openid =request.getParameter("openid");
String check=Topay.WxJsApiCheck4(urlname,openid);

//ɾ�� openid = 'null' �ļ�¼
MyUtils7.delnul();

//boolean cz = MyUtils7.iscz(openid);
//if(cz){
  //  response.sendRedirect("cj_chk.jsp?openid="+openid+"");
//}
%>

 <%
	//����ʱ��
	int kz =0;
	String tt1=AllValus.zy1;
	String tt2=AllValus.zy2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //��ʼ�齱
    //2: //�齱�Ѿ�����,��л��ע��
    //3: //�齱��û��ʼ��
  
	 %>

<html>
	<head>
	
	 <title></title>
	 
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

	 
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript" charset="gb2312"></script>
		<script type="text/javascript">
		wx.config({
		    debug: true, // ��������ģʽ,���õ�����api�ķ���ֵ���ڿͻ���alert��������Ҫ�鿴����Ĳ�����������pc�˴򿪣�������Ϣ��ͨ��log���������pc��ʱ�Ż��ӡ��
		    <%=check%>,// ���ǩ��������¼1
		    jsApiList: ['hideMenuItems','onMenuShareTimeline'] // �����Ҫʹ�õ�JS�ӿ��б�����JS�ӿ��б����¼2
		});
		wx.ready(function(){
		   alert("config ok...");
		   //�������Ͻǲ˵��ӿ�
		   	  wx.hideOptionMenu();
		   	  
		   	   <%
		  // String accessToken = WeixinChaOpenId.GetDBAccessToken("���巢��");

		   %>
		   
		   	  
		   	  
		   	  <%
		     // ������ֹʱ���ж��Ƿ�رմ��� ���������Ѵ�
		  // kz=1 ��ʼ�齱(����) kz=2 �齱����(�ر�) kz=3 �齱û��ʼ���رգ�
		  
		   if (kz==1){
		   
		   
		  %>
		 // alert("��ʼ");
		  
		  <%}else if(kz==2){
		    // ��װ�ı��ͷ���Ϣ
		//   String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "�ǳ���Ǹ���齱ʱ���ѹ�����л���Ĺ�ע�����´�������");
		// ���Ϳͷ���Ϣ
		 //  AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		  
		  %>
		  
            alert('�ǳ���Ǹ���齱ʱ���ѹ�����л���Ĺ�ע�����´�������');
            //�رյ�ǰ��ҳ���ڽӿ�
            wx.closeWindow();
		 
		  <%}else if(kz==3){
		   // ��װ�ı��ͷ���Ϣ
		//   String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "��û��ʼ�أ�\"��ʼ�齱ʱ��"+tt1+"\"��\""+tt2+"\"��\n��ӭ��ʱ����룡");
		// ���Ϳͷ���Ϣ
		  // AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		  
		  %>
		  
           alert('��û��ʼ�أ�"��ʼ�齱ʱ��<%=tt1%>"��"<%=tt2%>"��\n��ӭ��ʱ����룡');
           //�رյ�ǰ��ҳ���ڽӿ�
           wx.closeWindow();
		 
		  <%}else{
		       // ��װ�ı��ͷ���Ϣ
		 //  String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "��л��ע��");
		// ���Ϳͷ���Ϣ
		 //  AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		  
		   %>
		  
		     alert('��л��ע��');
            //�رյ�ǰ��ҳ���ڽӿ�
            wx.closeWindow();
            
		  <%} %>
		   	  
			  wx.checkJsApi({
           jsApiList: [
             'hideMenuItems',
             'onMenuShareTimeline',
             'getNetworkType',
             'previewImage',
             'onMenuShareTimeline',
             'chooseImage'
           ],
           success: function (res) {
             alert(JSON.stringify(res));
             
           }
          });
          
		});
		wx.error(function(res){
			alert(res);
		    // config��Ϣ��֤ʧ�ܻ�ִ��error��������ǩ�����ڵ�����֤ʧ�ܣ����������Ϣ���Դ�config��debugģʽ�鿴��Ҳ�����ڷ��ص�res�����в鿴������SPA�������������ǩ����
		});
		
		
			
			// 2.2 ������������Ȧ��ť������Զ���������ݼ��������ӿ�
  function  sharefriendRound2() {
     //��ʾ���Ͻǲ˵��ӿ�
       wx.showOptionMenu();
	   
    wx.onMenuShareTimeline({
      title: '����������',
      link: 'http://www.yqrb.com.cn/CreatWs/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg',
      trigger: function (res) {
        // ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���
       alert('�û������������Ȧ');
      },
      success: function (res) {
        alert('�ѷ���');
      },
      cancel: function (res) {
        alert('��ȡ��');
      },
      fail: function (res) {
        alert(JSON.stringify(res));
      }
    });
	
    alert('��ע���ȡ����������Ȧ��״̬�¼�');
	alert('����ȥ��������Ѱɣ�������Ҳ���μ�ԤԼ����!');
  };
  

	// 2.2 ���������͸����ѡ���ť������Զ���������ݼ��������ӿ�
  function  sharefriendRound3() {
     //��ʾ���Ͻǲ˵��ӿ�
       wx.showOptionMenu();
	   
    wx.onMenuShareAppMessage({
      title: '����������',
      desc: '�����μӴ���',
      link: 'http://www.yqrb.com.cn/CreatWs/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg',
      type: '', // ��������,music��video��link������Ĭ��Ϊlink
      dataUrl: '', // ���type��music��video����Ҫ�ṩ�������ӣ�Ĭ��Ϊ��
      trigger: function (res) {
        // ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���
       // alert('�û�������͸�����');
      },
      success: function (res) {
        alert('�ѷ���');
      },
      cancel: function (res) {
        alert('��ȡ��');
      },
      fail: function (res) {
        alert(JSON.stringify(res));
      }
    });
	
    alert('��ע���ȡ���������ѡ�״̬�¼�');
	alert('����ȥ���͸����Ѱɣ�������Ҳ���μ�ԤԼ����!');
  };
  			
	// 2.2 ���������͸�qq���ѡ���ť�������ȡ������QQ����ť���״̬���Զ���������ݽӿ�
  function  sharefriendRound4() {
     //��ʾ���Ͻǲ˵��ӿ�
       wx.showOptionMenu();
	   
    wx.onMenuShareQQ({
      title: '����������',
      desc: '�����μӴ���',
      link: 'http://www.yqrb.com.cn/CreatWs/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg',
     
      trigger: function (res) {
        // ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���
       // alert('�û�������͸�QQ����');
      },
      success: function (res) {
        alert('�ѷ���');
      },
      cancel: function (res) {
        alert('��ȡ��');
      },
      fail: function (res) {
      //  alert(JSON.stringify(res));
      }
    });
	
    //alert('��ע���ȡ����������Ȧ��״̬�¼�');
	//alert('����ȥ���͸�QQ���Ѱɣ�������Ҳ���μ�ԤԼ����!');
  };	
		
		
		
				
	// 2.2 ������������Ѷ΢������ť�������ȡ��������Ѷ΢������ť���״̬���Զ���������ݽӿ�
  function  sharefriendRound5() {
     //��ʾ���Ͻǲ˵��ӿ�
       wx.showOptionMenu();
	   
    wx.onMenuShareWeibo({
      title: '����������',
      desc: '�����μӴ���',
      link: 'http://www.yqrb.com.cn/CreatWs/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg',
     
      trigger: function (res) {
        // ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���
       // alert('�û�������͸���Ѷ΢��');
      },
      success: function (res) {
        alert('�ѷ���');
      },
      cancel: function (res) {
        alert('��ȡ��');
      },
      fail: function (res) {
       // alert(JSON.stringify(res));
      }
    });
	
    //alert('��ע���ȡ����������Ȧ��״̬�¼�');
	//alert('����ȥ���͸���Ѷ΢���ɣ�������Ҳ���μ�ԤԼ����!');
  };	
			
				
	// 2.2 �������ύ����ť�������ȡ���������ز˵��� ��
  function  sharefriendRound6() {
     //��ʾ���Ͻǲ˵��ӿ�
      // wx.showOptionMenu();
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
      //  alert('������һϵ�а�ť'); 
      }, 
      fail: function (res) { 
        alert(JSON.stringify(res)); 
      } 
    }); 
	
    //alert('��ע���ȡ����������Ȧ��״̬�¼�');
	//alert('����ȥ���͸���������������Ҳ���μ�ԤԼ����!');
  };		
  

		</script>
	</head>
  <body onLoad="sharefriendRound6()">
  

    <div  id="contentid" style="display:block">
    
  

    <header>
        <div class="left-box">        </div>
        <h1>��д�û���Ϣ</h1>
    </header>
	
<div style=" margin-left:5px; margin-right:5px; padding-bottom:6px; padding-top:8px; line-height:25px;"> 
<SPAN style="COLOR: #ff0000"><B>�߿�־Ը����潲��</B></SPAN>
<P><SPAN style="COLOR:#0000ff">���죺�����н����� �����ձ���</SPAN></P>
<P><SPAN style="color:#0000FF">�����ˣ������н�����ԭ���������������</SPAN></P>
<P><SPAN style="color:#0000FF">ʱ�䣺6��18������3ʱ</SPAN></P>
<P><SPAN style="COLOR:#0000FF">�ص㣺�����ձ����¥�������</SPAN></P>
<!--  
<P><SPAN style="COLOR:#ff0000"><B>Ŀǰʣ��<=MyUtils7.GetTotalSY(2)%>����������</B></SPAN></P>
<P><SPAN style="COLOR:#ff0000"><B>Ŀǰʣ��<=MyUtils7.GetTotalSY(1)%>��ר��һ��һָ������</B></SPAN></P>
-->
</div>

<div id="tips"></div>


<div class="body p-10 address-edit">

    <form id="form1" name="form1" method="post" action="cj_chk.jsp">

       <input type="hidden" name="openid" value="<%=openid%>">

		<table width="100%" border="0" cellpadding="3" cellspacing="1">
      <tr>
        <td height="20"  bgcolor="#E8F0F7">&nbsp;<span class="STYLE20">��������д��Ϣ</span></td>
        </tr>
    
		
		  
		
      <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><input  id="xm" name="xm" type="text" class="input-common" placeholder="����(����)" pattern=".{2,}"  maxlength="10"  data-err="����ȷ��д����" value=""></td>
        </tr>
	  </tbody>
	  
	  
	
	  
	 <tbody id="tbTel">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><input id="tel" name="tel" type="tel" class="input-common" placeholder="�ֻ�����(����,ƾ������Ϣ��ͼ�볡)" pattern="\d{3}[\d\*]{4,}"   maxlength="20" /></td>
        </tr>
	 </tbody>
	  
	 <tbody id="tbTel">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><textarea id="memo" name="memo" class="text-common" placeholder="������ѯ������(ѡ��)" pattern="^.{5,300}$"  maxlength="300"></textarea></td>
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
  <button type="submit" gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" onClick="document.form1.action='cj_chk.jsp';if(DataLength(form1.xm.value)<2){alert('��������2����');form1.xm.focus();return false};if(DataLength(form1.tel.value)<2){alert('����д��ȷ����ϵ��ʽ');form1.tel.focus();return false};sharefriendRound2();sharefriendRound3();sharefriendRound4();sharefriendRound5();sharefriendRound6();document.form1.submit();">�ύ����</button>
          </div>
          <!--
		end if%>
		--></td>
        </tr>
    </table>
    
    
    <div style="font-family:Arial; font-size:18px; margin-top:10px;" onClick="sharefriendRound2();sharefriendRound3();"> ��������</div>
		
    </form>
</div>

<footer>
    <div class="ft-wrap">
  </div>
    <nav class="ft-nav"></nav>
  <div class="ft-partner"></div>
    <div class="ft-copyright"><span class="ft-copyright-text">2015 <a href="#" target="_blank">��ICP��05000063��</a></span></div>
</footer>


 
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


