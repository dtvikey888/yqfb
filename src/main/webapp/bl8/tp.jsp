<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils22"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%
String openid = request.getParameter("openid");
int c1 = new Integer(request.getParameter("c1"));
int c2 = new Integer(request.getParameter("c2"));
int c3 = new Integer(request.getParameter("c3"));
int c4 = new Integer(request.getParameter("c4"));
int c5 = new Integer(request.getParameter("c5"));
int c6 = new Integer(request.getParameter("c6"));
int c7 = new Integer(request.getParameter("c7"));
int c8 = new Integer(request.getParameter("c8"));
int c9 = new Integer(request.getParameter("c9"));
int c10 = new Integer(request.getParameter("c10"));
int bz=MyUtils22.DtRl(openid,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10);
//out.println(bz);
//out.close();
//AACA BBCC AB
if(bz==1){

	out.print("<script type=\"text/javascript\">alert('"+AllValus.success_lan+"');document.location.href='cj.jsp?openid="+openid+"';</script>");

}else if(bz==2){

	out.print("<script type=\"text/javascript\">alert('"+AllValus.csc_lan+"');history.back();window.location.href=document.referrer;</script>");

}else if(bz==3){

	out.print("<script type=\"text/javascript\">alert('"+AllValus.error_lan+"');history.back();window.location.href=document.referrer;</script>");

}
%>