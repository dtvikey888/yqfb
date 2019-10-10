<%@ page language="java" pageEncoding="gb2312"%>
<%@page import="org.liufeng.course.util.ZghTools"%>

<html>
<head>
	<title>文明餐桌之光盘大作战</title>
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

// 设置 
Cookie userCookie = new Cookie("userCookie",openid);
// 在响应头部添加cookie
response.addCookie(userCookie);

if(ZghTools.IsCj(openid)){

//助力分享页
	out.println("<script>window.location.href='cj_chk.jsp?bzlopenid="+openid+"'</script>");

}else{

//上传抽奖页
	out.println("<script>window.location.href='dl.jsp?openid="+openid+"'</script>");

}

%>

</body>
</html>


<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //是微信浏览器不做操作
	   
    }else{
	  // alert('not');
	  //非微信浏览器就因此显示列表等
	   var target=document.getElementById("contentid");
	   target.style.display="none";
	   alert('非微信中打开');

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

