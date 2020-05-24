<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils28"%>
<%
String openid = request.getParameter("openid");
String xm = request.getParameter("xm");
String tel = request.getParameter("tel");
String sno = request.getParameter("sno");
String dw = request.getParameter("dw");
String xb = request.getParameter("xb");
String bh = MyUtils28.GetNextBH();


    //这里开始提交用户数据
  int bz =  MyUtils28.StartCJBM(openid,xm,tel,bh,xb,dw,sno);
    //1 已经提交，然后关闭页面) 2.提交数据成功,留在本页面 就是抽奖页面.
  
  //String sc="您是第"+MyUtils28.GetWs(openid)+"位参与者,"+AllValus.cg_cx2;

    String sc="您是第"+MyUtils28.GetWs(openid)+"位参与者,您已经通过考试！请前去领证！";

if(bz==1){

	out.print("<script type=\"text/javascript\">alert('"+sc+"');document.location.href='success.jsp?openid="+openid+"';</script>");

}else{

	out.print("<script type=\"text/javascript\">alert('"+sc+"');document.location.href='success.jsp?openid="+openid+"';</script>");

}
%>