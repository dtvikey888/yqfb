<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils25"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%
String openid = request.getParameter("openid");
String xm = request.getParameter("xm");
String tel = request.getParameter("tel");
String bh = MyUtils25.GetNextBH();


    //���￪ʼ�ύ�û�����
  int bz =  MyUtils25.StartCJBM(openid,xm,tel,bh);
    //1 �Ѿ��ύ��Ȼ��ر�ҳ��) 2.�ύ���ݳɹ�,���ڱ�ҳ�� ���ǳ齱ҳ��.
  
  String sc="���ǵ�"+MyUtils25.GetWs(openid)+"λ������,"+MyUtils25.xsdz(openid);

if(bz==1){

	out.print("<script type=\"text/javascript\">alert('"+sc+"');document.location.href='success.jsp?openid="+openid+"';</script>");

}else{

	out.print("<script type=\"text/javascript\">alert('"+sc+"');document.location.href='success.jsp?openid="+openid+"';</script>");

}
%>