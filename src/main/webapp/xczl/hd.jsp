<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils24"%>
<%@page import="org.fjw.weixin.util.StringFromat"%>
<%
String openid=request.getParameter("openid");
String name1=request.getParameter("name1");
String headimg=request.getParameter("headimg");

String id2 = MyUtils24.Rk(openid,name1,headimg);
//out.println("id2="+id2);
String bzlopenid=request.getParameter("state");
//out.println("state="+bzlopenid);
String id1 = MyUtils24.GetId(bzlopenid);
//out.println("id1="+id1);

session.setAttribute("state_session",openid);

out.println("<script>window.location.href='index.jsp?id="+id1+"&id2="+id2+"&op="+bzlopenid+"&bz=1'</script>");


%>