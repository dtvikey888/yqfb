<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils23"%>
<%

//dl.jsp �û�������д
//String urlname ="jsk/dl.jsp";
String openid =request.getParameter("openid");
//String check=Topay.WxJsApiCheck4(urlname,openid);

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
    
    //out.println(kz);
    
  
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
          out.println("<script>window.location.href='wel.jsp?openid=123'</script>");
          //out.close();

      }

  }else{
  
       //out.println("<h2>û�з��� Cookie</h2>");
       //out.println("<br/><h1>���ȹ�ע����Ա������ߡ����ں�(yq6188)���й������������ں�(yq3535)�����롰���ء�������</h1>");
        //out.println("<script>window.location.href='gz.jsp'</script>");
        out.println("<script>window.location.href='wel.jsp?openid=123'</script>");
        //out.close();
      
  }

%> 
	 

<html>
	<head>
	
	 <title>���̴���ս�����Ӯ���ѣ�</title>
	 
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
		   	  
		  <%
		     // ������ֹʱ���ж��Ƿ�رմ��� ���������Ѵ�
		  // kz=1 ��ʼ�齱(����) kz=2 �齱����(�ر�) kz=3 �齱û��ʼ���رգ�
		  
		   if (kz==1){
		   
		   
		  %>
		  //alert("��ʼ");
		  
		  <%}else if(kz==2){
		   
		  
		  %>
		  
            alert('�ǳ���Ǹ���齱ʱ���ѹ�����л���Ĺ�ע�����´�������');
            window.location.href="wel.jsp"; 
            
		  <%}else if(kz==3){
		  
		  
		  %>
		  
           alert('��û��ʼ�أ�"��ʼ�齱ʱ��<%=tt1%>"��"<%=tt2%>"��\n��ӭ��ʱ����룡');
          
		  <%}else{
		      
		  
		   %>
		  
		     alert('��л��ע��');
           
		  <%} %>

		</script>
		
	</head>
	
  <body>
  

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
               
                ����wifi�ϴ�����������(�黯����Ч)

	
      <input type="file" name="file"  value=''>
       </td>
              </tr>
  </table>
  

 <div style="margin-top:20px;"/>
 


	 <tbody id="tbTel">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><input id="tel" name="tel" type="text" class="input-common" placeholder="�ֻ�����(���������ƶ�)" pattern="\d{3}[\d\*]{4,}"   maxlength="20" /></td>
        </tr>
	 </tbody>
	 
	 
	 <div style="margin-top:20px;"/>
 

	 
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
        
        <%if (MyUtils23.IsYw(openid)){ %>
        
        <div align="center" style="font-size:18px; font-family:'������'"> �����5�λ���������,�����������!</div>
        
        <%}else if (MyUtils23.IsDtMdz(openid)){ %>
        <div align="center" style="font-size:18px; font-family:'������'"> δ���������,������������Ϊ������!</div>
        <%}else{ %>
        
             <div class="form-btn">
  <button type="submit"  gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" onClick="document.form1.action='sc_chk.jsp?bzlopenid=<%=openid%>';if(DataLength(form1.file.value)<1){alert('����ѡȡ�ļ���ťѡȡ������Ƭ');return false};if(DataLength(form1.tel.value)<2){alert('����д��ȷ����ϵ��ʽ');form1.tel.focus();return false};if(DataLength(form1.memo.value)<1){alert('��ѡ���������');form1.memo.focus();return false};document.form1.submit();">�ύ</button>
          </div>
          
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



