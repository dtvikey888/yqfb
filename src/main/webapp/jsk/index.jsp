<%@ page language="java" pageEncoding="gb2312"%>
<%@page import="org.liufeng.course.util.ZghTools"%>

<html>
<head>
	<title>��������֮���̴���ս</title>
	<meta name="viewport" content="width=device-width,user-scalable=0">
	<style type="text/css">
		*{margin:0; padding:0}
		table{border:1px dashed #B9B9DD;font-size:12pt}
		td{border:1px dashed #B9B9DD;word-break:break-all; word-wrap:break-word;}
	</style>
</head>
<body>
 <div  id="contentid">
 
 </div>

<%

String openid =request.getParameter("openid");

//session.setAttribute("zlsession",openid);
session.invalidate();

// ���� 
Cookie userCookie = new Cookie("userCookie",openid);
// ����Ӧͷ�����cookie
response.addCookie(userCookie);

if(ZghTools.IsCj(openid)){

//��������ҳ
	out.println("<script>window.location.href='cj_chk.jsp?bzlopenid="+openid+"'</script>");

}else{

//�ϴ��齱ҳ
	out.println("<script>window.location.href='dl.jsp?openid="+openid+"'</script>");

}

%>

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

