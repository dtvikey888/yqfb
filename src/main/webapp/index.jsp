<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.component.Topay"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.fjw.weixin.util.sql_data"%>
<%@page import="org.fjw.weixin.util.StringFromat"%>
<%@page import="org.fjw.weixin.util.MyUtils3"%>
<%

String openid = request.getParameter("openid");
//String check=Topay.WxJsApiCheck(openid);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>乐清最美的笑脸都在这儿，有你认识的吗？</title>

<link rel="stylesheet" type="text/css" href="css/default.css" />

<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/component.css" />



<script src="js/modernizr.custom.js"></script>


<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
em{font-style:normal;}
a{text-decoration:none;cursor:pointer;color:#666666;}
a:hover{color:#FF6699;}
body{background:url("images/bodybg.jpg") repeat #f5f6f7;color:#666666;font-family:Arial;font-size:12px;}
.fl{float:left;}.fr{float:right;}
.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
.clearfix{display:inline-table;}
*html .clearfix{height:1%;}
.clearfix{display:block;}
*+html .clearfix{min-height:1%;}
.demo{width:950px;margin:0 auto;}

/* item_list */
.item_list{position:relative;padding:0 0 50px;}
.item{
	width:350px;background:#fff;overflow:hidden;margin:15px 0 0 0;
	border-radius:4px 4px 4px 4px;
	width:100%;
	box-shadow:0 1px 3px rgba(34, 25, 25, 0.2);	
}
.item_t{padding:50px 8px 0;}
.item_t .img{background-color:#FFFFFF;margin:0 auto;position:relative;width:260px;min-height:210px;}
.item_t .img a{display:block;}
.item_t .img a:hover{background:#000;}
.item_t .img a:hover img{filter:alpha(opacity=80);-khtml-opacity:0.8;opacity:0.8;-webkit-transition:all 0.3s ease-out;-khtml-transition:all 0.3s ease-out;}
.item_t .price{
	position:absolute;bottom:10px;right:0px;background-color:rgba(0, 0, 0, 0.2);color:#FFF;
	filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#33000000, endcolorstr=#33000000);
}
.item .btns{display:none;}
.img_album_btn{top:0px;right:0px;position:absolute;background:#ff6fa6;color:#ffffff;height:20px;line-height:20px;width:56px;border-radius:3px;}
.img_album_btn:hover{color:#fff;}
.item_t .title{padding:8px 0;line-height:38px;}
.item_b{padding:10px 8px;}
.item_b .items_likes .like_btn{background:url("images/fav_icon_word_new_1220.png") no-repeat;display:block;float:left;height:23px;width:59px;margin-right:5px;}
.item_b .items_likes em{line-height:23px;display:block;float:left;padding:0px 6px;color:#FF6699;font-weight:800;border:1px solid #ff6fa6;border-radius:3px;}

/* more */
#more{display:block;margin:10px auto 20px;}

/* infscr-loading */
#infscr-loading{bottom:-10px;left:45%;position:absolute;text-align:center;height:20px;line-height:20px;z-index:100;width:120px;}

/* page */
.page{display:none;font-size:18px;height:60px;text-align:center;margin:20px 0 0 0;}
.page_num a,.page_num span{margin:0 2px;background:url("images/page.png") no-repeat;display:inline-block;width:30px;height:28px;line-height:26px;overflow:hidden;}
.page_num a{background-position:-65px 0;color:#FF3333;overflow:hidden;}
.page_num .prev{background-position:1px -33px;}
.page_num .unprev{background-position:1px 0;cursor:default;}
.page_num .next{background-position:-32px 0;}
.page_num .unnext{background-position:-32px -33px;cursor:default;}
.page_num .current{background-position:-99px 0;color:#FFFFFF;}
.page_num .etc{background-position:-172px 8px;}

/* to_top */
.to_top a,.to_top a:hover{background:url("images/gotop.png") no-repeat}
.to_top a{
	background-position:0 0;float:left;height:50px;overflow:hidden;width:50px;position:fixed;bottom:35px;cursor:pointer;right:20px;
	_position:absolute;
	_right:auto;
	_left:expression(eval(document.documentElement.scrollLeft+document.documentElement.clientWidth-this.offsetWidth)-(parseInt(this.currentStyle.marginLeft, 10)||0)-(parseInt(this.currentStyle.marginRight, 10)||20));
	_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop, 10)||20)-(parseInt(this.currentStyle.marginBottom, 10)||20)));
}
.to_top a:hover{background-position:-51px 0px;}
.STYLE2 {font-size: 25px}
.STYLE4 {font-size: 35px}
</style>

<style>
#menu {right:0; top:0; width:100%; position:fixed; padding:30px; text-align:center; background:#fff; z-index:1; }

#menu input.intext{
  width:400px;
  height:100px;
  padding:5px 5px 0px;
  border:none;
  color:#A6A6A6;
  background-color:#EAEAEB;
  font-size:14px;
}

#menu2 { bottom:0; left:0; width:100%; position:fixed; padding:30px; text-align:center; background:#fff; z-index:2; }
</style>
</head>
<body>
<div  id="contentid">

<nav class="codrops-demos">
	<div id="menu" style="background:url(images/wlwhj3_A.png) no-repeat; height:187px;">
	
	<div style="margin-left:50px;; margin-right:auto">

      <div>
	  <form method="post" name="form1"  action="?kk=1">
        <table width="100%" border="0">
          <tr>
            <td width="31%">&nbsp;</td>
            <td width="26%"><input name="kw" id="kw" type="text" class="intext"  style="font-family:微软雅黑; font-size:35px; color:#a6a6a6;" onfocus="if(value=='  输入姓名或编号') {value=''}" onblur="if (value=='') {value='  输入姓名或编号'}" value="  输入姓名或编号"/></td>
			<td width="4%">&nbsp;</td>
            <td width="36%" bgcolor="#dd1c60" style="font-family:微软雅黑; font-size:35px; color:#FFF"><input type="image" src="images/Button_search.png"/></td>
            <td width="3%">&nbsp;</td>
          </tr>
        </table>
		</form>
      </div>
	</div>	
</div>
</nav>

<script>

function show(){

   alert('5月8日是“世界微笑日”,乐清日报社和乐清宣传部联合举办“笑脸征集活动”,赶快上传你的笑脸吧！不但有机会上南虹广场的“笑脸墙”,还有机会赢取大奖.\n点击“上传照片”,填写真实姓名和手机号码,选择上传,获取照片序号,一人只能上传一张照片.\n可以邀请家人、朋友、同事一起参加,在团队栏里输入统一的“来源”（如机关幼儿园）,参加人数最多的前3个团队将获得最佳团队奖.\n照片要求:像素大于1680*1200;以脸部笑容为主;拒绝低俗.\n5月20日开始投票,为期3天.编辑“真实姓名/手机号码/序号”给参赛选手投票,一人只能投一票.票数前5位将获得2000元大奖.\n5月26日,在乐清发布和中国乐清网上同步公布800位入围名单.敬请关注！\n主办：乐清市委宣传部、乐清日报社\n协办:乐清市嘉恒南虹广场、乐清韩城国际摄影会所');
  // document.getElementById("div_gz").style.display="";
   //alert(document.getElementById("div").style.display)
   
}
</script>


<style>
#round {
    padding:10px; width:300px; height:50px;
    background:#de1d60
    -moz-border-radius: 15px;
    -webkit-border-radius: 15px;
    border-radius:15px;
}
</style>
<script>

function sczp(){

   alert('你好，笑脸照征集时间已经截止，目前已进入投票环节，请查看投票细则');
  // document.getElementById("div_gz").style.display="";
   //alert(document.getElementById("div").style.display)
   
}



</script>

<nav class="codrops-demos">
	<div id="menu2">
	<div style="margin-left:50px;; margin-right:auto">
	<table width="850" height="120" border="0" cellpadding="0" cellspacing="0">
      <tr>
	  
        <td width="670" align="center" bgcolor="#dd1c60" style="font-family:微软雅黑; font-size:35px; color:#FFF ">
		<div id="round" onClick="javascript:window.open('sc.jsp?openid=<%=openid%>','_self')"> 上传照片</div> 
		<!--<div id="round" onclick="sczp();"> 上传照片</div> -->
		</td>
        <td width="15">&nbsp;</td>
        <td width="165" align="center" bgcolor="#fff" style="border:2px solid #dd1c60; font-family:微软雅黑; font-size:35px; color:#dd1c60 "> <div onClick="javascript:window.open('http://mp.weixin.qq.com/s?__biz=MjM5MzE0NDkwNQ==&mid=206181800&idx=1&sn=a4092f5fe3e915eebf76bbd286344885&key=1936e2bc22c2ceb55d5f73f7a68bfd9bb55fa4a3b5fa35e85bb2884d92de81068b19a678ce622b5a10c43bf5f4ebd8d5&ascene=1&uin=MTM5NTQxNDc2MA%3D%3D&devicetype=Windows+7&version=61000721&pass_ticket=%2Foqk4q5mBzVMOfaWh3nkFwOAuLg4Gz4uyoAAmnl81QjSO1KXX1ZXiYogE5H0L3LH','_self')">投票细则</div></td>
      </tr>
    </table>
	</div>
</div>
</nav>
	
<ul class="grid effect-1" id="grid">
<li>&nbsp;</li>
<li>&nbsp;</li>
<div align="center"><img src="images/PIC_theme.png"/></div>
<li>&nbsp;</li>
<li>&nbsp;</li>
<!--start-->							
<%
String kk = request.getParameter("kk");
String kw = StringFromat.codetoString(request.getParameter("kw"));
//out.println("kw= "+kw);

  //输入姓名或编号
String sql = "";
if(kw!=""&&kk!=null){
  
    sql = "Select * FROM yqfbwx_face where bh like '%"+kw+"%' or  xm  like '%"+kw+"%' and yz=1 order by fbsj desc";

   
}else{
   //sql = "Select * FROM yqfbwx_face where bh is not null and openid<>'null' and yz=1 order by fbsj desc";
     sql = "Select * FROM yqfbwx_face where bh is not null and yz=1 order by fbsj desc";
}

//out.println(sql);
sql_data db = new sql_data();
ResultSet RS = db.executeQuery(sql);
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
intPageSize = 10;
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
i = 0;
%>

<%while((i<intPageSize && !RS.isAfterLast())){
	String bh = RS.getString("bh");
	String xm = RS.getString("xm");
	//String zan = RS.getString("zan");
	String id = RS.getString("id");
	
	String images ="";
	images = RS.getString("img1");
	String images2="";
	if(images.length()>0 && !images.equals("no.gif") ){
		images2 = "http://v.yqcn.com/bmwj/asp/sxbook/download3_simg/r1_"+images;
	}else{
		images2 = "http://info.yqcn.com:7001/ADV/uploadfiles/video/no.gif";
	}
	
%>
		
	<li>
	<table width="478" border="0" cellpadding="0" cellspacing="15" style="background-color:#FFF">
          <tr>
            <td width="448" align="right" style="font-family:Arial; font-size:35px; ">NO.<%=bh %></td>
          </tr>
          <tr>
            <td align="center" valign="middle"><div onClick="javascript:window.open('show.jsp?id=<%=id%>&openid=<%=openid%>','_self')"><img src="<%=images2%>" width="380px;"/></div>
            </td>
          </tr>
          <tr>
            <td align="center" valign="middle"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="13%"><img src="images/ICO_user.png" width="38" height="35" /></td>
                <td width="30%" style="font-family:微软雅黑; font-size:25px; "><%=xm %></td>
                <td width="17%"><div style="font-family:微软雅黑; font-size:30px; color:#a6a6a6">票数:</div>  </td>
                <td width="40%"><span style="font-family:微软雅黑; font-size:30px; color:#000000"><!--zan -->
                <span style="font-family:微软雅黑; font-size:30px; color:#a6a6a6"><%=MyUtils3.GetPS(id) %></span></span></td>
              </tr>
            </table></td>
          </tr>
      </table>
	</li>
	
<%
RS.next();
i++;}
}
RS.close();
%>


</ul>

<script src="js/masonry.pkgd.min.js"></script>
<script src="js/imagesloaded.js"></script>
<script src="js/classie.js"></script>
<script src="js/AnimOnScroll.js"></script>
<script type="text/javascript">
new AnimOnScroll( document.getElementById( 'grid' ), {
	minDuration : 0.4,
	maxDuration : 0.7,
	viewportFactor : 0.2
} );
</script>
</div>
</body>
</html>
<!--  
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
-->