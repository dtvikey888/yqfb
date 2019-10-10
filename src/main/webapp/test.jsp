<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.sql_data"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.fjw.weixin.util.MyUtils3"%>
<%
//String urlname ="show.jsp";
String openid =request.getParameter("openid");
//String check=Topay.WxJsApiCheck4(urlname,openid);



%>
<%
  String id =request.getParameter("id"); 
  sql_data sqlbean=new sql_data();
  String sql = "Select * FROM yqsjwx_bdsp where id="+id;
  ResultSet RS = sqlbean.executeQuery(sql);
  String images2="";
  String bh ="";
  String xm ="";
  String title="";
  String zan="";
  String ps="";
  String memo=""; 
  int lb=0;
  String lbs = "";
  String lb2="";
 
  while(RS.next()){

    bh = RS.getString("bh");
    title = RS.getString("title");
    //out.println(title);
	memo = RS.getString("memo");
	ps = RS.getString("ps");
	lbs= RS.getString("lb");
	lb= RS.getInt("lb");
	switch(lb){

		 case 1:
		    lb2 = "本地食品企业";
		 break;
		 case 2:
		    lb2 = "本地食品企业";
		 break;
		 case 3: 
		    lb2 = "本地食品企业";
		 break;

		 default:
		 break;

		 }
	
	String images ="";
	images = RS.getString("img1");
	
	if(images.length()>0 && !images.equals("no.gif") ){
		images2 = "http://v.yqcn.com/bmwj/asp/sxbook/download3/"+images;
	}else{
		images2 = "http://info.yqcn.com:7001/ADV/uploadfiles/video/no.gif";
	}


}
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>网友最想参观的本地食品企业<%=title%>投票，点击链接参加活动，与网友一起瓜分2万元超市卡!</title>
	<meta name='yixin-share-image' content='http://www.yqrb.com.cn/yqvod/bmwj/asp/sxbook/images/logo45.png'>
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
	<script src="js/jquery.js"></script>
	
</head>
<body>
<%=memo %>
</body>
</html>