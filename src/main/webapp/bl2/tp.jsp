<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils22"%>
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
String c11 = request.getParameter("c11");
String c12 = request.getParameter("c12");
String c13 = request.getParameter("c13");
String c14 = request.getParameter("c14");
String c15 = request.getParameter("c15");
String c16 = request.getParameter("c16");
String c17 = request.getParameter("c17");
String c18 = request.getParameter("c18");
String c19 = request.getParameter("c19");
String[] c20=null;
String cs20="";
if(request.getParameterValues("c20")!=null){
	c20=request.getParameterValues("c20");
	for(int i=0;i<c20.length;i++){
		cs20+=c20[i]+",";
	}
}
int bz=MyUtils22.DtRl(openid,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,cs20);
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