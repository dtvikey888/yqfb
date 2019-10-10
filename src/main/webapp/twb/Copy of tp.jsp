<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<jsp:useBean id="sqlbean" scope="page" class="org.fjw.weixin.util.MysqlDB"/>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%
	//控制时间
	int kz =0;
	String tt1=AllValus.tw1;
	String tt2=AllValus.tw2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //开始抽奖
    //2: //抽奖已经结束,感谢关注！
    //3: //抽奖还没开始呢！
    //out.println(kz);
%>


<%

String openid =request.getParameter("openid");
//out.println("openid="+openid);


String twbsession1 = (String)session.getAttribute("twbsession1");

//out.println("twbsession1="+twbsession1);

if(twbsession1!=null){
   
      if(twbsession1.equals(openid)){
      
   	      //out.println("你是自己点的，不回调");
   	     
   	      
      }else{
        
          //out.println("其他人点了以后，不回调");
           response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet16&response_type=code&scope=snsapi_base&state=1#wechat_redirect");        
  
      }
   
   }else{
   
  		//还没点要回调
         response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet16&response_type=code&scope=snsapi_base&state=1#wechat_redirect");        
  
   }
   
   ZghTools.upyt2(openid);
   
   ZghTools.ClearNull2();
   
%>

<!-- saved from url=(0038)http://i.meituan.com/orders/haverefund -->
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta charset="utf-8">
    <link href="http://p0.meituan.net/" rel="dns-prefetch">
    <link href="http://p1.meituan.net/" rel="dns-prefetch">
    <link href="http://ms0.meituan.net/" rel="dns-prefetch">
    <link href="http://mc.meituan.net/" rel="dns-prefetch">
    <title>乐清市"最美退伍兵"网络评选</title>
    <meta name="description" content="微信投票-最美退伍兵">
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1" media="(device-height: 568px)">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="full-screen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
	
	<script type="text/javascript">
		   	  
		  <%
		     // 根据起止时间判断是否关闭窗口 ，弹出提醒窗
		  // kz=1 开始抽奖(不关) kz=2 抽奖结束(关闭) kz=3 抽奖没开始（关闭）
		  
		   if (kz==1){
		   
		   
		  %>
		  //alert("开始");
		  
		  <%}else if(kz==2){
		   
		  
		  %>
		  
            alert('非常抱歉，投票时间已过。感谢您的关注，请下次再来！');
            window.location.href="http://www.yqrb.com.cn/yqfb/twb/success.jsp";
            
		  <%}else if(kz==3){
		  
		  
		  %>
		  
           alert('还没开始呢，"开始投票时间<%=tt1%>"到"<%=tt2%>"！\n欢迎到时候参与！');
           window.location.href="http://www.yqrb.com.cn/yqfb/twb/success.jsp";
          
		  <%}else{
		      
		  
		   %>
		  
		     alert('感谢关注！');
           
		  <%} %>

		</script>
	
	
<link type="text/css" rel="stylesheet" href="./css/other10.css">
<style type="text/css"> 
*{margin:0;padding:0;}

.main-left4{
    width:45%;
    height:55%;
    float:left;
	margin-left:5px;
	margin-top:20px;
	border:1px solid #CCCCCC;
}
.main-right4{
    width:45%;
    height:55%;
    float:right;
	margin-right:5px;
	margin-top:20px;
	border:1px solid #CCCCCC;
}

.main-left{
    width:47%;
    height:55%;
    float:left;
	margin-left:5px;
	margin-top:20px;
	border:1px solid #CCCCCC;
}
.main-right{
    width:47%;
    height:55%;
    float:right;
	margin-right:5px;
	margin-top:20px;
	border:1px solid #CCCCCC;
}

.main-left2{
    width:60%;
    height:100%;
	text-indent:1em;
    float:left;
}
.main-right2{
    width:30%;
    height:100%;
    float:right;
}


.main-left3{
    width:63%;
    height:100%;
	text-indent:1em;
    float:left;
	margin-left:-8px;
	margin-top:-18px;
	margin-bottom:6px;
}
.main-right3{
    width:32%;
    height:100%;
    float:right;
	margin-right:10px;
	margin-top:-18px;
	margin-bottom:6px;
}
.xuanfu{
	left: 0;
	position: fixed;
	bottom: 0;//这里换成top:0;就悬浮在头部
	width: 100%;
	z-index: 100;
	background-color:#FFFFFF;
}

</style>

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
				right: 30px;
				top: 50px;
				width: 300px!important;
				height: 350px!important;
				z-index: 20001;
			 }
			 
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
				right: 16px;
				top: 10px;
				width: 330px!important;
				height: 510px!important;
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
		
		

<script>

function rule(){

   alert('        本次评选活动，将本着公开、公平、公正的原则，三大系列*个（位）候选单位（人），以同系列中的文字笔画为序。\n        投票环节采取专家评审与社会评选相结合的方式进行公正的评选，网友可以通过本期专题详细了解*位候选单位（人）的风采，并为你心目中的“最美”投上支持的一票。\n        投票包含网络投票（占20%的权重）和专家投票（占80%权重），最终将各方投票结果汇总，依据得票排名产生“十大最美”系列获奖名单。\n        为规范投票行为，预防恶意投票现象的产生，保障所有参选个人在公平公正的环境下接受社会投票。特制定如下投票规则：\n        1、投票时间：11月21-24日\n        2、每个ID每天可以给三大系列各投票一次，每次投票选择不少于3个（位），不超过5个（位）。\n        3、每个ID投票完毕转发朋友圈后才可抽奖。温州地区的移动、联通、电信用户均可抽奖，活动结束后由运营商统一充值。\n        4、系统具有投票日志分析系统和报警系统，如果发现刷票行为，将视作无效投票，取消投票成绩。\n        5、本次评选的最终结果将在乐清日报、乐清发布微信公众号、中国乐清网上同步公布。');

}

function mrts(){

   alert('您今日已经投完，请明日再来投票！');

  // document.getElementById("div_gz").style.display="";
   //alert(document.getElementById("div").style.display)
   
}

</script>


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

</head>
<body>
<%if(twbsession1!=null){%>
  <%if(twbsession1.equals(openid)){ %>
  <div id="contentid"  style="display:block">
  <%}else{ %>
  <div id="contentid"  style="display:none">
  <%} %>
<%}else{ %>
<div id="contentid"  style="display:none">
<%} %>


<div id="mcover" onClick="weChat()" style="display: none;">
          <img src="css/image/button/sc5.png">
   </div>
   
   
   <div id="mcover2" onClick="weChat2()" style="display: none;">
          <img src="css/image/button/tip9.jpg">
   </div>


<%
int firstgz=0;
int yt=0;

if(ZghTools.IsCz4(openid)){

    yt=ZghTools.GetYt2(openid);

}else{
   
    firstgz=1;

}
//out.println(ZghTools.IsCz4(openid));
//out.println(ZghTools.GetYt2(openid));
%>
<div><img src="images/logo12.png" style="width:100%"/></div>

<div id="tips"></div>
<form name="form1" method="get" action="sc_tp.jsp">

<div class="body p-0">

   <ul class="ml-deal orders" id="orders">
	
<% 
String sql="select * from yqcnwx_twb order by bh asc";
ResultSet RS=sqlbean.executeQuery(sql); 
if(RS.wasNull()) out.print("<br><font face=Arial color=navy size=2><b>当前暂无新内容</b></font>");
%>
<%
int intPageSize; //一页显示的记录数
int intRowCount; //记录总数
int intPageCount; //总页数
int intPage; //待显示页码
java.lang.String strPage;
int i;
//设置一页显示的记录数
intPageSize = 100;
//取得待显示页码
strPage = request.getParameter("page");
if(strPage==null){//表明在QueryString中没有page这一个参数，此时显示第一页数据
intPage = 1;
}
else{//将字符串转换成整型
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1;
}
RS.last();
intRowCount = RS.getRow();
//记算总页数
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
//调整待显示的页码
if(intPage>intPageCount) intPage = intPageCount;
if(intPageCount>0){
//将记录指针定位到待显示页的第一条记录上
RS.absolute((intPage-1) * intPageSize + 1);
//显示数据
i = 0;%>

<%	while((i<intPageSize && !RS.isAfterLast()))
{
String bh,ps,title,title2,id;

id = RS.getString("id");
title = RS.getString("title");
ps = RS.getString("ps");
bh = RS.getString("bh");

if(title.length()>10){
   title2=title.substring(0,10);
}else{
   title2=title;
}

String images ="";
images = RS.getString("img1");
String images2="";
if(images.length()>0 && !images.equals("no.gif") ){
images2 = "http://v.yqcn.com/bmwj/asp/sxbook/download3/"+images;
}else{
images2 = "http://info.yqcn.com:7001/ADV/uploadfiles/video/no.gif";
}

%>

<%if((i%2)==0){%>
<div class=main-left4>
<%}else{%>
<div class=main-right4>
<%}%>

<div style="text-indent:1em;padding-top:3px;">编号: <%=bh%></div>
<div style="text-indent:1em; padding-top:9px;"><a href="http://www.yqrb.com.cn/yqfb/show5.jsp?id=<%=id%>&openid=<%=openid%>"><img src="<%=images2%>" height="160" width="130"/></a></div>

<div style="padding-top:8px; font-size:13px;" align="center">
<%=title2%>
<div style="text-indent:1em;">&nbsp;</div>
</div>

<div style="padding-top:8px;">
<div class="main-left2">票数：<%=ps%></div>

<div class="main-right2">

<%if(yt==1){%>
<img src="css/image/button/yt.png" width="43px;"/>
<%}else{%>
<%if(bh.equals("003")||bh.equals("015")||bh.equals("017")||bh.equals("020")) {%>

<%}else{ %>

<input type="checkbox" name="ArticleId" value="<%=id%>" style="width:23px;height:23px; border:#666666 solid 1px;" />
<%}%>
<%}%>

</div>

</div>
</div>

<%
RS.next();
i++;}
}
RS.close();
%>	




    </ul>


</div>

<div style="margin-top:150px;"></div>

   <div class="xuanfu">
     <div align="center" style="padding-bottom:20px; margin-top:30px;">
	 <div class="main-left3">
	 
	 <%if(firstgz==1){%>
	 
	 <div onClick="button2();">
	 <img src="css/image/button/tp.png" width=100% height=44>
	 </div>
	
	 <%}else{%>
	 
	 <%if(yt==1){%>
	 
	 <div onClick="mrts();"><img src="css/image/button/zt.png" width=100% height=44></div>
	 
	 <%}else{%>
	 
	 <input target="_self" type="image" border="0" name="sub22" src="css/image/button/tp.png" width=100% height=44>
	 
	 <%}%>
	 
	 
	 <%}%>
	 </div>
	 <div class="main-right3"  onClick="button3();"><img src="css/image/button/rule.png" width=100% height=44></div>
	 </div>
	 <input name="openid" type="hidden" id="openid" value="<%=openid%>">
   </div>
</form>
</div>

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