<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.liufeng.course.util.ZghTools"%>

<%
//拉人点赞页

//关于回调

//如有朋友圈转发点开来的还是我自己点，那就不回调
//如果不是我自己点才回调
//回调后应该是调到另外一个助力页面

//String openid =request.getParameter("openid");
String bzlopenid =request.getParameter("bzlopenid");

//获取当前是第几个记录
int hqpx=ZghTools.GetNoMerObkect(bzlopenid);

String temp = bzlopenid+"|"+hqpx;
 

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
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet7&response_type=code&scope=snsapi_userinfo&state="+temp+"#wechat_redirect");        
   
   }
   
   
   //yqfb_openid 没有存在要回调
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet7&response_type=code&scope=snsapi_userinfo&state="+temp+"#wechat_redirect");        
   
   
   }
  
  
  String px = "0";
if(request.getParameter("px")!=null){
	px=request.getParameter("px");
}

  
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>清明祭扫，不烧纸钱不放鞭炮！<%=ZghTools.GetNick(bzlopenid)%>正在追思故亲，邀你来献花！</title>
<script src="js/meta.js"></script>
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/memorial3.css">
<script src="js/jquery.min.js"></script>
<script src="js/jquery.js"></script>
<!--<script src="js/memorial.js"></script>-->
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
				width: 360px!important;
				height: 280px!important;
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
</head>
<body>

<div id="mcover" onClick="weChat()" style="display: none;">
          <img src="js/tip.png">
</div>

<div class="wrap">
    <ul class="tabUl">
        <li class="tabli fl" onClick="javascript:location.href='http://v.yqcn.com/bmwj/asp/h5/gt31/index.asp'">
            <img class="verticl" src="images/01.png" alt="">
     
        </li>
        
        <li class="tabli fr">
            <img class="verticl" src="images/02.png" alt="">
            
        </li>
    </ul>

    <!--1-->
    <div class="main1" id="commitShow1">
        <div class="container1">
            <ul>
                <li class="formLi center">
                    <img src="images/06.png" alt="">
                </li>
                <li class="formLi center">
                    <img class="vertical" src="images/07.png" alt="">
                    <span class="flower">鲜花</span>
                </li>
                <li class="formLi">
                    <span class="merLeft">祭奠对象：</span>
                    <input type="text" id="merObkect" class="merObject">
                </li>
                <li class="formLi">
                    <span class="merLeft">祭奠人：</span>
                    <input type="text" id="merMan" class="merObject">
                </li>
                <li class="formLi empty"></li>
            </ul>
            <div class="btn" id="commitY">确认提交</div>
        </div>
    </div>
    <!--2-->
    <div class="main1 main2" id="commitShow2">
        <div class="container1">
            <div class="title">
                                        亲爱的<span class="name"><%=ZghTools.GetMerObkect(bzlopenid,px)%></span>
            </div>
            <div class="empInfo">
			<%=ZghTools.GetMemo(bzlopenid,px)%>
            </div>
            
        <%if(zlsession!=null){ %>
		
		
		<%if(zlsession.equals(bzlopenid)){ %>
		
		  <div class="flowsValue">
                <div class="letFlow"  onClick="javascript:window.open('zl.jsp?bzlopenid=<%=bzlopenid%>&zlopenid=<%=zlsession %>&px=<%=px %>','_self')">
                    <img class="vertical" src="images/11.png" alt="">
                    
                    <%if(ZghTools.Isdz(bzlopenid,zlsession)){ %>
                  	<span class="flower">您已献花</span>
                    <%} %>
                    
                    <%if(ZghTools.GetZlopenid(bzlopenid).equals("0")){ %>
                    <span class="flower">已有0人送上鲜花</span>
                    
                    <%}else{ %>
                    <span class="flower">已有<%=ZghTools.GetNoXh(bzlopenid) %>人送上鲜花</span>
                    
                    <%} %>
               </div>
            </div>
		   
		<%}else if(ZghTools.IsHelp(bzlopenid,zlsession)){%>
		
			 <div class="flowsValue">
                <div class="letFlow"  onClick="javascript:window.open('zl.jsp?bzlopenid=<%=bzlopenid%>&zlopenid=<%=zlsession %>&px=<%=px %>','_self')">
                    <img class="vertical" src="images/11.png" alt="">
                    
                    <%if(ZghTools.Isdz(bzlopenid,zlsession)){ %>
                  	<span class="flower">您已献花</span>
                    <%} %>
                    <%if(ZghTools.GetZlopenid(bzlopenid).equals("0")){ %>
                    <span class="flower">已有0人送上鲜花</span>
                    
                    <%}else{ %>
                    <span class="flower">已有<%=ZghTools.GetNoXh(bzlopenid) %>人送上鲜花</span>
                    
                    <%} %>
               </div>
            </div>
			
		<%}else{ %>
            
            
		   	<div class="flowsValue">
                <div class="letFlow"  onClick="javascript:window.open('zl.jsp?bzlopenid=<%=bzlopenid%>&zlopenid=<%=zlsession %>&px=<%=px %>','_self')">
                    <img class="vertical" src="images/11.png" alt="">
                    
                    <%if(ZghTools.Isdz(bzlopenid,zlsession)){ %>
                  	<span class="flower">您已献花</span>
                    <%} %>
                    <%if(ZghTools.GetZlopenid(bzlopenid).equals("0")){ %>
                    <span class="flower">已有0人送上鲜花</span>
                    
                    <%}else{ %>
                    <span class="flower">已有<%=ZghTools.GetNoXh(bzlopenid) %>人送上鲜花</span>
                    
                    <%} %>
               </div>
            </div>
            
        <%} %>
            
		<%} %>	    
            
            
	
                 <span class="come">到访追思：</span>
            
            <div class="empInfo2">
			<%=ZghTools.GetNickNameForHtml(bzlopenid) %>
            </div>
			
            <div class="lineEmp">
			   
                <span class="fr">发起人：<span class="Launch"><%=ZghTools.GetNick(bzlopenid) %></span></span>
            </div>
        </div>
    </div>

    <footer class="fixedMain">
        <div class="mymemor">
            <img src="images/09.png" alt="" onClick="button2();">
        </div>
		 
        <img class="logo" src="images/05.jpg" alt="" onClick="javascript:location.href='https://file762d99333146.iamh5.cn/v3/idea/JvUPUUWt'">
		
    </footer>
	
	<footer class="fixedMain2">
        
        <img class="logo2" src="images/logo.png" alt="">
		
    </footer>
	
</div>


</body>
</html>