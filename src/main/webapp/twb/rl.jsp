<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="org.liufeng.course.pojo.SNSUserInfo"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.liufeng.course.pojo.WeixinUserInfo"%>

	<% 
		// ��ȡ��OAuthServlet�д���Ĳ���
		//SNSUserInfo user = (SNSUserInfo)request.getAttribute("snsUserInfo"); 
		WeixinUserInfo user = (WeixinUserInfo)request.getAttribute("snsUserInfo"); 
		
		if(null != user) {
		
		//���
		ZghTools.Rlk4(user.getOpenId());
		
		session.setAttribute("twbsession1",user.getOpenId());
		
		out.println("<script>window.location.href='twb/tp.jsp?openid="+user.getOpenId()+"'</script>");
  
  
		}
		else 
			out.print("�û���ͬ����Ȩ,δ��ȡ���û���Ϣ��");
	%>