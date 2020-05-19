<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@ page import="org.fjw.weixin.util.MyUtils28" %>
<%
	//控制时间
	int kz =0;
	String tt1=AllValus.ws_t1;
	String tt2=AllValus.ws_t2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //开始抽奖
    //2: //抽奖已经结束,感谢关注！
    //3: //抽奖还没开始呢！
    //out.println(kz);
%>

<%

String urlname ="bl8/index.jsp";
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
              response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet36&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

          }

          //out.println("你是自己点的，不回调");
   	     
      }else{
        
            //out.println("其他人点了以后，不回调");      
   			
   			//response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect");        

 			response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet36&response_type=code&scope=snsapi_base&state=1#wechat_redirect");



      }
   
   }else{
   
  		    //还没点要回调
            //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect");        
  			response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet36&response_type=code&scope=snsapi_base&state=1#wechat_redirect");

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
        wx_share_title="<%=AllValus.ws_title%>";
        wx_share_desc="<%=AllValus.ws_desc%>";
        wx_share_link="<%=AllValus.ws_link%>";
        wx_share_imgUrl="<%=AllValus.ws_img%>";

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
<title><%=AllValus.ws_title %></title>
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
body{
    height: 1800px;
    font-size:45px;
    color:#3f3e3d;
    line-height:35px;
    font-family:微软雅黑;
    background-color:#e7f0f7;
    padding:0px;
    margin:0px;
}

/*右上角*/
div.right_top{
    right: 10px;
    top: 10px;
}

/*右下角*/
div.right_bottom{
    right: 10px;
    bottom: 10px;
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
		  
		   if (kz==1){%>
		  //alert("开始");
		  
		  <%}else if(kz==2){%>
		  
            alert('非常抱歉，答题时间已过。感谢您的关注，请下次再来！');
            window.location.href="<%=AllValus.errpage5%>";
            
		  <%}else if(kz==3){%>
		  
            alert('还没开始呢，"开始答题时间<%=tt1%>"到"<%=tt2%>"！\n欢迎到时候参与！');
            window.location.href="<%=AllValus.errpage5%>";
          
		  <%}else{%>
		  
		     alert('感谢关注！');
           
		  <%}%>

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
    position:fixed;
    bottom:0;
    right:0;
    /*width:100%;*/
    /*height:0;*/

    top: 50%;
    z-index: 99999999 !important;

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


        }
    </script>
</head>
<body>
<%int cs = MyUtils28.GetCsForDt(openid);%>
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
        <td colspan="2" align="left"><p><strong><div style="line-height:1.8;text-indent:2em;"><%=AllValus.ws_desc%></div></strong></P></td>
        </tr>
      <tr>
        <td height="50" colspan="2">
	      <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#82CBE8; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">活动规则</button>
          <div style="margin-top:50px;padding-left:12px;line-height:1.8">1、  共有10题，答对其中8道以上就是过关，然后就可以去监督所领证。</div>
		  <div style="margin-top:25px;padding-left:12px;margin-bottom:25px;line-height:1.8">2、  参与本次活动的手机号码必须为乐清移动用户，每个手机号仅限获奖一次，请实名参与。</div>
		  <div style="margin-top:25px;padding-left:12px;margin-bottom:50px;line-height:1.8">3、  通过考试者请及时到各辖区卫生监督所领取卫生管理员证，联系方式如下：城区所：城东街道晨曦路111号公共卫生中心大楼（609室、61600276）；柳市所：柳市镇溪桥路温州海关驻乐清办事处大院内一楼（内勤室、61723810）；虹桥所：虹桥镇八村村委楼7楼（内勤室、61315889）；大荆所：大荆镇湖边路38号（内勤室、62238150）。</div>
		  <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#82CBE8; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">选择题</button>
        </td>
      </tr>

      <tr>
        <td>

	<table width="103%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
      <tbody id="tbName" >
      <tr>
        <td height="20"><p></p><div style="line-height:1.8"><strong>1、国家卫生计生委新版《公共场所卫生管理条例实施细则》于什么时候开始实施？（    ）</strong></div>
          <p><input type="radio" name="c1" value="1" style="width:55px; height:55px;"/>
		    A. 2010年5月1日</p>
          <p>
            <input type="radio" name="c1" value="2" style="width:55px; height:55px;"/>
            B. 2012年5月1日</p>
          <p style="line-height:1.8">
            <input type="radio" name="c1" value="3" style="width:55px; height:55px;"/>
            C. 2016年1月19日</p>
          <p style="line-height:1.8">
            <input type="radio" name="c1" value="4" style="width:55px; height:55px;"/>
            D. 2017年12月26日</p>
          </td>
      </tr>
	  </tbody>


	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>2、公共场所从业人员体检和健康证的有效时间是:_____</strong></div>
          <p><input type="radio" name="c2" value="1" style="width:55px; height:55px;"/>
		    A. 半年 </p>
          <p>
            <input type="radio" name="c2" value="2" style="width:55px; height:55px;"/>
            B. 一年</p>
          <p>
            <input type="radio" name="c2" value="3" style="width:55px; height:55px;"/>
            C. 二年</p>
           <p>
            <input type="radio" name="c2" value="4" style="width:55px; height:55px;"/>
            D. 三年</p>
          </td>
      </tr>
	  </tbody>


	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>3、“公共场所卫生许可证”由_____签发。</strong></div>
          <p> <input type="radio" name="c3" value="1" style="width:55px; height:55px;"/>
		    A. 县级以上卫生防疫站</p>
          <p>
            <input type="radio" name="c3" value="2" style="width:55px; height:55px;"/>
            B. 县级以上卫生行政部门</p>
          <p>
            <input type="radio" name="c3" value="3" style="width:55px; height:55px;"/>
            C. 市级以上卫生防疫站</p>
          <p>
            <input type="radio" name="c3" value="4" style="width:55px; height:55px;"/>
            D. 市级以上工商行政部门</p>
        </td>
      </tr>
	  </tbody>

	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>4、公共场所不得设置（  ）</strong></div>
          <p> <input type="radio" name="c4" value="1" style="width:55px; height:55px;"/>
		    A. 自动售套机</p>
          <p>
            <input type="radio" name="c4" value="2" style="width:55px; height:55px;"/>
            B. 自动售烟机</p>
          <p>
            <input type="radio" name="c4" value="3" style="width:55px; height:55px;"/>
            C. 自动饮料售卖机</p>

		   </td>
      </tr>
	  </tbody>

	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>5、个人卫生四勤是指（  ）</strong></div>
          <p> <input type="radio" name="c5" value="1" style="width:55px; height:55px;"/>
		    A. 勤剪指甲.勤洗手,勤洗澡.勤理发</p>
          <p>
            <input type="radio" name="c5" value="2" style="width:55px; height:55px;"/>
            B. 勤换衣服.勤洗手,勤洗头.勤理发</p>
          <p>
            <input type="radio" name="c5" value="3" style="width:55px; height:55px;"/>
            C. 勤洗手,勤洗头.勤理发,勤剪指甲</p>
          <p>
            <input type="radio" name="c5" value="4" style="width:55px; height:55px;"/>
            D. 勤洗头,勤洗澡,勤洗衣服,勤剪指甲</p>
            </td>
      </tr>
	  </tbody>

	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>6、禁止吸烟公共场所应该履行哪些职责（ ）</strong></div>
          <p  style="line-height:1.8"><input type="radio" name="c6" value="1" style="width:55px; height:55px;"/>
		    A. 公共场所经营者应当设置醒目的禁止吸烟警语和标志</p>
          <p style="line-height:1.8">
            <input type="radio" name="c6" value="2" style="width:55px; height:55px;"/>
            B. 室外公共场所设置的吸烟区不得位于行人必经的通道上</p>
          <p style="line-height:1.8">
            <input type="radio" name="c6" value="3" style="width:55px; height:55px;"/>
            C. 公共场所经营者应当开展吸烟危害健康的宣传，并配备专（兼）职人员对吸烟者进行劝阻</p>
          <p style="line-height:1.8">
            <input type="radio" name="c6" value="4" style="width:55px; height:55px;"/>
            D. 以上都是</p>
		  </td>
      </tr>
	  </tbody>


	 <tbody id="tbName">
      <tr>
          <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>7、公共场所经营者发生违法行为应当承担的法律责任？（  ）</strong></div>
          <p style="line-height:1.8"><input type="radio" name="c7" value="1" style="width:55px; height:55px;"/>
		    A. 公共场所经营者违反《公共场所卫生管理条例实施细则》的有关规定，县级以上卫生行政部门依法责令限期改正，给予警告 </p>
          <p style="line-height:1.8">
            <input type="radio" name="c7" value="2" style="width:55px; height:55px;"/>
            B. 根据情节并可处以三万元以下的罚款</p>
          <p style="line-height:1.8">
            <input type="radio" name="c7" value="3" style="width:55px; height:55px;"/>
            C. 情节严重的，可以依法责令停业整顿，直至吊销卫生许可证</p>
          <p>
            <input type="radio" name="c7" value="4" style="width:55px; height:55px;"/>
            D. 以上都是</p>
		</td>
      </tr>
	  </tbody>


	 <tbody id="tbName">
      <tr>
          <td height="20" bgcolor="#FFFFFF"><p></p><div style="line-height:1.8"><strong>8、患有以下哪些疾病的人员在治愈前不得从事直接为顾客服务的工作？</strong></div>
          <p style="line-height:1.8"> <input type="radio" name="c8" value="1" style="width:55px; height:55px;"/>
		    A. 痢疾、伤寒、化脓性或渗出性皮肤病</p>
          <p>
            <input type="radio" name="c8" value="2" style="width:55px; height:55px;"/>
            B. 甲型病毒性肝炎</p>
          <p>
            <input type="radio" name="c8" value="3" style="width:55px; height:55px;"/>
            C. 戊型病毒性肝炎</p>
          <p>
            <input type="radio" name="c8" value="4" style="width:55px; height:55px;"/>
            D. 以上全是</p>
       </td>
      </tr>
	  </tbody>



	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>9、公共场所发生危害健康事故时，经营者应当立即处置，防止危害扩大，并及时向县级以上人民政府（  ）部门报告？</strong></div>
          <p> <input type="radio" name="c9" value="1" style="width:55px; height:55px;"/>
		    A. 卫生行政</p>
          <p>
            <input type="radio" name="c9" value="2" style="width:55px; height:55px;"/>
            B. 工商管理</p>
          <p>
            <input type="radio" name="c9" value="3" style="width:55px; height:55px;"/>
            C. 城市管理与行政执法</p>
            <p>
             <input type="radio" name="c9" value="4" style="width:55px; height:55px;"/>
            D. 税务管理</p>
       </td>
      </tr>
	  </tbody>



	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><div style="line-height:1.8"><strong>10、公共场所经营者应当加强自身管理，制订卫生检查计划，规定检查时间、项目等，检查服务过程卫生状况并记录，对不符合卫生要求的行为及时制止并提出处理意见。每（     ）月至少有一次全面自查记录。</strong></div>
          <p> <input type="radio" name="c10" value="1" style="width:55px; height:55px;"/>
		    A. 1</p>
          <p>
            <input type="radio" name="c10" value="2" style="width:55px; height:55px;"/>
            B. 2</p>
          <p>
            <input type="radio" name="c10" value="3" style="width:55px; height:55px;"/>
            C. 3</p>
          <p>
            <input type="radio" name="c10" value="4" style="width:55px; height:55px;"/>
            D. 4</p>

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
        <%if(!MyUtils28.iscj_pd(openid)){%>
        <!--  
        <input target="_self" type="image" border="0" name="sub22" src="img/tp3.png" width=100% height=80  onclick="return processForm(this.form);"/>
        -->
       <button onclick="return processForm(this.form);" type="submit" style="width:100%;padding:15px 15px;border-radius:15px; background:#21457B; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交&nbsp;&nbsp;&nbsp;&nbsp;</button>
       <p></p>
		<%}else{ %>
		 <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#CC0001; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">恭喜，您已经通过考试,<%="您是第"+MyUtils28.GetWs(openid)+"位参与者"%></button>
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
