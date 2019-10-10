<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.fjw.weixin.util.StringFromat"%>
<%@page import="org.fjw.weixin.util.sql_data"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.fjw.weixin.util.MyUtils3"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>“随手拍”拍下“不文明”</title>

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.masonry.js"></script>
<script type="text/javascript" src="js/jquery.infinitescroll.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
em{font-style:normal;}
a{text-decoration:none;cursor:pointer;color:#666666;}
a:hover{color:#FF6699;}
body{font-family:Arial;font-size:12px;}
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
	width:226px;background:#fff;overflow:hidden;margin:15px 0 0 0;
	border-radius:4px 4px 4px 4px;
	box-shadow:0 1px 3px rgba(34, 25, 25, 0.2);	
}
.item_t{padding:35px 8px 0;}
.item_t .img{background-color:#FFFFFF;margin:0 auto;position:relative;width:210px;min-height:210px;}
.item_t .img a{display:block;}
.item_t .img a:hover{background:#000;}
.item_t .img a:hover img{filter:alpha(opacity=80);-khtml-opacity:0.8;opacity:0.8;-webkit-transition:all 0.3s ease-out;-khtml-transition:all 0.3s ease-out;}
.item_t .price{
	position:absolute;
	top:-20px;
	right:0px;
	background-color:rgba(0, 0, 0, 0);
	color:#333;
	filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#33000000, endcolorstr=#33000000);
}
.item .btns{display:none;}
.img_album_btn{top:0px;right:0px;position:absolute;background:#f8b62c;color:#ffffff;height:20px;line-height:20px;width:56px;border-radius:3px;}
.img_album_btn:hover{color:#fff;}
.item_t .title{padding:8px 0;line-height:18px;}
.item_b{padding:20px 8px; font:"微软雅黑"}

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
</style>

<script type="text/javascript">
var isWidescreen=screen.width>=1280; 
if(isWidescreen){document.write("<style type='text/css'>.demo{width:1194px;}</style>");}
</script>

<script type="text/javascript">
function item_masonry(){ 
	$('.item img').load(function(){ 
		$('.infinite_scroll').masonry({ 
			itemSelector: '.masonry_brick',
			columnWidth:226,
			gutterWidth:15								
		});		
	});
		
	$('.infinite_scroll').masonry({ 
		itemSelector: '.masonry_brick',
		columnWidth:226,
		gutterWidth:15								
	});	
}

$(function(){

	function item_callback(){ 
		
		$('.item').mouseover(function(){
			$(this).css('box-shadow', '0 1px 5px rgba(35,25,25,0.5)');
			$('.btns',this).show();
		}).mouseout(function(){
			$(this).css('box-shadow', '0 1px 3px rgba(34,25,25,0.2)');
			$('.btns',this).hide();		 	
		});
		
		item_masonry();	

	}

	item_callback();  

	$('.item').fadeIn();

	var sp = 1
	
	$(".infinite_scroll").infinitescroll({
		navSelector  	: "#more",
		nextSelector 	: "#more a",
		itemSelector 	: ".item",
		
		loading:{
			img: "images/masonry_loading_1.gif",
			msgText: ' ',
			finishedMsg: '',
			finished: function(){
				sp++;
				if(sp>=1000000){ //到第1000000页结束事件
					$("#more").remove();
					$("#infscr-loading").hide();
					$("#page").show();
					$(window).unbind('.infscr');
				}
			}	
		},errorCallback:function(){ 
			$("#page").show();
		}
		
	},function(newElements){
		var $newElems = $(newElements);
		$('.infinite_scroll').masonry('appended', $newElems, false);
		$newElems.fadeIn();
		item_callback();
		return;
	});

});
</script>


<style>
body{font-size:13px;color:#3f3e3d; font-family:微软雅黑; background-color:#f1f1f3; padding:0px; width:1195px; margin:0 auto;}
a{color:#3f3e3d; text-decoration:none; line-height:25px;}
a:hover{ color:#de1d60; text-decoration:none;}
h1{font-size:16px; line-height:25px;}
h2{font-size:16px;line-height:25px; font-weight:bold; color:#c1262c;}
d{font-size:16px; color:#ffffff; text-indent:2em;}
e{color:#b1b1b1;}

.watermark {
background:transparent url(../images/ico_used.png) no-repeat;
}
img.logo {
filter:alpha(opacity=75);
opacity:.75;
}

</style>
</head>

<body>
<script>

function lc(){

   alert('征集时间：5月8日——5月20日\n点击“上传照片”，填写真实姓名和手机号码等信息，上传照片，获取照片序号。开始投票：5月21日——5月22\n关注“乐清发布”微信公众号，编辑“真实姓名/手机号码/序号”，私信“乐清发布”，给参赛选手投票，一人只能投一票。\n公布名单：5月26日\n在“乐清发布”和“中国乐清网”上同步公布800位入围名单。\n“笑脸墙”揭幕时间：5月30日\n举办“笑脸墙”揭幕仪式，邀请入围人员参加“笑脸墙”揭幕仪式。');
  // document.getElementById("div_gz").style.display="";
   //alert(document.getElementById("div").style.display)
   
}

function xz(){

   alert('点击“上传照片”，填写真实姓名和手机号码（用于领奖，不公开），上传照片，获取照片序号。一个手机号码，只能上传一张照片。\n照片要求：以脸部笑容为主；拒绝低俗。\n可以在照片下方填写寄语，内容可以是自己的心愿，也可以是对家人、朋友的祝福，或是对城市建设的希冀。寄语在140字以内，好的寄语将连同照片，刊登在《乐清日报》街坊版“笑言”。\n还可以邀请家人、朋友、同事一起参加，在团队栏里输入统一的来源（如机关幼儿园），参加人数最多的前3个团队将获得最佳团队奖。最佳团队将获得专属于本团队成员的笑脸写真一张和水晶奖杯一个。\n5月20日开始投票，为期3天，编辑“真实姓名/手机号码/序号”给参赛者投票，一人只能投一票。通过搜索姓名、照片序号，可以查看投票情况。\n票数前五名，不但能够获得2000元奖金，还将获得韩城国际婚纱摄影价值1000元的写真套系1套，并可以成为《乐清一周》杂志的封面人物。');
  // document.getElementById("div_gz").style.display="";
   //alert(document.getElementById("div").style.display)
   
}


function sczp(){

   alert('你好，随手拍活动征集时间已经截止，请查看参与细则');
   
}

</script>
    <td align="center"><table width="1195" height="615" border="0" cellspacing="10" align="center">
      <tr valign="bottom">
        <td height="525" colspan="6" align="center"  background="IMG/suishoupai-banner.png" style="background-repeat:no-repeat">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" background="IMG/jianbian.png"  style="font:'微软雅黑'" >
          <tr>
            <td width="414" height="21"  align="center"><img src="IMG/tupianyaoqiu.png"/></td>
            <td colspan="2"  align="center"><img src="IMG/xingwei.png" width="318" height="35" /></td>
            <td colspan="3" align="center"><img src="IMG/fatutujing.png" width="305" height="34" /></td>
          </tr>
          <tr>
            <td height="62" align="center">图像清晰，构图合理，主题明确。</td>
            <td width="219" rowspan="3" valign="top" style="padding-top:20px">车辆行经人行横道时不礼让行人<br />
              行人翻越道路隔离栏<br />
              行人、车辆闯红灯<br />
              在公共场合抽烟<br />
              乱贴&quot;牛皮鲜&quot;<br /></td>
            <td width="157" rowspan="3" valign="top" style="padding-top:20px">随手乱扔垃圾<br />
              损坏公共设施<br />
              随地大小便<br />
              车窗抛物<br />
              违章停车...</td>
            <td width="135" rowspan="2" align="center"><img src="IMG/乐报爆料.jpg" width="90" height="90"/></td>
            <td width="135" rowspan="2" align="center"><img src="IMG/《中国乐清网》微信.jpg" width="90" height="90"/></td>
            <td width="135" rowspan="2" align="center"><img src="IMG/城市网.jpg" width="90" height="90" /></td>
          </tr>
          <tr>
            <td height="21"  align="center"><img src="IMG/fatugeshi.png"/></td>
          </tr>
          <tr height="84">
            <td align="center">图片（需提供拍摄时间、拍摄地点以及简单的说明），<br />
              还需附上你的姓名和联系方式，方便联系、发奖。</td>
            <td align="center">&quot;乐报有料&quot;微信号<br />
              （yq61116222）</td>
            <td align="center">&quot;中国乐清网&quot;<br />
              微信公众号</td>
            <td align="center">&quot;乐清城市网&quot;<br />
              微信公众号</td>
          </tr>
        </table></td>
      </tr>
      <form method="post" name="form1"  action="?kk=1">
      <tr>
        <td width="597" height="60" align="center" valign="center">
          <input type="text"  name="kw" id="kw"  placeholder="输入姓名或编号"  style="width:100%; height:50px; border-radius:6px; margin-bottom:10px;"/>
        </td>
        <td width="98" align="center" valign="center" bgcolor="#f8b62c"><input type="image" src="IMG/Button_search.png"  /></td>
        <td width="171" align="center" valign='middle'><div style=" height:40px;border:2px solid #F8B62D; color:#F8B62D; font-size:20px; font:'微软雅黑'; color:#f8b62c; line-height:40px; " onClick="javascript:window.open('http://mp.weixin.qq.com/s?__biz=MjM5MzE0NDkwNQ==&mid=402217642&idx=4&sn=3bfaecdafca1e0006721326c4a583415&scene=0#wechat_redirect','_target')">参与细则</div></td>
        <td width="271" align="center" valign='middle' bgcolor="#f8b62c">
        <!--  <div style="font-size:20px; color:#FFF; font:'微软雅黑'" onClick="javascript:window.open('sc.jsp?openid=null','_blank')">上传照片</div>-->
              <div style="font-size:20px; color:#FFF; font:'微软雅黑'" onclick="sczp();">上传照片</div>
        
        </td>
       
      </tr>
      </form>
</table></td>
  </tr>
  <tr>
    <td height="10" align="center" valign="top" ><table width="1195" border="0" cellpadding="0" cellspacing="0" style="background:url(IMG/round.png) no-repeat top left;">
      <tr>
        <td height="500" valign="top">
		<div class="demo clearfix">
	
			
	<div class="item_list infinite_scroll">
	
	
<!--start-->							
<%
String kk = request.getParameter("kk");
String kw = StringFromat.codetoString(request.getParameter("kw"));
//out.println("kw= "+kw);

  //输入姓名或编号
String sql = "";
if(kw!=""&&kk!=null){
  
     
    sql = "Select * FROM yqfbwx_ssp where bh like '%"+kw+"%' or  xm  like '%"+kw+"%' and yz=1  order by fbsj desc";

   
}else{
  // sql = "Select * FROM yqfbwx_face where bh is not null and openid<>'null' and yz=1 order by fbsj desc";
  
  sql = "Select * FROM yqfbwx_ssp where bh is not null and yz=1 order by fbsj desc";
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
	String id = RS.getString("id");
	
	String images ="";
	images = RS.getString("img1");
	String images2="";
	if(images.length()>0 && !images.equals("no.gif") ){
		images2 = "http://v.yqcn.com/bmwj/asp/sxbook/download7/"+images;
	}else{
		images2 = "http://info.yqcn.com:7001/ADV/uploadfiles/video/no.gif";
	}
	
		
	String memo = RS.getString("memo");
	String memo2="";
	if(memo.length()>30){
	   memo2=memo.substring(0,30);
	}else{
	   memo2=memo;
	}
	
	int isla=RS.getInt("isla");
	
%>
	

	
	    <div class="item masonry_brick">
			<div class="item_t">
				<div class="img">
					<a href="show.jsp?id=<%=id%>" target="_blank()">
					<div <%if(isla==1){%> class="watermark"<%}%> onClick="javascript:window.open('show.jsp?id=<%=id%>','_blank')">
   
					<img <%if(isla==1){%> class="logo"<%}%> src="<%=images2%>" width="210px;"/>
					
					</div>
					
					</a>
					<span class="price">NO.<%=bh %></span>
					<div class="btns">
					<a href="show.jsp?id=<%=id%>" target="_blank()" class="img_album_btn">点击详情</a>
					</div>
				</div>
			
			</div>
			<div class="item_b clearfix">
				<div class="items_likes fl">
					<a href="show.jsp?id=<%=id%>" class="like_btn"></a><%=memo2%>
				
				</div>
				<!--  <div class="items_comment fr"><a href="#">票数：</a><em class="bold">1000</em></div>-->
			</div>
		</div>

	    <!--item end-->
		<%
RS.next();
i++;}
}
RS.close();
%>	
	

	</div>
					
					
   <div id="more"><a href="page/2.html"></a></div>
					
	<div id="page" class="page" style="display:none;">
		<div>
			<div align="right">第<%=intPage%>页/共<%=intPageCount%>页&nbsp;&nbsp;
          <%if(intPage>1){%>
      <a href="?kw=<%=kw %>&page=<%=intPage-1%>">上一页</a>
      <%}%>
  &nbsp;&nbsp;
  <%if(intPage<intPageCount){%>
  <a href="?kw=<%=kw %>&page=<%=intPage+1%>">下一页</a>
  <%}%>
  &nbsp;&nbsp;请选择页码：
  <select name="page" onChange="MM_jumpMenu('this',this,0)" style="width:80px;">
    <option value="?kw=<%=kw %>&page=<%=intPage%>" selected><%=intPage%></option>
    <%int j;
	  for (j=1;j<=intPageCount;j++){%>
    <option value="?kw=<%=kw %>&page=<%=j%>"><%=j%></option>
    <%}%>
  </select>
  
    </div>
		
	</div>

</div>
					
<div style="display:none;" id="gotopbtn" class="to_top"><a title="返回顶部" href="javascript:void(0);"></a></div>
					

<script type="text/javascript">
$(function(){

	$(window).scroll(function(){
		$(window).scrollTop()>1000 ? $("#gotopbtn").css('display','').click(function(){
			$(window).scrollTop(0);
		}):$("#gotopbtn").css('display','none');	
	});
	
});
</script>
		</td>
      </tr>
    </table></td>
  </tr>
 
  <tr>
    <td align="center" valign="top"><a href="#"></a></td>
  </tr>
  <tr>
    <td height="70" align="center" valign="top" bgcolor="#de1d60" ><table width="100%" height="80" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f8b62c">
      <tr>
        <td width="182" height="62" align="center"><a href="http://www.yqcn.com/" target="_blank"><img src="http://zt1.yqcn.com/logo/Logo_zgyqw_white.png" width="177" height="54" border="0" /></a></td>
        <td width="10">&nbsp;</td>
        <td width="788" align="left"><d>Copyright &copy; www.yqcn.com　All Rights Reserved. 版权所有 中国乐清网 
          专题制作：中国乐清网2015年05月</d></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
