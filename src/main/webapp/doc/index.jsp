<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.AllValus"%>

 <%
	//����ʱ��
	int kz =0;
	String tt1=AllValus.doc1;
	String tt2=AllValus.doc2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //��ʼ�齱
    //2: //�齱�Ѿ�����,��л��ע��
    //3: //�齱��û��ʼ��
  
	 %>
	 
	 
	 <%

String openid =request.getParameter("openid");
//out.println("openid="+openid);


String twbsession = (String)session.getAttribute("twbsession");

//out.println("docsession="+twbsession);

if(twbsession!=null){
   
      if(twbsession.equals(openid)){
      
   	      //out.println("�����Լ���ģ����ص�");
   	     
   	      
      }else{
        
          //out.println("�����˵����Ժ󣬲��ص�");
           response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet22&response_type=code&scope=snsapi_base&state=1#wechat_redirect");        
  
      }
   
   }else{
   
  		//��û��Ҫ�ص�
         response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet22&response_type=code&scope=snsapi_base&state=1#wechat_redirect");        
  
   }
   
   
%>

<html>
	<head>
	
	 <title>�����ձ��ڶ�����ҽ��̳����</title>
	 
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
            window.location.href="http://www.yqrb.com.cn/yqfb/doc/success.jsp";
            
		  <%}else if(kz==3){
		  
		  
		  %>
		  
           alert('��û��ʼ�أ�"��ʼʱ��<%=tt1%>"��"<%=tt2%>"��\n��ӭ��ʱ����룡');
           window.location.href="http://www.yqrb.com.cn/yqfb/doc/success.jsp";
          
		  <%}else{
		      
		  
		   %>
		  
		     alert('��л��ע��');
           
		  <%} %>

		</script>
		
	</head>
  <body>
  
  
  
<%if(twbsession!=null){%>
  <%if(twbsession.equals(openid)){ %>
  <div id="contentid"  style="display:block">
  <%}else{ %>
  <div id="contentid"  style="display:none">
  <%} %>
<%}else{ %>
<div id="contentid"  style="display:none">
<%} %>
    <header>
        <div class="left-box">        </div>
        
        <%if(twbsession!=null){%>
           <%if(MyUtils7.iscz2(twbsession)){ %>
                <div style="font-size:20px;">���ѱ����ɹ�,���ı����:<%=MyUtils7.GetIdFromDoc1(twbsession)%></div>
           <%} %>
        <%}else{ %>
           <h1>��д�û���Ϣ</h1>
        <%} %>
        
        
    </header>
	
<div style=" margin-left:5px; margin-right:5px; padding-bottom:6px; padding-top:8px; line-height:25px;"> 
<!--  
<P><SPAN style="COLOR:#ff0000"><B>Ŀǰʣ��<=MyUtils7.GetTotalSY(2)%>����������</B></SPAN></P>
<P><SPAN style="COLOR:#ff0000"><B>Ŀǰʣ��<=MyUtils7.GetTotalSY(1)%>��ר��һ��һָ������</B></SPAN></P>
-->
</div>

<div id="tips"></div>

 <%if(MyUtils7.iscz2(twbsession)){ %>
		
		<%}else {%>
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
        <td height="20" bgcolor="#FFFFFF"><input id="tel" name="tel" type="tel" class="input-common" placeholder="�ֻ�����(����)" pattern="\d{3}[\d\*]{4,}"   maxlength="20" /></td>
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
  <button type="submit" gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" onClick="document.form1.action='cj_chk.jsp';if(DataLength(form1.xm.value)<2){alert('��������2����');form1.xm.focus();return false};if(DataLength(form1.tel.value)!=11){alert('����д��ȷ����ϵ��ʽ');form1.tel.focus();return false};document.form1.submit();">�ύ����</button>
          </div>
		
         
          <!--
		end if%>
		--></td>
        </tr>
    </table>

    </form>
</div>


<footer>
    <div class="ft-wrap">
  </div>
    <nav class="ft-nav"></nav>
  <div class="ft-partner"></div>
    <div class="ft-copyright"><span class="ft-copyright-text">2015 <a href="#" target="_blank">��ICP��05000063��</a></span></div>
</footer>
 <%} %>
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


