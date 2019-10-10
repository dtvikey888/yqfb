<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.component.*"%>
<%
String urlname ="sc.jsp";
String openid =request.getParameter("openid");
String check=Topay.WxJsApiCheck4(urlname,openid);
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
	
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    <%=check%>,// 必填，签名，见附录1
		    jsApiList: ['chooseImage','previewImage','uploadImage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		wx.ready(function(){
		   //alert("config ok...");
		    //隐藏右上角菜单接口
		   	 // wx.hideOptionMenu();
		   
			    wx.checkJsApi({
           jsApiList: [
             'getNetworkType',
             'previewImage',
             'onMenuShareTimeline',
             'chooseImage',
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
			    jsApiList: ['chooseImage','previewImage','uploadImage'], // 检查微信接口是否可用
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
	                	 //var image = document.createElement("img");
	                     //image.src = res.localIds;
	                    // image.width=100;
	                   //  image.height=150;
	               		// document.querySelector("#imageList").appendChild(image);
	               		 //document.querySelector("#imageList2").display=none;
						 aa = res.localIds;
						 changeimg(aa); 
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

	               	   alert("上传照片成功!如果要更换照片请按加号！");
	               	   
   					 },
   				  fail: function(res){
	  			  alert(JSON.stringify(res));
	  		      }
			    });
   
		}
		
		
		function addmed2(dtt){
		   
		   document.getElementById("med2").value=dtt;
		   
		}
		
		function changeimg(dtt){
		   
		    document.getElementById("imageList").style.display=""
		    document.getElementById("imageList").src = dtt;
	        document.getElementById("imageList").width=120;
	        document.getElementById("imageList").height=100;
			//document.getElementById("imageList2").style.display="none";
		}
		
		
		
		

		</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	background-color: #efeff1;
}
-->
</style>
</head>
	

   <body id="signupverify" style="">
   <div  id="contentid">
    <header>
            <div class="left-box">
                <a class="hd-lbtn" href="http://www.yqrb.com.cn/yqfb/index.jsp?openid=oSX6kjlwIvpFGl2Ws8TN5Ggxd7Ak"><span>返回</span></a>
            </div>
        <h1><font color="#000000">乐清最美</font>笑脸<font color="#000000">大赛</font></h1>
    </header>

	
	
	  <form id="form1" name="form1" method="post"  enctype="multipart/form-data" action="sc_chk.jsp">


  <div align="center" style="padding-top:40px; padding-bottom:40px;">
  <table width="120px;" height="100px;" border="0" cellpadding="0" cellspacing="0" style="border:3px dashed #dd1c60; font-family:Arial; font-size:12px; color:#dd1c60 ">
              <tr>
                <td align="center" valign="middle"><div><img id="imageList"  width="100px;" height="100px;" style="display:none"/>请上传个人清晰完整，以正面脸部为主的笑脸照，集体照、全身照、侧面照、半脸照、虚化照无效。
</div>
	
      <input type="file" name="file"  value=''>
       </td>
              </tr>
  </table>
  
 </div>

<!--  
<div style=" margin-left:5px; margin-right:5px; padding-bottom:6px; padding-top:8px; line-height:25px;"> 
<SPAN style="COLOR: #ff0000"><B>活动说明：</B></SPAN>
<P>1、<SPAN style="COLOR: #000"> 关注“中国乐清网”（yq3535）公众微信号。</SPAN></P>
<P>2、<SPAN style="COLOR: #000"> 先转发“母亲节,1000盆康乃馨免费送”活动微信至朋友圈并截图存放于手机相册</SPAN>
<P>3、<SPAN style="color:#000">在中国乐清网微信对话框中输入<font color=red>"花"</font>关键字。</SPAN></P>
<P>4、<SPAN style="color:#000">需填写姓名、手机号码、上传朋友圈截图，点击提交按钮进入浇花页面。</SPAN></P>
</div>
-->	


<div id="tips"></div>

<div class="body p-10 address-edit" style="background:#efeff1">

   
   
       <input type="hidden" name="openid" value="<%=openid %>">
       
        <input type="hidden" id="img1" name="img1" value="">
		
		<table width="100%" border="0" cellpadding="3" cellspacing="1">
      <tr>
        <td height="20">&nbsp;<span class="STYLE20">请认真填写信息</span></td>
        </tr>
    
	
		 
		
      <tbody id="tbName">
      <tr>
        <td height="20"><input  id="xm" name="xm" type="text" class="input-common" placeholder="姓名:请填写真实姓名" pattern=".{2,}"  maxlength="10"  data-err="请正确填写姓名" value=""></td>
        </tr>
	  </tbody>
	  
	  
	
	  
	 <tbody id="tbTel">
      <tr>
        <td height="20"><input id="tel" name="tel" type="text" class="input-common" placeholder="电话:用于领奖核对，不公开" pattern="\d{3}[\d\*]{4,}"   maxlength="20" /></td>
        </tr>
	  </tbody>
	  
	   <tbody id="tbTel">
      <tr>
        <td height="20"><input id="td" name="td" type="text" class="input-common" placeholder="团队:个人可不填" pattern="\d{3}[\d\*]{4,}"   maxlength="20" /></td>
        </tr>
	  </tbody>
	  
	  
	    <tbody id="tbTel">
      <tr>
        <td height="20"><textarea id="memo" name="memo" class="text-common" placeholder="寄语：内容可以是心愿、祝福，或是对城市建设的希冀。限140字以内，好的寄语将连同照片，刊登在《乐清日报》街坊版'笑言'" pattern="^.{5,140}$"  maxlength="140"  data-err="请填写正确的拍卖内容、服务信息！"></textarea></td>
        </tr>
	  </tbody>
	  


	  
	
	  
	  <div id="textList"></div>

    
	
	<!-- 
	<button type="button" onclick="uploadimg()" >上传图片</button>
	  -->
      <tr>
        <td height="20">	<!--
		if (s1<=0 and s2<=0 and s3<=0 and s4<=0 and s5<=0) then%>
		<div class="form-btn">
<span gaevent="imt/account/address/addBtn" class="btn btn-block" id="btn-login" );">这次名额已经没了报名结束！</span>
        </div>
		
		else%>
		-->
          <div class="form-btn">
  <button type="submit" gaevent="imt/account/address/addBtn" class="btn2 btn-block2" id="btn-login" onClick="document.form1.action='sc_chk.jsp';if(DataLength(form1.file.value)<1){alert('请点击选取文件按钮选取美图');return false};if(DataLength(form1.xm.value)<2){alert('姓名最少2个字');form1.xm.focus();return false};if(DataLength(form1.tel.value)<2){alert('请填写正确手机号码');form1.tel.focus();return false};document.form1.submit();">提交</button>
          </div>
          <!--
		end if%>
		-->          </td>
        </tr>
    </table>
		
    </form>
</div>

<footer>
   <div align="center" style="margin-bottom:15px;">
		
		  </div>
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
