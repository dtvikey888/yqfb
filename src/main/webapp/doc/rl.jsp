<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="org.liufeng.course.pojo.SNSUserInfo"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.liufeng.course.pojo.WeixinUserInfo"%>

	<% 
		// 获取由OAuthServlet中传入的参数
		//SNSUserInfo user = (SNSUserInfo)request.getAttribute("snsUserInfo"); 
		WeixinUserInfo user = (WeixinUserInfo)request.getAttribute("snsUserInfo"); 
		
		if(null != user) {
		
		//入库
		ZghTools.Rlk5(user.getOpenId());
		
		session.setAttribute("twbsession",user.getOpenId());
		
		out.println("<script>window.location.href='doc/index.jsp?openid="+user.getOpenId()+"'</script>");
  
  
		}
		else 
			out.print("用户不同意授权,未获取到用户信息！");
	%>
