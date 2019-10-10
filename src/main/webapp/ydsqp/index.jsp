<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="org.liufeng.course.pojo.SNSUserInfo"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.liufeng.course.pojo.WeixinUserInfo"%>
<html>
<head>
	<title></title>
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
		
		System.out.println("user= "+user);
		
	
		if(null != user) {
		
		String openid = user.getOpenId();
		
		//入库
		//ZghTools.Rlk(user.getOpenId(),user.getNickname(),user.getSex(),user.getCountry(),user.getProvince(),user.getCity(),user.getHeadImgUrl());
		ZghTools.Rlk4(user.getOpenId());
		
		
		// 设置 
		//Cookie userCookie = new Cookie("userCookie",openid);
		// 在响应头部添加cookie
		//response.addCookie(userCookie);
		

		//session.setAttribute("cartid",openid);
		
	    response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/yqvod/bmwj/asp/ybjy/test7.asp?openid="+openid+"");
	 
	 
		
	
		}else
		
		//out.println("no");
		
		//ZghTools.Rlk3(filename);
		
		
		//response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/yqvod/bmwj/baohu/test7.asp?openid="+filename+"");        
	 
			out.print("用户不同意授权,未获取到用户信息！");
			
		
	%>
	
	

</body>
</html>