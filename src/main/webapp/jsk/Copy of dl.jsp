<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils23"%>
<%

//dl.jsp �û�������д
String urlname ="jsk/dl.jsp";
String openid =request.getParameter("openid");
String check=Topay.WxJsApiCheck4(urlname,openid);

MyUtils23.clym(openid);

%>

<%
	//����ʱ��
	int kz =0;
	String tt1=AllValus.gp1;
	String tt2=AllValus.gp2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //��ʼ�齱
    //2: //�齱�Ѿ�����,��л��ע��
    //3: //�齱��û��ʼ�أ�
  
%>
	 
<%

   String userCookie="";
   Cookie cookie = null;

   Cookie[] cookies = null;
   // ��ȡcookies������,��һ������
   cookies = request.getCookies();
   
   if( cookies != null ){
   
      for (int i = 0; i < 1; i++){
      
         cookie = cookies[i];
         
         //out.println("������ : " + cookie.getName());
         //out.println("����ֵ : " + cookie.getValue());
         
      }
      
      userCookie=cookie.getValue();
      
      if(userCookie.equals(openid)){
      
        //out.println("����ͨ��΢�Ž����������û�");
        
      }else{
      
          //out.println("<br/><h1>���ȹ�ע����Ա������ߡ����ں�(yq6188)���й������������ں�(yq3535)�����롰���ء�������</h1>");
          //out.println("<script>window.location.href='gz.jsp'</script>");
          
          //out.close();

      }

  }else{
  
       //out.println("<h2>û�з��� Cookie</h2>");
       //out.println("<br/><h1>���ȹ�ע����Ա������ߡ����ں�(yq6188)���й������������ں�(yq3535)�����롰���ء�������</h1>");
        //out.println("<script>window.location.href='gz.jsp'</script>");
        
        //out.close();
      
  }

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
 
	 <link type="text/css" rel="stylesheet" href="../css/other5.css">

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
		    debug: false, // ��������ģʽ,���õ�����api�ķ���ֵ���ڿͻ���alert��������Ҫ�鿴����Ĳ�����������pc�˴򿪣�������Ϣ��ͨ��log���������pc��ʱ�Ż��ӡ��
		    <%=check%>,// ���ǩ��������¼1
		    jsApiList: ['hideMenuItems'] // �����Ҫʹ�õ�JS�ӿ��б�����JS�ӿ��б����¼2
		});
		wx.ready(function(){
		   //alert("config ok...");
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
           ],
           success: function (res) {
             //alert(JSON.stringify(res));
             
           }
          });
          
		});
		wx.error(function(res){
			//alert(res);
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
       // alert('�û������������Ȧ');
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
	//alert('����ȥ��������Ѱɣ�������Ҳ���μ�ԤԼ����!');
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
       // alert(JSON.stringify(res));
      }
    });
	
    //alert('��ע���ȡ����������Ȧ��״̬�¼�');
	//alert('����ȥ���͸����Ѱɣ�������Ҳ���μ�ԤԼ����!');
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
          <div class="left-box">
                <!-- <a class="hd-lbtn" href="javascript:history.go(-1)"><span>����</span></a> -->
               <a class="hd-lbtn" href="wel.jsp?openid=<%=openid%>"><span>��ҳ</span></a>
            </div>
        <h1>��д�û���Ϣ</h1>
    </header>
    <div id="tips"></div>

<div class="body p-10 address-edit">

    <form id="form1" name="form1" method="post"  enctype="multipart/form-data"  action="sc_chk.jsp">

       <input type="hidden" name="openid" value="<%=openid%>">

		<table width="100%" border="0" cellpadding="3" cellspacing="1">
   
        
     <%if(MyUtils23.GetCs(openid)<5&&MyUtils23.GetYz(openid)==0){%>
		
		
  <table width="100%" height="100px;" border="0" cellpadding="5" cellspacing="0" style="border:3px dashed #dd1c60; font-family:Arial; font-size:12px; color:#dd1c60 ">
              <tr>
                <td align="center" valign="middle">
               
                <img id="imageList"  width="100px;" height="100px;" style="display:none"/>
               
                ����wifi�ϴ�������(����Ҳ�������⣡)

	
      <input type="file" name="file"  value=''>
       </td>
              </tr>
  </table>
  

 
 


	 <tbody id="tbTel">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><input id="tel" name="tel" type="text" class="input-common" placeholder="�ֻ�����(����)" pattern="\d{3}[\d\*]{4,}"   maxlength="20" /></td>
        </tr>
	 </tbody>
	 
	 
	
	 
	 <tbody id="tbMemo">
      <tr>
        <td height="20" bgcolor="#FFFFFF">
	 <select class="select-common" name="memo" style="width:100%">
				   <option value="">ѡ���������</option>

				   <option value="1">�Թ����в� ������ʣ��ʣŮ����</option>  
                  
				   <option value="2">�ܾ��˷ѣ���������</option>

				   <option value="3">�ܾ���ʣ���磬���������̡�!</option>
				  
				   <option value="4">����Ҫ���Բ��ˡ������ߡ��᳹����!</option>
				   
				   <option value="5">�ܾ�����ϵ��˷ѣ�����һ������ͬ�У�</option>
                </select>
	 </tr>
	 </tbody>
	  
	<%} %>
	
      <tr>
        <td height="20" bgcolor="#FFFFFF">
        
        <%if(MyUtils23.GetCs(openid)<5&&MyUtils23.GetYz(openid)==0){%>
        
          <div class="form-btn">
  <button type="submit" gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" onClick="document.form1.action='sc_chk.jsp?bzlopenid=<%=openid%>';if(DataLength(form1.file.value)<1){alert('����ѡȡ�ļ���ťѡȡ������Ƭ');return false};if(DataLength(form1.tel.value)<2){alert('����д��ȷ����ϵ��ʽ');form1.tel.focus();return false};if(DataLength(form1.memo.value)<1){alert('��ѡ���������');form1.memo.focus();return false};sharefriendRound2();sharefriendRound3();sharefriendRound4();sharefriendRound5();sharefriendRound6();document.form1.submit();">�ύ</button>
          </div>
         
        <%}else{%>
        
         <div align="center" style="font-size:18px; font-family:'������'"> δ�����������������5�λ���������!</div>
        
        <%} %>
          
        </td>
      </tr>
    </table>
		
    </form>
</div>

<footer>
   <div align="center" style="margin-bottom:15px;">
		
  </div>
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



