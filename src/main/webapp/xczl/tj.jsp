<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils24"%>
<%

String openid =request.getParameter("openid");
//out.println(openid);

String tjop_session = (String)session.getAttribute("tjop_session");
//out.println(tjop_session);
//out.println(MyUtils24.iscz(tjop_session));

if(tjop_session!=null){

    if(MyUtils24.iscz(tjop_session)){

        out.println("<script>window.location.href='index.jsp'</script>");
        
    }
    
}

if(tjop_session!=null){
   
      if(tjop_session.equals(openid)){
      
   	      //out.println("你是自己点的，不回调");
   	      
      }else{
        
          //out.println("其他人点了以后，不回调");
          response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/wmyqwx/yqw/checkwx3.jsp");
      }
   
   }else{
   
  		//还没点要回调
        response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/wmyqwx/yqw/checkwx3.jsp");
   }

 %>
 
<html>
<title>倡导绿色生活，反对铺张浪费</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta name="description" content="倡导绿色生活">
<meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
<meta name="viewport" content="initial-scale=1,user-scalable=no,maximum-scale=1" media="(device-height: 568px)">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="full-screen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<script>
function DataLength(fData) 
{ 
    var intLength=0 
    for (var i=0;i<fData.length;i++) 
    { 
        if ((fData.charCodeAt(i) < 0) || (fData.charCodeAt(i) > 255)) 
            intLength=intLength+2 
        else 
            intLength=intLength+1    
    } 
    return intLength 
} 
</script>
<style>
body{
	padding:0px;
	margin:0px;
	background-color: #FFFFFF;
}
td{font-size:14px;font-family:微软雅黑}
.style20 {color: #FFFFFF; font-size: 20px; }
.style23 {color: #615F5F; font-size: 16px; height:50px; }

.main{
    text-align: center; /*让div内部文字居中*/
    border-radius: 20px;
    width: 300px;
    height: 350px;
    margin: auto;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}
</style>
<body style="background:url(images/login.png) no-repeat top center;background-size:100%;">
<%if(openid!=null){%>
  <div id="contentid"  style="display:block">
<%}else{%>
<div class="main">
<img src="images/loading.gif"/>
</div>
<div id="contentid"  style="display:none">
<%}%>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form id="form1" name="form1" method="post" action="cj_chk.jsp">

<input name="openid" type="hidden" value=<%=openid%>>
<table width="90%"  border="0" align="center" cellspacing="8">
  <tr>
    <th scope="row"><input name="xm" type="text" class="style23" style="border-radius:10px;width:100%"  placeholder="请输入姓名" value="" onfocus="if(this.value==this.defaultValue){this.value=''}" onblur="if(this.value==''){this.value=this.defaultValue}"/></th>
  </tr>
  <tr>
    <th scope="row"><input name="tel" type="text" class="style23" style="border-radius:10px;width:100%" placeholder="请输入电话" value="" onfocus="if(this.value==this.defaultValue){this.value=''}" onblur="if(this.value==''){this.value=this.defaultValue}"/></th>
  </tr>
</table>
<table width="80%"  border="0" align="center">
  <tr>
    <th align="center" scope="row"><table width="50%" height="0"  border="0" align="center" style="border:1px solid #71D3E9;border-radius:10px;background-color:#71D3E9;border-color:#71D3E9">
        <tr>
          <th bgcolor="#71D3E9" scope="row"><table width="100%"  border="0" cellspacing="5">
              <tr>
                <th align="center" scope="row"><div  onClick="document.form1.action='cj_chk.jsp';if(DataLength(form1.xm.value)<2){alert('姓名最少2个字');form1.xm.focus();return false};if(DataLength(form1.tel.value)!=11){alert('请填写正确的手机号码');form1.tel.focus();return false};document.form1.submit();"><span class="style20">提交</span></div></th>
              </tr>
          </table></th>
        </tr>
    </table></th>
  </tr>
</table>
</form>

</div>
</div>
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