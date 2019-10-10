<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="org.liufeng.course.pojo.SNSUserInfo"%>
<%@ page import="org.liufeng.course.util.ZghTools"%>
<%@ page import="org.liufeng.course.pojo.WeixinUserInfo"%>

	<% 
		// 获取由OAuthServlet中传入的参数
		SNSUserInfo user = (SNSUserInfo)request.getAttribute("snsUserInfo"); 
		//WeixinUserInfo user = (WeixinUserInfo)request.getAttribute("snsUserInfo"); 
		
		if(null != user) {
		
		//入库
		ZghTools.Rlk8(user.getOpenId(),user.getNickname(),user.getHeadImgUrl());
		
		session.setAttribute("twbsession1",user.getOpenId());
		
		out.println("<script>window.location.href='jg/List.jsp?openid="+user.getOpenId()+"'</script>");

		}
		else 
			out.print("用户不同意授权,未获取到用户信息！");
	%>
