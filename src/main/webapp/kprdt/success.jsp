<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>2018����ȫ��������</title>
<style type="text/css">
#outer{vertical-align: middle;}
#outer.yourcssclass{ display:block; width:640px; height:88px; font-family:'΢���ź�';margin-left:160px;margin-top:260px; text-align:center;padding-top:40px; font-size:40px; color:#fff; background-color:#1E90FF; text-decoration:none; line-height:41px;}
#outer.yourcssclass span.a1{ font-weight:bolder; font-size:30px; padding:0 10px; vertical-align:middle; }
#outer.yourcssclass span.a2{ font-size:20px; vertical-align:middle;}
</style>
</head>
<body>
<div  id="contentid" style="display:block">
<div id="outer" class="yourcssclass"  onclick="WeixinJSBridge.call('closeWindow');" >
&nbsp;����ɣ�����˳���
</div>
</div>
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