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


    //���￪ʼ�ύ�û�����
  int bz =  MyUtils28.StartCJBM(openid,xm,tel,bh,xb,dw,sno);
    //1 �Ѿ��ύ��Ȼ��ر�ҳ��) 2.�ύ���ݳɹ�,���ڱ�ҳ�� ���ǳ齱ҳ��.
  
  //String sc="���ǵ�"+MyUtils28.GetWs(openid)+"λ������,"+AllValus.cg_cx2;

    String sc="���ǵ�"+MyUtils28.GetWs(openid)+"λ������,���Ѿ�ͨ�����ԣ���ǰȥ��֤��";

if(bz==1){

	out.print("<script type=\"text/javascript\">alert('"+sc+"');document.location.href='success.jsp?openid="+openid+"';</script>");

}else{

	out.print("<script type=\"text/javascript\">alert('"+sc+"');document.location.href='success.jsp?openid="+openid+"';</script>");

}
%>