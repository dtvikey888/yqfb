<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.fjw.weixin.util.MyUtils24"%>
<%
String id1 = request.getParameter("id");
//out.println("id1="+id1);
String openid = request.getParameter("openid");
//out.println("openid="+openid);

String state = request.getParameter("state");
//out.println("state="+state);

String op = request.getParameter("op");
//out.println("op="+op);


if(openid==null){
   session.setAttribute("id1_session",id1);
}

String id1_session = (String)session.getAttribute("id1_session");
//out.println("id1_session="+id1_session);

if(id1_session!=null){
    if(MyUtils24.iscz(MyUtils24.GetOpenid(id1_session))==false){
        //out.println("<script>alert('请先填写用户信息！');window.location.href='tj.jsp'</script>");
        out.println("<script>window.location.href='tj.jsp'</script>");
    }
   
}

String id2 = request.getParameter("id2");
//out.println("id2="+id2);

String bz="0";
if(request.getParameter("bz")!=null){

    bz=request.getParameter("bz");

}



//out.println("bz="+bz);

if(bz.equals("1")){

}else{

if(id2==null){

   if(id1_session!=null){
   
      
          if(id1_session.equals(id2)){
   	      //out.println("你是自己点的，不回调");
          }else{
          //out.println("其他人点了以后，不回调");
           //response.setHeader("Refresh","1;url=http://xadmin.yqcn.com/yqw/checkwx1.php");
          }
     

   
   }else{
  		//还没点要回调
        response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/wmyqwx/yqw/checkwx1.jsp?st=3");
   }

}else{

    if((String)session.getAttribute("state_session")==null){
    
         session.removeAttribute("bz_session");
         response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/wmyqwx/yqw/checkwx2.jsp?st="+op+"");
         
    }else{
    
         if(!op.equals((String)session.getAttribute("state_session"))){
         
          session.removeAttribute("bz_session");
         response.setHeader("Refresh","1;url=http://www.yqrb.com.cn/wmyqwx/yqw/checkwx2.jsp?st="+op+"");
         
         }
    }
}

}

//out.println("state_session="+(String)session.getAttribute("state_session"));


String name1 = request.getParameter("name1");
String headimg = request.getParameter("headimg");
String id1_session_hd = "";

if(openid!=null){

   id2 = MyUtils24.Rk(openid,name1,headimg);
   id1_session_hd = (String)session.getAttribute("id1_session");
   
   if(id1_session_hd==null){
   
       id1_session_hd=id2;
       
   }

      response.setHeader("Refresh","1;url=index.jsp?id="+id1_session_hd+"&id2="+id2+"&share=1&state="+state+"&op="+openid+"");
   
   
   
}

String hdimg="";
String nickname="";
if(id1!=null){
	hdimg=MyUtils24.GetHeadImg(id1);
	nickname=MyUtils24.GetName1(id1);
}



//写入库并且返回参数id
//response.setHeader("Refresh","1;url=rl.jsp?openid="+openid+"&name1="+name1+"&headimg="+headimg+"");

%>
<html>
<head>
<title>倡导绿色生活,反对铺张浪费。快来响应<%=MyUtils24.GetName1(id1_session) %>的倡议</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<meta name="description" content="倡导绿色生活">
<meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
<meta name="viewport" content="initial-scale=1,user-scalable=no,maximum-scale=1" media="(device-height: 568px)">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="full-screen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background:#F7F7F7;
}

#center{
height:530px;
}

#cen1{
height:530px;
background:url(images/cen1.png) no-repeat center 0; background-size:300px 520px;
}

#cen2{
padding-top:3px;
height:50px;
background:url(images/top2.png) no-repeat center 0;background-size:250px 50px;
}

#cen3{
margin-top:400px;
text-align:center;
}

.div-inline{display:inline;padding-left:3px;} 

#footer{
margin-top:20px;
}

#xytu{
height:530px;
}

#xybg{
height:530px;
background:url(images/xybg.png) no-repeat center 0; background-size:300px 520px;
}

#xybgtop{
height:50px;
background:url(images/xybgtop.png) no-repeat center 0;background-size:250px 50px;
}


#cen4{
margin-top:20px;
text-align:center;
}

.circle{
width:30px;
height:30px;
border-radius:50%;
-moz-border-radius:50%;
-webkit-border-radius:50%;
border:1px white solid;
}

.main{
    text-align: center; /*让div内部文字居中*/
    border-radius: 20px;
    width: 300px;
    height: 350px;
    margin: auto;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}
-->
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
				height: 400px!important;
				z-index: 20001;
			 }
			
        </style>


        <script type="text/javascript">
			function button1(){
			$("#mcover").css("display","block")    // 分享给好友按钮触动函数
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
<%=id1_session_hd %>
xxx
<%=id2 %>
<%if(id1_session!=null){%>

<%if(MyUtils24.IsGz(id1_session)==false){ %>

<div id="mcover" style="display: block;">
   <img src="images/ct.png">
</div>

<%} %>
<%} %>

<%

String bz_session = (String)session.getAttribute("bz_session");
//out.println("bz_session= "+bz_session);

 %>
<%if("1".equals(request.getParameter("bz"))){%>
  <div id="contentid"  style="display:block">
<%}else if(bz_session!=null){%>
  <div id="contentid"  style="display:block">
<%}else{%>
<div class="main">
<img src="images/loading.gif"/>
</div>
<div id="contentid"  style="display:none">

<%}%>

<div id="mcover" onClick="weChat()" style="display: none;">
   <img src="images/tip.png">
</div>

<div>
<img src="images/top.png" width="100%"/>
</div>
<div id="center">
  <div id="cen1">
    <br/>
    <div id="cen2">
       <table width="100%" border="0" cellspacing="2" cellpadding="2">
  		 <tr>
   		   <td width="33%">
   		   <div align="right"><img src="<%=hdimg%>" width=30px; height=30px; style="border-radius:3px 4px 5px 6px;border:1px white solid;"/></div>
   		   </td>
    		<td width="67%"><div style="font-size:16px;font-weight:bold;color:white;"><%=nickname%>发起倡议书</div></td>
  		 </tr>
      </table>
    </div>
    <div id="cen3">
    <%if(id1!=null){ %>
      <div class="div-inline" onClick="javascript:window.open('do.jsp?id1=<%=id1%>&id2=<%=id2%>')"><img src="images/btn3.png" width="85px;" height="35px;"/></div> 
	  
	  <%if(request.getParameter("share")!=null){ %>
	  <div class="div-inline" onClick="button1();"><img src="images/btn7.png" width="85px;" height="35px;"/></div> 
	  <%}else{ %>
	  <div class="div-inline" onClick="javascript:window.open('index.jsp')"><img src="images/btn1.png" width="85px;" height="35px;"/></div> 
	  <%} %>
	  
      <div class="div-inline" onClick="javascript:window.open('rul.jsp?op=<%=op %>')"><img src="images/btn5.png" width="85px;" height="35px;"/></div> 
    <%}else{ %>
      <div class="div-inline"><img src="images/btn1.png" width="85px;" height="35px;"/></div> 
	  <div class="div-inline" onClick="javascript:window.open('rul.jsp')"><img src="images/btn5.png" width="85px;" height="35px;"/></div> 
      <div class="div-inline" onClick="javascript:window.open('phb.jsp')"><img src="images/btn4.png" width="85px;" height="35px;"/></div> 
    <%} %>
     
    </div>
  </div>
</div>

<%if(MyUtils24.GetPerNum(id1)!=0){%>
<div id="xytu">
<div id="xybg">
<br/>
<div id="xybgtop">
 <div style="padding-left:130px;padding-top:12px;">响应人数<%=MyUtils24.GetPerNum(id1)%>人</div>
</div>

<div id="cen4">
    <%if(id1!=null){ %>
    
    <% 
    
    out.println(MyUtils24.GetHtmlZLPER(id1));
    
    %>
      
    <%}%>
</div>

</div>
</div>
<%} %>

<div id="footer">
<img src="images/bot.png" width="100%"/>
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