<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
//���������1.���� ���� openid ����zgh_cj �е� zlopenid �ֶΣ�����ҵ�
//˵���Ѿ�������������
// 2. û�ҵ��͸��½�ȥ�������β��
String bzlopenid = request.getParameter("bzlopenid");

ZghTools.HelpCz3(bzlopenid);

request.getRequestDispatcher("zjd.jsp").forward(request, response);
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>������԰װ�μ�װ΢��Ը�</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my JSP page. <br>
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

