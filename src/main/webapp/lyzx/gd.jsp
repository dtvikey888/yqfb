<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%

ZghTools.ClearNull();

String openid =request.getParameter("openid");
//out.println("openid="+openid);


String welsession = (String)session.getAttribute("welsession");

//out.println("welsession="+welsession);

if(welsession!=null){
   
      if(welsession.equals(openid)){
      
   	      //out.println("你是自己点的，不回调");
   	      if(ZghTools.IsCz2(openid)==true&&ZghTools.IsCz3(openid)==true){
   	      		response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/yqfb/lyzx/dz.jsp?bzlopenid="+openid+"");  
   	      }
   	      
   	      
      }else{
        
          //out.println("其他人点了以后，不回调");
           response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet14&response_type=code&scope=snsapi_base&state=888#wechat_redirect");        
  
      }
   
   }else{
   
  		//还没点要回调
         response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet14&response_type=code&scope=snsapi_base&state=888#wechat_redirect");        
  
   }
   
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


