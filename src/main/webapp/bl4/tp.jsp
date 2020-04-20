<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils25"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%
String openid = request.getParameter("openid");
String c1 = request.getParameter("c1");
String[] c2=null;
String cs2="";
if(request.getParameterValues("c2")!=null){
	c2=request.getParameterValues("c2");
	for(int i=0;i<c2.length;i++){
		cs2+=c2[i]+",";
	}
}
String c3 = request.getParameter("c3");
String[] c4=null;
String cs4="";
if(request.getParameterValues("c4")!=null){
	c4=request.getParameterValues("c4");
	for(int i=0;i<c4.length;i++){
		cs4+=c4[i]+",";
	}
}
String c5 = request.getParameter("c5");
String c6 = request.getParameter("c6");
String c7 = request.getParameter("c7");
String c8 = request.getParameter("c8");
String c9 = request.getParameter("c9");
String c10 = request.getParameter("c10");

String[] c11=null;
String cs11="";
if(request.getParameterValues("c11")!=null){
	c11=request.getParameterValues("c11");
	for(int i=0;i<c11.length;i++){
		cs11+=c11[i]+",";
	}
}

//	out.println(c1);
//	out.println(cs2);
//	out.println(c3);
//	out.println(cs4);
//	out.println(c5);
//	out.println(c6);
//	out.println(cs7);
//	out.close();

	int bz=MyUtils25.DtRl(openid,c1,cs2,c3,cs4,c5,c6,c7,c8,c9,c10,cs11);
//out.println(bz);
//out.close();
if(bz==1){

	out.print("<script type=\"text/javascript\">alert('"+AllValus.success_lp_lan+"');document.location.href='cj.jsp?openid="+openid+"';</script>");

}else if(bz==2){

	out.print("<script type=\"text/javascript\">alert('"+AllValus.csc_lp_lan+"');history.back();window.location.href=document.referrer;</script>");

}else if(bz==3){

	out.print("<script type=\"text/javascript\">alert('"+AllValus.error_lp_lan+"');history.back();window.location.href=document.referrer;</script>");

}
%>