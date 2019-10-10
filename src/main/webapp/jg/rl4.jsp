<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="org.liufeng.course.pojo.SNSUserInfo"%>
<%@ page import="org.liufeng.course.util.ZghTools"%>


	<% 
		// 获取由OAuthServlet中传入的参数
		//SNSUserInfo user = (SNSUserInfo)request.getAttribute("snsUserInfo"); 
		//WeixinUserInfo user = (WeixinUserInfo)request.getAttribute("snsUserInfo"); 
	    SNSUserInfo user = (SNSUserInfo)request.getAttribute("snsUserInfo"); 
		
		if(null != user) {
		
		//入库
		ZghTools.Rlk8(user.getOpenId(),user.getNickname(),user.getHeadImgUrl());
		
		session.setAttribute("twbsession1",user.getOpenId());
		
		out.println("<script>window.location.href='jg/index.jsp?openid="+user.getOpenId()+"'</script>");

		}
		else 
			out.print("用户不同意授权,未获取到用户信息！");
	%>
	
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
	