<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="com.component.Topay"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MyUtils22"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
	//����ʱ��
	int kz =0;
	String tt1=AllValus.daf_t1;
	String tt2=AllValus.daf_t2;
    Date c1=MyUtils7.CharDate(tt1);
    Date c2=MyUtils7.CharDate(tt2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //��ʼ�齱
    //2: //�齱�Ѿ�����,��л��ע��
    //3: //�齱��û��ʼ�أ�
    //out.println(kz);
%>

<%

String urlname ="bl2/index.jsp";
String openid =request.getParameter("openid");
//out.println("openid="+openid);


String from=request.getParameter("from");

String ympath=AllValus.ympath;
String appid=AllValus.appid;

String twbsession2 = (String)session.getAttribute("twbsession2");

//out.println("dafsession="+dafsession);

if(twbsession2!=null){
   
      if(twbsession2.equals(openid)){
      
   	      //out.println("�����Լ���ģ����ص�");
   	      
   	     
      }else{
        
            //out.println("�����˵����Ժ󣬲��ص�");      
   			
   			//response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect");        

 			response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
   
      
      }
   
   }else{
   
  		    //��û��Ҫ�ص�
            //response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect");        
  			response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri=http%3a%2f%2f"+ympath+"%2fyqfb%2fOAuthServlet2&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
   
   }
   
   //ZghTools.upyt6(openid);
   
   ZghTools.ClearNull();
   
   String check="";
if(from!=null){
  check=Topay.WxJsApiCheck48(urlname,openid,from);
}else{
  check=Topay.WxJsApiCheck4(urlname,openid);
}
   
  
   
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script>
  /*
   * ע�⣺
   * 1. ���е�JS�ӿ�ֻ���ڹ��ںŰ󶨵������µ��ã����ںſ�������Ҫ�ȵ�¼΢�Ź���ƽ̨���롰���ں����á��ġ��������á�����д��JS�ӿڰ�ȫ��������
   * 2. ��������� Android ���ܷ����Զ������ݣ��뵽�����������µİ����ǰ�װ��Android �Զ������ӿ��������� 6.0.2.58 �汾�����ϡ�
   * 3. �������⼰���� JS-SDK �ĵ���ַ��http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
   *
   * ������������������ĵ�����¼5-�������󼰽���취�����������δ�ܽ����ͨ����������������
   * �����ַ��weixin-open@qq.com
   * �ʼ����⣺��΢��JS-SDK��������������
   * �ʼ�����˵�����ü��������������������ڣ��������������������ĳ������ɸ��Ͻ���ͼƬ��΢���Ŷӻᾡ�촦����ķ�����
   */
        wx_share_title="<%=AllValus.daf_title%>";
        wx_share_desc="<%=AllValus.daf_desc%>";
        wx_share_link="<%=AllValus.daf_link%>?openid=<%=openid%>";
        wx_share_imgUrl="<%=AllValus.daf_img%>";
        
        wx.config({
      debug: false,
      <%=check%>,// ���ǩ��������¼1
      jsApiList: [
        'updateTimelineShareData',
        'updateAppMessageShareData'
      ]
  });
  
  wx.ready(function () {   //�����û����ܵ������ťǰ���ȵ���
    wx.updateTimelineShareData({
      title: wx_share_title,
      link: wx_share_link,
      imgUrl: wx_share_imgUrl,
      trigger: function (res) {
        // ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���
        //alert('�û������������Ȧ');
      },
      success: function (res) {
      //  alert('�ѷ���');
      },
      cancel: function (res) {
       // alert('��ȡ��');
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
        // ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���
       // alert('�û�������͸�����');
      },
      success: function (res) {
       // alert('�ѷ���');
      },
      cancel: function (res) {
        //alert('��ȡ��');
      },
      fail: function (res) {
        //alert(JSON.stringify(res));
      }
    });
    
});

</script>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title><%=AllValus.daf_title %></title>
<meta name="description" content=""/>
<meta name="viewport" content="initial-scale=0.3, width=device-width, maximum-scale=0.3, user-scalable=no"/>
<meta name="viewport" content="initial-scale=0.3,user-scalable=no,maximum-scale=0.3" media="(device-height: 568px)"/>
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
 
<style>
body{font-size:30px;color:#3f3e3d;line-height:35px;font-family:΢���ź�;background-color:#e7f0f7;padding:0px;margin:0px;}
a{color:#3f3e3d; text-decoration:none;}
a:hover{ color:#C1262C; text-decoration:none;}
p{text-indent:2em;line-height:40px;}
h1{font-size:40px; color:#6b6b6b;}
h2{font-size:20px; color:#315E01;}
m{color:#a6a6a6;}
c{font-size:30px; font-family:Arial; color:#ffb400;}
d{color:#fff;}
</style>

	<script type="text/javascript">
		   	  
		  <%
		     // ������ֹʱ���ж��Ƿ�رմ��� ���������Ѵ�
		  // kz=1 ��ʼ�齱(����) kz=2 �齱����(�ر�) kz=3 �齱û��ʼ���رգ�
		  
		   if (kz==1){
		   
		   
		  %>
		  //alert("��ʼ");
		  
		  <%}else if(kz==2){
		   
		  
		  %>
		  
            alert('�ǳ���Ǹ������ʱ���ѹ�����л���Ĺ�ע�����´�������');
            window.location.href="<%=AllValus.errpage%>";
            
		  <%}else if(kz==3){
		  
		  
		  %>
		  
           alert('��û��ʼ�أ�"��ʼ����ʱ��<%=tt1%>"��"<%=tt2%>"��\n��ӭ��ʱ����룡');
           window.location.href="<%=AllValus.errpage%>";
          
		  <%}else{
		      
		  
		   %>
		  
		     alert('��л��ע��');
           
		  <%} %>

		</script>

	<style>
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
				right: 18px;
				top: 5px;
				width: 96%!important;
				height: 98%!important;
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
        .STYLE1 {color: #FFFFFF}
    </style>
        
         <script type="text/javascript">
			function button1(){
			$("#mcover").css("display","block")    // ��������Ѱ�ť��������
			}
			function button2(){
			$("#mcover").css("display","block")  // ���������Ȧ��ť��������
			}
			
			function button3(){
			$("#mcover2").css("display","block")  // ���������Ȧ��ť��������
			}
			
			function weChat2(){
			$("#mcover2").css("display","none");  // ��������㣬��������ʧ
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
		
		
	<script src="js/jquery.js"></script>
	
<style>
/*divͨ����ʽ*/
div{

}

/*���Ͻ�*/
div.right_top{
overflow: hidden;
z-index: 2000;
position:absolute;
right: 10px;
top: 190px;
}

/*���½�*/
div.right_bottom{
position:absolute;
bottom:0px;
right:0px

}


/*��Ļ�м�*/
div.center_{
right: 45%;
top: 50%;
}


/*���Ͻ�*/
div.left_top{
left: 10px;
top: 10px;
}


/*���½�*/
div.left_bottom{
left: 10px;
bottom: 10px;
}
</style>
		
<script>
var xz=0;
function processForm(form)
{
xz=0;
var xf=0;
if (form.c1[0].checked==1) xf+=0;
else if (form.c1[1].checked==1) xf+=0;
else if (form.c1[2].checked==1) xf+=0;
else xz=1;

if (form.c2[0].checked==1) xf+=0;
else if (form.c2[1].checked==1) xf+=0;
else if (form.c2[2].checked==1) xf+=0;
else xz=1;

if (form.c3[0].checked==1) xf+=0;
else if (form.c3[1].checked==1) xf+=0;
else if (form.c3[2].checked==1) xf+=0;
else xz=1;

if (form.c4[0].checked==1) xf+=0;
else if (form.c4[1].checked==1) xf+=0;
else if (form.c4[2].checked==1) xf+=0;
else xz=1;

if (form.c5[0].checked==1) xf+=0; 
else if (form.c5[1].checked==1) xf+=0; 
else if (form.c5[2].checked==1) xf+=0; 
else xz=1;


if (form.c6[0].checked==1) xf+=0;
else if (form.c6[1].checked==1) xf+=0; 
else if (form.c6[2].checked==1) xf+=0; 
else xz=1;

if (form.c7[0].checked==1) xf+=0;
else if (form.c7[1].checked==1) xf+=2;
else if (form.c7[2].checked==1) xf+=0;
else xz=1;

if (form.c8[0].checked==1) xf+=0;
else if (form.c8[1].checked==1) xf+=2; 
else if (form.c8[2].checked==1) xf+=2;
else xz=1;

if (form.c9[0].checked==1) xf+=0;
else if (form.c9[1].checked==1) xf+=2; 
else if (form.c9[2].checked==1) xf+=2;
else xz=1;

if (form.c10[0].checked==1) xf+=0;
else if (form.c10[1].checked==1) xf+=2; 
else if (form.c10[2].checked==1) xf+=2;
else xz=1;


if(xz!=0){alert('������ѡ��ÿһ�');return false;}
else
{
  //alert(OK');
  return true; 
}
}
</script>
</head>
<body>
<%int cs = MyUtils22.GetCsForDt(openid);%>
<%if(cs>100000){%>
<div id="mcover" onClick="weChat()" style="display: block;">
          <img src="js/tip.png"/>
</div>
<%}else{%>
<div id="mcover" onClick="weChat()" style="display: none;">
          <img src="js/tip.png"/>
</div>
<%}%>

<%if(twbsession2!=null){%>
  <%if(twbsession2.equals(openid)){%>
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

<div id="mcover2" onClick="weChat2()" style="display:none;">
          <img src="img/tip3.png"/>
</div>



<form name="form1" method="get" action="tp.jsp">
<table width="100%" height="302" border="0" cellpadding="0" cellspacing="0" style="background-color:#ececee">
  <tr>
    <td height="450" align="center" valign="top" bgcolor="#FFFFFF" style="background:url(img/IMG_TOP2.png) no-repeat top center;background-size: 100% 100%;"><table width="95%" cellspacing="2" cellpadding="0">
      <tr>
        <td height="10" colspan="2" align="right">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" align="right"><div onClick="button2();"></div></td>
      </tr>
      
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="30" background="IMG/bodybg.jpg">
      <tr>
        <td colspan="2" align="left"><p><strong>�����ǡ��л����񹲺͹����������䲼32���꣬���ݹ��һ���ʵ�С�˭ִ����˭�շ�����Ҫ�������е����ֻ�����չ��ʽ�������������Ŭ������ȫ��Ⱥ�ڶ������ط����÷���ʶ����ǿ�������ƹ�� </strong></P></td>
        </tr>
      <tr>
        <td height="50" colspan="2">
		  <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#FDCB03; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">�����</button>  
	      <div align="center" style="margin-top:25px;margin-bottom:25px;">���뽱10Ԫ�ƶ����ѣ���600�ݻ��ѡ�</div>
	        <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#FDCB03; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">�����</button>  
	      <div style="margin-top:25px;padding-left:12px;">1������ȫ����ȷ�ɻ񽱣�ÿ���ֻ��Ž��޻�һ�Σ���ʵ�����롣</div>
		  <div style="margin-top:25px;padding-left:12px;">2��6000Ԫ���ѽ�������򳬳��ʱ�����������Ч��</div>
		  <div style="margin-top:25px;padding-left:12px;margin-bottom:25px;">3�����λ�ֻ��������Ϊ�����ƶ��û���</div>
		  
		  
		   <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#FDCB03; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">ѡ����</button>  
        </td>
      </tr>
      
     
	  
      <tr>

	  
        <td>
		<table width="103%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
     
		
		  
		
      <tbody id="tbName" >
      <tr>
        <td height="20" ><p><strong>1��������ȫ����������᳣��ίԱ��ڶ�ʮ���λ���ͨ�����л����񹲺͹����������������ǣ�����</strong>
          <p><input type="radio" name="c1" value="1" style="width:55px; height:55px;"/>
		    A. 1987��9��5��</p>
          <p> 
            <input type="radio" name="c1" value="2" style="width:55px; height:55px;"/>
            B. 1988��1��1��</p>
          <p>
            <input type="radio" name="c1" value="3" style="width:55px; height:55px;"/>
            C. 1996��7��5��</p>
          </td>
      </tr>
	  </tbody>
	  
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><strong>2.������ָ��ȥ�����ڵĹ��һ����������֯�Լ����˴������Ρ����¡����á���ѧ���������Ļ����ڽ̵Ȼ�����Թ��Һ�����б����ֵ�ĸ������֡�ͼ������Ȳ�ͬ��ʽ����ʷ��¼��</strong>
          <p><input type="radio" name="c2" value="1" style="width:55px; height:55px;"/>
		    A. ֱ���γɵ�</p>
          <p> 
            <input type="radio" name="c2" value="2" style="width:55px; height:55px;"/>
            B. �γɵ�</p>
          <p>
            <input type="radio" name="c2" value="3" style="width:55px; height:55px;"/>
            C. ֱ�Ӻͼ���γɵ�</p>
          </td>
      </tr>
	  </tbody>
	  
	  
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><strong>3����ֹ�������ڣ������еĵ�����</strong>
          <p> <input type="radio" name="c3" value="1" style="width:55px; height:55px;"/>
		    A. ����</p>
          <p>
            <input type="radio" name="c3" value="2" style="width:55px; height:55px;"/>
            B. ����</p>
          <p>
            <input type="radio" name="c3" value="3" style="width:55px; height:55px;"/>
            C. ����</p>
         

</td>
      </tr>
	  </tbody>
	  
	   <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><strong>4���л����񹲺͹��������֯���У��������������Ѿ����ŵĵ�����</strong>
          <p> <input type="radio" name="c4" value="1" style="width:55px; height:55px;"/>
		    A. �Ϸ�֤��</p>
          <p>
            <input type="radio" name="c4" value="2" style="width:55px; height:55px;"/>
            B. ��Ч֤��</p>
          <p>
            <input type="radio" name="c4" value="3" style="width:55px; height:55px;"/>
            C. ����Ŀ��֤��</p>
         
		   </td>
      </tr>
	  </tbody>
	  
	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><strong>5��ĳ�й�����Դ��һ��Ա�������Ĵ���,��ʧ����,Ӧ�ɣ��������������֡�</strong>
          <p> <input type="radio" name="c5" value="1" style="width:55px; height:55px;"/>
		    A. �е����ֻ��߹�����Դ��</p>
          <p>
            <input type="radio" name="c5" value="2" style="width:55px; height:55px;"/>
            B. �й�����Դ�ֻ����м���</p>
          <p>
            <input type="radio" name="c5" value="3" style="width:55px; height:55px;"/>
            C. �е����ֻ��Ǽ���</p>
         
            
            </td>
      </tr>
	  </tbody>
	  
	  <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><strong>6��Ǯĳδ��������ͬ�⣬���Լ��ڵ�����ժ���͸�ӡ��δ���ŵ�����������༭������һ���飬������Ϊ���ڣ�����Ӧ�е��������Ρ�</strong>
          <p><input type="radio" name="c6" value="1" style="width:55px; height:55px;"/>
		    A. �Ƿ�����</p>
          <p>
            <input type="radio" name="c6" value="2" style="width:55px; height:55px;"/>
            B. ���Թ�������</p>
          <p>
            <input type="radio" name="c6" value="3" style="width:55px; height:55px;"/>
            C. �Ƿ���¼</p>
          
		  </td>
      </tr>
	  </tbody>
	
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><strong>7����ҵ�ʱ��ṹ�򣨣������ϴ�仯ʱ,Ӧ��ʱ�޶��������ļ����Ϲ鵵��Χ�͵����������ޱ�</strong>
          <p><input type="radio" name="c7" value="1" style="width:55px; height:55px;"/>
		    A. ����������</p>
          <p>
            <input type="radio" name="c7" value="2" style="width:55px; height:55px;"/>
            B. ��ɶ�</p>
          <p>
            <input type="radio" name="c7" value="3" style="width:55px; height:55px;"/>
            C. ��Ӫҵ��</p>
         
         
		</td>
      </tr>
	  </tbody>
	  
	  
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><strong>8��������������������������֣����桢���������</strong>
          <p> <input type="radio" name="c8" value="1" style="width:55px; height:55px;"/>
		    A. �����⳥��ʧ</p>
          <p>
            <input type="radio" name="c8" value="2" style="width:55px; height:55px;"/>
            B. ��������</p>
          <p>
            <input type="radio" name="c8" value="3" style="width:55px; height:55px;"/>
            C. û��Υ������</p>
        
       </td>
      </tr>
	  </tbody>
	  
	   
      
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><strong>9��ĳ�н����ֱ���Ĳ��ֵ����Ѿ������ƽ����ޣ������ݷ����߸��ƽ������þ־ֳ����ڲ鵵ʹ�÷���Ŀ��ǣ�ָʾ�ܾ��ƽ����Դˣ�Ӧ������ ��</strong>
          <p> <input type="radio" name="c9" value="1" style="width:55px; height:55px;"/>
		    A. �Ըþ־ֳ�������������</p>
          <p>
            <input type="radio" name="c9" value="2" style="width:55px; height:55px;"/>
            B. �Ըþֽ�����������</p>
          <p>
            <input type="radio" name="c9" value="3" style="width:55px; height:55px;"/>
            C. �Ըþֽ�������������ͬʱ�Ըþ־ֳ�������������</p>
        
       </td>
      </tr>
	  </tbody>
	  
	  
	    
	 <tbody id="tbName">
      <tr>
        <td height="20" bgcolor="#FFFFFF"><p><strong>10�����л����񹲺͹��̷�����329���涨:�����ᡢ��ȡ�������еĵ�����,����������ͽ�̻��߾���</strong>
          <p> <input type="radio" name="c10" value="1" style="width:55px; height:55px;"/>
		    A. 3������</p>
          <p>
            <input type="radio" name="c10" value="2" style="width:55px; height:55px;"/>
            B. 5������</p>
          <p>
            <input type="radio" name="c10" value="3" style="width:55px; height:55px;"/>
            C. 7������</p>
            
            <div style="float:right" onClick="button3();"><img src="img/xxzl2.png" border="0"></div>
            
            <!-- 
         <button onClick="button3();" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#871815; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">����ʾ</button>  
           -->
          
        
       </td>
      </tr>
	  </tbody>
	  
	  
	 
    </table>
		</td>
       </tr><tr>
		
      </tr>
	  
	  
	  
    </table></td>
  </tr>
  
  
  
  <tr>
    <td height="115" align="center" valign="middle"><table width="95%" height="75" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center">
        <%if(!MyUtils22.iscj_pd(openid)){%>
        <!--  
        <input target="_self" type="image" border="0" name="sub22" src="img/tp3.png" width=100% height=80  onclick="return processForm(this.form);"/>
        -->
       <button onclick="return processForm(this.form);" type="submit" style="width:100%;padding:15px 15px;border-radius:15px; background:#FDCB03; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;</button>  
       <p></p>
		<%}else{ %>
		 <button onclick="return nosForm(this.form);" type="reset" style="width:100%;padding:15px 15px;border-radius:15px; background:#871815; border:0px #555 solid; color:#fff; font-size:55px; font-weight:bold;">���Ѿ������,<%="���ǵ�"+MyUtils22.GetWs(openid)+"λ������,"+MyUtils22.xsdz(openid) %></button>  
		<%} %>
	   <p></p>
	<input name="openid" type="hidden" id="openid" value="<%=openid%>"/>	<div></div></td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
</div>

</body>
</html>


<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //��΢���������������
	   
	   
	   
	   
    }else{
	   //alert('not');
	  //��΢��������������ʾ�б��
	   var target=document.getElementById("contentid");
	   target.style.display="none";
	   //alert('���ȹ�ע΢��');
	  
	 
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
