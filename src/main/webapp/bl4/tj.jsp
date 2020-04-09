<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils25"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%
String openid = request.getParameter("openid");
String xm = request.getParameter("xm");
String tel = request.getParameter("tel");
String bh = MyUtils25.GetNextBH();


    //这里开始提交用户数据
  int bz =  MyUtils25.StartCJBM(openid,xm,tel,bh);
    //1 已经提交，然后关闭页面) 2.提交数据成功,留在本页面 就是抽奖页面.
  
  String sc="您是第"+MyUtils25.GetWs(openid)+"位参与者,"+MyUtils25.xsdz(openid);

if(bz==1){

	out.print("<script type=\"text/javascript\">alert('"+sc+"');document.location.href='success.jsp?openid="+openid+"';</script>");

}else{

	out.print("<script type=\"text/javascript\">alert('"+sc+"');document.location.href='success.jsp?openid="+openid+"';</script>");

}
%>