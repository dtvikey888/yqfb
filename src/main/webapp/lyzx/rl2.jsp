<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="org.liufeng.course.pojo.SNSUserInfo"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.liufeng.course.pojo.WeixinUserInfo"%>
<html>
<head>
	<title>乐清丽园装饰家装微心愿活动</title>
	<meta name="viewport" content="width=device-width,user-scalable=0">
	<style type="text/css">
		*{margin:0; padding:0}
		table{border:1px dashed #B9B9DD;font-size:12pt}
		td{border:1px dashed #B9B9DD;word-break:break-all; word-wrap:break-word;}
	</style>
</head>
<body>
	<% 
		// 获取由OAuthServlet中传入的参数
		//SNSUserInfo user = (SNSUserInfo)request.getAttribute("snsUserInfo"); 
		WeixinUserInfo user = (WeixinUserInfo)request.getAttribute("snsUserInfo"); 
		
		if(null != user) {
		
		//入库
		ZghTools.Rlk3(user.getOpenId());
		
		session.setAttribute("welsession",user.getOpenId());
		
		out.println("<script>window.location.href='lyzx/gd.jsp?openid="+user.getOpenId()+"'</script>");
  
  
		}
		else 
			out.print("用户不同意授权,未获取到用户信息！");
	%>
</body>
</html>