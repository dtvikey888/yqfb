<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.fjw.weixin.util.StringFromat"%>
<%@page import="org.fjw.weixin.util.sql_data"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.fjw.weixin.util.MyUtils3"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��������Ц������</title>

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
	width:226px;background:#fff;overflow:hidden;margin:15px 0 0 0;
	border-radius:4px 4px 4px 4px;
	box-shadow:0 1px 3px rgba(34, 25, 25, 0.2);	
}
.item_t{padding:10px 8px 0;}
.item_t .img{background-color:#FFFFFF;margin:0 auto;position:relative;width:210px;min-height:210px;}
.item_t .img a{display:block;}
.item_t .img a:hover{background:#000;}
.item_t .img a:hover img{filter:alpha(opacity=80);-khtml-opacity:0.8;opacity:0.8;-webkit-transition:all 0.3s ease-out;-khtml-transition:all 0.3s ease-out;}
.item_t .price{
	position:absolute;bottom:10px;right:5px;background-color:rgba(0, 0, 0, 0.2);color:#FFF;
	filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#33000000, endcolorstr=#33000000);
}
.item .btns{display:none;}
.img_album_btn{top:0px;right:0px;position:absolute;background:#ff6fa6;color:#ffffff;height:20px;line-height:20px;width:56px;border-radius:3px;}
.img_album_btn:hover{color:#fff;}
.item_t .title{padding:8px 0;line-height:18px;}
.item_b{padding:10px 8px;}
.item_b .items_likes .like_btn{background:url("IMG/ICO24x24_user.png") no-repeat;display:block;float:left;height:24px;width:24px;margin-right:5px;}
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
				if(sp>=1000000){ //����1000000ҳ�����¼�
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
body{font-size:13px;color:#3f3e3d; font-family:΢���ź�; background-color:#f1f1f3; padding:0px;margin:0px; }
a{color:#3f3e3d; text-decoration:none; line-height:25px;}
a:hover{ color:#de1d60; text-decoration:none;}
h1{font-size:16px; line-height:25px;}
h2{font-size:16px;line-height:25px; font-weight:bold; color:#c1262c;}
d{font-size:16px; color:#ffffff; text-indent:2em;}
e{color:#b1b1b1;}

</style>
</head>

<body>
<script>

function lc(){

   alert('����ʱ�䣺5��8�ա���5��20��\n������ϴ���Ƭ������д��ʵ�������ֻ��������Ϣ���ϴ���Ƭ����ȡ��Ƭ��š���ʼͶƱ��5��21�ա���5��22\n��ע�����巢����΢�Ź��ںţ��༭����ʵ����/�ֻ�����/��š���˽�š����巢������������ѡ��ͶƱ��һ��ֻ��ͶһƱ��\n����������5��26��\n�ڡ����巢�����͡��й�����������ͬ������800λ��Χ������\n��Ц��ǽ����Ļʱ�䣺5��30��\n�ٰ조Ц��ǽ����Ļ��ʽ��������Χ��Ա�μӡ�Ц��ǽ����Ļ��ʽ��');
  // document.getElementById("div_gz").style.display="";
   //alert(document.getElementById("div").style.display)
   
}

function xz(){

   alert('������ϴ���Ƭ������д��ʵ�������ֻ����루�����콱�������������ϴ���Ƭ����ȡ��Ƭ��š�һ���ֻ����룬ֻ���ϴ�һ����Ƭ��\n��ƬҪ��������Ц��Ϊ�����ܾ����ס�\n��������Ƭ�·���д������ݿ������Լ�����Ը��Ҳ�����ǶԼ��ˡ����ѵ�ף�������ǶԳ��н����ϣ����������140�����ڣ��õļ��ｫ��ͬ��Ƭ�������ڡ������ձ����ַ��桰Ц�ԡ���\n������������ˡ����ѡ�ͬ��һ��μӣ����Ŷ���������ͳһ����Դ��������׶�԰�����μ���������ǰ3���Ŷӽ��������Ŷӽ�������Ŷӽ����ר���ڱ��Ŷӳ�Ա��Ц��д��һ�ź�ˮ������һ����\n5��20�տ�ʼͶƱ��Ϊ��3�죬�༭����ʵ����/�ֻ�����/��š���������ͶƱ��һ��ֻ��ͶһƱ��ͨ��������������Ƭ��ţ����Բ鿴ͶƱ�����\nƱ��ǰ�����������ܹ����2000Ԫ���𣬻�����ú��ǹ��ʻ�ɴ��Ӱ��ֵ1000Ԫ��д����ϵ1�ף������Գ�Ϊ������һ�ܡ���־�ķ������');
  // document.getElementById("div_gz").style.display="";
   //alert(document.getElementById("div").style.display)
   
}


function sczp(){

   alert('��ã�Ц��������ʱ���Ѿ���ֹ��Ŀǰ�ѽ���ͶƱ���ڣ���鿴ͶƱϸ��');
  // document.getElementById("div_gz").style.display="";
   //alert(document.getElementById("div").style.display)
   
}


</script>

<div style="position:fixed;top:150px;left:10px; z-index:999;"><img src="IMG/qr.png" height="100px;" width="100px;"/><div style="padding-top:6px;">ɨ�����������ˮ��</div></div>

<table width="100%" border="0" cellpadding="0" cellspacing="0"style="background:url(IMG/TOP_D.png) no-repeat top center;">
  <tr style="background:url(IMG/wlwhj3.png) no-repeat top left;">
    <td align="center" valign="top" ><table width="1195" height="209" border="0" cellspacing="10">
      <tr>
        <td height="102" colspan="3" align="center" valign="bottom"><img src="IMG/PIC_theme.png" /></td>
      </tr>
      <tr>
        <td width="612" align="left" valign="top"><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5��8��������΢Ц�գ����Լ�һ������Ц���ɡ�Ȼ���أ����������һ�̼�¼�������ϴ���Ƭ���μ� "��������Ц������"��������������ί�������������ձ����������죬����κ��Ϻ�㳡�����庫�ǹ�����Ӱ����Э�죬���Ц�����п��ܳ������Ϻ�㳡��"Ц��ǽ"�ϣ����л���Ӯ��2000Ԫ����"����"д��ȶ��غ���Ŷ��
</a></td>
        <td width="271" align="center" valign="middle"><table width="100%" border="0" cellspacing="3">
          <tr>
            <td colspan="2" align="right"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              
              <form method="post" name="form1"  action="?kk=1">
              <tr>
                <td width="78%" valign="top">
                  <div><input type="text"  name="kw" id="kw"  placeholder="������������"  style="width:202px; height:32px; border-radius:6px; margin-bottom:10px;"/>
                  </div>                  </td>
                <td width="22%" valign="top"><input type="image" src="IMG/Button_search.png" /></td>
              </tr>
              </form>
              
            </table></td>
          </tr>
          <tr>
            <td><div onclick="lc();"  style="cursor:pointer;"><img src="IMG/Button_bslc.png" width="129" height="51" /></div></td>
            <td><div onclick="xz();"  style="cursor:pointer;"><img src="IMG/Button_csxz.png" width="129" height="51" /></div></td>
          </tr>
        </table></td>
        <td width="266" align="center" valign="middle">
		<!--
		<div onClick="javascript:window.open('sc.jsp','_blank')" style="cursor:pointer;"><img src="IMG/Button_sczp.png" width="266" height="85" /></div>
		-->
		<div  onclick="sczp();" style="cursor:pointer;"><img src="IMG/Button_sczp.png" width="266" height="85" /></div>
		</td>
      </tr>
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

  //������������
String sql = "";
if(kw!=""&&kk!=null){
  
     
    sql = "Select * FROM yqfbwx_face where bh like '%"+kw+"%' or  xm  like '%"+kw+"%' and yz=1  order by fbsj desc";

   
}else{
  // sql = "Select * FROM yqfbwx_face where bh is not null and openid<>'null' and yz=1 order by fbsj desc";
  
  sql = "Select * FROM yqfbwx_face where bh is not null and yz=1 order by fbsj desc";
}

//out.println(sql);
sql_data db = new sql_data();
ResultSet RS = db.executeQuery(sql);
if(RS.wasNull()) out.print("<br><font face=Arial color=navy size=2><b>��ǰ����������</b></font>");
%>
<%
int intPageSize; //һҳ��ʾ�ļ�¼��
int intRowCount; //��¼����
int intPageCount; //��ҳ��
int intPage; //����ʾҳ��
java.lang.String strPage;
int i;
//����һҳ��ʾ�ļ�¼��
intPageSize = 10;
//ȡ�ô���ʾҳ��
strPage = request.getParameter("page");
if(strPage==null){//������QueryString��û��page��һ����������ʱ��ʾ��һҳ����
intPage = 1;
}
else{//���ַ���ת��������
intPage = java.lang.Integer.parseInt(strPage);
if(intPage<1) intPage = 1;
}
RS.last();
intRowCount = RS.getRow();
//������ҳ��
intPageCount = (intRowCount+intPageSize-1) / intPageSize;
//��������ʾ��ҳ��
if(intPage>intPageCount) intPage = intPageCount;
if(intPageCount>0){
//����¼ָ�붨λ������ʾҳ�ĵ�һ����¼��
RS.absolute((intPage-1) * intPageSize + 1);
//��ʾ����
i = 0;
%>

<%while((i<intPageSize && !RS.isAfterLast())){
	String bh = RS.getString("bh");
	String xm = RS.getString("xm");
	String zan = RS.getString("zan");
	String id = RS.getString("id");
	
	String images ="";
	images = RS.getString("img1");
	String images2="";
	if(images.length()>0 && !images.equals("no.gif") ){
		images2 = "http://v.yqcn.com/bmwj/asp/sxbook/download3/"+images;
	}else{
		images2 = "http://info.yqcn.com:7001/ADV/uploadfiles/video/no.gif";
	}
	
%>
	
	    <div class="item masonry_brick">
			<div class="item_t">
				<div class="img">
					<a href="show.jsp?id=<%=id%>" target="_blank()"><img width="210" src="<%=images2%>" /></a>
					<span class="price">NO.<%=bh %></span>
					<div class="btns">
						<a href="<%=images2%>" class="img_album_btn">�������</a>
					</div>
				</div>
			
			</div>
			<div class="item_b clearfix">
				<div class="items_likes fl">
					<a href="#" class="like_btn"></a><%=xm %>
				
				</div>
				<div class="items_comment fr"><a href="#">Ʊ����</a><em class="bold"><%=MyUtils3.GetPS(id) %></em></div>
			</div>
		</div><!--item end-->
			
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
			<div align="right">��<%=intPage%>ҳ/��<%=intPageCount%>ҳ&nbsp;&nbsp;
          <%if(intPage>1){%>
      <a href="?kw=<%=kw %>&page=<%=intPage-1%>">��һҳ</a>
      <%}%>
  &nbsp;&nbsp;
  <%if(intPage<intPageCount){%>
  <a href="?kw=<%=kw %>&page=<%=intPage+1%>">��һҳ</a>
  <%}%>
  &nbsp;&nbsp;��ѡ��ҳ�룺
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
					
<div style="display:none;" id="gotopbtn" class="to_top"><a title="���ض���" href="javascript:void(0);"></a></div>
					

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
    <td height="70" align="center" valign="top" bgcolor="#de1d60" ><table width="985" height="80" border="0" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td width="182" height="62" align="left"><a href="http://www.yqcn.com/" target="_blank"><img src="http://zt1.yqcn.com/logo/Logo_zgyqw_white.png" width="177" height="54" border="0" /></a></td>
        <td width="10">&nbsp;</td>
        <td width="788" align="left"><d>Copyright &copy; www.yqcn.com��All Rights Reserved. ��Ȩ���� �й������� 
          ר���������й�������2015��05��</d></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>