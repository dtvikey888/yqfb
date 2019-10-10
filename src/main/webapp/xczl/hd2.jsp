<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String openid=request.getParameter("openid");
String name1= request.getParameter("name1");
//out.println(name1);

String headimg=request.getParameter("headimg");
String state=request.getParameter("state");

session.setAttribute("bz_session",state);

//session.setAttribute("id1_session",openid);

out.println("<script>window.location.href='index.jsp?openid="+openid+"&name1="+name1+"&headimg="+headimg+"&state="+state+"&bz=3'</script>");

%>