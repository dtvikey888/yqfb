<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.sql_data"%>
<%@page import="java.sql.ResultSet"%>
<%
String urlname ="show.jsp";
String openid =request.getParameter("openid");
String check=Topay.WxJsApiCheck4(urlname,openid);
%>
<%
  String id =request.getParameter("id"); 
  sql_data sqlbean=new sql_data();
  String sql = "Select * FROM yqfbwx_face where yz=1 and id="+id;
  ResultSet RS = sqlbean.executeQuery(sql);
  String images2="";
  String bh ="";
  String xm ="";
  String zan="";
  String memo=""; 
 
  while(RS.next()){

    bh = RS.getString("bh");
	xm = RS.getString("xm");
	zan = RS.getString("zan");
	memo = RS.getString("memo");
	
	String images ="";
	images = RS.getString("img1");
	
	if(images.length()>0 && !images.equals("no.gif") ){
		images2 = "http://v.yqcn.com/bmwj/asp/sxbook/download3/"+images;
	}else{
		images2 = "http://info.yqcn.com:7001/ADV/uploadfiles/video/no.gif";
	}


}
   %>

<html>
	<head>
	<title>ˢ�������콱Ʒ��������Ⱥ��¶���</title>
	
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
	
	<script src="js/jquery.js"></script>
	
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
        </style><script type="text/javascript">
			function button1(){
			$("#mcover").css("display","block")    // ��������Ѱ�ť��������
			}
			function button2(){
			$("#mcover").css("display","block")  // ���������Ȧ��ť��������
			}
			function weChat(){
			$("#mcover").css("display","none");  // ��������㣬��������ʧ
			}
			
			/*$
			(function(){
			   setTimeout(function () {
					$("#mcover").show();}, 6000);   // 6000ʱ�����ǵ�����
			setTimeout(function () {
					$("#mcover").hide(); }, 8000);    //8000���������ز�
			})
			*/
		</script>

	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		wx.config({
		    debug: false, // ��������ģʽ,���õ�����api�ķ���ֵ���ڿͻ���alert��������Ҫ�鿴����Ĳ�����������pc�˴򿪣�������Ϣ��ͨ��log���������pc��ʱ�Ż��ӡ��
		    <%=check%>,// ���ǩ��������¼1
		    jsApiList: ['onMenuShareTimeline','chooseImage','previewImage','uploadImage'] // �����Ҫʹ�õ�JS�ӿ��б�����JS�ӿ��б����¼2
		});
		wx.ready(function(){
		   //alert("config ok...");
		    //�������Ͻǲ˵��ӿ�
		   	  wx.hideOptionMenu();
		   
			    wx.checkJsApi({
           jsApiList: [
             'onMenuShareTimeline',
             'getNetworkType',
             'previewImage',
             'onMenuShareTimeline',
             'chooseImage'
           ],
           success: function (res) {
            // alert(JSON.stringify(res));
           }
          });
		});
		wx.error(function(res){
			//alert(res);
		    // config��Ϣ��֤ʧ�ܻ�ִ��error��������ǩ�����ڵ�����֤ʧ�ܣ����������Ϣ���Դ�config��debugģʽ�鿴��Ҳ�����ڷ��ص�res�����в鿴������SPA�������������ǩ����
		});
		

		function callpay(){
			wx.chooseImage({
			    jsApiList: ['onMenuShareTimeline','chooseImage','previewImage','uploadImage'], // ���΢�Žӿ��Ƿ����
			     success: function (res) {
        				var localIds = res.localIds; // ����ѡ����Ƭ�ı���ID�б�localId������Ϊimg��ǩ��src������ʾͼƬ
   					 }
			    });
			    
		}
		
		function preimg(){
			 wx.previewImage({
			    jsApiList: ['previewImage'], // ���΢�Žӿ��Ƿ����
			     current: '<%=images2%>',
      			urls: [
        		'<%=images2%>'
      			]
			    });
   
		}
		
		
		// 2.2 ������������Ȧ��ť������Զ���������ݼ��������ӿ�
  function  sharefriendRound2() {
     //��ʾ���Ͻǲ˵��ӿ�
       wx.showOptionMenu();
	   
    wx.onMenuShareTimeline({
      title: '����μ�\"��������Ц������\"��<%=xm%> <%=bh%>ͶƱ���л������100Ԫ��ƷŶ',
      link: 'http://www.yqrb.com.cn/yqfb/show.jsp?id=<%=id%>&openid=<%=openid%>',
      imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo5.jpg',
      trigger: function (res) {
        // ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���
       // alert('�û������������Ȧ');
      },
      success: function (res) {
        alert('�ѷ���');
      },
      cancel: function (res) {
        alert('��ȡ��');
      },
      fail: function (res) {
       // alert(JSON.stringify(res));
      }
    });
	
    //alert('��ע���ȡ����������Ȧ��״̬�¼�');
	//alert('����ȥ��������Ѱɣ�������Ҳ���μ�ԤԼ����!');
  };
		
</script>

<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
body {
	background-color: #efeff1;
}
-->
</style>

<style>

#menu2 { bottom:0; left:0; width:100%; position:fixed; padding:30px; text-align:center; background:#fff; z-index:2; }
</style>
</head>
   <body id="signupverify" style="">
   
   <div id="mcover" onClick="weChat()" style="display: none;">
          <img src="js/tip.png">
   </div>
   
   <div  id="contentid">
    <header>
            <div class="left-box">
                <!-- <a class="hd-lbtn" href="javascript:history.go(-1)"><span>����</span></a> -->
                <a class="hd-lbtn" href="http://www.yqrb.com.cn/yqfb/index.jsp?openid=oSX6kjlwIvpFGl2Ws8TN5Ggxd7Ak"><span>����</span></a>
            </div>
        <h1><font color="#000000">��������</font>Ц��<font color="#000000">����</font></h1>
    </header>
    <!--  
<div style=" margin-left:5px; margin-right:5px; padding-bottom:6px; padding-top:8px; line-height:25px;"> 
<SPAN style="COLOR: #ff0000"><B>�˵����</B></SPAN>
<P>1��<SPAN style="COLOR: #000">��ע���й�����������yq3535������΢�źš�</SPAN></P>
<P>2��<SPAN style="COLOR: #000">��ת����ĸ�׽�,1000�迵��ܰ����͡��΢��������Ȧ����ͼ������ֻ���ᡣ</SPAN>
<P>3��<SPAN style="color:#000">���й�������΢�ŶԻ���������<font color=red>"��"</font>�ؼ��֡�</SPAN></P>
<P>4��<SPAN style="color:#000">����д�������ֻ����롢�ϴ�����Ȧ��ͼ������ύ��ť���뽽��ҳ�档</SPAN></P>
</div>
-->
<div id="tips"></div>

<div class="body p-10 address-edit" style="background:#efeff1">

 

<table width="100%" border="0" cellpadding="0" cellspacing="20">
      <tr>
        <td bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="15" style="background-color:#FFF">
          <tr>
            <td height="41" align="right" style="font-family:Arial; font-size:18px; ">
			<table width="100%" height="299" border="0" cellpadding="0" cellspacing="12" style="background-color:#FFF; font-family:΢���ź�; font-size:35px;">
          <tr>
            <td height="48" colspan="3" align="center" style="color:#888888; border-bottom:2px  solid  #f5f5f7 "><a style="font-family:Arial; font-size:20px;">NO.<%=bh%></a>&nbsp;<span style="font-family:Arial; font-size:20px;"><%=xm%></span></td>
          </tr>
          <tr>
            <td height="103" colspan="3" style="font-family:΢���ź�; font-size:35px; "><table width="100%" border="0" cellspacing="10">
              <tr>
                <td width="29%" height="21">Ŀǰ������</td>
                <td width="71%">�� <a  style="font-family:Arial; color:#dd1c60;">18</a> ��</td>
              </tr>
              <tr>
                <td rowspan="2" valign="top">Ц����Ʊ��</td>
                <td valign="top">�� <a  style="font-family:Arial; color:#dd1c60;">370</a> Ʊ</td>
              </tr>
              <tr>
                <td height="21" valign="top" style="color:#888888" >�����һ������  <a  style="font-family:Arial; color:#dd1c60;">25</a> Ʊ����ȥ������Ʊ�ɣ�</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="50" align="center" bgcolor="#dd1c60" style="color:#FFF "><div style="font-family:Arial; font-size:18px;" onClick="javascript:window.open('#','_self')"> ͶTAһƱ</div></td>
            <td align="center" style=" color:#FFF ">&nbsp;</td>
            <td height="50" align="center" bgcolor="#ffa200" style=" color:#FFF "><div style="font-family:Arial; font-size:18px;" onClick="button2();sharefriendRound2();"> ��TA��Ʊ</div></td>
            </tr>
         <tr>
            <td height="10" colspan="3" align="center" valign="middle"  style="color:#FFF;font-family:Arial; font-size:16px;"></td>
          </tr>
         
			
          <tr>
            <td height="38" colspan="3" align="center" valign="middle" bgcolor="#888888"  style="color:#FFF;font-family:Arial; font-size:16px;">ÿ��ֻ��ͶһƱ��ͶƱ�ɲ���齱Ŷ��</td>
          </tr>
         
          </table>
			
			
			<div style="margin-top:10px;"></div>
			</td>
          </tr>
          <tr>
            <td align="center" valign="middle" bgcolor="#FFCCCC"><div onClick="preimg()"><img src="<%=images2%>" width="100%"/></div></td>
          </tr>
          <tr>
            <td height="48" align="center" valign="middle"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="428" height="34" style="font-family:΢���ź�; font-size:15px; color:#a6a6a6 "><!--Ʊ��&nbsp;&nbsp;<=zan %>--></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td align="left" valign="middle" style="font-family:΢���ź�; font-size:16px; line-height:26px; "><div style="text-indent:2em;"><%=memo %></div></td>
          </tr>
        </table></td>
      </tr>
	  
	  
  </table>

<nav class="codrops-demos"></nav>

</div>

<footer>
   <div align="center" style="margin-bottom:15px;">
		
  </div>
</footer>
</div>
  </body>
</html>
<!--
<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //��΢���������������
	   
    }else{
	  // alert('not');
	  //��΢��������������ʾ�б��
	   var target=document.getElementById("contentid");
	   target.style.display="none";
	   alert('��΢���д򿪣�');
	  
	 
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