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
      
   	      //out.println("�����Լ���ģ����ص�");
   	      if(ZghTools.IsCz2(openid)==true&&ZghTools.IsCz3(openid)==true){
   	      		response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/yqfb/lyzx/dz.jsp?bzlopenid="+openid+"");  
   	      }
   	      
   	      
      }else{
        
          //out.println("�����˵����Ժ󣬲��ص�");
           response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet14&response_type=code&scope=snsapi_base&state=888#wechat_redirect");        
  
      }
   
   }else{
   
  		//��û��Ҫ�ص�
         response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet14&response_type=code&scope=snsapi_base&state=888#wechat_redirect");        
  
   }
   
%>
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


