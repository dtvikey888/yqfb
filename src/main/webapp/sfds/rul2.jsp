<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<html>
	<head>
	<title>第二届“中雁荡山杯”全国大书法作品大赛</title>
	<meta name='yixin-share-image' content=''>
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
	<link type="text/css" rel="stylesheet" href="css/other5.css">
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
			text-shadow: 0.5px 0.5px 1px #fff;
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

	

<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
body {
	background-color: #efeff1;
}
-->
</style>

<style>

#menu2 { bottom:0; left:0; width:100%; position:fixed; padding:30px; text-align:center; background:#fff; z-index:2; }
.STYLE1 {color: #FF0000}
</style>
</head>
   <body id="signupverify" style="">
   
   <div id="mcover" onClick="weChat()" style="display: none;">
          <img src="js/tip.png">
   </div>
   
   <div  id="contentid">
  
   <div><img src="images/logo7.jpg" style="width:100%"/></div>
  
   <!-- 
    <header>
            <div class="left-box">
                 <a class="hd-lbtn" href="javascript:history.go(-1)"><span>返回</span></a>
                <a class="hd-lbtn" href="http://www.yqrb.com.cn/yqfb/index.jsp?openid=oSX6kjlwIvpFGl2Ws8TN5Ggxd7Ak"><span>返回</span></a>
            </div>
        <h1><font color="#000000">乐清最美</font>笑脸<font color="#000000">大赛</font></h1>
    </header> -->
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

 

<table width="100%" border="0" cellpadding="0" cellspacing="20">
      <tr>
        <td bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="15" style="background-color:#FFF">
          <tr>
            <td height="41" align="right" style="font-family:Arial; font-size:18px; ">
			<table width="100%" border="0" cellpadding="1" style="background-color:#FFF; font-family:微软雅黑; font-size:35px;">
          <tr>
            <td width="5%" align="center" style="color:#888888; border-bottom:2px  solid  #f5f5f7 "><img src="IMG/img_lmt.png" width="40" height="40"></td>
            <td width="95%" align="center" style="color:#888888; border-bottom:2px  solid  #f5f5f7 "><h2 align="left" class="STYLE1">活动规则</h2></td>
          </tr>
          
         <!--  
          <tr>
            <td colspan="2" style="font-family:微软雅黑; font-size:35px; "><table width="100%" border="0" cellspacing="10">
              <tr>
                <td width="29%" height="21">目前排名：</td>
                <td width="71%">第 <a  style="font-family:Arial; color:#dd1c60;"><=MyUtils3.GetPM6(id,tp) %></a> 名</td>
              </tr>
              <tr>
                <td rowspan="2" valign="top">票数差距：</td>
                <td valign="top">共 <a  style="font-family:Arial; color:#dd1c60;"><=MyUtils3.GetPS6(id,tp) %></a> 票</td>
              </tr>
              <tr>
                <td height="21" valign="top" style="color:#888888" >距离第一名还差  <a  style="font-family:Arial; color:#dd1c60;"><=MyUtils3.GetJLFirstPS6(id,tp)%></a> 票，快去帮TA拉票吧！</td>
              </tr>
            </table></td>
          </tr>-->
        
         
			<!-- 
          <tr>
            <td colspan="2" align="center" valign="middle"><img src="images/zy3.png" width="100%"/></td>
          </tr>
           -->
          </table>
			
			
			<div style="margin-top:10px;"></div>
			</td>
          </tr>
        
          
          <tr>
            <td>
			<div style="padding-left:10px; padding-right:10px;">
			投票时间： 9月21日-9月23日
			</div>
			 </td>
          </tr>
		  
		   
          <tr>
            <td>
			
			<div style="padding-left:10px; padding-right:10px;">
			<p>投票规则：  </p>
              <p>&nbsp;</p>
              <p> 1.本次网络评选活动本着公开、公平、公正的原则进行。<br />
                2.每人每天可为每组投票一次，每组必须勾选10名参赛者。<br />
                3.系统具有投票日志分析系统和报警系统，如果发现刷票行为，将视作无效投票，取消投票成绩。<br />
              4.本次网络评选的最终结果将汇总至第二届&quot;中雁荡山杯&quot;全国大书法作品大赛组委会，作为本次网络评选的评选依据。</p>
			 </div>
			  
			  </td>
          </tr>
		  
		  <tr>
            <td><div align="center"><img src="IMG/desk.png" width="243" height="176"></div></td>
          </tr>
		  
         <!-- 
          <tr>
            <td align="left" valign="middle" style="font-family:微软雅黑; font-size:16px; line-height:26px; "><div style="text-indent:2em; padding-left:4px; padding-right:4px;"><=memo %></div></td>
          </tr> -->
        </table></td>
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
