<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
ZghTools.ClearNull();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0058)file:///C:/Users/zpuser/Desktop/%E7%BD%91%E9%A1%B5/CYL.htm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>
<title>乐清丽园装饰家装微心愿活动</title>
<style>
body{
	padding:0px;
	margin:0px;
	background-color: #FFFFFF;
}
td{font-size:14px;font-family:微软雅黑}
.style13 {
	color: #FFCC00;
	font-size: 18px;
}
.style18 {font-size: 24px; font-weight: bold; color: #FFCC00; }
.style21 {
	color: #FFCC00;
	font-size: 36px;
	font-weight: bold;
}
.style10 {color: #FFFFFF}
.style7 {	font-size: 18px;
	font-weight: bold;
	color: #FFFFFF;
}
.style9 {	font-size: 36px;
	font-weight: bold;
	color: #FFFFFF;
}
</style>
</head>
<body style="background:url(img/top2.png) no-repeat top center;background-size:100%;">
<div id="contentid">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="100%"  border="0" cellspacing="0">
  <tr>
    <th width="20%" align="left" valign="middle" scope="row"><table width="60%"  border="0" cellspacing="0">
      <tr>
        <th scope="row"><div onClick="javascript:window.open('tj.jsp','_self')"><img src="img/19.png" width="100%" /></div></th>
      </tr>
    </table></th>
    <th scope="row"><p>&nbsp;</p>
      <p>&nbsp;</p>      <table width="100%"  border="0" align="center">
      <tr>
        <th scope="row"><span class="style21">助力排行</span></th>
      </tr>
    </table>
    
    <!--  
      <table width="100%"  border="0" align="center" style="border-bottom:1px solid #FFCC00; color: #993126; font-size: 18px;">
        <tr>
          <td width="11%" align="left"><span class="style18">0</span></td>
          <td width="22%" align="left"><table width="100%"  border="0">
              <tr>
                <td><img src="img/07.png" width="100%"/></td>
              </tr>
          </table></td>
          <td width="16%" align="left"><span class="style13">范建伟</span></td>
          <td width="40%" align="right"><span class="style13">20000</span></td>
          <td width="11%" align="right"><table width="90%"  border="0">
              <tr>
                <td><img src="img/06.png" width="100%"/></td>
              </tr>
          </table></td>
        </tr>
      </table>
      -->
      
      <%=ZghTools.GetPhbToHtml2(20) %>
    
      </th>
    <th width="20%" align="right" valign="middle" scope="row"><table width="60%"  border="0" cellspacing="0">
        <tr>
          <th scope="row"><div onClick="javascript:window.open('https://file762d99333146.iamh5.cn/v3/idea/NaNE3YYJ','_self')"><img src="img/14.png" width="100%" /></div></th>
        </tr>
    </table></th>
  </tr>
</table>
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