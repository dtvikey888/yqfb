<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils23"%>
<%

//dl.jsp 用户数据填写
//String urlname ="jsk/dl.jsp";
String openid =request.getParameter("openid");
//String check=Topay.WxJsApiCheck4(urlname,openid);

MyUtils23.clym(openid);

%>

<%
	//控制时间
	int kz =0;
	String tt1=AllValus.gp1;
	String tt2=AllValus.gp2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //开始抽奖
    //2: //抽奖已经结束,感谢关注！
    //3: //抽奖还没开始呢！
    
    //out.println(kz);
    
  
%>
	 
<%

   String userCookie="";
   Cookie cookie = null;

   Cookie[] cookies = null;
   // 获取cookies的数据,是一个数组
   cookies = request.getCookies();
   
   if( cookies != null ){
   
      for (int i = 0; i < 1; i++){
      
         cookie = cookies[i];
         
         //out.println("参数名 : " + cookie.getName());
         //out.println("参数值 : " + cookie.getValue());
         
      }
      
      userCookie=cookie.getValue();
      
      if(userCookie.equals(openid)){
      
        //out.println("你是通过微信进来的正规用户");
        
      }else{
      
          //out.println("<br/><h1>请先关注“党员在您身边”公众号(yq6188)或“中国乐清网”公众号(yq3535)，输入“闯关”参与活动！</h1>");
          //out.println("<script>window.location.href='gz.jsp'</script>");
          out.println("<script>window.location.href='wel.jsp?openid=123'</script>");
          //out.close();

      }

  }else{
  
       //out.println("<h2>没有发现 Cookie</h2>");
       //out.println("<br/><h1>请先关注“党员在您身边”公众号(yq6188)或“中国乐清网”公众号(yq3535)，输入“闯关”参与活动！</h1>");
        //out.println("<script>window.location.href='gz.jsp'</script>");
        out.println("<script>window.location.href='wel.jsp?openid=123'</script>");
        //out.close();
      
  }

%> 
	 

<html>
	<head>
	
	 <title>光盘大作战，免费赢话费！</title>
	 
	<meta name="description" content="">
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1" media="(device-height: 568px)">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="full-screen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="http://ms0.meituan.net/touch/img/startup/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="http://ms0.meituan.net/touch/img/startup/apple-touch-icon-120x120-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="196x196" href="http://ms0.meituan.net/touch/img/startup/apple-touch-icon-196x196-precomposed.png">
    <link rel="apple-touch-startup-image" href="http://ms0.meituan.net/touch/img/startup/apple-touch-startup-image-640x1096.png" media="(device-height:568px)">
    <link rel="apple-touch-startup-image" href="http://ms0.meituan.net/touch/img/startup/apple-touch-startup-image-640x920.png" media="(device-height:480px)">
 
	 <link type="text/css" rel="stylesheet" href="../css/other5.css">

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

	 
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript" charset="gb2312"></script>
		<script type="text/javascript">
		   	  
		  <%
		     // 根据起止时间判断是否关闭窗口 ，弹出提醒窗
		  // kz=1 开始抽奖(不关) kz=2 抽奖结束(关闭) kz=3 抽奖没开始（关闭）
		  
		   if (kz==1){
		   
		   
		  %>
		  //alert("开始");
		  
		  <%}else if(kz==2){
		   
		  
		  %>
		  
            alert('非常抱歉，抽奖时间已过。感谢您的关注，请下次再来！');
            window.location.href="wel.jsp"; 
            
		  <%}else if(kz==3){
		  
		  
		  %>
		  
           alert('还没开始呢，"开始抽奖时间<%=tt1%>"到"<%=tt2%>"！\n欢迎到时候参与！');
          
		  <%}else{
		      
		  
		   %>
		  
		     alert('感谢关注！');
           
		  <%} %>

		</script>
		
	</head>
	
  <body>
  

    <div  id="contentid" style="display:block">
    
  

    <header>
          <div class="left-box">
                <!-- <a class="hd-lbtn" href="javascript:history.go(-1)"><span>返回</span></a> -->
               <a class="hd-lbtn" href="wel.jsp?openid=<%=openid%>"><span>首页</span></a>
            </div>
        <h1>填写用户信息</h1>
    </header>
    <div id="tips"></div>

<div class="body p-10 address-edit">

    <form id="form1" name="form1" method="post"  enctype="multipart/form-data"  action="sc_chk.jsp">

       <input type="hidden" name="openid" value="<%=openid%>">

		<table width="100%" border="0" cellpadding="3" cellspacing="1">
   
        
     <%if(MyUtils23.GetCs(openid)<5&&MyUtils23.GetYz(openid)==0){%>
		
		
  <table width="100%" height="100px;" border="0" cellpadding="5" cellspacing="0" style="border:3px dashed #dd1c60; font-family:Arial; font-size:12px; color:#dd1c60 ">
              <tr>
                <td align="center" valign="middle">
               
                <img id="imageList"  width="100px;" height="100px;" style="display:none"/>
               
                请用wifi上传清晰光盘照(虚化照无效)

	
      <input type="file" name="file"  value=''>
       </td>
              </tr>
  </table>
  

 <div style="margin-top:20px;"/>
 


	 <tbody id="tbTel">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><input id="tel" name="tel" type="text" class="input-common" placeholder="手机号码(仅限乐清移动)" pattern="\d{3}[\d\*]{4,}"   maxlength="20" /></td>
        </tr>
	 </tbody>
	 
	 
	 <div style="margin-top:20px;"/>
 

	 
	 <tbody id="tbMemo">
      <tr>
        <td height="20" bgcolor="#FFFFFF">
	 <select class="select-common" name="memo" style="width:100%">
				   <option value="">选择光盘宣言</option>

				   <option value="1">吃光盘中餐 不做“剩男剩女”！</option>  
                  
				   <option value="2">拒绝浪费，从我做起！</option>

				   <option value="3">拒绝“剩”宴，倡导“光盘”!</option>
				  
				   <option value="4">我们要将吃不了“兜着走”贯彻到底!</option>
				   
				   <option value="5">拒绝舌尖上的浪费，光盘一族你我同行！</option>
                </select>
	 </tr>
	 </tbody>
	  
	<%} %>
	
      <tr>
        <td height="20" bgcolor="#FFFFFF">
        
        <%if (MyUtils23.IsYw(openid)){ %>
        
        <div align="center" style="font-size:18px; font-family:'新宋体'"> 今天的5次机会用完了,明天继续走起!</div>
        
        <%}else if (MyUtils23.IsDtMdz(openid)){ %>
        <div align="center" style="font-size:18px; font-family:'新宋体'"> 未获得新助力,请邀请新朋友为您助力!</div>
        <%}else{ %>
        
             <div class="form-btn">
  <button type="submit"  gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" onClick="document.form1.action='sc_chk.jsp?bzlopenid=<%=openid%>';if(DataLength(form1.file.value)<1){alert('请点击选取文件按钮选取光盘照片');return false};if(DataLength(form1.tel.value)<2){alert('请填写正确的联系方式');form1.tel.focus();return false};if(DataLength(form1.memo.value)<1){alert('请选择光盘宣言');form1.memo.focus();return false};document.form1.submit();">提交</button>
          </div>
          
        <%} %>
          
        </td>
      </tr>
    </table>
		
    </form>
</div>

<footer>
   <div align="center" style="margin-bottom:15px;">
		
  </div>
</footer>


 
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



