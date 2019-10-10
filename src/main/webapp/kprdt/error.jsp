<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<html>
<title>2018乐清全国科普日</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030"/>
<meta name="description" content="倡导绿色生活">
<meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
<meta name="viewport" content="initial-scale=1,user-scalable=no,maximum-scale=1" media="(device-height: 568px)">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="full-screen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<style>
body{
	padding:0px;
	margin:0px;
	background-color: #FFFFFF;
}
td{font-size:14px;font-family:微软雅黑}
.style20 {color: #FFFFFF; font-size: 20px; }
</style>
<body style="background:url(img/top.png) no-repeat top center;background-size:100%;">
<div  id="contentid" style="display:block">
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
<table width="80%"  border="0" align="center">
  <tr>
    <th align="center" scope="row"><table width="50%" height="0"  border="0" align="right" style="border:1px solid #71D3E9;border-radius:10px;background-color:#71D3E9;border-color:#71D3E9">
      <tr>
        <th bgcolor="#71D3E9" scope="row"><table width="100%"  border="0" cellspacing="5">
            <tr>
              <th align="center" scope="row"><span class="style20">重新回答</span></th>
            </tr>
        </table></th>
      </tr>
    </table></th>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div style="display:block;"></div>
<div style="postion:fixed;bottom:0;left:0">
<table width="100%"  border="0">
  <tr>
    <td bgcolor="#03398F"><img src="img/05.png" width="100%" /></td>
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