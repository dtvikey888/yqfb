<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.component.*"%>
<%
String urlname ="sc.jsp";
String openid =request.getParameter("openid");
String check=Topay.WxJsApiCheck4(urlname,openid);
%>
<html>
	<head>
	<title>ˢ�������콱Ʒ��������Ⱥ��¶���</title>
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
	<link type="text/css" rel="stylesheet" href="css/other5.css">

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
	
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		wx.config({
		    debug: false, // ��������ģʽ,���õ�����api�ķ���ֵ���ڿͻ���alert��������Ҫ�鿴����Ĳ�����������pc�˴򿪣�������Ϣ��ͨ��log���������pc��ʱ�Ż��ӡ��
		    <%=check%>,// ���ǩ��������¼1
		    jsApiList: ['chooseImage','previewImage','uploadImage'] // �����Ҫʹ�õ�JS�ӿ��б�����JS�ӿ��б����¼2
		});
		wx.ready(function(){
		   //alert("config ok...");
		    //�������Ͻǲ˵��ӿ�
		   	 // wx.hideOptionMenu();
		   
			    wx.checkJsApi({
           jsApiList: [
             'getNetworkType',
             'previewImage',
             'onMenuShareTimeline',
             'chooseImage',
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
		

		
		function callpay(){
			wx.chooseImage({
			    jsApiList: ['chooseImage','previewImage','uploadImage'], // ���΢�Žӿ��Ƿ����
			     success: function (res) {
        				var localIds = res.localIds; // ����ѡ����Ƭ�ı���ID�б�localId������Ϊimg��ǩ��src������ʾͼƬ
   					 }
			    });
			    
			
			
		}
		
		 // 5 ͼƬ�ӿ�
    // 5.1 ���ա�����ѡͼ
     var images = {
        localId: [],
         serverId: []
    };
    
		function chooseimg(){
			wx.chooseImage({
			    jsApiList: ['chooseImage'], // ���΢�Žӿ��Ƿ����
			     success: function (res) {
        				//var localIds = res.localIds; // ����ѡ����Ƭ�ı���ID�б�localId������Ϊimg��ǩ��src������ʾͼƬ
						 images.localId = res.localIds;
	                	 //var image = document.createElement("img");
	                     //image.src = res.localIds;
	                    // image.width=100;
	                   //  image.height=150;
	               		// document.querySelector("#imageList").appendChild(image);
	               		 //document.querySelector("#imageList2").display=none;
						 aa = res.localIds;
						 changeimg(aa); 
	               		 uploadimg();
   					 }
			    });
			    
			    
			    
		}
		
		
		function uploadimg(){
		
		    if(images.localId.length <= 0){
  		    alert("��ѡ����Ƭ");
  		    return false;
  	       }
  	       	var i = 0, len = images.localId.length;
		
			wx.uploadImage({
			    jsApiList: ['uploadImage'], // ���΢�Žӿ��Ƿ����
			    localId: images.localId[i], // ��Ҫ�ϴ���ͼƬ�ı���ID����chooseImage�ӿڻ��
    			isShowProgressTips: 1, // Ĭ��Ϊ1����ʾ������ʾ
			     success: function (res) {
        				i++;
		  			    images.serverId.push(res.serverId);
		  			    if(i<len){
		  				upload();
		  			   }
		  			   
		  			   //��ӵ� med2
		  			   dd=res.serverId;
		  			   addmed2(dd);
		  			   
		  			  // var e = document.createElement("input");
		  			  // e.name= "med";
             		  // e.type = "text";
            		 //  e.value = res.serverId;
	               	 //  document.querySelector("#textList").appendChild(e);

	               	   alert("�ϴ���Ƭ�ɹ�!���Ҫ������Ƭ�밴�Ӻţ�");
	               	   
   					 },
   				  fail: function(res){
	  			  alert(JSON.stringify(res));
	  		      }
			    });
   
		}
		
		
		function addmed2(dtt){
		   
		   document.getElementById("med2").value=dtt;
		   
		}
		
		function changeimg(dtt){
		   
		    document.getElementById("imageList").style.display=""
		    document.getElementById("imageList").src = dtt;
	        document.getElementById("imageList").width=120;
	        document.getElementById("imageList").height=100;
			//document.getElementById("imageList2").style.display="none";
		}
		
		
		
		

		</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	background-color: #efeff1;
}
-->
</style>
</head>
	

   <body id="signupverify" style="">
   <div  id="contentid">
    <header>
            <div class="left-box">
                <a class="hd-lbtn" href="http://www.yqrb.com.cn/yqfb/index.jsp?openid=oSX6kjlwIvpFGl2Ws8TN5Ggxd7Ak"><span>����</span></a>
            </div>
        <h1><font color="#000000">��������</font>Ц��<font color="#000000">����</font></h1>
    </header>

	
	
	  <form id="form1" name="form1" method="post"  enctype="multipart/form-data" action="sc_chk.jsp">


  <div align="center" style="padding-top:40px; padding-bottom:40px;">
  <table width="120px;" height="100px;" border="0" cellpadding="0" cellspacing="0" style="border:3px dashed #dd1c60; font-family:Arial; font-size:12px; color:#dd1c60 ">
              <tr>
                <td align="center" valign="middle"><div><img id="imageList"  width="100px;" height="100px;" style="display:none"/>���ϴ�������������������������Ϊ����Ц���գ������ա�ȫ���ա������ա������ա��黯����Ч��
</div>
	
      <input type="file" name="file"  value=''>
       </td>
              </tr>
  </table>
  
 </div>

<!--  
<div style=" margin-left:5px; margin-right:5px; padding-bottom:6px; padding-top:8px; line-height:25px;"> 
<SPAN style="COLOR: #ff0000"><B>�˵����</B></SPAN>
<P>1��<SPAN style="COLOR: #000"> ��ע���й�����������yq3535������΢�źš�</SPAN></P>
<P>2��<SPAN style="COLOR: #000"> ��ת����ĸ�׽�,1000�迵��ܰ����͡��΢��������Ȧ����ͼ������ֻ����</SPAN>
<P>3��<SPAN style="color:#000">���й�������΢�ŶԻ���������<font color=red>"��"</font>�ؼ��֡�</SPAN></P>
<P>4��<SPAN style="color:#000">����д�������ֻ����롢�ϴ�����Ȧ��ͼ������ύ��ť���뽽��ҳ�档</SPAN></P>
</div>
-->	


<div id="tips"></div>

<div class="body p-10 address-edit" style="background:#efeff1">

   
   
       <input type="hidden" name="openid" value="<%=openid %>">
       
        <input type="hidden" id="img1" name="img1" value="">
		
		<table width="100%" border="0" cellpadding="3" cellspacing="1">
      <tr>
        <td height="20">&nbsp;<span class="STYLE20">��������д��Ϣ</span></td>
        </tr>
    
	
		 
		
      <tbody id="tbName">
      <tr>
        <td height="20"><input  id="xm" name="xm" type="text" class="input-common" placeholder="����:����д��ʵ����" pattern=".{2,}"  maxlength="10"  data-err="����ȷ��д����" value=""></td>
        </tr>
	  </tbody>
	  
	  
	
	  
	 <tbody id="tbTel">
      <tr>
        <td height="20"><input id="tel" name="tel" type="text" class="input-common" placeholder="�绰:�����콱�˶ԣ�������" pattern="\d{3}[\d\*]{4,}"   maxlength="20" /></td>
        </tr>
	  </tbody>
	  
	   <tbody id="tbTel">
      <tr>
        <td height="20"><input id="td" name="td" type="text" class="input-common" placeholder="�Ŷ�:���˿ɲ���" pattern="\d{3}[\d\*]{4,}"   maxlength="20" /></td>
        </tr>
	  </tbody>
	  
	  
	    <tbody id="tbTel">
      <tr>
        <td height="20"><textarea id="memo" name="memo" class="text-common" placeholder="������ݿ�������Ը��ף�������ǶԳ��н����ϣ������140�����ڣ��õļ��ｫ��ͬ��Ƭ�������ڡ������ձ����ַ���'Ц��'" pattern="^.{5,140}$"  maxlength="140"  data-err="����д��ȷ���������ݡ�������Ϣ��"></textarea></td>
        </tr>
	  </tbody>
	  


	  
	
	  
	  <div id="textList"></div>

    
	
	<!-- 
	<button type="button" onclick="uploadimg()" >�ϴ�ͼƬ</button>
	  -->
      <tr>
        <td height="20">	<!--
		if (s1<=0 and s2<=0 and s3<=0 and s4<=0 and s5<=0) then%>
		<div class="form-btn">
<span gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" );">��������Ѿ�û�˱���������</span>
        </div>
		
		else%>
		-->
          <div class="form-btn">
  <button type="submit" gaevent="imt/account/address/addBtn" class="btn2 btn-block2" id="btn-login" onClick="document.form1.action='sc_chk.jsp';if(DataLength(form1.file.value)<1){alert('����ѡȡ�ļ���ťѡȡ��ͼ');return false};if(DataLength(form1.xm.value)<2){alert('��������2����');form1.xm.focus();return false};if(DataLength(form1.tel.value)<2){alert('����д��ȷ�ֻ�����');form1.tel.focus();return false};document.form1.submit();">�ύ</button>
          </div>
          <!--
		end if%>
		-->          </td>
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
	   alert('��΢���д򿪣�');
	  
	 
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
