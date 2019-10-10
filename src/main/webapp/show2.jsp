<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.sql_data"%>
<%@page import="java.sql.ResultSet"%>
<%
String urlname ="show.jsp";
String openid =request.getParameter("openid");
String check=Topay.WxJsApiCheck4(urlname,openid);
%>
<%
  String id =request.getParameter("id"); 
  sql_data sqlbean=new sql_data();
  String sql = "Select * FROM yqfbwx_face where yz=1 and id="+id;
  ResultSet RS = sqlbean.executeQuery(sql);
  String images2="";
  String bh ="";
  String xm ="";
  String zan="";
  String memo=""; 
 
  while(RS.next()){

    bh = RS.getString("bh");
	xm = RS.getString("xm");
	zan = RS.getString("zan");
	memo = RS.getString("memo");
	
	String images ="";
	images = RS.getString("img1");
	
	if(images.length()>0 && !images.equals("no.gif") ){
		images2 = "http://v.yqcn.com/bmwj/asp/sxbook/download3/"+images;
	}else{
		images2 = "http://info.yqcn.com:7001/ADV/uploadfiles/video/no.gif";
	}


}
   %>

<html>
	<head>
	<title>刷脸可以领奖品，竟有这等好事儿！</title>
	
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
        </style><script type="text/javascript">
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

	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    <%=check%>,// 必填，签名，见附录1
		    jsApiList: ['onMenuShareTimeline','chooseImage','previewImage','uploadImage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		wx.ready(function(){
		   //alert("config ok...");
		    //隐藏右上角菜单接口
		   	  wx.hideOptionMenu();
		   
			    wx.checkJsApi({
           jsApiList: [
             'onMenuShareTimeline',
             'getNetworkType',
             'previewImage',
             'onMenuShareTimeline',
             'chooseImage'
           ],
           success: function (res) {
            // alert(JSON.stringify(res));
           }
          });
		});
		wx.error(function(res){
			//alert(res);
		    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		});
		

		function callpay(){
			wx.chooseImage({
			    jsApiList: ['onMenuShareTimeline','chooseImage','previewImage','uploadImage'], // 检查微信接口是否可用
			     success: function (res) {
        				var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
   					 }
			    });
			    
		}
		
		function preimg(){
			 wx.previewImage({
			    jsApiList: ['previewImage'], // 检查微信接口是否可用
			     current: '<%=images2%>',
      			urls: [
        		'<%=images2%>'
      			]
			    });
   
		}
		
		
		// 2.2 监听分享到朋友圈按钮点击、自定义分享内容及分享结果接口
  function  sharefriendRound2() {
     //显示右上角菜单接口
       wx.showOptionMenu();
	   
    wx.onMenuShareTimeline({
      title: '请给参加\"乐清最美笑脸大赛\"的<%=xm%> <%=bh%>投票，有机会抽中100元奖品哦',
      link: 'http://www.yqrb.com.cn/yqfb/show.jsp?id=<%=id%>&openid=<%=openid%>',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo5.jpg',
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
       // alert('用户点击分享到朋友圈');
      },
      success: function (res) {
        alert('已分享');
      },
      cancel: function (res) {
        alert('已取消');
      },
      fail: function (res) {
       // alert(JSON.stringify(res));
      }
    });
	
    //alert('已注册获取“分享到朋友圈”状态事件');
	//alert('现在去分享给朋友吧，叫他们也来参加预约报名!');
  };
		
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
                <a class="hd-lbtn" href="http://www.yqrb.com.cn/yqfb/index.jsp?openid=oSX6kjlwIvpFGl2Ws8TN5Ggxd7Ak"><span>返回</span></a>
            </div>
        <h1><font color="#000000">乐清最美</font>笑脸<font color="#000000">大赛</font></h1>
    </header>
    <!--  
<div style=" margin-left:5px; margin-right:5px; padding-bottom:6px; padding-top:8px; line-height:25px;"> 
<SPAN style="COLOR: #ff0000"><B>活动说明：</B></SPAN>
<P>1、<SPAN style="COLOR: #000">关注“中国乐清网”（yq3535）公众微信号。</SPAN></P>
<P>2、<SPAN style="COLOR: #000">先转发“母亲节,1000盆康乃馨免费送”活动微信至朋友圈并截图存放于手机相册。</SPAN>
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
			<table width="100%" height="299" border="0" cellpadding="0" cellspacing="12" style="background-color:#FFF; font-family:微软雅黑; font-size:35px;">
          <tr>
            <td height="48" colspan="3" align="center" style="color:#888888; border-bottom:2px  solid  #f5f5f7 "><a style="font-family:Arial; font-size:20px;">NO.<%=bh%></a>&nbsp;<span style="font-family:Arial; font-size:20px;"><%=xm%></span></td>
          </tr>
          <tr>
            <td height="103" colspan="3" style="font-family:微软雅黑; font-size:35px; "><table width="100%" border="0" cellspacing="10">
              <tr>
                <td width="29%" height="21">目前排名：</td>
                <td width="71%">第 <a  style="font-family:Arial; color:#dd1c60;">18</a> 名</td>
              </tr>
              <tr>
                <td rowspan="2" valign="top">笑脸得票：</td>
                <td valign="top">共 <a  style="font-family:Arial; color:#dd1c60;">370</a> 票</td>
              </tr>
              <tr>
                <td height="21" valign="top" style="color:#888888" >距离第一名还差  <a  style="font-family:Arial; color:#dd1c60;">25</a> 票，快去帮他拉票吧！</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="50" align="center" bgcolor="#dd1c60" style="color:#FFF "><div style="font-family:Arial; font-size:18px;" onClick="javascript:window.open('#','_self')"> 投TA一票</div></td>
            <td align="center" style=" color:#FFF ">&nbsp;</td>
            <td height="50" align="center" bgcolor="#ffa200" style=" color:#FFF "><div style="font-family:Arial; font-size:18px;" onClick="button2();sharefriendRound2();"> 替TA拉票</div></td>
            </tr>
         <tr>
            <td height="10" colspan="3" align="center" valign="middle"  style="color:#FFF;font-family:Arial; font-size:16px;"></td>
          </tr>
         
			
          <tr>
            <td height="38" colspan="3" align="center" valign="middle" bgcolor="#888888"  style="color:#FFF;font-family:Arial; font-size:16px;">每人只能投一票，投票可参与抽奖哦！</td>
          </tr>
         
          </table>
			
			
			<div style="margin-top:10px;"></div>
			</td>
          </tr>
          <tr>
            <td align="center" valign="middle" bgcolor="#FFCCCC"><div onClick="preimg()"><img src="<%=images2%>" width="100%"/></div></td>
          </tr>
          <tr>
            <td height="48" align="center" valign="middle"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="428" height="34" style="font-family:微软雅黑; font-size:15px; color:#a6a6a6 "><!--票数&nbsp;&nbsp;<=zan %>--></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td align="left" valign="middle" style="font-family:微软雅黑; font-size:16px; line-height:26px; "><div style="text-indent:2em;"><%=memo %></div></td>
          </tr>
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
<!--
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
-->