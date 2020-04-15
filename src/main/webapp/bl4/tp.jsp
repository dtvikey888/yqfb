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
	for(int i=1;i<c2.length;i++){
		cs2+=c2[i]+",";
	}
}
String c3 = request.getParameter("c3");
String[] c4=null;
String cs4="";
if(request.getParameterValues("c4")!=null){
	c4=request.getParameterValues("c4");
	for(int i=1;i<c4.length;i++){
		cs4+=c4[i]+",";
	}
}
String c5 = request.getParameter("c5");
String c6 = request.getParameter("c6");
String[] c7=null;
String cs7="";
if(request.getParameterValues("c7")!=null){
	c7=request.getParameterValues("c7");
	for(int i=1;i<c7.length;i++){
		cs7+=c7[i]+",";
	}
}
	int bz=MyUtils25.DtRl(openid,c1,cs2,c3,cs4,c5,c6,cs7);
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