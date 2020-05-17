<%@page language="java" pageEncoding="gb2312"%>
<%@page import="org.liufeng.course.pojo.SNSUserInfo"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.liufeng.course.pojo.WeixinUserInfo"%>

	<%
		// 获取由OAuthServlet中传入的参数
		//SNSUserInfo user = (SNSUserInfo)request.getAttribute("snsUserInfo");
		WeixinUserInfo user = (WeixinUserInfo)request.getAttribute("snsUserInfo");

		if(null != user) {

		//out.println(user.getOpenId());
		//out.close();

		session.setAttribute("twbsession2",user.getOpenId());

		//入库
		ZghTools.Rlk9(user.getOpenId());

		//out.println("<script>window.location.href='tea/index.jsp?openid="+user.getOpenId()+"'</script>");
		//response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/yqvod/bmwj/asp/h5/gt30/test.asp?openid="+openid+"");
  		out.println("<script>window.location.href='bl7/index.jsp?openid="+user.getOpenId()+"'</script>");


		}
		else
			out.print("用户不同意授权,未获取到用户信息！");
	%>
