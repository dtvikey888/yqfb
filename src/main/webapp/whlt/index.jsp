<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="org.liufeng.course.pojo.SNSUserInfo"%>
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
		// ��ȡ��OAuthServlet�д���Ĳ���
		SNSUserInfo user = (SNSUserInfo)request.getAttribute("snsUserInfo"); 
		if(null != user) {
		
		String openid = user.getOpenId();
		
		// ���� 
		//Cookie userCookie = new Cookie("userCookie",openid);
		// ����Ӧͷ�����cookie
		//response.addCookie(userCookie);
		

		//session.setAttribute("cartid",openid);
		
	    response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/yqvod/bmwj/baohu/test.asp?openid="+openid+"");        
	 
	 
		
	%>
	
	
	<!--  
	<table width="100%" cellspacing="0" cellpadding="0">
		<tr><td width="20%">����</td><td width="80%">ֵ</td></tr>
		<tr><td>OpenID</td><td><=user.getOpenId()%></td></tr>
		
	</table>
	-->
	<%
		}
		else 
			out.print("�û���ͬ����Ȩ,δ��ȡ���û���Ϣ��");
	%>
	
	

</body>
</html>