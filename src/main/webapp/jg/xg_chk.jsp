<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="org.liufeng.course.util.ZghTools"%>

<!-- 完善资料 -->
<%
String id = request.getParameter("id");

String lb = request.getParameter("lb");

out.println(id);
out.println(lb);

ZghTools.XgFl(id,lb);

out.print("<script type=\"text/javascript\">document.location.href='List2.jsp';</script>");

//out.print("<script type=\"text/javascript\">alert('现在进入作品上传!');document.location.href='UP.jsp?openid="+openid+"';</script>");

%>