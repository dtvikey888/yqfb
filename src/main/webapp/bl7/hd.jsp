<%@page language="java" pageEncoding="gb2312"%>
<%@page import="org.liufeng.course.pojo.SNSUserInfo"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.liufeng.course.pojo.WeixinUserInfo"%>

	<%
		// ��ȡ��OAuthServlet�д���Ĳ���
		//SNSUserInfo user = (SNSUserInfo)request.getAttribute("snsUserInfo");
		WeixinUserInfo user = (WeixinUserInfo)request.getAttribute("snsUserInfo");

		if(null != user) {

		//out.println(user.getOpenId());
		//out.close();

		session.setAttribute("twbsession2",user.getOpenId());

		//���
		ZghTools.Rlk9(user.getOpenId());

		//out.println("<script>window.location.href='tea/index.jsp?openid="+user.getOpenId()+"'</script>");
		//response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/yqvod/bmwj/asp/h5/gt30/test.asp?openid="+openid+"");
  		out.println("<script>window.location.href='bl7/index.jsp?openid="+user.getOpenId()+"'</script>");


		}
		else
			out.print("�û���ͬ����Ȩ,δ��ȡ���û���Ϣ��");
	%>
