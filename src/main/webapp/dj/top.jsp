<%@ page language="java" contentType="text/html; charset=gb2312" pageEncoding="gb2312"%>
<%@page import="org.liufeng.course.util.ZghTools"%>

<%

String openid =request.getParameter("openid");

String welsession = (String)session.getAttribute("welsession");

if(welsession!=null){
   
      if(welsession.equals(openid)){
      
   	      //out.println("�����Լ���ģ����ص�");
   	      
      }else{
        
          //out.println("�����˵����Ժ󣬲��ص�");
           response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet10&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
   
      }
   
   }else{
   
  		//��û��Ҫ�ص�
         response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet10&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
   
   }
   

%> 

<%



if(ZghTools.IsCz2(openid)==false){

	//�ص�
	  response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet10&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
   
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0058)file:///C:/Users/zpuser/Desktop/%E7%BD%91%E9%A1%B5/CYL.htm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>�������ģ�����ĵ�Ա�ǣ������������ǵĵ���</title>
<style>
body{
	padding:0px;
	margin:0px;
	background-color: #FFFFFF;
}
td{font-size:14px;font-family:΢���ź�}
.style11 {
	color: #000000;
	font-size: 16px;
}
.style7 {color: #8F0501}
.style12 {color: #FFFFFF}
.style13 {font-size: 16px}
.style15 {font-size: 22px}
</style>
<script type="text/javascript">
         function check(form) {

         if(form.y1.value=='') {
                alert("�������뵳���!");
                form.y1.focus();
                return false;
         }
         
         if(parseInt(form.y1.value)>2017 || parseInt(form.y1.value)<1921) {
                alert("����������");
                form.y1.focus();
                return false;
         }
         
         if(form.m1.value==''){
                alert("�������뵳�·�!");
                form.m1.focus();
                return false;
         }
         
         if(parseInt(form.m1.value)>12 || parseInt(form.m1.value)<1) {
                alert("�·��������");
                form.m1.focus();
                return false;
         }
         
         if(form.d1.value==''){
                alert("�������뵳֮��!");
                form.d1.focus();
                return false;
         }
          
         if(parseInt(form.d1.value)>31 || parseInt(form.d1.value)<1) {
                alert("�����������");
                form.d1.focus();
                return false;
         }
         
         if (form1.y1.value.length!=4)
         {
            alert("��ݸ�ʽ����");
            form1.y1.focus();
            return false;
         }
         if (form1.m1.value.length>2)
         {
            alert("�·ݸ�ʽ����");
            form1.m1.focus();
            return false;
         }
         if (form1.d1.value.length>2)
         {
            alert("���Ӹ�ʽ����");
            form1.d1.focus();
            return false;
         }
         
         return true;
         }
         

</script>
</head>
<body style="background:url(img/to.png) no-repeat top center;background-size:100%;">
<audio autoplay="autoplay" loop="loop" preload="auto" src="http://www.yqrb.com.cn/yqvod/bmwj/other/001.mp3">
      		
</audio>
<div style="margin-top:15px;"/>
<table width="100%" height="365"  border="0" align="center">
  <tr>
    <td align="right"><p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <table width="80%"  border="0" align="center" cellspacing="0">
      <tr>
        <td align="center"><span class="style11">����</span><span class="style7"><span class="style15"><%=ZghTools.GetRdDemoNum() %></span></span><span class="style13">�˴β���</span></td>
      </tr>
    </table>
      <table width="80%"  border="0" align="center">
        <tr>
          <td align="center"><p class="style13">����<%=ZghTools.GetNick(openid) %>���뵳���ھ��㵳�� </p></td>
        </tr>
      </table>   
	  <form id="form1" name="form1" method="post" action="tj.jsp" onsubmit="return check(this)">
	  
      <table width="80%"  border="0" align="center">
        <tr>
          <td width="100" align="right"><table width="80" height="40"  border="1" cellpadding="0" cellspacing="0" bordercolor="#5B0603">
              <tr>
                <td height="40" align="right" bordercolor="#FFFFFF">
                
                <input type="hidden" name="bzlopenid" value="<%=openid%>"/>
                <input type="text" name="y1" style="width:60%;height:100%;border:none;font-size:20px;font-weight:bold;padding-right:20px;" maxlength="4" onkeyup="value=value.replace(/[^\d]/g,'')" /></td>
              </tr>
          </table></td>
          <td width="12%" align="left"><span class="style13">��</span></td>
          <td width="100" align="right"><table width="60" height="40"  border="1" cellpadding="0" cellspacing="0" bordercolor="#5B0603">
              <tr>
                <td width="60" height="40" bordercolor="#FFFFFF"><input type="text" name="m1" style="width:60%;height:100%;border:none;font-size:20px;font-weight:bold;" maxlength="2" onkeyup="value=value.replace(/[^\d]/g,'')" /></td>
              </tr>
          </table></td>
          <td width="18%" align="left"><span class="style13">��</span></td>
          <td width="100" align="right"><table width="60" height="40"  border="1" cellpadding="0" cellspacing="0" bordercolor="#5B0603">
              <tr>
                <td width="60" height="40" bordercolor="#FFFFFF"><input type="text" name="d1" style="width:60%;height:100%;border:none;font-size:20px;font-weight:bold;" maxlength="2" onkeyup="value=value.replace(/[^\d]/g,'')" /></td>
              </tr>
          </table></td>
          <td width="19%" align="left"><span class="style13">��</span></td>
        </tr>
      </table>      
      <table width="80%"  border="0" align="center">
        <tr>
          <td><table width="55%"  border="0" align="center" cellspacing="10">
            <tr>
              <td><input id="upload_button" type="image" src="img/03.png" width="100%"></td>
            </tr>
          </table></td>
        </tr>
      </table> 
	  </form>   
	       <p>&nbsp;</p>      <p>&nbsp;</p>      <p>&nbsp;</p></td>
  </tr>
</table>
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

