<%@ page language="java" contentType="text/html; charset=gb2312" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
String bzlopenid = request.getParameter("bzlopenid");
String merobkect = request.getParameter("merObkect");
String memo = request.getParameter("memo");
int px = ZghTools.GetNoMerObkect(bzlopenid);

//out.println("bzopenid£º"+bzlopenid);
//out.println("¼Àµì¶ÔÏó£º"+merobkect);
//out.println("¼ÄÓï£º"+memo);
//out.println("NO: "+ZghTools.GetNoMerObkect(bzlopenid));


WeixinChaOpenId.ReImgesToDB5(bzlopenid,merobkect,memo);

out.println("<script>window.location.href='index5.jsp?bzlopenid="+bzlopenid+"&px="+px+"'</script>");

%>