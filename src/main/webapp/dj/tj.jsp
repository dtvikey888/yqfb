<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
String openid=request.getParameter("bzlopenid");
String fbsj=request.getParameter("y1")+"-"+request.getParameter("m1")+"-"+request.getParameter("d1");
ZghTools.InsRdDemo(openid,fbsj);
out.println("<script>window.location.href='http://www.yqrb.com.cn/yqfb/dj/share.jsp?bzlopenid="+openid+"'</script>");
%>