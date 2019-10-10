<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="org.liufeng.course.pojo.SNSUserInfo"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.fjw.weixin.util.PublicFun"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<html>
<head>
	<title><%=AllValus.title1 %></title>
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
		SNSUserInfo user = (SNSUserInfo)request.getAttribute("snsUserInfo"); 
		
		if(null != user) {
		
		String openid = user.getOpenId();
		String state = request.getParameter("state");
		String[] sz = PublicFun.split(state, "|");
	
		
		//入库
		ZghTools.Rlk8(user.getOpenId(),user.getNickname(),user.getHeadImgUrl());
		
		// 设置 
		//Cookie zlCookie = new Cookie("zlCookie",openid);
		// 在响应头部添加cookie
		//response.addCookie(zlCookie);
		
		session.setAttribute("zlsession",openid);
	
		

		//session.setAttribute("cartid",openid);
		
	    //response.setHeader("Refresh","1;url=jsk/cj_chk.jsp?zlopenid="+openid+"&bzlopenid="+bzlopenid+"");        
	 	out.println("<script>window.location.href='jg/Pic1.jsp?openid="+openid+"&bzlopenid="+sz[0]+"&id="+sz[1]+"'</script>");
  
	 
		
	%>
	
	
	<!--  
	<table width="100%" cellspacing="0" cellpadding="0">
		<tr><td width="20%">属性</td><td width="80%">值</td></tr>
		<tr><td>OpenID</td><td><=user.getOpenId()%></td></tr>
		<tr><td>昵称</td><td><=user.getNickname()%></td></tr>
		<tr><td>性别</td><td><=user.getSex()%></td></tr>
		<tr><td>国家</td><td><=user.getCountry()%></td></tr>
		<tr><td>省份</td><td><=user.getProvince()%></td></tr>
		<tr><td>城市</td><td><=user.getCity()%></td></tr>
		<tr><td>头像</td><td><=user.getHeadImgUrl()%></td></tr>
		<tr><td>特权</td><td><=user.getPrivilegeList()%></td></tr>
	</table>
	-->
	<%
		}
		else 
			out.print("用户不同意授权,未获取到用户信息！");
	%>
	
	

</body>
</html>


<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //是微信浏览器不做操作
	   
    }else{
	  // alert('not');
	  //非微信浏览器就因此显示列表等
	   var target=document.getElementById("contentid");
	   target.style.display="none";
	   alert('非微信中打开');

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

