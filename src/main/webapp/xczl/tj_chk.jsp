<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils24"%>
<%@page import="org.fjw.weixin.util.StringFromat"%>
<%
String openid = request.getParameter("openid");
String xm = request.getParameter("xm");
String tel = request.getParameter("tel");

boolean bz=MyUtils24.LrXx2(openid,xm,tel);

if(bz==true){

out.println("<script>alert('�ύ�ɹ���');window.location.href='index.jsp'</script>");


}else{

out.println("<script>alert('�ظ��ύ��');history.back();window.location.href=document.referrer;</script>");

}


%>