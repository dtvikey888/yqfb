<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="org.fjw.weixin.util.MyUtils24"%>
<%@page import="org.fjw.weixin.util.StringFromat"%>
<%

String xm = request.getParameter("xm");
String tel = request.getParameter("tel");
boolean bz=MyUtils24.LrXx(xm,tel);

if(bz==true){

out.println("<script>alert('提交成功！');window.location.href='success.jsp'</script>");


}else{

out.println("<script>alert('提交失败，电话重复！');history.back();window.location.href=document.referrer;</script>");

}


%>