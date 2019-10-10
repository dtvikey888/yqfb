<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.MyUtils2"%>
<%@page import="org.fjw.weixin.util.MyUtils3"%>
<%@page import="org.fjw.weixin.util.MyUtils6"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.liufeng.course.util.AdvancedUtil"%>
<%@page import="org.fjw.weixin.util.MathRandom2"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MathRandom3"%>
<%

String openid = request.getParameter("openid");

System.out.println("openid="+openid);
//String xm = MyUtils2.codetoString(request.getParameter("xm"));
String xm = request.getParameter("xm");
String tel = request.getParameter("tel");
int fhz=0;
%>

<%


      //这里开始提交用户数据
       fhz = MyUtils7.StartCJBM2(openid,xm,tel);
  
  		if(fhz==1){
  		
  			out.println("<script>alert('您已经参加过');window.location.href='index.jsp?openid=="+openid+"'</script>");
  			
  		}else if(fhz==2){
  		
  			out.println("<script>alert('很抱歉，名额已经报完，报名失败！');window.location.href='index.jsp?openid=="+openid+"'</script>");
  			
  		}else if(fhz==3){
  		
  			out.println("<script>alert('报名成功！');window.location.href='index.jsp?openid=="+openid+"'</script>");
  			
  		}
   
  
%>

