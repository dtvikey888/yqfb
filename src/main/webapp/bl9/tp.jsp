<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils29"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%
String openid = request.getParameter("openid");
String c1 = request.getParameter("c1");
String c2 = request.getParameter("c2");
String c3 = request.getParameter("c3");
String c4 = request.getParameter("c4");
String c5 = request.getParameter("c5");
String c6 = request.getParameter("c6");
String c7 = request.getParameter("c7");
String c8 = request.getParameter("c8");
String c9 = request.getParameter("c9");
String c10 = request.getParameter("c10");


//	out.println(c1);
//	out.println(c2);
//	out.println(c3);
//	out.println(c4);
//	out.println(c5);
//	out.println(c6);
//	out.println(c7);
//	out.println(c8);
//	out.println(c9);
//	out.println(c10);
//	out.println(c11);
//	out.println(c12);
//	out.println(c13);
//	out.println(c14);
//	out.println(c15);
//	out.println(c16);
//	out.println(c17);
//	out.println(c18);
//	out.println(c19);
//	out.println(cs20);
//	out.close();

int bz=MyUtils29.DtRl(openid,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10);
//out.println(bz);
//out.close();
//AACA BBCC AB
if(bz==1){

	out.print("<script type=\"text/javascript\">alert('"+AllValus.success_lp_lan2+"');document.location.href='cj.jsp?openid="+openid+"';</script>");

}else if(bz==2){

	out.print("<script type=\"text/javascript\">alert('"+AllValus.csc_lan+"');history.back();window.location.href=document.referrer;</script>");

}else if(bz==3){

	out.print("<script type=\"text/javascript\">alert('"+AllValus.error_lan+"');history.back();window.location.href=document.referrer;</script>");

}
%>