<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.fjw.weixin.util.MyUtils2"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.fjw.weixin.util.MyUtils3"%>
<%

String img1 = request.getParameter("img1");
String xm = MyUtils2.codetoString(request.getParameter("xm"));
String tel = request.getParameter("tel");
String td = MyUtils2.codetoString(request.getParameter("td"));
String memo = MyUtils2.codetoString(request.getParameter("memo"));
String bh = MyUtils3.GetNextBH();
String openid="pc"; //����PC��


//��ͼƬ�������绰д�����ݿ�
int bz=WeixinChaOpenId.ReImgesToDB2(img1,openid,xm,tel,td,memo,bh);

//��ת����ҳ

if(bz==2){
out.print("<script type=\"text/javascript\">alert('ͬһ������ֻ���ϴ�һ����Ƭ�������Ի��Ų�����');document.location.href='index.jsp';</script>");
//response.sendRedirect("index.jsp?openid="+openid);
}else if(bz==1){
out.print("<script type=\"text/javascript\">alert('������Ƭ�Ѿ��ϴ��ɹ������ı����"+bh+",��ȴ����ͨ����лл,�ٻ�С���һ��μӰɣ�');document.location.href='index.jsp';</script>");

//out.println("<script>alert('������Ƭ�Ѿ��ϴ��ɹ������ı����"+bh+"��');</script>");
//response.sendRedirect("index.jsp?openid="+openid);
}

%>