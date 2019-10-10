<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils24"%>
<%@page import="org.fjw.weixin.util.StringFromat"%>
<%
String openid=request.getParameter("openid");

session.setAttribute("tjop_session",openid);

out.println("<script>window.location.href='tj.jsp?openid="+openid+"'</script>");


%>