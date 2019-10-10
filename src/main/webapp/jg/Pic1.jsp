<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<jsp:useBean id="sqlbean" scope="page" class="org.fjw.weixin.util.MysqlDB"/>
<%@page import="java.sql.ResultSet"%>
<%
String urlname ="jg/Pic1.jsp";
//String openid =request.getParameter("openid");
//out.println(openid);


String ympath=AllValus.ympath;

String bzlopenid =request.getParameter("bzlopenid");
//out.println("bzlopenid: "+bzlopenid);
int id = new Integer(request.getParameter("id"));

String fbsj = ZghTools.GetFbsjById(id);

int lb = ZghTools.GetLbById(id);

String from=request.getParameter("from");

String statecode = bzlopenid+"|"+id;

  String zlsession = (String)session.getAttribute("zlsession");
   
  //out.println("zlsession: "+zlsession);
  
  if(ZghTools.IsCz12(zlsession)==false){

  
   if(zlsession!=null){
   
      if(zlsession.equals(bzlopenid)){
      
   	      //out.println("你是自己点的，不回调");
   	      
      }else{
        
          //out.println("其他人点了以后，不回调");
          //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet4&response_type=code&scope=snsapi_userinfo&state="+bzlopenid+"#wechat_redirect");        
   
      }
   
   }else{
   
  		//还没点要回调
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet28&response_type=code&scope=snsapi_userinfo&state="+statecode+"#wechat_redirect");        
   
   }
   
   
   //yqfb_openid 没有存在要回调
        response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet28&response_type=code&scope=snsapi_userinfo&state="+statecode+"#wechat_redirect");        
   
   
   }
  

//继续...

int oid = ZghTools.Getoid(bzlopenid);
int oid2 = ZghTools.GetOidById(id);

//out.println(openid);
//out.println(id);

int f3=0;
int f4=0;

int f1 = ZghTools.fy1(oid,id);
//out.println("f1:"+f1);
if(f1!=0){
	f3=f1;
}else{
   f3=ZghTools.getFirstId(oid);
}

int f2 = ZghTools.fy2(oid,id);
//out.println("f2:"+f2);
if(f2!=0){
   f4=f2;
}else{
   f4=ZghTools.getEndId(oid);
}

String check="";
if(from!=null){
 check=Topay.WxJsApiCheck45(urlname,bzlopenid,id+"",from);
}else{
 check=Topay.WxJsApiCheck44(urlname,bzlopenid,id+"");
}

//out.println(oid);
//out.println(check);
%>

<%
	//控制时间
	int kz =0;
	String tt1=AllValus.story_t1;
	String tt2=AllValus.story_t2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //开始抽奖
    //2: //抽奖已经结束,感谢关注！
    //3: //抽奖还没开始呢！
    //out.println(kz);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/<c>1999/xhtml">
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
   wx_share_title="<%=AllValus.title1 %>请为<%=ZghTools.GetNickname(oid2)%>点赞";
   wx_share_desc="<%=AllValus.desc %>";
   
   wx_share_link="<%=AllValus.propath %>jg/Pic1.jsp?bzlopenid=<%=bzlopenid%>&id=<%=id%>";
   wx_share_imgUrl="<%=AllValus.nopicpath %>";
   
   wx.config({
      debug: false,
      <%=check%>,// 必填，签名，见附录1
      jsApiList: [
        'updateTimelineShareData',
        'updateAppMessageShareData'
      ]
   });
  
  wx.ready(function () {   //需在用户可能点击分享按钮前就先调用
   //隐藏右上角菜单接口
	//wx.hideOptionMenu();
	
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

// 2.2 监听分享到朋友圈按钮点击、自定义分享内容及分享结果接口
  function  sharefriendRound2() {
     //显示右上角菜单接口
       wx.showOptionMenu();
	   
    wx.updateTimelineShareData({
       title: wx_share_title,
      desc: wx_share_desc,
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

<script>

function rule(){

   alert('活动时间到');

}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="user-scalable=no, initial-scale=0.3, maximum-scale=0.3"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<title><%=AllValus.title1 %></title>
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
body{font-size:12px; font-family:wing; background:url(IMG/top.png) repeat-y;background-size:100%;}
td{font-size:40px; font-family:wing;}
a{text-decoration:none; color:#000000;}
a:hover{ color:#d73615; text-decoration:none;}
p{text-indent:2em;}
m{font-size:45px; color:#f2f2f2;}
c{font-size:35px; font-family:Arial;}
d{color:#ffffff; text-indent:2em;}
e{color:#b1b1b1;}

.class_outer {
    display: block;
    margin: 10px auto;
    position: relative;
    overflow: hidden;
    padding-right:18px;
    background-color:#F2F2F2;
}

.class_cover {
    width:100%;
    height:145px;
    line-height:50px;
    padding-left:12px;
    background-color: rgba(0, 0, 0, .50);
    font-family:wing;
    font-weight:bold;
    color:#F2F2F2;
    font-size:38px;
    position:absolute;
    left: 0px;
    bottom: 0px;
    text-align:left;
   
}
.class_cover_long {
    width:100%;
    height:180px;
    line-height:50px;
    padding-left:12px;
    background-color: rgba(0, 0, 0, .50);
    font-family:wing;
    font-weight:bold;
    color:#F2F2F2;
    font-size:38px;
    position:absolute;
    left: 0px;
    bottom: 0px;
    text-align:left;
}
.class_cover2 {
    width:100%;
    height:80px;
    line-height:50px;
    padding-left:5px;
    font-family:wing;
    color:#F2F2F2;
    font-size:30px;
    position:absolute;
    left: 0px;
    bottom: 0px;
}
</style>

<style>
     .con_bak{
            height:auto !important;
            width:468px;
            margin:0 auto;
            overflow:hidden;
            margin-top:3px;
            padding-left:10px;
            padding-right:10px;
            position:relative;
            background-color:#F2F2F2;
      }
      .subscript{
        color:#C9AD85;
        position:absolute;
        right:2px;
		top:-10px;
        text-align:center;
        line-height:30px;
        font-family:wing;
      }
      .subscript2{
        color:#C9AD85;
        position:absolute;
        left:15px;
		top:15px;
        text-align:center;
        line-height:30px;
        font-family:wing;
      }
      
      .subscript3{
        color:#C9AD85;
        position:absolute;
        right:60px;
		bottom:30px;
        text-align:center;
        line-height:30px;
        font-family:wing;
      }
      
       .subscript4{
        color:#FFFFFF;
        position:absolute;
        right:30px;
		bottom:40px;
        text-align:center;
        line-height:30px;
        font-family:wing;
        font-size:30px;
      }
</style>
    
<style> 
.div-a{ float:left;width:20%;} 
.div-b{ float:left;width:auto;} 
.style3 {font-size: 40px; color: #666666; }
.style8 {	color: #666666;
	font-size: 40px;
}
.style4 {color: #000000}
.style9 {font-size: 45px}
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
				width: 100%!important;
				height: 80%!important;
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

<body >
<%if(zlsession!=null){%>
<div id="contentid"  style="display:block">
<%}else{%>
<div id="contentid"  style="display:none">
<%}%>
<div id="mcover2" onClick="weChat2()" style="display: none;">
   <img src="IMG/tip.png"/>
</div>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
  <tr bgcolor="#d73615">
    <td align="center" valign="middle"><table width="100%" height="75" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="right"><a href="index.jsp"><img src="IMG/ICO_return.png" border="0" /></a></td>
        <td width="1547" align="center">
        <%if(lb==1){ %>
        <img src="IMG/PIC_theme.png" />
        <%}else if(lb==2){ %>
        <img src="IMG/PIC_theme1.png" />
        <%}else if(lb==3){ %>
        <img src="IMG/PIC_theme3.png" />
        <%}else if(lb==4){ %>
        <img src="IMG/PIC_theme2.png" />
        <%} %>
        </td>
        <td width="50" align="center" >&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="250" align="center"><table width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td align="left"><a href=?bzlopenid=<%=bzlopenid%>&id=<%=f3%>><img src="IMG/ICO_L.png" /></a></td>
            <td align="center" valign="middle">
            
          
            <img style="border:8px solid #fff;" src="<%=ZghTools.getImg(id)%>"; width="100%" height="auto" />
            
            </td>
            <td align="right"><a href=?bzlopenid=<%=bzlopenid%>&id=<%=f4%>><img src="IMG/ICO_R.png" /></a></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="50" align="center">&nbsp;</td>
      </tr>
     
      
      
    </table></td>
  </tr>

</table>

<table width="100%"  border="0">
  <tr>
    <td><table width="80%" border="0" cellspacing="10">
      <tr>
        <td width="12%" rowspan="2"><table width="150" border="0">
            <tr>
              <td><img src="<%=ZghTools.GetImg2(oid2)%>" width=100%; style="border-radius:50%"/></td>
            </tr>
        </table></td>
        <td width="88%" height="66" align="left" valign="bottom" nowrap="nowrap" class="style8"><%=ZghTools.GetNickname(oid2)%></td>
      </tr>
      <tr>
        <td align="left" valign="top" nowrap="nowrap"><span class="style3"><%=fbsj %>发布</span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" align="center" cellspacing="20">
      <tr>
        <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellspacing="40">
            <tr>
              <td><span class="style4"><span class="style9">
              <%if(ZghTools.getMemo(id)!=null||ZghTools.getMemo(id)!=""){
                  out.println(ZghTools.getMemo(id));
              }%>
              <%if(ZghTools.GetStory2(id+"")!=null||ZghTools.GetStory2(id+"")!=""){
                  out.println(ZghTools.GetStory2(id+""));
              }%>
              
              
              </span></span></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="360" border="0" align="right" cellspacing="15">
      <tr>
        <td width="222" align="right"><table width="100%"  border="0">
            <tr>
              <td align="center">
              
             <%if(kz==1){
           // kz=1 开始抽奖(不关) kz=2 抽奖结束(关闭) kz=3 抽奖没开始（关闭）
            %>  
              
            <%if(zlsession!=null){%>
            <%if(ZghTools.Isdz3(id+"",zlsession)){%>
            <img src="IMG/dz2.png" width="92" height="120"/>
            <%}else{%>
            <a href="/yqfb/del?action=6&id=<%=id%>&openid=<%=zlsession%>">
	        <img src="IMG/dz.png" width="92" height="120"/>
	        </a>
	        <%}%>
	        <%}%>  
	        
	         <%}else if(kz==2){%>
 			   <div onclick="rule();">
 			   <img src="IMG/dz.png" width="92" height="120"/>
 			   </div>
            <%}else{%>
               <div onclick="rule();">
 			   <img src="IMG/dz.png" width="92" height="120"/>
 			   </div>
            <%}%>
	        
              
              </td>
              <td align="left"><span class="style13"><%=ZghTools.GetDzs(id+"")%></span></td>
            </tr>
        </table></td>
        <td width="89">
 				 <div onClick="sharefriendRound2();button3();">
                 <img src="IMG/dzd.png" width="100%" />
                 </div>
		</td>
      </tr>
    </table></td>
  </tr>
</table>


<jsp:include page="bot.jsp">
<jsp:param value="<%=zlsession %>" name="openid"/>
</jsp:include>
</div>
</body>
</html>
