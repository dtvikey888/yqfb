<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="org.liufeng.course.pojo.SNSUserInfo"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.liufeng.course.pojo.WeixinUserInfo"%>
<html>
<head>
	<title>������԰װ�μ�װ΢��Ը�</title>
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
		//SNSUserInfo user = (SNSUserInfo)request.getAttribute("snsUserInfo"); 
		WeixinUserInfo user = (WeixinUserInfo)request.getAttribute("snsUserInfo"); 
		
		if(null != user) {
		
		String openid = user.getOpenId();
		
		String bzlopenid = request.getParameter("bzlopenid");
		
		
		//���
		ZghTools.Rlk3(user.getOpenId());

		// ���� 
		//Cookie zlCookie = new Cookie("zlCookie",openid);
		// ����Ӧͷ�����cookie
		//response.addCookie(zlCookie);
		
		session.setAttribute("zlsession",openid);
	
      
	 	out.println("<script>window.location.href='lyzx/dz.jsp?openid="+openid+"&bzlopenid="+bzlopenid+"'</script>");
  

	%>
	
	
	<!--  
	<table width="100%" cellspacing="0" cellpadding="0">
		<tr><td width="20%">����</td><td width="80%">ֵ</td></tr>
		<tr><td>OpenID</td><td><=user.getOpenId()%></td></tr>
		<tr><td>�ǳ�</td><td><=user.getNickname()%></td></tr>
		<tr><td>�Ա�</td><td><=user.getSex()%></td></tr>
		<tr><td>����</td><td><=user.getCountry()%></td></tr>
		<tr><td>ʡ��</td><td><=user.getProvince()%></td></tr>
		<tr><td>����</td><td><=user.getCity()%></td></tr>
		<tr><td>ͷ��</td><td><=user.getHeadImgUrl()%></td></tr>
		<tr><td>��Ȩ</td><td><=user.getPrivilegeList()%></td></tr>
	</table>
	-->
	<%
		}
		else 
			out.print("�û���ͬ����Ȩ,δ��ȡ���û���Ϣ��");
	%>
	
	

</body>
</html>


<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //��΢���������������
	   
    }else{
	  // alert('not');
	  //��΢��������������ʾ�б��
	   var target=document.getElementById("contentid");
	   target.style.display="none";
	   alert('��΢���д�');

	}
}
function isWeiXin(){
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}
</script>

