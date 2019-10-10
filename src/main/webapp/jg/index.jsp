<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<jsp:useBean id="sqlbean" scope="page" class="org.fjw.weixin.util.MysqlDB"/>
<%@page import="java.sql.ResultSet"%>
<%
String urlname ="jg/index.jsp";
String openid =request.getParameter("openid");

String ympath=AllValus.ympath;

//out.println("openid="+openid);
String twbsession1 = (String)session.getAttribute("twbsession1");
//out.println("twbsession1="+twbsession1);

if(twbsession1!=null){
      if(twbsession1.equals(openid)){
   	      //out.println("你是自己点的，不回调");
      }else{
          //out.println("其他人点了以后，不回调");
           response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet27&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
      }
   }else{
  		//还没点要回调
           response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet27&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
   
   }
   
   ZghTools.ClearNull3();
   String check=Topay.WxJsApiCheck4(urlname,openid);
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
        wx_share_title="<%=AllValus.title1 %>";
        wx_share_desc="<%=AllValus.desc %>";
        wx_share_link="<%=AllValus.thelink %>";
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
a{text-decoration:none; color:#F2F2F2;}
a:hover{ color:#d73615; text-decoration:none;}
p{text-indent:2em;}
m{font-size:45px; color:#F2F2F2;}
c{font-size:35px; font-family:Arial;}
d{color:#F2F2F2; text-indent:2em;}
e{color:#b1b1b1;}
h1{font-size:30px;}
#m1{width:50%;float:left;}

.class_outer {
    display:  block;
    margin:   10px auto;
    position: relative;
    overflow: hidden;
}
.class_cover {
    width:100%;
    height:110px;
    line-height:50px;
    padding-left:15px;
    background-color:rgba(0, 0, 0, .50);
    font-family:wing;
    font-weight:bold;
    color:#F2F2F2;
    font-size:38px;
    position:absolute;
    padding-top:5px;
    left: 0px;
    bottom: 0px;
    text-align:left;
   
}
.class_cover_long {
    width:100%;
    height:155px;
    line-height:50px;
    padding-left:15px;
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
    padding-top:23px;
    left: 0px;
    bottom: 0px;
}
</style>

   <style>
     .con{
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
.div-c{ float:left;} 
</style> 

<style>
/*div通用样式*/
div{

}

/*右上角*/
div.right_top{
overflow: hidden;
z-index: 2000;
position:absolute;
right: 0px;
top: 190px;
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
</style>

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
 
<div  class="right_top"><a href="Readme.jsp?openid=<%=openid%>&lb=<%=0%>"><img src="IMG/hdxz1.png" border="0"></a></div>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td align="center" valign="middle"><table width="100%" height="338" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="338" align="right">&nbsp;<br />
          <br /><br /></td>
        <td width="1547" align="center"><img src="IMG/totu.png" width="90%"/><br /><br /><br /></td>
        <td width="50" align="center" >&nbsp;<br /><br /><br />
        
        </td>
      </tr>
    </table><br />
    <a href="List.jsp?openid=<%=openid%>&lb=1">
    <img src="IMG/B1.png" width="235" height="140" />&nbsp;
    </a>
    <a href="List.jsp?openid=<%=openid%>&lb=3">
	<img src="IMG/B2.png" width="235" height="140" />&nbsp;
	</a>
	<a href="List.jsp?openid=<%=openid%>&lb=2">
	<img src="IMG/B3.png" width="235" height="140" />&nbsp;
	</a>
	<a href="List.jsp?openid=<%=openid%>&lb=4">
	<img src="IMG/B4.png" width="235" height="140" />
	</a>
	<br />
    <br /></td>
  </tr>
  

  <tr>
    <td align="center" valign="top"><table width="90%" cellspacing="10" cellpadding="0">
      <tr>
  
        <td align="center"><img src="IMG/logo.png"  width="90%" /></td>
       
      </tr>
    </table></td>
  </tr>

  <tr>
    <td align="center" valign="top"><!--图片加载开始-->
<link rel="stylesheet" type="text/css" href="css/default2.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr.custom.js"></script>
<ul class="grid effect-1" id="grid">
<%
//String sql="select * from jg where oid="+oid+" and yz=1 order by id desc";
String sql="select * from jg where yz<>0 ORDER BY istop DESC,fbsj DESC";
ResultSet RS=sqlbean.executeQuery(sql);
if(RS.wasNull())out.print("<br><font face=Arial color=navy size=2><b>当前暂无新内容</b></font>");
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

<%while((i<intPageSize && !RS.isAfterLast()))
{
String images2,lb2,memo,id,video1;
int lb=0;
int oid=0;

id = RS.getString("id");
oid = RS.getInt("oid");
lb=RS.getInt("lb");
memo = RS.getString("memo");


if(lb==1){
   lb2="IMG/003.png";
}else if(lb==2){
   lb2="IMG/004.png";
}else if(lb==3){
   lb2="IMG/005.png";
}else{
   lb2="IMG/006.png";
}

video1= RS.getString("video1");

String tzurl = "";

String bzlopenid=ZghTools.GetOpenidFromOid(oid);

if(video1.equals("0")){

    tzurl="Pic1.jsp?bzlopenid="+bzlopenid+"&id="+id+"";

}else{

	tzurl="video.jsp?bzlopenid="+bzlopenid+"&id="+id+"";
}


String images ="";
images = RS.getString("img1");

if(images.length()>0 && !images.equals("0") ){
	images2 = AllValus.videopath+images;
}else{
   if(video1.indexOf(".mp3")!=-1||video1.indexOf(".mp4")!=-1||video1.indexOf(".MP3")!=-1||video1.indexOf(".MP4")!=-1){
      images2 = AllValus.videopath+"video.png";
   }else{
      images2 = AllValus.nopicpath;
   }
	
}

%>
	<li>
	<table width="100%" border="0" cellpadding="0" cellspacing="5">
        <tr>
         <td align="center" valign="middle">
         
         <div class="con">   
         <div onClick="javascript:location.href='<%=tzurl%>';"  class="class_outer">
         <img src="<%=images2%>" width="100%;"/>
         
          <%if(memo.length()>10){%>
          <span class="class_cover_long">
          <%}else{%>
          <span class="class_cover">
          <%}%>
          <%=memo%>
          </span>
          
          <span class="class_cover2">
          
          <div class="div-a"><img src="<%=ZghTools.GetImg2(oid)%>" height=50px; width=50px; style="border-radius:50%"/></div> 
		  <div class="div-b"><%=ZghTools.GetNickname(oid)%></div> 
          
          
          </span>
          
          
           <div class="subscript">
	        <img src="<%=lb2%>" width="210" height="130"/>
            </div>
           <%if(video1.indexOf(".mp3")!=-1||video1.indexOf(".mp4")!=-1){%>
             <div class="subscript2">
	         <img src="IMG/timg.png" width="60" height="60"/>
             </div>
           <%}%>
           
           
           
           <%if(kz==1){
           // kz=1 开始抽奖(不关) kz=2 抽奖结束(关闭) kz=3 抽奖没开始（关闭）
            %>
           
            <div class="subscript3">
           
            <%if(ZghTools.Isdz3(id,openid)){%>
            <img src="IMG/dz2.png" width="68" height="92"/>
           
            <%}else{%>
            <a href="/yqfb/del?action=5&id=<%=id%>&openid=<%=openid%>&uprl=index.jsp&lb=<%=lb%>">
	        <img src="IMG/dz.png" width="68" height="92"/>
	        </a>
	        <%}%>
	          
            </div>
            
            <%}else if(kz==2){%>
 			   <div class="subscript3" onclick="rule();">
 			   <img src="IMG/dz.png" width="68" height="92"/>
 			   </div>
            <%}else{%>
               <div class="subscript3" onclick="rule();">
 			   <img src="IMG/dz.png" width="68" height="92"/>
 			   </div>
            <%}%>
            
           
            <div class="subscript4">
            
            <%=ZghTools.GetDzs(id)%>
	         
            </div>
            
           
          
         </div>
         </div>
         <br /></td>
        </tr>
   
      
         
        
        
    </table>
	<br /></li>
<%
RS.next();
i++;}
}
RS.close();
%>

<li>
	<table width="100%" border="0" cellpadding="0" cellspacing="5">
        <tr>
         <td align="center" valign="middle">
         <div onClick="javascript:location.href='UP2.jsp?openid=<%=openid%>';">   
         <div style="background-color:#E6E0D4;width:300px;height:300px;"><br/><br/><br/>
         <img  src="IMG/007.png" width="200" height="200"/>
         </div>
         </div>
        
         <br /></td>
        </tr>
    </table>
	<br /></li>

<span id="pp"></span>
</ul>
<script src="js/masonry.pkgd.min.js"></script>
<script src="js/imagesloaded.js"></script>
<script src="js/classie.js"></script>
<script src="js/AnimOnScroll.js"></script>
<script type="text/javascript">
new AnimOnScroll(document.getElementById('grid'),{
	minDuration : 0.4,
	maxDuration : 0.7,
	viewportFactor : 0.2
});
</script>
<!--图片加载结束 -->
	<br /></td>
  </tr>
</table>
<jsp:include page="bot.jsp">
<jsp:param value="<%=openid %>" name="openid"/>
</jsp:include>
</div>
</body>
</html>
