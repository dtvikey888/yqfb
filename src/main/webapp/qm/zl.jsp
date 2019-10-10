<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
//助力类操作1.根据 参数 openid 查找zgh_cj 中的 zlopenid 字段，如果找到
//说明已经助力过，跳过
// 2. 没找到就更新进去（加入结尾）
String bzlopenid = request.getParameter("bzlopenid");
String zlopenid = request.getParameter("zlopenid");
String px = request.getParameter("px");

ZghTools.HelpCz(bzlopenid,zlopenid);

out.println("<script>window.location.href='index5.jsp?bzlopenid="+bzlopenid+"&px="+px+"'</script>");

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

