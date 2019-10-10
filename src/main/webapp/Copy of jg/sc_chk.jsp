<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.fjw.weixin.util.AllValus"%>

<!-- 先搞定上传 -->
<%
String openid = request.getParameter("openid");
//String memo = MyUtils2.codetoString(request.getParameter("memo"));
String memo = request.getParameter("memo");
String story = request.getParameter("story");
String MediaId = request.getParameter("med2");
String lb = request.getParameter("lb");

//int oid = ZghTools.Getoid(openid);

if(WeixinChaOpenId.ReImgesToDB8(MediaId,openid,lb,memo,story)){
out.print("<script type=\"text/javascript\">alert('"+AllValus.title3+"');document.location.href='index.jsp?openid="+openid+"';</script>");

}else{
WeixinChaOpenId.ReImgesToDB9(openid,lb,memo,story);
out.print("<script type=\"text/javascript\">alert('"+AllValus.title3+"');document.location.href='index.jsp?openid="+openid+"';</script>");

}
//response.sendRedirect("UP.jsp?openid="+openid);
//out.print("<script type=\"text/javascript\">alert('您的作品正在审核!');document.location.href='UP.jsp?openid="+openid+"';</script>");

%>
