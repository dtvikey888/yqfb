<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils24"%>
<%
String openid= (String)session.getAttribute("state_session");
//out.println("openid="+ openid);
String id = MyUtils24.GetId(openid);
//out.println(id);
 %>
<html>
<head>
<title>倡导绿色生活,反对铺张浪费</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<meta name="description" content="倡导绿色生活">
<meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
<meta name="viewport" content="initial-scale=1,user-scalable=no,maximum-scale=1" media="(device-height: 568px)">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="full-screen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<style type="text/css">
<!--
body {

  margin-left: 0px;
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 0px;
  background:#F8EFE0;
  
}

#top{

  height:850px;
  background:url(images/phb.png) no-repeat center 0; background-size:380px 850px;
  
}

#phb{

  padding-top:420px;
  
}

#phb2{
  overflow-y:auto;
  height:280px;
}

#cen1{

  padding-top:10px;
  text-align:center;
  
}

.div-inline{

  display:inline

} 

#phb3{
  width:260px;
  height:30px;
  background:#00B674;
  border-radius:80px;
  margin-left:40px;
  margin-bottom:10px;
}

#phb33{
  width:260px;
  height:30px;
  background:#00986C;
  border-radius:80px;
  margin-left:40px;
  margin-bottom:10px;
}

#phb4{
padding-top:3px;
padding-left:10px;
}

.circle{
width:20px;
height:20px;
border-radius:50%;
-moz-border-radius:50%;
-webkit-border-radius:50%;
}


-->
</style></head>
<body>
<div id="top">

<div id="phb">
   <div>
     <table width="100%" border="0" cellspacing="5" cellpadding="5">
       <tr>
         <td>
         <div id="phb2">
         
           <%
    		out.println(MyUtils24.GetHtmlPHB(200));
    		%>
           
         </div></td>
       </tr>
     </table>
   </div>
</div>

<div id="cen1">


    <div class="div-inline" onClick="javascript:history.back(-1);"><img src="images/btn6.png" width="85px;" height="35px;"/></div> 
</div>
</div>
</body>
</html>