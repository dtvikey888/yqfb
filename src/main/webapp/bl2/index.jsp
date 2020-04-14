<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils22"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
	//控制时间
	int kz =0;
	String tt1=AllValus.daf_t1;
	String tt2=AllValus.daf_t2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //开始抽奖
    //2: //抽奖已经结束,感谢关注！
    //3: //抽奖还没开始呢！
    //out.println(kz);
%>

<%

String urlname ="bl2/index.jsp";
String openid =request.getParameter("openid");
//out.println("openid="+openid);


String from=request.getParameter("from");

String ympath=AllValus.ympath;
String appid=AllValus.appid;

String twbsession2 = (String)session.getAttribute("twbsession2");

//out.println("dafsession="+dafsession);

if(twbsession2!=null){
   
      if(twbsession2.equals(openid)){
      

   	      if(from!=null){
              response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

          }

          //out.println("你是自己点的，不回调");
   	     
      }else{
        
            //out.println("其他人点了以后，不回调");      
   			
   			//response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect");        

 			response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_base&state=1#wechat_redirect");



      }
   
   }else{
   
  		    //还没点要回调
            //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect");        
  			response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

   }
   
   //ZghTools.upyt6(openid);
   
   ZghTools.ClearNull();
   
   String check="";
   
    if(from!=null){
      check=Topay.WxJsApiCheck48(urlname,openid,from);
      //out.println("from");
    }else{
      check=Topay.WxJsApiCheck4(urlname,openid);
     // out.println("nofrom");
    }
   
    // out.println(check);

    //这个随时准备启动
    //session.removeAttribute("twbsession2");
    //session.invalidate();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
    <script>
        /*
         * 注意：
         * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
         * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
         * 3. 常见问题及完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
         *
         * 开发中遇到问题详见文档“附录5-常见错误及解决办法”解决，如仍未能解决可通过以下渠道反馈：
         * 邮箱地址：weixin-open@qq.com
         * 邮件主题：【微信JS-SDK反馈】具体问题
         * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
         */
        wx_share_title="<%=AllValus.daf_title%>";
        wx_share_desc="<%=AllValus.daf_desc%>";
        wx_share_link="<%=AllValus.daf_link%>";
        wx_share_imgUrl="<%=AllValus.daf_img%>";

        wx.config({
                debug: false,
            <%=check%>,// 必填，签名，见附录1
            jsApiList: [
            'updateTimelineShareData',
            'updateAppMessageShareData'
        ]
        });

        wx.ready(function () {   //需在用户可能点击分享按钮前就先调用
            wx.updateTimelineShareData({
                title: wx_share_title,
                link: wx_share_link,
                imgUrl: wx_share_imgUrl,
                trigger: function (res) {
                    // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
                    //alert('用户点击分享到朋友圈');
                },
                success: function (res) {
                    //  alert('已分享');
                },
                cancel: function (res) {
                    // alert('已取消');
                },
                fail: function (res) {
                    //alert(JSON.stringify(res));
                }
            });


            wx.updateAppMessageShareData({
                title: wx_share_title,
                desc: wx_share_desc,
                link: wx_share_link,
                imgUrl: wx_share_imgUrl,
                trigger: function (res) {
                    // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
                    // alert('用户点击发送给朋友');
                },
                success: function (res) {
                    // alert('已分享');
                },
                cancel: function (res) {
                    //alert('已取消');
                },
                fail: function (res) {
                    //alert(JSON.stringify(res));
                }
            });

        });

    </script>


<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title><%=AllValus.daf_title %></title>
<meta name="description" content=""/>
<meta name="viewport" content="initial-scale=0.3, width=device-width, maximum-scale=0.3, user-scalable=no"/>
<meta name="viewport" content="initial-scale=0.3,user-scalable=no,maximum-scale=0.3" media="(device-height: 568px)"/>
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
 
<style>
body{font-size:45px;color:#3f3e3d;line-height:35px;font-family:微软雅黑;background-color:#e7f0f7;padding:0px;margin:0px;}
a{color:#3f3e3d; text-decoration:none;}
a:hover{ color:#C1262C; text-decoration:none;}
p{text-indent:2em;line-height:40px;}
h1{font-size:40px; color:#6b6b6b;}
h2{font-size:20px; color:#315E01;}
m{color:#a6a6a6;}
c{font-size:30px; font-family:Arial; color:#ffb400;}
d{color:#fff;}
</style>

	<script type="text/javascript">
		   	  
		  <%
		     // 根据起止时间判断是否关闭窗口 ，弹出提醒窗
		  // kz=1 开始抽奖(不关) kz=2 抽奖结束(关闭) kz=3 抽奖没开始（关闭）
		  
		   if (kz==1){
		   
		   
		  %>
		  //alert("开始");
		  
		  <%}else if(kz==2){
		   
		  
		  %>
		  
            alert('非常抱歉，答题时间已过。感谢您的关注，请下次再来！');
            window.location.href="<%=AllValus.errpage%>";
            
		  <%}else if(kz==3){
		  
		  
		  %>
		  
           alert('还没开始呢，"开始答题时间<%=tt1%>"到"<%=tt2%>"！\n欢迎到时候参与！');
           window.location.href="<%=AllValus.errpage%>";
          
		  <%}else{
		      
		  
		   %>
		  
		     alert('感谢关注！');
           
		  <%} %>

		</script>

	<style>
			 #mcover2 {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background: rgba(0, 0, 0, 0.7);
				display: none;
				z-index: 20000;
			 }
			 #mcover2 img {
				position: fixed;
				right: 18px;
				top: 5px;
				width: 96%!important;
				height: 98%!important;
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
        .STYLE1 {color: #FFFFFF}
    </style>
        
         <script type="text/javascript">
			function button1(){
			$("#mcover").css("display","block")    // 分享给好友按钮触动函数
			}
			function button2(){
			$("#mcover").css("display","block")  // 分享给好友圈按钮触动函数
			}
			
			function button3(){
			$("#mcover2").css("display","block")  // 分享给好友圈按钮触动函数
			}
			
			function weChat2(){
			$("#mcover2").css("display","none");  // 点击弹出层，弹出层消失
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
		
		
	<script src="js/jquery.js"></script>
	
<style>
/*div通用样式*/
div{

}

/*右上角*/
div.right_top{
overflow: hidden;
z-index: 2000;
position:absolute;
right: 10px;
top: 190px;
}

/*右下角*/
div.right_bottom{
position:absolute;
bottom:0px;
right:0px

}


/*屏幕中间*/
div.center_{
right: 45%;
top: 50%;
}


/*左上角*/
div.left_top{
left: 10px;
top: 10px;
}


/*左下角*/
div.left_bottom{
left: 10px;
bottom: 10px;
}
</style>
		
<script>
var xz=0;
function processForm(form)
{
xz=0;
var xf=0;
if (form.c1[0].checked==1) xf+=0;
else if (form.c1[1].checked==1) xf+=0;
else if (form.c1[2].checked==1) xf+=0;
else xz=1;

if (form.c2[0].checked==1) xf+=0;
else if (form.c2[1].checked==1) xf+=0;
else if (form.c2[2].checked==1) xf+=0;
else xz=1;

if (form.c3[0].checked==1) xf+=0;
else if (form.c3[1].checked==1) xf+=0;
else if (form.c3[2].checked==1) xf+=0;
else xz=1;

if (form.c4[0].checked==1) xf+=0;
else if (form.c4[1].checked==1) xf+=0;
else if (form.c4[2].checked==1) xf+=0;
else xz=1;

if (form.c5[0].checked==1) xf+=0; 
else if (form.c5[1].checked==1) xf+=0; 
else if (form.c5[2].checked==1) xf+=0; 
else xz=1;


if (form.c6[0].checked==1) xf+=0;
else if (form.c6[1].checked==1) xf+=0; 
else if (form.c6[2].checked==1) xf+=0; 
else xz=1;

if (form.c7[0].checked==1) xf+=0;
else if (form.c7[1].checked==1) xf+=2;
else if (form.c7[2].checked==1) xf+=0;
else xz=1;

if (form.c8[0].checked==1) xf+=0;
else if (form.c8[1].checked==1) xf+=2; 
else if (form.c8[2].checked==1) xf+=2;
else xz=1;

if (form.c9[0].checked==1) xf+=0;
else if (form.c9[1].checked==1) xf+=2; 
else if (form.c9[2].checked==1) xf+=2;
else xz=1;

if (form.c10[0].checked==1) xf+=0;
else if (form.c10[1].checked==1) xf+=2; 
else if (form.c10[2].checked==1) xf+=2;
else xz=1;


if (form.c11[0].checked==1) xf+=0;
else if (form.c11[1].checked==1) xf+=2; 
else if (form.c11[2].checked==1) xf+=2;
else xz=1;

if (form.c12[0].checked==1) xf+=0;
else if (form.c12[1].checked==1) xf+=2; 
else if (form.c12[2].checked==1) xf+=2;
else xz=1;

if (form.c13[0].checked==1) xf+=0;
else if (form.c13[1].checked==1) xf+=2; 
else if (form.c13[2].checked==1) xf+=2;
else xz=1;

if (form.c14[0].checked==1) xf+=0;
else if (form.c14[1].checked==1) xf+=2; 
else if (form.c14[2].checked==1) xf+=2;
else xz=1;

if (form.c15[0].checked==1) xf+=0;
else if (form.c15[1].checked==1) xf+=2; 
else if (form.c15[2].checked==1) xf+=2;
else xz=1;

if(xz!=0){alert('请认真选择每一项！');return false;}
else
{
  //alert(OK');
  return true; 
}
}
</script>
</head>
<body>
<%int cs = MyUtils22.GetCsForDt(openid);%>
<%if(cs>100000){%>
<div id="mcover" onClick="weChat()" style="display: block;">
          <img src="js/tip.png"/>
</div>
<%}else{%>
<div id="mcover" onClick="weChat()" style="display: none;">
          <img src="js/tip.png"/>
</div>
<%}%>

<%if(twbsession2!=null){%>
  <%if(twbsession2.equals(openid)){%>
  <div id="contentid"  style="display:block">
  <%}else{%>
  <!--  
  <img src="http://v.yqcn.com/bmwj/asp/sxbook/download3/no.png" width="100%" height="100%"/>-->
  <div id="contentid"  style="display:none">
  <%}%>
<%}else{%>
  <!--  
  <img src="http://v.yqcn.com/bmwj/asp/sxbook/download3/no.png" width="100%" height="100%"/>-->
<div id="contentid"  style="display:none">
<%}%>

<div id="mcover2" onClick="weChat2()" style="display:none;">
  <img src="img/tip6.png"/>
</div>

<form name="form1" method="get" action="tp.jsp">
<table width="100%" height="302" border="0" cellpadding="0" cellspacing="0" style="background-color:#ececee">
  <tr>
    <td height="600" align="center" valign="top" bgcolor="#FFFFFF" style="background:url(img/IMG_TOP3.png) no-repeat top center;background-size: 100% 100%;"><table width="95%" cellspacing="2" cellpadding="0">
      <tr>
        <td height="10" colspan="2" align="right">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" align="right"><div onClick="button2();"></div></td>
      </tr>
      
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="30">
      <tr>
        <td colspan="2" align="left"><p><strong><div style="line-height:1.8;text-indent:2em;">今年4月是第32个爱国卫生月，今年的活动主题是“防疫有我，爱卫同行”。为了加大本次爱国卫生月的宣传力度，普及爱国卫生和防疫知识，引导群众树立健康卫生意识，乐清市爱卫办、乐清市卫健局、乐清市日报社联合举办乐清市“第32个爱国卫生月”知训有奖问答活动。</div></strong></P></td>
        </tr>
      <tr>
        <td height="50" colspan="2">
		  <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#CC0001; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">活动奖励</button>  
	      <div align="center" style="margin-top:50px;margin-bottom:25px;line-height:1.8">一等奖10份: 50元移动话费</div>
	      <div align="center" style="margin-top:25px;margin-bottom:25px;line-height:1.8">二等奖30份: 30元移动话费</div>
	      <div align="center" style="margin-top:25px;margin-bottom:25px;line-height:1.8">三等奖50份: 20元移动话费</div>
	      <div align="center" style="margin-top:25px;margin-bottom:50px;line-height:1.8">参与奖210份:10元移动话费</div>
	      <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#CC0001; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">活动规则</button>  
		  <div style="margin-top:50px;padding-left:12px;line-height:1.8">1、  共有15道爱国卫生月基础题，全部答对其中10道题，即可参与刮刮卡抽奖活动。每个手机号仅限获奖一次，请实名参与。</div>
		  <div style="margin-top:25px;padding-left:12px;margin-bottom:25px;line-height:1.8">2、  300份话费奖励完成或超出活动时间参与答题均无效。</div>
		  <div style="margin-top:25px;padding-left:12px;margin-bottom:50px;line-height:1.8">3、	参与本次活动的手机必须为浙江移动用户。</div>
		  <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#CC0001; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">选择题</button>
        </td>
      </tr>
      
      <tr>
        <td>
        
	<table width="103%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
      <tbody id="tbName" >
      <tr>
        <td height="20"><p></p><strong>1、在交通工具上我们不建议做以下哪种行为：</strong>
          <p><input type="radio" name="c1" value="1" style="width:55px; height:55px;"/>
		    A. 主动让座</p>
          <p> 
            <input type="radio" name="c1" value="2" style="width:55px; height:55px;"/>
            B. 主动投币</p>
          <p style="line-height:1.8">
            <input type="radio" name="c1" value="3" style="width:55px; height:55px;"/>
            C. 进食</p>
          </td>
      </tr>
	  </tbody>
	  
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>2、如果在市场购买肉类，应优先选择：</strong></div>
          <p><input type="radio" name="c2" value="1" style="width:55px; height:55px;"/>
		    A. 冰鲜鸡</p>
          <p> 
            <input type="radio" name="c2" value="2" style="width:55px; height:55px;"/>
            B. 穿山甲</p>
          <p>
            <input type="radio" name="c2" value="3" style="width:55px; height:55px;"/>
            C. 果子狸</p>
          </td>
      </tr>
	  </tbody>
	  
	  
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>3、四害”不包括：</strong></div>
          <p> <input type="radio" name="c3" value="1" style="width:55px; height:55px;"/>
		    A. 跳蚤</p>
          <p>
            <input type="radio" name="c3" value="2" style="width:55px; height:55px;"/>
            B. 苍蝇</p>
          <p>
            <input type="radio" name="c3" value="3" style="width:55px; height:55px;"/>
            C. 老鼠</p>
        </td>
      </tr>
	  </tbody>
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>4、为了保护环境，我们应该：</strong></div>
          <p> <input type="radio" name="c4" value="1" style="width:55px; height:55px;"/>
		    A. 垃圾分类</p>
          <p>
            <input type="radio" name="c4" value="2" style="width:55px; height:55px;"/>
            B. 多开车出行</p>
          <p>
            <input type="radio" name="c4" value="3" style="width:55px; height:55px;"/>
            C. 多用一次性餐具</p>
		   </td>
      </tr>
	  </tbody>
	  
	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>5、爱国卫生月为每年的：</strong></div>
          <p> <input type="radio" name="c5" value="1" style="width:55px; height:55px;"/>
		    A. 3月</p>
          <p>
            <input type="radio" name="c5" value="2" style="width:55px; height:55px;"/>
            B. 4月</p>
          <p>
            <input type="radio" name="c5" value="3" style="width:55px; height:55px;"/>
            C. 5月</p>
            </td>
      </tr>
	  </tbody>
	  
	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>6、属于农村“两管、五改”中“五改”的是：</strong></div>
          <p><input type="radio" name="c6" value="1" style="width:55px; height:55px;"/>
		    A. 改路</p>
          <p>
            <input type="radio" name="c6" value="2" style="width:55px; height:55px;"/>
            B. 改厕</p>
          <p>
            <input type="radio" name="c6" value="3" style="width:55px; height:55px;"/>
            C. 改地</p>
		  </td>
      </tr>
	  </tbody>
	


	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p></p><strong>7、用过的餐巾纸、包装、食物残渣应放在：</strong>
          <p><input type="radio" name="c7" value="1" style="width:55px; height:55px;"/>
		    A. 花丛中</p>
          <p>
            <input type="radio" name="c7" value="2" style="width:55px; height:55px;"/>
            B. 地上</p>
          <p>
            <input type="radio" name="c7" value="3" style="width:55px; height:55px;"/>
            C. 指定垃圾桶</p>
		</td>
      </tr>
	  </tbody>
	  
	  
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p></p><strong>8、中央爱国卫生运动委员会第一届主任是：</strong>
          <p> <input type="radio" name="c8" value="1" style="width:55px; height:55px;"/>
		    A. 朱德</p>
          <p>
            <input type="radio" name="c8" value="2" style="width:55px; height:55px;"/>
            B. 刘少奇</p>
          <p>
            <input type="radio" name="c8" value="3" style="width:55px; height:55px;"/>
            C. 周恩来</p>
       </td>
      </tr>
	  </tbody>
	  
	   
      
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>9、不属于传播爱国卫生运动精神的是：</strong></div>
          <p> <input type="radio" name="c9" value="1" style="width:55px; height:55px;"/>
		    A. 热爱祖国</p>
          <p>
            <input type="radio" name="c9" value="2" style="width:55px; height:55px;"/>
            B. 讲文明卫生</p>
          <p>
            <input type="radio" name="c9" value="3" style="width:55px; height:55px;"/>
            C. 好逸恶劳</p>
       </td>
      </tr>
	  </tbody>
	  
	  
	    
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>10、应邀赴宴过程中，我们应该：</strong></div>
          <p> <input type="radio" name="c10" value="1" style="width:55px; height:55px;"/>
		    A. 吸烟</p>
          <p>
            <input type="radio" name="c10" value="2" style="width:55px; height:55px;"/>
            B. 使用公筷</p>
          <p>
            <input type="radio" name="c10" value="3" style="width:55px; height:55px;"/>
            C. 劝酒</p>
       </td>
      </tr>
	  </tbody>
	  
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>11、乐清市创成国家卫生城市在哪一年：</strong></div>
          <p> <input type="radio" name="c11" value="1" style="width:55px; height:55px;"/>
		    A. 2016年</p>
          <p>
            <input type="radio" name="c11" value="2" style="width:55px; height:55px;"/>
            B. 2017年</p>
          <p>
            <input type="radio" name="c11" value="3" style="width:55px; height:55px;"/>
            C. 2018年</p>
       </td>
      </tr>
	  </tbody>
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>12、乐清市将在哪一年迎接国家卫生城市第一轮复评：</strong></div>
          <p> <input type="radio" name="c12" value="1" style="width:55px; height:55px;"/>
		    A. 2020年</p>
          <p>
            <input type="radio" name="c12" value="2" style="width:55px; height:55px;"/>
            B. 2021年</p>
          <p>
            <input type="radio" name="c12" value="3" style="width:55px; height:55px;"/>
            C. 2022年</p>
       </td>
      </tr>
	  </tbody>
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p></p><strong>13、导致温室效应的主要气体是：</strong>
          <p> <input type="radio" name="c13" value="1" style="width:55px; height:55px;"/>
		    A. 一氧化碳</p>
          <p>
            <input type="radio" name="c13" value="2" style="width:55px; height:55px;"/>
            B. 二氧化碳</p>
          <p>
            <input type="radio" name="c13" value="3" style="width:55px; height:55px;"/>
            C. PM2.5</p>
       </td>
      </tr>
	  </tbody>
	  
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p></p><strong>14、健康的解压方式包括：</strong>
          <p> <input type="radio" name="c14" value="1" style="width:55px; height:55px;"/>
		    A. 调整自己的想法</p>
          <p>
            <input type="radio" name="c14" value="2" style="width:55px; height:55px;"/>
            B. 饮酒</p>
          <p>
            <input type="radio" name="c14" value="3" style="width:55px; height:55px;"/>
            C. 沉迷游戏</p>
       </td>
      </tr>
	  </tbody>
	  
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>15、不正确的洗手方法包括:</strong></div>
          <p> <input type="radio" name="c15" value="1" style="width:55px; height:55px;"/>
		    A. 用流动水洗手</p>
          <p>
            <input type="radio" name="c15" value="2" style="width:55px; height:55px;"/>
            B. 用脸盆盛放清洁的水洗手</p>
          <p>
            <input type="radio" name="c15" value="3" style="width:55px; height:55px;"/>
            C. 必须使用皂液(肥皂)等清洁剂</p>
           
            <div style="float:right" onClick="button3();"><img src="img/xxzl2.png" border="0"></div>
       </td>
      </tr>
	  </tbody>
	 
	 
	 
    </table>
		</td>
       </tr><tr>
		
      </tr>
	  
	  
	  
    </table></td>
  </tr>
  
  
  
  <tr>
    <td height="115" align="center" valign="middle"><table width="95%" height="75" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center">
        <%if(!MyUtils22.iscj_pd(openid)){%>
        <!--  
        <input target="_self" type="image" border="0" name="sub22" src="img/tp3.png" width=100% height=80  onclick="return processForm(this.form);"/>
        -->
       <button onclick="return processForm(this.form);" type="submit" style="width:100%;padding:15px 15px;border-radius:15px; background:#FDCB03; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交&nbsp;&nbsp;&nbsp;&nbsp;</button>  
       <p></p>
		<%}else{ %>
		 <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#CC0001; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">您已经参与过,<%="您是第"+MyUtils22.GetWs(openid)+"位参与者,"+MyUtils22.zsm(openid) %></button>  
		<%} %>
	   <p></p>
	<input name="openid" type="hidden" id="openid" value="<%=openid%>"/>	<div></div></td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
</div>

</body>
</html>


<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //是微信浏览器不做操作
	   
	   
	   
	   
    }else{
	   //alert('not');
	  //非微信浏览器就因此显示列表等
	   var target=document.getElementById("contentid");
	   target.style.display="none";
	   //alert('请先关注微信');
	  
	 
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
