<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils26"%>
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

String urlname ="bl6/index.jsp";
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
              response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet32&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

          }

          //out.println("你是自己点的，不回调");
   	     
      }else{
        
            //out.println("其他人点了以后，不回调");      
   			
   			//response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect");        

 			response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet32&response_type=code&scope=snsapi_base&state=1#wechat_redirect");



      }
   
   }else{
   
  		    //还没点要回调
            //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect");        
  			response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet32&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

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
        //表单验证
        function processForm(form)
        {

            var ids = document.getElementsByName("c1");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c2");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c3");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c4");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c5");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c6");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c7");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c8");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c9");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c10");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }


            var ids = document.getElementsByName("c11");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c12");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c13");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c14");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c15");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c16");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c17");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c18");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c19");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }

            var ids = document.getElementsByName("c20");
            var flag = false ;
            for(var i=0;i<ids.length;i++){
                if(ids[i].checked){
                    flag = true ;
                    break ;
                }
            }
            if(!flag){
                alert("请选择！");
                return false ;
            }



        }
    </script>
</head>
<body>
<%int cs = MyUtils26.GetCsForDt(openid);%>
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
  <img src="img/tip9.png"/>
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
        <td colspan="2" align="left"><p><strong><div style="line-height:1.8;text-indent:2em;">4月26日是世界知识产权日，今年的活动主题是“强化版权治理，优化版权生态”，为了树立尊重知识、崇尚科学和保护知识产权的意识，营造鼓励知识创新的法律环境，中共乐清市委宣传部（市新闻出版局）举办版权知识网络有奖问答活动。</div></strong></P></td>
        </tr>
      <tr>
        <td height="50" colspan="2">
		  <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#82CBE8; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">活动奖励</button>
	      <div align="center" style="margin-top:50px;margin-bottom:25px;line-height:1.8">一等奖10份:  50元移动话费</div>
	      <div align="center" style="margin-top:25px;margin-bottom:25px;line-height:1.8">二等奖30份:  30元移动话费</div>
	      <div align="center" style="margin-top:25px;margin-bottom:25px;line-height:1.8">三等奖50份:  20元移动话费</div>
	      <div align="center" style="margin-top:25px;margin-bottom:50px;line-height:1.8">参与奖260份: 10元移动话费</div>
	      <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#82CBE8; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">活动规则</button>
		  <div style="margin-top:50px;padding-left:12px;line-height:1.8">1、  共有20道选择题，答对其中15道题，即可参与刮刮卡抽奖活动。每个手机号仅限参与一次，请实名参与。</div>
		  <div style="margin-top:25px;padding-left:12px;margin-bottom:25px;line-height:1.8">2、  350份话费奖励完成或超出活动时间参与答题均无效。</div>
		  <div style="margin-top:25px;padding-left:12px;margin-bottom:50px;line-height:1.8">3、	活动对象：浙江移动用户。</div>
          <div style="margin-top:25px;padding-left:12px;margin-bottom:50px;line-height:1.8">4、	话费将在活动结束后5个工作日内赠送。</div>
		  <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#82CBE8; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">选择题</button>
        </td>
      </tr>
      
      <tr>
        <td>
        
	<table width="103%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
      <tbody id="tbName" >
      <tr>
        <td height="20"><p></p><div style="line-height:1.8"><strong>1、世界读书日是（ ）月（ ）日。</strong></div>
          <p><input type="radio" name="c1" value="1" style="width:55px; height:55px;"/>
		    A. 3月23日</p>
          <p> 
            <input type="radio" name="c1" value="2" style="width:55px; height:55px;"/>
            B. 3月26日</p>
          <p style="line-height:1.8">
            <input type="radio" name="c1" value="3" style="width:55px; height:55px;"/>
            C. 4月23日</p>
          <p style="line-height:1.8">
            <input type="radio" name="c1" value="4" style="width:55px; height:55px;"/>
            D. 4月26日</p>
          </td>
      </tr>
	  </tbody>
	  
	  
	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>2、世界知识产权日是（ ）月（ ）日。</strong></div>
          <p><input type="radio" name="c2" value="1" style="width:55px; height:55px;"/>
		    A. 3月23日 </p>
          <p> 
            <input type="radio" name="c2" value="2" style="width:55px; height:55px;"/>
            B. 3月26日</p>
          <p>
            <input type="radio" name="c2" value="3" style="width:55px; height:55px;"/>
            C. 4月23日</p>
           <p>
            <input type="radio" name="c2" value="4" style="width:55px; height:55px;"/>
            D. 4月26日</p>
          </td>
      </tr>
	  </tbody>
	  
	  
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>3、从事出版活动应当将（ ）放在首位。</strong></div>
          <p> <input type="radio" name="c3" value="1" style="width:55px; height:55px;"/>
		    A. 经济效益</p>
          <p>
            <input type="radio" name="c3" value="2" style="width:55px; height:55px;"/>
            B. 社会效益</p>
          <p>
            <input type="radio" name="c3" value="3" style="width:55px; height:55px;"/>
            C. 个人效益</p>
          <p>
            <input type="radio" name="c3" value="4" style="width:55px; height:55px;"/>
            D. 企业效益</p>
        </td>
      </tr>
	  </tbody>
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>4、按《印刷业管理条例》的规定，以下不属于“出版物”的是（ ）。</strong></div>
          <p> <input type="radio" name="c4" value="1" style="width:55px; height:55px;"/>
		    A. 期刊</p>
          <p>
            <input type="radio" name="c4" value="2" style="width:55px; height:55px;"/>
            B. 地图</p>
          <p>
            <input type="radio" name="c4" value="3" style="width:55px; height:55px;"/>
            C. 挂历</p>
            <p>
                <input type="radio" name="c4" value="4" style="width:55px; height:55px;"/>
                D. 广告宣传品</p>
		   </td>
      </tr>
	  </tbody>
	  
	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>5、以未成年人为对象的出版物（   ）含有诱发未成年人模仿违反社会公德的行为和违法犯罪的行为的内容，（    ）含有恐怖、残酷等妨害未成年人身心健康的内容。</strong></div>
          <p> <input type="radio" name="c5" value="1" style="width:55px; height:55px;"/>
		    A. 不得      不得</p>
          <p>
            <input type="radio" name="c5" value="2" style="width:55px; height:55px;"/>
            B. 可以      可以</p>
          <p>
            <input type="radio" name="c5" value="3" style="width:55px; height:55px;"/>
            C. 不得      可以</p>
            <p>
                <input type="radio" name="c5" value="4" style="width:55px; height:55px;"/>
                D. 可以      不得</p>
            </td>
      </tr>
	  </tbody>
	  
	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>6、《出版管理条例》规定，单位违反本条例被处以吊销许可证行政处罚的，其法定代表人或者主要负责人自许可证被吊销之日起（ ）内不得担任出版、印刷或者复制、进口、发行单位的法定代表人或者主要负责人。</strong></div>
          <p><input type="radio" name="c6" value="1" style="width:55px; height:55px;"/>
		    A. 5年</p>
          <p>
            <input type="radio" name="c6" value="2" style="width:55px; height:55px;"/>
            B. 10年</p>
          <p>
            <input type="radio" name="c6" value="3" style="width:55px; height:55px;"/>
            C. 15年</p>
            <p>
                <input type="radio" name="c6" value="4" style="width:55px; height:55px;"/>
                D. 20年</p>
		  </td>
      </tr>
	  </tbody>
	

	 <tbody id="tbName">
      <tr>
          <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>7、差错率不超过（ ）的图书，其编校质量属合格。</strong></div>
          <p><input type="radio" name="c7" value="1" style="width:55px; height:55px;"/>
		    A. 千分之一</p>
          <p>
            <input type="radio" name="c7" value="2" style="width:55px; height:55px;"/>
            B. 万分之一</p>
          <p>
            <input type="radio" name="c7" value="3" style="width:55px; height:55px;"/>
            C. 百分之一</p>
              <p>
                  <input type="radio" name="c7" value="4" style="width:55px; height:55px;"/>
                  D. 十万分之一</p>
		</td>
      </tr>
	  </tbody>
	  
	  
	 <tbody id="tbName">
      <tr>
          <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>8、著作权法所称作品，是指文学、艺术和科学领域内具有（ ）并能以某种有形形式复制的智力成果。</strong></div>
          <p> <input type="radio" name="c8" value="1" style="width:55px; height:55px;"/>
		    A. 新颖性</p>
          <p>
            <input type="radio" name="c8" value="2" style="width:55px; height:55px;"/>
            B. 艺术性</p>
          <p>
            <input type="radio" name="c8" value="3" style="width:55px; height:55px;"/>
            C. 独创性</p>
              <p>
                  <input type="radio" name="c8" value="4" style="width:55px; height:55px;"/>
                  D. 思想性</p>
       </td>
      </tr>
	  </tbody>
	  
	   
      
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>9、根据我国著作权法的规定，（ ）与著作权是同一概念。</strong></div>
          <p> <input type="radio" name="c9" value="1" style="width:55px; height:55px;"/>
		    A. 版权</p>
          <p>
            <input type="radio" name="c9" value="2" style="width:55px; height:55px;"/>
            B. 出版权</p>
          <p>
            <input type="radio" name="c9" value="3" style="width:55px; height:55px;"/>
            C. 复制权</p>
            <p>
             <input type="radio" name="c9" value="4" style="width:55px; height:55px;"/>
            D. 邻接权</p>
       </td>
      </tr>
	  </tbody>
	  
	  
	    
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>10、著作权法保护的是（ ）。</strong></div>
          <p> <input type="radio" name="c10" value="1" style="width:55px; height:55px;"/>
		    A. 思想观念</p>
          <p>
            <input type="radio" name="c10" value="2" style="width:55px; height:55px;"/>
            B. 数学概念</p>
          <p>
            <input type="radio" name="c10" value="3" style="width:55px; height:55px;"/>
            C. 原则和发现</p>
            <p>
                <input type="radio" name="c10" value="4" style="width:55px; height:55px;"/>
                D. 思想观念的独创性表达</p>
       </td>
      </tr>
	  </tbody>
	  
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>11、根据我国著作权法，我国公民著作权（ ）。</strong></div>
          <p> <input type="radio" name="c11" value="1" style="width:55px; height:55px;"/>
		    A. 随作品的发表而自动产生</p>
          <p>
            <input type="radio" name="c11" value="2" style="width:55px; height:55px;"/>
            B. 随作品的创作完成而自动产生</p>
          <p>
            <input type="radio" name="c11" value="3" style="width:55px; height:55px;"/>
            C. 在作品上加注版权标记后自动产生</p>
            <p>
                <input type="radio" name="c11" value="4" style="width:55px; height:55px;"/>
                D. 作品以一定的物质形态固定后产生</p>
       </td>
      </tr>
	  </tbody>
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>12、（ ）不受著作权法保护。</strong></div>
          <p> <input type="radio" name="c12" value="1" style="width:55px; height:55px;"/>
		    A. 计算机软件</p>
          <p>
            <input type="radio" name="c12" value="2" style="width:55px; height:55px;"/>
            B. 地图</p>
          <p>
            <input type="radio" name="c12" value="3" style="width:55px; height:55px;"/>
            C. 时事新闻</p>
            <p>
                <input type="radio" name="c12" value="4" style="width:55px; height:55px;"/>
                D. 即兴演说</p>
       </td>
      </tr>
	  </tbody>
	  
	  <tbody id="tbName">
      <tr>
          <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>13、图书出版者重印、再版作品的，应当（ ）。</strong></div>
          <p> <input type="radio" name="c13" value="1" style="width:55px; height:55px;"/>
		    A. 支付报酬但不必通知著作权人</p>
          <p>
            <input type="radio" name="c13" value="2" style="width:55px; height:55px;"/>
            B. 通知著作权人并支付报酬</p>
          <p>
            <input type="radio" name="c13" value="3" style="width:55px; height:55px;"/>
            C. 通知著作权人但不必支付报酬</p>
              <p>
                  <input type="radio" name="c13" value="4" style="width:55px; height:55px;"/>
                  D. 与著作权人重新签订合同</p>
       </td>
      </tr>
	  </tbody>
	  
	  
	   <tbody id="tbName">
      <tr>
          <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>14、作者的署名权、修改权、保护作品完整权的保护期为（ ）。</strong></div>
          <p> <input type="radio" name="c14" value="1" style="width:55px; height:55px;"/>
		    A. 作者终生及死后五十年</p>
          <p>
            <input type="radio" name="c14" value="2" style="width:55px; height:55px;"/>
            B. 作者终生</p>
          <p>
            <input type="radio" name="c14" value="3" style="width:55px; height:55px;"/>
            C. 不受限制</p>
              <p style="line-height: 1.5">
                  <input type="radio" name="c14" value="4" style="width:55px; height:55px;line-height: 1.5"/>
                  D. 截止于作品首次发表后第50年的12月31日</p>
       </td>
      </tr>
	  </tbody>
	  
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>15、甲撰写毕业论文，大量抄袭了乙刊登在某杂志上的一篇译文，甲的行为侵犯了（ ）的著作权。</strong></div>
          <p> <input type="radio" name="c15" value="1" style="width:55px; height:55px;"/>
		    A. 乙</p>
          <p>
            <input type="radio" name="c15" value="2" style="width:55px; height:55px;"/>
            B. 杂志社</p>
          <p>
            <input type="radio" name="c15" value="3" style="width:55px; height:55px;"/>
            C. 乙和杂志社</p>
            <p>
                <input type="radio" name="c15" value="4" style="width:55px; height:55px;"/>
                D. 乙和原作者</p>
       </td>
      </tr>
	  </tbody>

        <tbody id="tbName">
        <tr>
            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>16、下列哪项不适用于我国著作权法保护？（ ）</strong></div>
                <p> <input type="radio" name="c16" value="1" style="width:55px; height:55px;"/>
                    A. 书法</p>
                <p>
                    <input type="radio" name="c16" value="2" style="width:55px; height:55px;"/>
                    B. 地图</p>
                <p>
                    <input type="radio" name="c16" value="3" style="width:55px; height:55px;"/>
                    C. 化学元素周期表</p>
                <p>
                    <input type="radio" name="c16" value="4" style="width:55px; height:55px;"/>
                    D. 地方志</p>
            </td>
        </tr>
        </tbody>


        <tbody id="tbName">
        <tr>
            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>17、因侵犯著作权行为提起的民事诉讼，由著作权法所规定侵权行为的（ ）人民法院管辖。</strong></div>
                <p> <input type="radio" name="c17" value="1" style="width:55px; height:55px;"/>
                    A. 实施地</p>
                <p>
                    <input type="radio" name="c17" value="2" style="width:55px; height:55px;"/>
                    B. 侵权复制品储藏地</p>
                <p>
                    <input type="radio" name="c17" value="3" style="width:55px; height:55px;"/>
                    C. 被告住所地</p>
                <p style="line-height: 1.5">
                    <input type="radio" name="c17" value="4" style="width:55px; height:55px;"/>
                 D. 实施地、侵权复制品储藏地或查封扣押地、被告住所地</p>
            </td>
        </tr>
        </tbody>

        <tbody id="tbName">
        <tr>
            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>18、下列哪个是著作权中的人身权（ ）。</strong></div>
                <p> <input type="radio" name="c18" value="1" style="width:55px; height:55px;"/>
                    A. 发行权</p>
                <p>
                    <input type="radio" name="c18" value="2" style="width:55px; height:55px;"/>
                    B. 署名权</p>
                <p>
                    <input type="radio" name="c18" value="3" style="width:55px; height:55px;"/>
                    C. 表演权</p>
                <p>
                    <input type="radio" name="c18" value="4" style="width:55px; height:55px;"/>
                    D. 复制权</p>
            </td>
        </tr>
        </tbody>


        <tbody id="tbName">
        <tr>
            <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>19、中国历史上第一部著作权法是（ ）。</strong></div>
                <p> <input type="radio" name="c19" value="1" style="width:55px; height:55px;"/>
                    A. 中华人民共和国著作权法</p>
                <p>
                    <input type="radio" name="c19" value="2" style="width:55px; height:55px;"/>
                    B. 中华民国著作权法</p>
                <p>
                    <input type="radio" name="c19" value="3" style="width:55px; height:55px;"/>
                    C. 北洋政府著作权法</p>
                <p>
                    <input type="radio" name="c19" value="4" style="width:55px; height:55px;"/>
                    D. 大清著作权律</p>
            </td>
        </tr>
        </tbody>

        <tbody id="tbName">
        <tr>
            <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>20、商标注册和版权登记有哪些区别（多选）。</strong></div>
                <p><input type="checkbox" name="c20" value="1" style="width:55px; height:55px;"/>
                    A. 申请机构不同</p>
                <p>
                    <input type="checkbox" name="c20" value="2" style="width:55px; height:55px;"/>
                    B. 保护对象不同</p>
                <p>
                    <input type="checkbox" name="c20" value="3" style="width:55px; height:55px;"/>
                    C. 保护期限不同</p>
                <p>
                    <input type="checkbox" name="c20" value="4" style="width:55px; height:55px;"/>
                    D. 保护的目的不同</p>
                <div style="float:right" onClick="window.location.href='memo.jsp'"><img src="img/xxzl2.png" border="0"></div>
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
        <%if(!MyUtils26.iscj_pd(openid)){%>
        <!--  
        <input target="_self" type="image" border="0" name="sub22" src="img/tp3.png" width=100% height=80  onclick="return processForm(this.form);"/>
        -->
       <button onclick="return processForm(this.form);" type="submit" style="width:100%;padding:15px 15px;border-radius:15px; background:#21457B; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交&nbsp;&nbsp;&nbsp;&nbsp;</button>
       <p></p>
		<%}else{ %>
		 <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#CC0001; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">您已经参与过,<%="您是第"+MyUtils26.GetWs(openid)+"位参与者,"+MyUtils26.zsm(openid) %></button>  
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
