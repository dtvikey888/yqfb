<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.AllValus"%>

<%
	//控制时间
	int kz =0;
	String tt1=AllValus.ly1;
	String tt2=AllValus.ly2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //开始抽奖
    //2: //抽奖已经结束,感谢关注！
    //3: //抽奖还没开始呢！
    //out.println(kz);
%>

<%

ZghTools.ClearNull();

String openid =request.getParameter("openid");
//out.println("openid="+openid);


String welsession = (String)session.getAttribute("welsession");

//out.println("welsession="+welsession);

if(welsession!=null){
   
      if(welsession.equals(openid)){
      
   	      //out.println("你是自己点的，不回调");
   	      //if(ZghTools.IsCz2(openid)==true&&ZghTools.IsCz3(openid)==true){
   	      if(ZghTools.IsCz3(openid)==true){
   	      		response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/yqfb/lyzx/dz.jsp?bzlopenid="+openid+"");  
   	      		
   	      }
   	      
   	      
      }else{
        
          //out.println("其他人点了以后，不回调");
           response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet14&response_type=code&scope=snsapi_base&state=1#wechat_redirect");        
  
      }
   
   }else{
   
  		//还没点要回调
         response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet14&response_type=code&scope=snsapi_base&state=1#wechat_redirect");        
  
   }
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0058)file:///C:/Users/zpuser/Desktop/%E7%BD%91%E9%A1%B5/CYL.htm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>
<title>乐清丽园装饰家装微心愿活动</title>
<script src="js/jquery.js"></script>
<script type="text/javascript">
		   	  
		  <%
		     // 根据起止时间判断是否关闭窗口 ，弹出提醒窗
		  // kz=1 开始抽奖(不关) kz=2 抽奖结束(关闭) kz=3 抽奖没开始（关闭）
		  
		   if (kz==1){
		   
		   
		  %>
		  //alert("开始");
		  
		  <%}else if(kz==2){
		   
		  
		  %>
		  
            alert('非常抱歉，助力时间已过。感谢您的关注，请下次再来！');
            window.location.href="http://www.yqrb.com.cn/yqfb/lyzx/phb.jsp";
            
		  <%}else if(kz==3){
		  
		  
		  %>
		  
           alert('还没开始呢，"开始助力时间<%=tt1%>"到"<%=tt2%>"！\n欢迎到时候参与！');
           window.location.href="http://www.yqrb.com.cn/yqfb/lyzx/phb.jsp";
          
		  <%}else{
		      
		  
		   %>
		  
		     alert('感谢关注！');
           
		  <%} %>

		</script>
<style>
body{
	padding:0px;
	margin:0px;
	background-color: #FFFFFF;
}
td{font-size:14px;font-family:微软雅黑}
.style8 {
	font-size: 30px;
	color: #FFFFFF;
}
.style10 {color: #000000; font-size: 18px; }

input.fqObject{
    display: inline-block;
    vertical-align: middle;
    border:0px;
    background: transparent;
    font-size: 21px;
    color:#000;
    width:70%;
}
input.fqObject:focus{
    color: #000;
}

.leftValue{
    display: inline-block;
    vertical-align: middle;
    width:290px;
    height:90px;
    border-radius: 10px;
    background: rgba(255,255,255,.6);
    border:0px;
    float: left;
    margin-top:22px;
    font-size: 22px;
    padding:6px;
    color:#000;
}
.leftValue:focus{
    color: #000;
}

.upload-file{
      position: relative;
      width: 100px;
      padding: 0px 0px;
      border: 2px dotted rgb(119, 154, 80);
      border-radius: 5px;
      background-color: #ffffff;
      color: #333333;
      font-size: 14px;
      text-align: center;
      overflow: hidden;
    }

    .upload-file span{ //单行显示
      text-overflow: ellipsis;
      white-space: nowrap;
      overflow: hidden;
    }

    .upload-file:hover{ //简单的hover效果
      font-size: 15px;
      border-color: rgb(39, 226, 81);
    }

    .upload-file input[type='file']{
      height: 100%;
      width: 100%;
      position: absolute; //设置为绝对定位，不会影响到其他元素
      top: 0;
      right: 0;
      opacity: 0;   //透明度为0
      filter: alpha(opacity=0);
      cursor: pointer;
    }
	.upload-file .tip{
	font-size:70px;
	color:#00CC33
	}
</style>
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
</head>
<body>
<%if(ZghTools.IsCz3(openid)==false){%>
<div id="contentid"  style="display:block">
<%}else{%>
<div id="contentid"  style="display:none">
<%}%>
<table width="100%"  border="0" cellspacing="0">
  <tr>
    <td valign="top"><img src="img/01.png" width="100%" /></td>
  </tr>
</table>

<form id="form1" name="form1" method="post"  enctype="multipart/form-data"  action="sc_chk.jsp">
<input type="hidden" name="openid" value="<%=openid%>"/>
<table width="90%"  border="0" align="center" cellspacing="10" style="border-bottom:1px solid #139f42; color: #993126; font-size: 18px;">
  <tr>
    <td height="22"><span class="style10">姓名：<input type="text" id="xm" name="xm" class="fqObject"/></span></td>
  </tr>
</table>
<table width="90%"  border="0" align="center" cellspacing="10" style="border-bottom:1px solid #139f42; color: #993126; font-size: 18px;">
  <tr>
    <td height="22"><span class="style10">电话：<input type="text" id="tel" name="tel" class="fqObject"/></span></td>
  </tr>
</table>
<table width="90%"  border="0" align="center" cellspacing="10" style="border-bottom:1px solid #139f42; color: #993126; font-size: 18px;">
  <tr>
    <td height="22"><span class="style10">地址：<input type="text" id="dz" name="dz" class="fqObject"/></span></td>
  </tr>
</table>
<table width="90%" height="179"  border="0" align="center" cellspacing="10" style="border-bottom:1px solid #139f42; color: #993126; font-size: 18px;">
  <tr>
    <td height="22" align="left" valign="top">
    <span class="style10">心愿：
     <textarea id="memo" name="memo" class="leftValue"></textarea>
    </span></td>
  </tr>
  <tr>
    <td height="22" align="left" valign="top">请用文字描述你的装修心愿或装修风格</td>
  </tr>
</table>
<table width="90%" height="105"  border="0" align="center" cellspacing="10" style="border-bottom:1px solid #139f42; color: #993126; font-size: 18px;">
  <tr>
    <td width="21%" height="22"><span class="style10">照片：</span></td>
    <td width="55%">
    <!--  
    <img src="img/09.png" width="30%" />
    -->
    <div class="upload-file">
    <input type="file" name="file" class="input-file" multiple="false" value='' id="file"/>
    <span class="tip">+</span>    </div>    </td>
    <td width="12%">
    <div id='dd'></div>
    <script>
$(document).ready(function () {
$("#file").change(function () {
var fil = this.files;
for (var i = 0; i < fil.length; i++) {
reads(fil[i]);
}
});
});
function reads(fil){
var reader = new FileReader();
reader.readAsDataURL(fil);
reader.onload = function()
{
document.getElementById("dd").innerHTML = "<img src='"+reader.result+"' width=80px; height=80px;>";
};
}
</script>    </td>
    
    <td width="12%">&nbsp;</td>
  </tr>
  <tr>
    <td height="22" colspan="2">上传户型图即可</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="90%"  border="0" align="center">
  <tr>
    <td height="22" align="center" valign="middle" bgcolor="#139f42">
    <%if(ZghTools.IsCz2(openid)==true){%>
    
    <%
		     // 根据起止时间判断是否关闭窗口 ，弹出提醒窗
		  // kz=1 开始抽奖(不关) kz=2 抽奖结束(关闭) kz=3 抽奖没开始（关闭）
		  
		   if (kz==1){

		    %>
		  <div  onClick="document.form1.action='sc_chk.jsp?bzlopenid=<%=openid%>';if(DataLength(form1.file.value)<1){alert('请至少上传一张照片');return false};if(DataLength(form1.xm.value)<1){alert('请填写姓名');form1.xm.focus();return false};if(DataLength(form1.tel.value)!=11){alert('请填写正确的联系方式');form1.tel.focus();return false};if(DataLength(form1.dz.value)<1){alert('请填写地址');form1.dz.focus();return false};if(DataLength(form1.memo.value)<1){alert('请填写心愿');form1.memo.focus();return false};document.form1.submit();">
		    <span class="style8">提 交</span>
			
		  </div>
   
		   <%}else if(kz==2){
		   
		  
		  %>
		 
		  <%}else if(kz==3){
		  
		  
		  %>
		  
		  <%}else{
		      
		  
		   %>
		   
		    <%} %>
    
    
     <%}%>
    </td>
  
  </tr>
</table>
</form>

<table width="90%"  border="0" align="center" cellspacing="10">
  <tr>
    <td align="right"><table width="30%"  border="0">
      <tr>
        <td><div onClick="javascript:window.open('https://file762d99333146.iamh5.cn/v3/idea/NaNE3YYJ','_self')"><img src="img/11.png" width="100%" /></div></td>
      </tr>
    </table>      </td>
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


