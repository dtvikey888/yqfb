<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%
String urlname ="jg/UP.jsp";
String openid =request.getParameter("openid");
//out.println("openid="+openid);

String ympath=AllValus.ympath;

String twbsession1 = (String)session.getAttribute("twbsession1");

//out.println("twbsession1="+twbsession1);

if(twbsession1!=null){
   
      if(twbsession1.equals(openid)){
      
   	      //out.println("你是自己点的，不回调");
   	     
   	      
      }else{
        
            //out.println("其他人点了以后，不回调");
            response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet24&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
  
      }
   
   }else{
   
  		    //还没点要回调
            response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet24&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
  
   }

   ZghTools.ClearNull3();
   
   //out.println(openid);
   
  // out.println("isws:"+ZghTools.IsWs("oSX6kjlwIvpFGl2Ws8TN5Ggxd7Ak"));
   
   if(openid!=null){
   
   if(!ZghTools.IsWs(openid)){

	   out.println("<script>window.location.href='User.jsp?openid="+openid+"'</script>");

   }
   
   }
   
   String check=Topay.WxJsApiCheck4(urlname,openid);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/<c>1999/xhtml">
<head>
<script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
		<script type="text/javascript">
		 wx_share_title="<%=AllValus.title1 %>";
         wx_share_desc="<%=AllValus.desc %>";
         wx_share_link="<%=AllValus.thelink %>";
         wx_share_imgUrl="<%=AllValus.nopicpath %>";
         
         wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    <%=check%>,// 必填，签名，见附录1
		    jsApiList: ['updateTimelineShareData','updateAppMessageShareData','chooseImage','previewImage','uploadImage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		wx.ready(function(){
		   //alert("config ok...");
		    //隐藏右上角菜单接口
		   	  wx.hideOptionMenu();
		   
			    wx.checkJsApi({
           jsApiList: [
             'getNetworkType',
             'previewImage',
             'updateTimelineShareData',
             'chooseImage',
             'updateAppMessageShareData',
           ],
           success: function (res) {
             //alert(JSON.stringify(res));
           }
          });
          
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
        alert(JSON.stringify(res));
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
		wx.error(function(res){
			//alert(res);
		    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		});

		function callpay(){
			wx.chooseImage({
			    jsApiList: ['updateTimelineShareData','updateAppMessageShareData','chooseImage','previewImage','uploadImage'], // 检查微信接口是否可用
			     success: function (res) {
        				var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
   					 }
			    });

		}
		
		 // 5 图片接口
    // 5.1 拍照、本地选图
     var images = {
        localId: [],
         serverId: []
    };
    
		function chooseimg(){
			wx.chooseImage({
			    jsApiList: ['chooseImage'], // 检查微信接口是否可用
			     success: function (res) {
        				//var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
						 images.localId = res.localIds;
	                	 var image = document.createElement("img");
	                     image.src = res.localIds;
	                     image.width=100;
	                     image.height=90;
	                     document.querySelector("#imageList").innerHTML="";  //先清空内容
	               		 document.querySelector("#imageList").appendChild(image);
	               		 
	               		 uploadimg();
   					 }
			    });
			    
			    
			    
		}
		
		
		function uploadimg(){
		
		    if(images.localId.length <= 0){
  		    alert("请选择照片");
  		    return false;
  	       }
  	       	var i = 0, len = images.localId.length;
		
			wx.uploadImage({
			    jsApiList: ['uploadImage'], // 检查微信接口是否可用
			    localId: images.localId[i], // 需要上传的图片的本地ID，由chooseImage接口获得
    			isShowProgressTips: 1, // 默认为1，显示进度提示
			     success: function (res) {
        				i++;
		  			    images.serverId.push(res.serverId);
		  			    if(i<len){
		  				upload();
		  			   }
		  			   
		  			   //添加到 med2
		  			   dd=res.serverId;
		  			   addmed2(dd);
		  			   
		  			  // var e = document.createElement("input");
		  			  // e.name= "med";
             		  // e.type = "text";
            		 //  e.value = res.serverId;
	               	 //  document.querySelector("#textList").appendChild(e);

	               	  // alert("上传照片成功,现在可以点提交按钮!");
	               	   
   					 },
   				  fail: function(res){
	  			  alert(JSON.stringify(res));
	  		      }
			    });
   
		}
		
		
	function addmed2(dtt){
		   
		document.getElementById("med2").value=dtt;
		   
	}
	
	
	
	// 2.2 监听分享到朋友圈按钮点击、自定义分享内容及分享结果接口
  function  sharefriendRound2() {
     //显示右上角菜单接口
       wx.showOptionMenu();
	   
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
       // alert(JSON.stringify(res));
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
    
  };
  
  
  
  
   
	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport"/>
<title>庆祝建国70周年系列活动 晒晒你和光阴的故事</title>
<style>
 @font-face {
    font-family: wing;
    src: url("font/simkai.ttf")
} .wing{
    font-family: wing;
    color:#AA00FF;
}
</style>
<style>
body{
 font-size:12px;
 font-family:微软雅黑;
 background:url(IMG/top.png); 
 padding:0px;
 margin:0px;
 }
a{text-decoration:none; color:#000000;}
a:hover{ color:#d73615; text-decoration:none;}
p{text-indent:2em;}
m{font-size:45px; color:#ffffff;}
c{font-size:35px; font-family:Arial;}
d{color:#ffffff; text-indent:2em;}
e{color:#b1b1b1;}
.style23 {color: #CCCCCC; font-size: 14px; }
.style24 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 25px;
	
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
				width: 480px!important;
				height: 780px!important;
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
				right: 10px;
				top: 10px;
				width: 380px!important;
				height: 550px!important;
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
  //关闭等待窗口
function closediv() {
    //Close Div 
    document.body.removeChild(document.getElementById("bgDiv"));
    document.getElementById("msgDiv").removeChild(document.getElementById("msgTitle"));
    document.body.removeChild(document.getElementById("msgDiv"));
}
//显示等待窗口
function showdiv(str) {
    var msgw, msgh, bordercolor;
    msgw = 400; //提示窗口的宽度 
    msgh = 100; //提示窗口的高度 
    bordercolor = "#336699"; //提示窗口的边框颜色 
    titlecolor = "#99CCFF"; //提示窗口的标题颜色 

    var sWidth, sHeight;
    sWidth = window.screen.availWidth;
    sHeight = window.screen.availHeight;

    var bgObj = document.createElement("div");
    bgObj.setAttribute('id', 'bgDiv');
    bgObj.style.position = "absolute";
    bgObj.style.top = "0";
    bgObj.style.background = "#777";
    bgObj.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
    bgObj.style.opacity = "0.6";
    bgObj.style.left = "0";
    bgObj.style.width = sWidth + "px";
    bgObj.style.height = sHeight + "px";
    document.body.appendChild(bgObj);
    var msgObj = document.createElement("div")
    msgObj.setAttribute("id", "msgDiv");
    msgObj.setAttribute("align", "center");
    msgObj.style.position = "absolute";
    msgObj.style.background = "white";
    msgObj.style.font = "12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
    msgObj.style.border = "1px solid " + bordercolor;
    msgObj.style.width = msgw + "px";
    msgObj.style.height = msgh + "px";
    msgObj.style.top = (document.documentElement.scrollTop + (sHeight - msgh) / 2) + "px";
    msgObj.style.left = (sWidth - msgw) / 2 + "px";
    var title = document.createElement("h4");
    title.setAttribute("id", "msgTitle");
    title.setAttribute("align", "right");
    title.style.margin = "0";
    title.style.padding = "3px";
    title.style.background = bordercolor;
    title.style.filter = "progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
    title.style.opacity = "0.75";
    title.style.border = "1px solid " + bordercolor;
    title.style.height = "18px";
    title.style.font = "12px Verdana, Geneva, Arial, Helvetica, sans-serif";
    title.style.color = "white";
    //title.style.cursor = "pointer";
    //title.innerHTML = "关闭";
    //title.onclick = closediv;
    document.body.appendChild(msgObj);
    document.getElementById("msgDiv").appendChild(title);
    var txt = document.createElement("p");
    txt.style.margin = "1em 0"
    txt.setAttribute("id", "msgTxt");
    txt.innerHTML = str;
    document.getElementById("msgDiv").appendChild(txt);
}
//屏蔽F5
document.onkeydown = mykeydown;
function mykeydown() {
    if (event.keyCode == 116) //屏蔽F5刷新键   
    {
        window.event.keyCode = 0;
        return false;
    }
}  
</script>

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
  <%if(twbsession1.equals(openid)){%>
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

<div id="mcover2" onClick="weChat2()" style="display: none;">
   <img src="IMG/tip.png"/>
</div>

<table width="100%" border="0" cellspacing="15">
  <tr>
    <td><table width="100%" border="0">
        <tr>
          <td><img src="IMG/totu.png" width="100%" /></td>
        </tr>
    </table></td>
  </tr>
</table>

<form id="form1" name="form1" method="post" action="sc_chk.jsp" >
	 <input type="hidden" name="openid" value="<%=openid%>"/>
	 <input type="hidden" id="med2" name="med2" value=""/>
<table width="100%"  border="0">
  <tr>
    <td><table width="90%" height="80%" align="center" cellspacing="5">
      <tr>
        <th height="30" align="center" bordercolor="#EC6941" scope="row">
        <input type="text" name="memo"  placeholder=" 标题（14字以内）"  style="border:1px solid #294121;border-radius:10px;border-color:#294121;width:100%;height:50px;font-size:18px;"/>
        
        </th>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%"  border="0">
  <tr>
    <td><table width="90%" height="80%" align="center" cellspacing="5">
      <tr>
        <th height="30" align="center" bordercolor="#EC6941" scope="row">

        <textarea name="story" placeholder="故事（200字以内）" rows="5"   style="border:1px solid #294121;border-radius:10px;border-color:#294121;width:100%;height:150px;font-size:18px;"></textarea>
        </th>
      </tr>
    </table></td>
  </tr>
</table>
<table width="90%"  border="0" align="center">
  <tr>
    <td width="87%"><table width="111" height="97" border="0">
      <tr>
        <td align="center" bgcolor="#fff"><table width="60" border="0">
          <tr >
            <td>
            <div onClick="chooseimg()">
            <img src="IMG/007.png" width="77" height="77" id="s1"/>
            <div id="imageList"></div>
			<div id="textList"></div>
			</div>
            </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="13%" align="right">&nbsp;</td>
  </tr>
</table>
<!--  
<table width="90%" height="40" border="0" align="center" bordercolor="#C6B798">
  <tr>
    <td valign="bottom"><table width="100%" border="0">
      <tr>
        <td><img src="IMG/08.png" width="100%" /></td>
      </tr>
    </table></td>
  </tr>
</table>-->
<table width="90%" height="40" border="0" align="center" bordercolor="#C6B798">
  <tr>
    <td valign="bottom"><table width="100%" border="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="90%"  border="0" align="center">
  <tr>
    <td width="90%">
 			 <select name=lb style="border:1px solid #294121;border-radius:10px;border-color:#294121;width:100%;height:50px;font-size:18px;">
			    <option value="">选择类型</option>
				<option value="1">时光相册</option>
				<option value="2">我爱北京天安门</option>
				<option value="3">乐清地标</option>
				<option value="4">光阴故事</option>
			  </select>

    </td>
  </tr>
</table>
<table width="70%" height="10" border="0" align="center" cellspacing="30">
  <tr>
    <td align="center" bgcolor="#C62619" style="border-radius: 15px;">
    <div onClick="document.form1.action='sc_chk.jsp';if(DataLength(form1.memo.value)<2){alert('请填写标题');form1.memo.focus();return false};if(DataLength(form1.memo.value)>28){alert('标题字数超限');form1.memo.focus();return false};if(DataLength(form1.lb.value)<1){alert('请选择分类');form1.lb.focus();return false};if(DataLength(form1.story.value)<2){alert('请填写故事');form1.story.focus();return false};if(DataLength(form1.story.value)>228){alert('故事字数超限');form1.story.focus();return false};showdiv('数据提交中，请稍等');document.form1.submit();">
    <span class="style24">&nbsp;&nbsp;&nbsp;&nbsp;发&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;表&nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
    </td>
    <td align="center" bgcolor="#C62619" style="border-radius: 15px;">
    <div onClick="sharefriendRound2();button3();">
    <span class="style24">&nbsp;&nbsp;&nbsp;&nbsp;分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;享&nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
    </td>
  </tr>
</table>
</form>


<p>&nbsp;</p>
<p>&nbsp;</p>
</div>
</body>
</html>
