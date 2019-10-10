<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
//助力类操作1.根据 参数 openid 查找zgh_cj 中的 zlopenid 字段，如果找到
//说明已经助力过，跳过
// 2. 没找到就更新进去（加入结尾）
String bzlopenid = request.getParameter("bzlopenid");
String zlopenid = request.getParameter("zlopenid");

ZghTools.HelpCz2(bzlopenid,zlopenid);

out.println("<script>window.location.href='dz.jsp?bzlopenid="+bzlopenid+"'</script>");

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>乐清丽园装饰家装微心愿活动</title>
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

