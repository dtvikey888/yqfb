<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.liufeng.course.util.ZghTools"%>

<%
//���˵���ҳ
//���ڻص�

//��������Ȧת���㿪���Ļ������Լ��㣬�ǾͲ��ص�
//����������Լ���Żص�
//�ص���Ӧ���ǵ�������һ������ҳ��

//String openid =request.getParameter("openid");

String bzlopenid =request.getParameter("bzlopenid");

//out.println("openid: "+openid);
  //out.println("bzlopenid: "+bzlopenid);

  String zlsession = (String)session.getAttribute("zlsession");
   
  //out.println("zlsession: "+zlsession);
  
  if(ZghTools.IsCz2(zlsession)==false){

  
   if(zlsession!=null){
   
      if(zlsession.equals(bzlopenid)){
      
   	      //out.println("�����Լ���ģ����ص�");
   	      
      }else{
        
          //out.println("�����˵����Ժ󣬲��ص�");
          //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet4&response_type=code&scope=snsapi_userinfo&state="+bzlopenid+"#wechat_redirect");        
   
      }
   
   }else{
   
  		//��û��Ҫ�ص�
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet4&response_type=code&scope=snsapi_userinfo&state="+bzlopenid+"#wechat_redirect");        
   
   }
   
   
   //yqfb_openid û�д���Ҫ�ص�
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet4&response_type=code&scope=snsapi_userinfo&state="+bzlopenid+"#wechat_redirect");        
   
   
   }
  
 %>

<html>
	<head>
	<title>���̴���ս�����Ӯ����,��<%=ZghTools.GetNick(bzlopenid)%>����</title>
	<meta name='yixin-share-image' content='http://v.yqcn.com/bmwj/asp/sxbook/images/logo5.jpg'>
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
	
	<script src="js/jquery.js"></script>
	
	<style>
			 #mcover {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background: rgba(0, 0, 0, 0.7);
				display: none;
				z-index: 20000;
			 }
			 #mcover img {
				position: fixed;
				right: 18px;
				top: 5px;
				width: 260px!important;
				height: 180px!important;
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
				text-shadow: 0.5px 0.5px 1px #EFEFF1;
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
        </style>
        
        <script type="text/javascript">
			function button1(){
			$("#mcover").css("display","block")    // ��������Ѱ�ť��������
			}
			function button2(){
			$("#mcover").css("display","block")  // ���������Ȧ��ť��������
			}
			function weChat(){
			$("#mcover").css("display","none");  // ��������㣬��������ʧ
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
		
<script>

function show(){

   alert('�����\n1.��������ͺ�ġ����̡���Ƭ���ϴ����ҳ��󣬿������������˻��ѳ齱��\n2.�����̡��Ķ���Ϊ������û�����Ե�ʣ��ʳ�Ｔ�ɡ�Υ���˹涨�ߣ����췽��Ȩ���������н������\n3.���λּ���ռ�����Լ�òͣ��ʶ����ѡ�����������������ʱ�䲻�ޣ���͡��в͡���͡����ġ�ҹ���Կɣ�ÿ��ÿ�����1�λ��ᡣ���������Ϊ�Լ�������ÿ��ÿ�����5�λ��ᡣ');
  // document.getElementById("div_gz").style.display="";
   //alert(document.getElementById("div").style.display)
   
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
body {
	background-color: #efeff1;
}
-->
</style>

<style>

#menu2 { bottom:0; left:0; width:100%; position:fixed; padding:30px; text-align:center; background:#EFEFF1; z-index:2; }
</style>
</head>
   <body id="signupverify" style="">
   
   <div id="mcover" onClick="weChat()" style="display: none;">
          <img src="js/tip.png">
   </div>
   
   <div  id="contentid">
    <header>
            <div class="left-box">
                <!-- <a class="hd-lbtn" href="javascript:history.go(-1)"><span>����</span></a> -->
                 <a class="hd-lbtn" href="wel.jsp?openid=<%=bzlopenid%>"><span>��ҳ</span></a>
            </div>
            
            <div class="right-box">
                <!-- <a class="hd-lbtn" href="javascript:history.go(-1)"><span>����</span></a> -->
                 <a class="hd-rbtn" onclick="show();"><span>�����</span></a>
            </div>
        <h1>���̴���ս</h1>
    </header>
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

 <%
	//���� 1. �����ݱ� zgh_sjk �����ѯһ����δ�ù���bh,Ȼ����������yz=1
	//2.�� openid+xm+tel+bh д���zgh_cj
	
	//String openid =request.getParameter("openid");
	
	//out.println("openid: "+openid);
	
	//String xm =request.getParameter("xm");
	//String tel =request.getParameter("tel");

	//if(zlsession==null){
	
	//	ZghTools.Rkcz(openid,xm,tel);
		
	//}


      //if(zlsession==null&&ZghTools.IsCj(bzlopenid)==false){
      	//ZghTools.Rkcz(bzlopenid,xm,tel);
      //}
	
	
	
	

	%>
	
	<%
	String tp = "";
	//if(openid!=null){
	
	 // bh = ZghTools.GetBh(openid);
	
	//}else{
	
	  tp = ZghTools.GetImagSC(bzlopenid);
	  
	  
	 // out.println(tp);
	  
	//}
	
	
	
	//String xm2 = "";
	//if(openid!=null){
	
	//  xm2 = ZghTools.GetXm(openid);
	
	//}else{
	
	 // xm2 = ZghTools.GetXm(bzlopenid);
	  
	//}
	
	
	 %>

<table width="100%" border="0" cellpadding="0" cellspacing="20" style="table-layout:fixed;white-space: normal;word-break:break-all; width: 100%;">
      <tr>
        <td bgcolor="#EFEFF1"><table width="100%" border="0" cellpadding="0" cellspacing="15" style="background-color:#EFEFF1">
          <tr>
            <td height="41" align="right" style="font-family:Arial; font-size:18px; ">
			<table width="100%" height="299" border="0" cellpadding="0" cellspacing="12" style="background-color:#EFEFF1; font-family:΢���ź�; font-size:35px;">
          <tr>
            <td height="48" colspan="3" align="center" style="color:#888888; border-bottom:2px  solid  #f5f5f7 " style="overflow: hidden;"><a style="font-family:Arial; font-size:20px;"><%=tp%></a><br/><span style="font-family:Arial; font-size:20px;"><%=ZghTools.GetMemoSC(bzlopenid) %></span></td>
          </tr>
          
          
          <tr>
            <td height="103" colspan="3" style="font-family:΢���ź�; font-size:35px; "><table width="100%" border="0" cellspacing="10">
              <tr>
                <td height="75">&nbsp;</td>
                <td width="21%"><img src="<%=ZghTools.GetImg(bzlopenid)%>" width="50px" height="50px" border="0"/></td>
                <td width="71%">
                
                <%if(ZghTools.Isdz(bzlopenid,zlsession)){ %>
                  ����ΪTA����
                <%} %>
                </td>
              </tr>
              <tr>
                <td width="8%" height="21">&nbsp;</td>
                <td colspan="2"><%=ZghTools.GetNick(bzlopenid)%></td>
              </tr>
            </table></td>
          </tr>
          <tr>
      
        
       <%if(zlsession!=null) {%> 
          <%if(ZghTools.IsCz2(zlsession)){ %>  
          
           <td height="50" align="center"><div style="font-family:Arial; font-size:18px;"  onClick="javascript:window.open('dl.jsp?openid=<%=zlsession%>','_self')"><img src="img/join.png" width="103" height="32"/></div></td>
		  
		  <%}else{ %>
		  
		   <td height="50" align="center"><div style="font-family:Arial; font-size:18px;"  onClick="javascript:window.open('wel.jsp?openid=<%=zlsession%>','_self')"><img src="img/join.png" width="103" height="32"/></div></td>
		 
		  <%} %>
		<%}else{ %>
		
		<%} %>
		
		<%if(zlsession!=null){ %>
		
		
		<%if(zlsession.equals(bzlopenid)){ %>
		
			<td align="center" style=" color:#EFEFF1 "></td>
		
		<%}else if(ZghTools.IsHelp(bzlopenid,zlsession)){%>
		
			<td align="center" style=" color:#EFEFF1 "></td>
			
		<%}else{ %>
		
			<td align="center"><div style="font-family:Arial; font-size:18px;"  onClick="javascript:window.open('zl.jsp?bzlopenid=<%=bzlopenid%>&zlopenid=<%=zlsession %>','_self')"><img src="img/btdz.png" width="103" height="32"/></div></td>
		
		<%} %>
            
		<%} %>	
			
            <td height="50" align="center"><div style="font-family:Arial; font-size:18px;" onClick="button2();sharefriendRound2();"><img src="img/fxcq.png" width="103" height="32"/></div></td>
            </tr>
         <tr>
            <td height="10" colspan="3" align="center" valign="middle"  style="color:#EFEFF1;font-family:Arial; font-size:16px;"></td>
          </tr>
         
			<!--
          <tr>
            <td height="38" colspan="3" align="center" valign="middle" bgcolor="#888888"  style="color:#EFEFF1;font-family:Arial; font-size:16px;">ÿ��ֻ��ͶһƱ��</td>
          </tr>
         -->
          </table>
			
			
			<div style="margin-top:10px;"></div>			</td>
          </tr>
         
        </table>
      </tr>
	  
	  
  </table>

<nav class="codrops-demos"></nav>

</div>

<footer>
   <div align="center" style="margin-bottom:15px;">
		
  </div>
</footer>
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
