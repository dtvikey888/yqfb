<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="org.liufeng.course.util.ZghTools"%>

<!-- �������� -->
<%
String openid = request.getParameter("openid");

String xm =  request.getParameter("xm");
String tel = request.getParameter("tel");

ZghTools.wszl(openid,xm,tel);

out.print("<script type=\"text/javascript\">document.location.href='up.jsp?openid="+openid+"';</script>");
//out.print("<script type=\"text/javascript\">alert('���ڽ�����Ʒ�ϴ�!');document.location.href='UP.jsp?openid="+openid+"';</script>");

%>