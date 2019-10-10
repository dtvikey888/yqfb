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
  
  
  if(ZghTools.IsCz2(bzlopenid)&&ZghTools.IsCz3(bzlopenid)){
  
  
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
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet15&response_type=code&scope=snsapi_base&state="+bzlopenid+"#wechat_redirect");        
   
   }
   
   
   //yqfb_openid 没有存在要回调
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet15&response_type=code&scope=snsapi_base&state="+bzlopenid+"#wechat_redirect");        
   
   
   }
   
   }else{
   		response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/yqfb/lyzx/gd.jsp");  
   }
  
  ZghTools.upyt(zlsession);
  
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0058)file:///C:/Users/zpuser/Desktop/%E7%BD%91%E9%A1%B5/CYL.htm -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>
<title>乐清丽园装饰家装微心愿活动，为<%=ZghTools.GetXm2(bzlopenid)%>助力</title>
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


<style>
body{
	padding:0px;
	margin:0px;
	background-color: #FFFFFF;
}
td{font-size:14px;font-family:微软雅黑}
.style7 {
	font-size: 18px;
	font-weight: bold;
	color: #FFFFFF;
}
.style9 {
	font-size: 36px;
	font-weight: bold;
	color: #FFFFFF;
}
.style10 {color: #FFFFFF}
</style>

</head>
<%if(ZghTools.IsCz2(bzlopenid)==true){%>
<body style="background:url(img/to.png) no-repeat top center;background-size:100%;">
<div id="contentid"  style="display:block">
<%}else{%>
<body>
<div id="contentid"  style="display:none">
<%}%>
<div id="mcover" onClick="weChat()" style="display: none;">
    <img src="js/tip.png"/>
</div>
<table width="100%" height="102"  border="0">
  <tr>
    <th scope="row">&nbsp;</th>
  </tr>
</table>
<table width="95%" height="0"  border="1" align="center" cellspacing="0" bordercolor="#FFCC00" bgcolor="#FFFFFF">
  <tr>
    <td align="left"><img src="<%=ZghTools.GetImagSC2(bzlopenid)%>" width="100%" height="180px"/></td>
  </tr>
</table>
 <table width="100%"  border="0" cellspacing="0">
   <tr>
     <th width="20%" align="left" valign="middle" scope="row"><table width="60%"  border="0" cellspacing="0">
       <tr>
         <th scope="row"><div onClick="javascript:window.open('phb.jsp','_self')"><img src="img/15.png" width="100%" /></div></th>
       </tr>
     </table></th>
     <th scope="row"><table width="100%" height="94"  border="0" align="center">
       <tr>
         <td align="left"><span class="style7"><%=ZghTools.GetXm2(bzlopenid)%>心愿：</span></td>
       </tr>
       <tr>
         <td align="left"><span class="style10"><%=ZghTools.GetMemo(bzlopenid)%></span></td>
       </tr>
     </table>
       <table width="100%" border="0" align="center">
         <tr>
           <td width="75%" align="center"><table width="60%" border="0" align="center">
               <tr>
                 <td align="right">

		<%if(zlsession!=null){ %>
		<%if(ZghTools.GetPx(bzlopenid)!=0){ %>
		<img src="img/06.png" width="50%"/>
		<%} %>
		<%} %>

				</td>
                 <td align="left">
                 <span class="style9">
                    <%if(!ZghTools.GetNoZlz(bzlopenid).equals("0")){%>
         			 +<%=ZghTools.GetNoPx(bzlopenid)%>
        			<%}%>
				 </span></td>
               </tr>
           </table></td>
           <td width="25%" align="center">&nbsp;</td>
         </tr>
       </table>
       <table width="100%"  border="0" align="center">
         <tr>
           <td align="center"><p class="style10"><strong> 公司地址：乐清市清远路206号四楼<br />
        （时代广场对面）<br />
        咨询热线：0577-62567601</strong></p></td>
         </tr>
       </table>       
       <table width="100%" border="0" align="center">
         <tr>
           <td align="center"><table width="100%"  border="0">
               <tr>
                 <th scope="row">
                 
        <%if(zlsession!=null){ %>

		<%if(zlsession.equals(bzlopenid)){ %>
		
		<div><img src="img/17.png" width="100%" /></div>
	
		<%}else if(ZghTools.IsHelp2(bzlopenid,zlsession)&&ZghTools.GetYt(zlsession)!=0){%>
		
		    <%if(!zlsession.equals(bzlopenid)){ %>
		   
			<div><img src="img/18.png" width="100%" /></div>
			
		    <%}else{ %>
		   
		    <div><img src="img/17.png" width="100%" /></div>
		   
		    <%} %>
		<%}else{ %>
		    <%
		     // 根据起止时间判断是否关闭窗口 ，弹出提醒窗
		  // kz=1 开始抽奖(不关) kz=2 抽奖结束(关闭) kz=3 抽奖没开始（关闭）
		  
		   if (kz==1){

		    %>
		  
		    <div style="font-family:Arial; font-size:18px;" onClick="javascript:window.open('zl.jsp?bzlopenid=<%=bzlopenid%>&zlopenid=<%=zlsession %>','_self')"><img src="img/13.png" width="100%" /></div>
        
		   <%}else if(kz==2){
		   
		  
		  %>
		  <div><img src="img/17.png" width="100%" /></div>
		  <%}else if(kz==3){
		  
		  
		  %>
		  <div><img src="img/17.png" width="100%" /></div>
		  <%}else{
		      
		  
		   %>
		   <div><img src="img/17.png" width="100%" /></div>
		    <%} %>
		  
      
        <%} %>
		<%} %>	
                 
                 
                 </th>
               </tr>
           </table></td>
           <td align="center"><table width="100%"  border="0">
               <tr>
                 <th scope="row">
                  <%if(zlsession!=null){ %>
                 <div onClick="button2()"><img src="img/12.png" width="100%"/></div>
                 <%} %>
                 </th>
               </tr>
           </table></td>
         </tr>
       </table>       </th>
     <th width="20%" align="right" valign="middle" scope="row"><table width="60%"  border="0" cellspacing="0">
       <tr>
         <th scope="row"><div onClick="javascript:window.open('https://file762d99333146.iamh5.cn/v3/idea/NaNE3YYJ','_self')"><img src="img/14.png" width="100%" /></div></th>
       </tr>
     </table></th>
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


