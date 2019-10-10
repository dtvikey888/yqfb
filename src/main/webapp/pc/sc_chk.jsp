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
String openid="pc"; //代表PC端


//把图片和姓名电话写入数据库
int bz=WeixinChaOpenId.ReImgesToDB2(img1,openid,xm,tel,td,memo,bh);

//跳转到首页

if(bz==2){
out.print("<script type=\"text/javascript\">alert('同一个号码只能上传一次照片，您可以换号参赛。');document.location.href='index.jsp';</script>");
//response.sendRedirect("index.jsp?openid="+openid);
}else if(bz==1){
out.print("<script type=\"text/javascript\">alert('您的照片已经上传成功，您的编号是"+bh+",请等待审核通过，谢谢,召唤小伙伴一起参加吧！');document.location.href='index.jsp';</script>");

//out.println("<script>alert('您的照片已经上传成功，您的编号是"+bh+"！');</script>");
//response.sendRedirect("index.jsp?openid="+openid);
}

%>