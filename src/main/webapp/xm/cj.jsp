<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils2"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.liufeng.course.util.AdvancedUtil"%>
<%@page import="org.fjw.weixin.util.MyUtils4"%>
<%
String urlname ="xm/cj.jsp";
String openid =request.getParameter("openid");
String check=Topay.WxJsApiCheck4(urlname,openid);

String xm="";
String tel="";

int fid = MyUtils4.GetFid();

if(request.getParameter("xm")!=null){
   xm = new String (request.getParameter("xm").getBytes("ISO-8859-1"),"UTF-8");
}else{
   xm=MyUtils4.GetXmFromOpenId(openid,fid);
}

if(request.getParameter("tel")!=null){
  tel = request.getParameter("tel");
}else{
  tel=MyUtils4.GetTelFromOpenId(openid,fid);
}


int iszq = MyUtils4.GetIsZqFromOpenId(openid,fid);



//根据OPENID获取该用户答题是否正确,根据这个判断 ，如果不正确关闭页面，如果正确留在本页(可以不用，用下面的)

%>
<html>
	<head>
	
	 <title>答题互动</title>
	 
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
 
	 <link type="text/css" rel="stylesheet" href="../css/other10.css">
	 
	 <style type="text/css">
	 form#form1 {font:12px tahoma,sans-serif} 
	 input[type="radio"] {width:30px;height:30px;margin:0;padding:0;} 
	 </style>
	 
	  <%
	//控制时间
	int kz =0;
	String tt1=MyUtils4.GetStime();
	String tt2=MyUtils4.GetEtime();
    Date c1=MyUtils4.CharDate(tt1);
    Date c2=MyUtils4.CharDate(tt2);
    kz= MyUtils4.TimeKZ(c1,c2);
    //1: //开始抽奖
    //2: //抽奖已经结束,感谢关注！
    //3: //抽奖还没开始呢
  
	 %>
	 
	 <%
	 //1 留本页 2. 提示谢谢参与 3. 显示中了 什么奖
	 int  bz = MyUtils4.SyYd(openid,fid);
	// out.println(bz);
	  %>
	 
	  <%
	 //中了什么奖
	 String zsm = MyUtils4.zsm(openid,fid);
	  %>
	  
	
	  
	   <%
  
//各个奖项总剩余

int t1 = MyUtils4.sy1(fid); //一等奖总数剩余名额

System.out.println(t1);

   %>
	  
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

<script>
var xz=0;
function processForm(form)
{
xz=0;
var xf=0;
if (form.c1[0].checked==1) xf+=0; 
else if (form.c1[1].checked==1) xf+=0;
else if (form.c1[2].checked==1) xf+=0; 
else if (form.c1[3].checked==1) xf+=0;  
else xz=1;

if(xz!=0){alert('请认真选择每一项！');return false;}
else
{
  //alert(OK');
  return true; 
}
}
</script>

	 
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    <%=check%>,// 必填，签名，见附录1
		    jsApiList: ['hideMenuItems'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		wx.ready(function(){
		   //alert("config ok...");
		   //隐藏右上角菜单接口
		   	  wx.hideOptionMenu();
		   	  
		   	   <%
		   //判断答题是否正确
		   if(iszq==2){
		   
		            // 组装文本客服消息
		  // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "全部奖品已抽完,感谢您的关注，请下次再来！");
		// 发送客服消息
		//   AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		   
		   %>
		   
		        alert('本期活动您的答题错误哦,谢谢参与,请关注下期活动!');
              
                wx.closeWindow();
                
           <%}%>
		   
		     <%
		 //  String accessToken = WeixinChaOpenId.GetDBAccessToken("乐清发布");

		   %>
		   
		   <%
		   if(bz==1){
		       //留本页
		   %>
		   
		   
		   <%}else if(bz==2){
		     // 组装文本客服消息
		 //  String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "很遗憾，您木有全部答对哦！,感谢您的关注，请下次再来！");
		// 发送客服消息
		//   AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		   %>
		       
		       wx.closeWindow();  
		   
		   <%}else if(bz==3){  //已经中奖
		   
		    // 组装文本客服消息
		  // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, ""+zsm+"");
		// 发送客服消息
		  // AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   %>
		       
		       alert('"<%=zsm%>"');
		       wx.closeWindow();   
		   
		   <%}%>
		   
		   <%
		   //判断全部名额剩余
		   if(t1<0){
		   
		            // 组装文本客服消息
		  // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "全部奖品已抽完,感谢您的关注，请下次再来！");
		// 发送客服消息
		//   AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		   
		   %>
		   
		        alert('全部奖品已抽完,感谢您的关注，请下次再来！');
               //关闭当前网页窗口接口
                wx.closeWindow();
                
           <%}%>
           

		  <%
		     // 根据起止时间判断是否关闭窗口 ，弹出提醒窗
		  // kz=1 开始抽奖(不关) kz=2 抽奖结束(关闭) kz=3 抽奖没开始（关闭）
		  
		   if (kz==1){
		   
		   
		  %>
		 // alert("开始抽奖");
		  
		  <%}else if(kz==2){
		    // 组装文本客服消息
		  // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "非常抱歉，抽奖时间已过。感谢您对的关注，请下次再来！");
		// 发送客服消息
		//   AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		  
		  %>
		  
            alert('非常抱歉，抽奖时间已过。感谢您的关注，请下次再来！');
            //关闭当前网页窗口接口
            wx.closeWindow();
		 
		  <%}else if(kz==3){
		   // 组装文本客服消息
		 //  String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "还没开始呢，\"开始抽奖时间"+tt1+"\"到\""+tt2+"\"！\n欢迎到时候参与！");
		// 发送客服消息
		 //  AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		  
		  %>
		  
           alert('还没开始呢，"开始抽奖时间<%=tt1%>"到"<%=tt2%>"！\n欢迎到时候参与！');
           //关闭当前网页窗口接口
           wx.closeWindow();
		 
		  <%}else{
		       // 组装文本客服消息
		 //  String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "感谢关注！");
		// 发送客服消息
		//   AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		  
		   %>
		  
		    alert('感谢关注！');
            //关闭当前网页窗口接口
            wx.closeWindow();
            
		  <%} %>
		  
		   
		   	  
			    wx.checkJsApi({
           jsApiList: [
             'hideMenuItems',
           ],
           success: function (res) {
             //alert(JSON.stringify(res));
             
           }
          });
          
		});
		wx.error(function(res){
			//alert(res);
		    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		});
		
		
			
			// 2.2 监听分享到朋友圈按钮点击、自定义分享内容及分享结果接口
  function  sharefriendRound2() {
     //显示右上角菜单接口
       wx.showOptionMenu();
	   
    wx.onMenuShareTimeline({
      title: '邀您来答题',
      link: 'http://www.yqrb.com.cn/CreatWs/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg',
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
  

	// 2.2 监听“发送给朋友”按钮点击、自定义分享内容及分享结果接口
  function  sharefriendRound3() {
     //显示右上角菜单接口
       wx.showOptionMenu();
	   
    wx.onMenuShareAppMessage({
      title: '邀您来答题',
      desc: '快来参加答题',
      link: 'http://www.yqrb.com.cn/CreatWs/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg',
      type: '', // 分享类型,music、video或link，不填默认为link
      dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
       // alert('用户点击发送给朋友');
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
	//alert('现在去发送给朋友吧，叫他们也来参加预约报名!');
  };
  			
	// 2.2 监听“发送给qq朋友”按钮点击、获取“分享到QQ”按钮点击状态及自定义分享内容接口
  function  sharefriendRound4() {
     //显示右上角菜单接口
       wx.showOptionMenu();
	   
    wx.onMenuShareQQ({
      title: '邀您来答题',
      desc: '快来参加答题',
      link: 'http://www.yqrb.com.cn/CreatWs/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg',
     
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
       // alert('用户点击发送给QQ朋友');
      },
      success: function (res) {
        alert('已分享');
      },
      cancel: function (res) {
        alert('已取消');
      },
      fail: function (res) {
      //  alert(JSON.stringify(res));
      }
    });
	
    //alert('已注册获取“分享到朋友圈”状态事件');
	//alert('现在去发送给QQ朋友吧，叫他们也来参加预约报名!');
  };	
		
		
		
				
	// 2.2 监听“分享到腾讯微博”按钮点击、获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口
  function  sharefriendRound5() {
     //显示右上角菜单接口
       wx.showOptionMenu();
	   
    wx.onMenuShareWeibo({
      title: '邀您来答题',
      desc: '快来参加答题',
      link: 'http://www.yqrb.com.cn/CreatWs/err.jsp',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg',
     
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
       // alert('用户点击发送给腾讯微博');
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
	//alert('现在去发送给腾讯微博吧，叫他们也来参加预约报名!');
  };	
			
				
	// 2.2 监听“提交”按钮点击、获取“批量隐藏菜单项 ”
  function  sharefriendRound6() {
     //显示右上角菜单接口
      // wx.showOptionMenu();
      //隐藏右上角菜单接口
	wx.hideOptionMenu();
	   
   wx.hideMenuItems({ 
      menuList: [ 
        'menuItem:readMode', // 阅读模式 
        'menuItem:openWithQQBrowser', // 在	QQ浏览器中打开
        'menuItem:openWithSafari', //在Safari中打开
        'menuItem:share:email', //邮件
        'menuItem:copyUrl', // 复制链接 
        'menuItem:favorite', //收藏
        'menuItem:share:brand', //一些特殊公众号
        'menuItem:jsDebug',  //调试:
		'menuItem:editTag', //编辑标签: 
	    'menuItem:delete',  //删除:
 		'menuItem:originPage', //原网页:
 		'menuItem:share:qq',  //分享到QQ:
 		'menuItem:share:weiboApp',  //分享到Weibo:
		'menuItem:favorite',  //收藏: 
 		'menuItem:share:facebook', //分享到FB:
		'menuItem:share:QZone'  //分享到 QQ 空间

      ], 
      success: function (res) { 
      //  alert('已隐藏一系列按钮'); 
      }, 
      fail: function (res) { 
        alert(JSON.stringify(res)); 
      } 
    }); 
	
    //alert('已注册获取“分享到朋友圈”状态事件');
	//alert('现在去发送给。。。，叫他们也来参加预约报名!');
  };		


		</script>
	</head>
  <body onLoad="sharefriendRound6()">
  

    <div  id="contentid" style="display:block">
    
  

    <header>
        <div class="left-box">        </div>
        <h1>答题活动</h1>
    </header>
	
	
	
<div style=" margin-left:5px; margin-right:5px; padding-bottom:6px; padding-top:8px; line-height:25px;"> 
<SPAN style="COLOR: #ff0000"><B>活动说明：</B></SPAN>
<!--  
<P>1、<SPAN style="COLOR: #0000ff"> 关注“”（yq3535）公众微信号。</SPAN></P>
<P>2、<SPAN style="color:#0000FF">发送<font color=red>"地震"</font>关键字。</SPAN>（自动跳出答题页面）</P>-->
<P><SPAN style="color:#0000FF"><div style="text-ident=2em;">共有1道问答题，全部为单选题。全部答对的市民进入现场刮刮卡抽奖环节。</div></SPAN>
</P>
<!-- 
<P>4、<SPAN style="color:#0000FF">答完题后，提交姓名和电话号码。</SPAN></P>
<P>5、<SPAN style="color:#0000FF">全部答对的市民进入现场刮刮卡抽奖环节.</P>
<P>6、<SPAN style="color:#0000FF">活动结束后一周内，主办方将对每位中奖的市民给予30元的手机话费充值。</SPAN></P>
<!--<P>7、<SPAN style="color:#0000FF">本次活动的最终解释权归市爱卫办、创卫办。</SPAN></P>-->
<!--<P>8、<SPAN style="color:#0000FF"><a href="zs.jsp">点我查看答题知识</a></SPAN></P>-->
<P><SPAN style="COLOR: #ff0000"><B>活动时间：</B></SPAN></P>
<P><font color=red><%=MyUtils4.GetStime() %>-<%=MyUtils4.GetEtime() %></font></P>

  </div>



<div id="tips"></div>

<div class="body p-10 address-edit">

    <form id="form1" name="form1" method="post" action="cj_chk.jsp">
       
   
       <input type="hidden" name="openid" value="<%=openid%>">
       
       <input type="hidden" name="xm" value="<%=xm%>">
       
       <input type="hidden" name="tel" value="<%=tel%>">
       
       <input type="hidden" name="fid" value="<%=fid%>">
       
		<table width="100%" border="0" cellpadding="3" cellspacing="1">
      <tr>
        <td height="20"  bgcolor="#E8F0F7">&nbsp;<span class="STYLE20">请认真答题</span></td>
        </tr>

      <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><strong><%=MyUtils4.GetTitle() %></strong><br/>
            <br/>
		    <%=MyUtils4.GetXz()%></td>
      </tr>
	  </tbody>

      <tr>
        <td height="20" bgcolor="#FFFFFF">	<!--
		if (s1<=0 and s2<=0 and s3<=0 and s4<=0 and s5<=0) then%>
		<div class="form-btn">
<span gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" );">这次名额已经没了报名结束！</span>
        </div>
		
		else%>
		-->
          <div class="form-btn">
  <button type="submit" gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login"  onclick="return processForm(this.form);">提交</button>
          </div>
          <!--
		end if%>
		  -->          </td>
        </tr>
    </table>
	
	
		
    </form>
	
	

<footer>
    <div class="ft-wrap">
  </div>
    <nav class="ft-nav"></nav>
  <div class="ft-partner"></div>
    <div class="ft-copyright"><span class="ft-copyright-text">2015 <a href="#" target="_blank">浙ICP备05000063号</a></span></div>
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


