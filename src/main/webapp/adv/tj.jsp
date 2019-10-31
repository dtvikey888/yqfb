<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%
String openid = request.getParameter("openid");
//String memo = MyUtils2.codetoString(request.getParameter("memo"));
String memo = request.getParameter("memo");
String msgtel="13706776231";

//out.println(openid);
//out.println(memo);
//out.close();

ZghTools.Rlxq(openid,memo,msgtel);
out.print("<script type=\"text/javascript\">alert('"+AllValus.adv_title2+"');document.location.href='up.jsp?openid="+openid+"';</script>");

//response.sendRedirect("UP.jsp?openid="+openid);
//out.print("<script type=\"text/javascript\">alert('您的作品正在审核!');document.location.href='UP.jsp?openid="+openid+"';</script>");

%>
