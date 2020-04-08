<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.MyUtils2"%>
<%@page import="org.fjw.weixin.util.MyUtils22"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MathRandom4"%>
<%

String openid = request.getParameter("openid");
//String xm = MyUtils2.codetoString(request.getParameter("xm"));
String xm = request.getParameter("xm");
String tel = request.getParameter("tel");
String bh = MyUtils22.GetNextBH();

System.out.println("openid="+openid);




%>

 <%
    //这里开始更新用户数据
   int bz =  MyUtils22.StartCJBM(openid,xm,tel,bh);
    //1 已经抽过奖(更新成功，关闭页面) 2.提交数据失败,留在本页面.

  %>
  
