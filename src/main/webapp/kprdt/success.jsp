<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>2018乐清全国科普日</title>
<style type="text/css">
#outer{vertical-align: middle;}
#outer.yourcssclass{ display:block; width:640px; height:88px; font-family:'微软雅黑';margin-left:160px;margin-top:260px; text-align:center;padding-top:40px; font-size:40px; color:#fff; background-color:#1E90FF; text-decoration:none; line-height:41px;}
#outer.yourcssclass span.a1{ font-weight:bolder; font-size:30px; padding:0 10px; vertical-align:middle; }
#outer.yourcssclass span.a2{ font-size:20px; vertical-align:middle;}
</style>
</head>
<body>
<div  id="contentid" style="display:block">
<div id="outer" class="yourcssclass"  onclick="WeixinJSBridge.call('closeWindow');" >
&nbsp;已完成，点此退出！
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