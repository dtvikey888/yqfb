<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.liufeng.course.util.ZghTools"%>

<%
//拉人点赞页
//关于回调

//如有朋友圈转发点开来的还是我自己点，那就不回调
//如果不是我自己点才回调
//回调后应该是调到另外一个助力页面

//String openid =request.getParameter("openid");

String bzlopenid =request.getParameter("bzlopenid");

//out.println("openid: "+openid);
  //out.println("bzlopenid: "+bzlopenid);

  String zlsession = (String)session.getAttribute("zlsession");
   
  //out.println("zlsession: "+zlsession);
  
  if(ZghTools.IsCz2(zlsession)==false){

  
   if(zlsession!=null){
   
      if(zlsession.equals(bzlopenid)){
      
   	      //out.println("你是自己点的，不回调");
   	      
      }else{
        
          //out.println("其他人点了以后，不回调");
          //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet4&response_type=code&scope=snsapi_userinfo&state="+bzlopenid+"#wechat_redirect");        
   
      }
   
   }else{
   
  		//还没点要回调
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet4&response_type=code&scope=snsapi_userinfo&state="+bzlopenid+"#wechat_redirect");        
   
   }
   
   
   //yqfb_openid 没有存在要回调
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet4&response_type=code&scope=snsapi_userinfo&state="+bzlopenid+"#wechat_redirect");        
   
   
   }
  
 %>

<html>
	<head>
	<title>光盘大作战，免费赢话费,帮<%=ZghTools.GetNick(bzlopenid)%>助力</title>
	<meta name='yixin-share-image' content='http://v.yqcn.com/bmwj/asp/sxbook/images/logo5.jpg'>
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
	
	<script src="js/jquery.js"></script>
	
	<style>
			 #mcover {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background: rgba(0, 0, 0, 0.7);
				display: none;
				z-index: 20000;
			 }
			 #mcover img {
				position: fixed;
				right: 18px;
				top: 5px;
				width: 260px!important;
				height: 180px!important;
				z-index: 20001;
			 }
			 .text {
				margin: 15px 0;
				font-size: 14px;
				word-wrap: break-word;
				color: #727272;
			 }
			 #mess_share {
				margin: 15px 0;
				display: block;
			 }
			 #share_1 {
				float: left;
				width: 49%;
				display: block;
			 }
			 #share_2 {
				float: right;
				width: 49%;
				display: block;
			 }
			 .clr {
				display: block;
				clear: both;
				height: 0;
				overflow: hidden;
			 }
			 .button2 {
				font-size: 16px;
				padding: 8px 0;
				border: 1px solid #adadab;
				color: #000000;
				background-color: #e8e8e8;
				background-image: linear-gradient(to top, #dbdbdb, #f4f4f4);
				box-shadow: 0 1px 1px rgba(0, 0, 0, 0.45), inset 0 1px 1px #efefef;
				text-shadow: 0.5px 0.5px 1px #EFEFF1;
				text-align: center;
				border-radius: 3px;
				width: 100%;
			 }
			 #mess_share img {
				width: 22px!important;
				height: 22px!important;
				vertical-align: top;
				border: 0;
			 }
        </style>
        
        <script type="text/javascript">
			function button1(){
			$("#mcover").css("display","block")    // 分享给好友按钮触动函数
			}
			function button2(){
			$("#mcover").css("display","block")  // 分享给好友圈按钮触动函数
			}
			function weChat(){
			$("#mcover").css("display","none");  // 点击弹出层，弹出层消失
			}
			
			/*$
			(function(){
			   setTimeout(function () {
					$("#mcover").show();}, 6000);   // 6000时毫秒是弹出层
			setTimeout(function () {
					$("#mcover").hide(); }, 8000);    //8000毫秒是隐藏层
			})
			*/
		</script>
		
<script>

function show(){

   alert('活动规则：\n1.网友拍摄餐后的“光盘”照片，上传至活动页面后，可立即参与幸运话费抽奖。\n2.“光盘”的定义为餐盘中没有明显的剩余食物即可。违反此规定者，主办方有权撤销所有中奖结果。\n3.本次活动旨在普及“节约用餐，适度消费”的文明餐桌概念。因此时间不限，早餐、中餐、晚餐、点心、夜宵皆可，每人每天最多1次机会。可邀请好友为自己助力，每人每天最多5次机会。');
  // document.getElementById("div_gz").style.display="";
   //alert(document.getElementById("div").style.display)
   
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
body {
	background-color: #efeff1;
}
-->
</style>

<style>

#menu2 { bottom:0; left:0; width:100%; position:fixed; padding:30px; text-align:center; background:#EFEFF1; z-index:2; }
</style>
</head>
   <body id="signupverify" style="">
   
   <div id="mcover" onClick="weChat()" style="display: none;">
          <img src="js/tip.png">
   </div>
   
   <div  id="contentid">
    <header>
            <div class="left-box">
                <!-- <a class="hd-lbtn" href="javascript:history.go(-1)"><span>返回</span></a> -->
                 <a class="hd-lbtn" href="wel.jsp?openid=<%=bzlopenid%>"><span>首页</span></a>
            </div>
            
            <div class="right-box">
                <!-- <a class="hd-lbtn" href="javascript:history.go(-1)"><span>返回</span></a> -->
                 <a class="hd-rbtn" onclick="show();"><span>活动规则</span></a>
            </div>
        <h1>光盘大作战</h1>
    </header>
    <!--  
<div style=" margin-left:5px; margin-right:5px; padding-bottom:6px; padding-top:8px; line-height:25px;"> 
<SPAN style="COLOR: #ff0000"><B>活动说明：</B></SPAN>
<P>1、<SPAN style="COLOR: #000"> 关注“中国乐清网”（yq3535）公众微信号。</SPAN></P>
<P>2、<SPAN style="COLOR: #000"> 先转发“母亲节,1000盆康乃馨免费送”活动微信至朋友圈并截图存放于手机相册</SPAN>
<P>3、<SPAN style="color:#000">在中国乐清网微信对话框中输入<font color=red>"花"</font>关键字。</SPAN></P>
<P>4、<SPAN style="color:#000">需填写姓名、手机号码、上传朋友圈截图，点击提交按钮进入浇花页面。</SPAN></P>
</div>
-->
<div id="tips"></div>

<div class="body p-10 address-edit" style="background:#efeff1">

 <%
	//操作 1. 从数据表 zgh_sjk 随机查询一个还未用过的bh,然后设置他的yz=1
	//2.把 openid+xm+tel+bh 写入表zgh_cj
	
	//String openid =request.getParameter("openid");
	
	//out.println("openid: "+openid);
	
	//String xm =request.getParameter("xm");
	//String tel =request.getParameter("tel");

	//if(zlsession==null){
	
	//	ZghTools.Rkcz(openid,xm,tel);
		
	//}


      //if(zlsession==null&&ZghTools.IsCj(bzlopenid)==false){
      	//ZghTools.Rkcz(bzlopenid,xm,tel);
      //}
	
	
	
	

	%>
	
	<%
	String tp = "";
	//if(openid!=null){
	
	 // bh = ZghTools.GetBh(openid);
	
	//}else{
	
	  tp = ZghTools.GetImagSC(bzlopenid);
	  
	  
	 // out.println(tp);
	  
	//}
	
	
	
	//String xm2 = "";
	//if(openid!=null){
	
	//  xm2 = ZghTools.GetXm(openid);
	
	//}else{
	
	 // xm2 = ZghTools.GetXm(bzlopenid);
	  
	//}
	
	
	 %>

<table width="100%" border="0" cellpadding="0" cellspacing="20" style="table-layout:fixed;white-space: normal;word-break:break-all; width: 100%;">
      <tr>
        <td bgcolor="#EFEFF1"><table width="100%" border="0" cellpadding="0" cellspacing="15" style="background-color:#EFEFF1">
          <tr>
            <td height="41" align="right" style="font-family:Arial; font-size:18px; ">
			<table width="100%" height="299" border="0" cellpadding="0" cellspacing="12" style="background-color:#EFEFF1; font-family:微软雅黑; font-size:35px;">
          <tr>
            <td height="48" colspan="3" align="center" style="color:#888888; border-bottom:2px  solid  #f5f5f7 " style="overflow: hidden;"><a style="font-family:Arial; font-size:20px;"><%=tp%></a><br/><span style="font-family:Arial; font-size:20px;"><%=ZghTools.GetMemoSC(bzlopenid) %></span></td>
          </tr>
          
          
          <tr>
            <td height="103" colspan="3" style="font-family:微软雅黑; font-size:35px; "><table width="100%" border="0" cellspacing="10">
              <tr>
                <td height="75">&nbsp;</td>
                <td width="21%"><img src="<%=ZghTools.GetImg(bzlopenid)%>" width="50px" height="50px" border="0"/></td>
                <td width="71%">
                
                <%if(ZghTools.Isdz(bzlopenid,zlsession)){ %>
                  您已为TA助力
                <%} %>
                </td>
              </tr>
              <tr>
                <td width="8%" height="21">&nbsp;</td>
                <td colspan="2"><%=ZghTools.GetNick(bzlopenid)%></td>
              </tr>
            </table></td>
          </tr>
          <tr>
      
        
       <%if(zlsession!=null) {%> 
          <%if(ZghTools.IsCz2(zlsession)){ %>  
          
           <td height="50" align="center"><div style="font-family:Arial; font-size:18px;"  onClick="javascript:window.open('dl.jsp?openid=<%=zlsession%>','_self')"><img src="img/join.png" width="103" height="32"/></div></td>
		  
		  <%}else{ %>
		  
		   <td height="50" align="center"><div style="font-family:Arial; font-size:18px;"  onClick="javascript:window.open('wel.jsp?openid=<%=zlsession%>','_self')"><img src="img/join.png" width="103" height="32"/></div></td>
		 
		  <%} %>
		<%}else{ %>
		
		<%} %>
		
		<%if(zlsession!=null){ %>
		
		
		<%if(zlsession.equals(bzlopenid)){ %>
		
			<td align="center" style=" color:#EFEFF1 "></td>
		
		<%}else if(ZghTools.IsHelp(bzlopenid,zlsession)){%>
		
			<td align="center" style=" color:#EFEFF1 "></td>
			
		<%}else{ %>
		
			<td align="center"><div style="font-family:Arial; font-size:18px;"  onClick="javascript:window.open('zl.jsp?bzlopenid=<%=bzlopenid%>&zlopenid=<%=zlsession %>','_self')"><img src="img/btdz.png" width="103" height="32"/></div></td>
		
		<%} %>
            
		<%} %>	
			
            <td height="50" align="center"><div style="font-family:Arial; font-size:18px;" onClick="button2();sharefriendRound2();"><img src="img/fxcq.png" width="103" height="32"/></div></td>
            </tr>
         <tr>
            <td height="10" colspan="3" align="center" valign="middle"  style="color:#EFEFF1;font-family:Arial; font-size:16px;"></td>
          </tr>
         
			<!--
          <tr>
            <td height="38" colspan="3" align="center" valign="middle" bgcolor="#888888"  style="color:#EFEFF1;font-family:Arial; font-size:16px;">每人只能投一票！</td>
          </tr>
         -->
          </table>
			
			
			<div style="margin-top:10px;"></div>			</td>
          </tr>
         
        </table>
      </tr>
	  
	  
  </table>

<nav class="codrops-demos"></nav>

</div>

<footer>
   <div align="center" style="margin-bottom:15px;">
		
  </div>
</footer>
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
	   alert('非微信中打开！');
	  
	 
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
