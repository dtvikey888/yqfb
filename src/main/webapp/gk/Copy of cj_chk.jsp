<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.MyUtils2"%>
<%@page import="org.fjw.weixin.util.MyUtils3"%>
<%@page import="org.fjw.weixin.util.MyUtils6"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<%@page import="org.fjw.weixin.yy.WeixinChaOpenId"%>
<%@page import="org.liufeng.course.util.AdvancedUtil"%>
<%@page import="org.fjw.weixin.util.MathRandom2"%>
<%@page import="org.fjw.weixin.util.MyUtils7"%>
<%@page import="org.fjw.weixin.util.MathRandom3"%>
<%

String openid = request.getParameter("openid");
String urlname = "gk/cj_chk.jsp";

//String xm = request.getParameter("xm");
//String tel = request.getParameter("tel");

System.out.println("openid="+openid);
System.out.println("urlname="+urlname);
String xm = MyUtils2.codetoString(request.getParameter("xm"));
String tel = request.getParameter("tel");
String memo = MyUtils2.codetoString(request.getParameter("memo"));

String check=Topay.WxJsApiCheck3(urlname);

%>

<%
  boolean iscztel = MyUtils7.isczTel(tel);
  
  int fhz=2;
  
  if(iscztel){
    
    out.println("<script>alert('�ֻ������ظ�');window.location.href='dl.jsp?openid=="+openid+"'</script>");

   }else{
   
      //���￪ʼ�ύ�û�����
       fhz = MyUtils7.StartCJBM(openid,xm,tel,memo);
      //1 �Ѿ������(�ύ����ʧ�ܣ�Ȼ��ر�ҳ��) 2.��û�齱,���ڱ�ҳ�� ���ǳ齱ҳ��.
   }
  
   %>


  

<html>
	<head>
	
	<title>�齱�</title>
	
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
 
	 <link type="text/css" rel="stylesheet" href="../css/other10.css">
	 
	 <script type="text/javascript"  src="js/jquery-1.9.1.js"></script>
	 <style type="text/css">
	*{margin:0;padding:0;list-style-type:none;}
	a,img{border:0;}
	body{position:relative;background:url(img/guaguaka_bg.png) no-repeat 50% 0;height:640px;overflow:hidden;}

	#bg2{width:295px;height:195px;margin:0 auto;}
	#gua1{width:295px;;margin:0 auto;}
	#notify{width:295px;height:101px;margin:0 auto;}
	#nImg_div{position:absolute;color:white;font-size:17px;font-family:'����';}
	#nImg_div div{width:245px;height:101px;padding:20px 0px 0px 50px;}
	#di{width:295px;margin:0 auto;}
	#bg1{display:none;position:fixed;top:0%;left:0%;width:100%;height:100%;background-color:black;z-index:1001;-moz-opacity:0.7;opacity:.70;filter:alpha(opacity=70);}
	#show{display:none;position:absolute;top:222px;left:50%;margin-left:-148px;text-align:center;background-color:#fff;z-index:1002;overflow:auto;}
	#show div{margin-top:-145px;margin-left:40px;padding-right:40px;line-height:1.5;color:#000000;font-size:17px;font-family:'����';}
	</style>
	
	 <%
	//����ʱ��
	int kz =0;
	String cc1=AllValus.zy1;
	String cc2=AllValus.zy2;
    Date c1=MyUtils7.CharDate(cc1);
    Date c2=MyUtils7.CharDate(cc2);
    kz= MyUtils7.TimeKZ(c1,c2);
    //1: //��ʼ�齱
    //2: //�齱�Ѿ�����,��л��ע��
    //3: //�齱��û��ʼ��
  
	 %>
	 
	 <%
	 //����ʲô��
	 String zsm = MyUtils7.zsm(openid);
	  %>
	  
	   <%
  
//����������ʣ��

int t1 = MyUtils7.sy1(); //һ�Ƚ�����ʣ������
int t2 = MyUtils7.sy2(); //���Ƚ�����ʣ������

System.out.println(t1);
System.out.println(t2);

   %>
   
   
    <%
  
//��������ÿ���ʣ�� <=0 ��ʾû��

int day_sy1 = MyUtils7.TodaySY(1); //һ�Ƚ�����ʣ������
int day_sy2 = MyUtils7.TodaySY(2); //���Ƚ�����ʣ������


System.out.println(day_sy1);
System.out.println(day_sy2);

   %>

		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript" charset="gb2312"></script>
		<script type="text/javascript">
		wx.config({
		    debug: false, // ��������ģʽ,���õ�����api�ķ���ֵ���ڿͻ���alert��������Ҫ�鿴����Ĳ�����������pc�˴򿪣�������Ϣ��ͨ��log���������pc��ʱ�Ż��ӡ��
		    <%=check%>,// ���ǩ��������¼1
		    jsApiList: ['hideMenuItems'] // �����Ҫʹ�õ�JS�ӿ��б�������JS�ӿ��б�����¼2
		});
		wx.ready(function(){
		   //alert("config ok...");
		   
		   //�������Ͻǲ˵��ӿ�
		   	  wx.hideOptionMenu();
		   	  
		   	    <%
		   String accessToken = WeixinChaOpenId.GetDBAccessToken(""+AllValus.memo+"");

		   %>
		   	  
		   	  
		   <% if(fhz==1){
		     // ��װ�ı��ͷ���Ϣ
		   String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "���Ѿ��������"+zsm+"");
		// ���Ϳͷ���Ϣ
		   AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		   %>
		       //alert('���Ѿ��������%=zsm%>');
               //�رյ�ǰ��ҳ���ڽӿ�
                wx.closeWindow();
		   <%}else{%>
		     //  alert('�������ڱ�ҳ���г齱�ɣ�');
               

		   <%}%>
		   
		   

		   
		   <%
		   //�ж�ȫ������ʣ��
		   if(t1<0 && t2<0){
		   
		     // ��װ�ı��ͷ���Ϣ
		  // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "ȫ����Ʒ�ѳ���,��л���Ĳ��룬���ע������һ�ڻ��");
		// ���Ϳͷ���Ϣ
		 //  AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		   %>
		   
		        alert('ȫ����Ʒ�ѳ���,��л���Ĳ��룬���ע������һ�ڻ��');
               //�رյ�ǰ��ҳ���ڽӿ�
                wx.closeWindow();
                
           <%}%>
     

		  <%
		     // ������ֹʱ���ж��Ƿ�رմ��� ���������Ѵ�
		  // kz=1 ��ʼ�齱(����) kz=2 �齱����(�ر�) kz=3 �齱û��ʼ���رգ�
		  
		   if (kz==1){
		   
		   
		  %>
		 // alert("��ʼ�齱");
		  
		  <%}else if(kz==2){
		   // ��װ�ı��ͷ���Ϣ
		  // String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "�ǳ���Ǹ���齱ʱ���ѹ�����л����\"�й�������\"�Ĺ�ע�����´�������");
		// ���Ϳͷ���Ϣ
		  // AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		  
		  %>
		  
            alert('�ǳ���Ǹ���齱ʱ���ѹ�����л���Ĺ�ע�����´�������');
            //�رյ�ǰ��ҳ���ڽӿ�
            wx.closeWindow();
		 
		  <%}else if(kz==3){
		   // ��װ�ı��ͷ���Ϣ
		   //String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "��û��ʼ�أ�\"��ʼ�齱ʱ��"+cc1+"\"��\""+cc2+"\"��\n��ӭ��ʱ����룡");
		// ���Ϳͷ���Ϣ
		  //AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		  
		  %>
		  
           alert('��û��ʼ�أ�"�齱ʱ��<%=cc1%>"��"<%=cc2%>"��\n��ӭ��ʱ����룡');
           //�رյ�ǰ��ҳ���ڽӿ�
           wx.closeWindow();
		 
		  <%}else{ 
		  
		    // ��װ�ı��ͷ���Ϣ
		//   String jsonTextMsg =AdvancedUtil.makeTextCustomMessage(openid, "��л��ע��");
		// ���Ϳͷ���Ϣ
		//   AdvancedUtil.sendCustomMessage(accessToken, jsonTextMsg);
		   
		  %>
		  
		     alert('��л��ע��');
            //�رյ�ǰ��ҳ���ڽӿ�
            wx.closeWindow();
            
		  <%} %>
		  
		   
		   	  
			    wx.checkJsApi({
           jsApiList: [
             'hideMenuItems',
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

// 2.2 ����ҳ�� body onload����ȡ���������ز˵��� ��
  function  sharefriendRound6() {
    
   //�������Ͻǲ˵��ӿ�
	wx.hideOptionMenu();
	
	   
   wx.hideMenuItems({ 
      menuList: [ 
        'menuItem:readMode', // �Ķ�ģʽ 
        'menuItem:openWithQQBrowser', // ��	QQ������д�
        'menuItem:openWithSafari', //��Safari�д�
        'menuItem:share:email', //�ʼ�
        'menuItem:copyUrl', // �������� 
        'menuItem:favorite', //�ղ�
        'menuItem:share:brand', //һЩ���⹫�ں�
        'menuItem:jsDebug',  //����:
		'menuItem:editTag', //�༭��ǩ: 
	    'menuItem:delete',  //ɾ��:
 		'menuItem:originPage', //ԭ��ҳ:
 		'menuItem:share:qq',  //������QQ:
 		'menuItem:share:weiboApp',  //������Weibo:
		'menuItem:favorite',  //�ղ�: 
 		'menuItem:share:facebook', //������FB:
		'menuItem:share:QZone'  //������ QQ �ռ�

      ], 
      success: function (res) { 
        alert('������һϵ�а�ť'); 
      }, 
      fail: function (res) { 
        alert(JSON.stringify(res)); 
      } 
    }); 
	
    //alert('��ע���ȡ������������Ȧ��״̬�¼�');
	alert('����ȥ���͸���������������Ҳ���μ�ԤԼ����!');
  };		


		</script>
	</head>
  <body onLoad="sharefriendRound6()">
  
  <input type="hidden" name="opp" id="opp" value="<%=openid %>">
  
  <input type="hidden" name="day_sy1" id="day_sy1" value="<%=day_sy1%>">
  <input type="hidden" name="day_sy2" id="day_sy2" value="<%=day_sy2%>">
  
  <!-- �޸�img.srcʱͿ��Ҳ���Զ���Ӧ��ͼƬ�ĳߴ�.�޸�layer�����ɸ���Ϳ����ʽ -->
   <div id="bg2"><img id="bg2_img" src="img/guaguaka_word.png" width="295" height="195" style="position:absolute;"/></div>

<div id="gua1">
	<img id="gua1_img" src="img/gua_image.png" style="position: absolute;"/>
	<canvas id="front" style="position:absolute;" />
</div>

<div id="notify">
	<img id="nImg" src="img/notice_bg.png" style="position: absolute;"/>
	<div id="nImg_div">
		<div>�ο��ιο�������������!</div>
	</div>
</div>
<!--
<div id="di"><img id="di_img" src="img/detail_declare_bg.png" style="position: absolute;"/></div>
-->
<div id="bg1"></div>

<div id="show">
	<img id="show_img" src="img/dialog_bg.png" width="100%" height="100%"/>
	<!--  <div>�ף�������Ļ����Ѿ�������~�����ٽ�������</div>-->
	<div>�ף����Ѿ�������ˣ�</div>
	<img id="show_btn" src="img/btn_sure.png" style="margin-top: 30px;" onClick="hidediv()"/>
</div>


<script type="text/javascript">   
var gua = 1,re = 2;  // �����ùν�����
//var imgSrc = 'img/aa.png';
var imgSrc = ['img/z_1.jpg','img/z_2.jpg','img/z_3.jpg'];

//var num = Math.floor(Math.random()*5);
<%
MathRandom3  a = new MathRandom3();
int rds = a.PercentageRandom();
%>
var num = <%=rds%>

//alert(num);

//����Ҫ�ж��н����� ���ݵõ���num �Ա� �������ı�־��� ��־��0 ,��Ϊû���У��ǾͰ� num=4 �������־��1���Ǿ� num������������
//�������num=4�����룬ֻ���� 0��1��2��3

var day_sy1 = document.getElementById("day_sy1").value;  //һ�Ƚ�����ʣ��<=0��ʾû����
var day_sy2 = document.getElementById("day_sy2").value;  //���Ƚ�����ʣ��<=0��ʾû����



//����Ū������
	switch (num)
					{
						case 0:
						  if(day_sy1<=0){
						    num2=2;
						  }else{
						    num2=0;
						  }
  						break;
  						
  						case 1:
  						  if(day_sy2<=0){
						    num2=2;
						  }else{
						    num2=1;
						  }
  						break;
  						
						case 2:
						  num2=2;
  						break;
					 }


function showdiv() { 
	 document.getElementById("bg1").style.display ="block";
	 document.getElementById("show").style.display ="block";
}

function hidediv() {
	 document.getElementById("bg1").style.display ='none';
	 document.getElementById("show").style.display ='none';
}

$(function(){
	var width = $("#show_img").width();
	var height = $("#show_img").height();
	var winheight=$(window).height();
	var winwidth=$(window).width();
	$("#show").css({"width":300+"px","height":160+"px","overflow":"hidden"});
	$("#show_btn").css({"width":176*0.5+"px","height":76*0.5+"px"});
	$("#gua_div").html("x"+gua);
	$("#re_div").html("x"+re);
	
	if(gua == 0){
		showdiv();
	}
})

$("img").load(function(){
	var body_width = $(window).width();
	var body_height = $(window).height();
	$("#gua1_img").width(300).height(160);
	var height = 141;
	var width  = 285;
	var bg2_width = $("#bg2_img").width();
	var bg2_height = $("#bg2_img").height();
	
	$("#gua1").css({"margin-top":"20px"});

	$("#notify").css({"margin-top":"200px"});
	$("#nImg").width(300).height(101);
	
	$("#di").css({"margin-top":"50px"});
	$("#di_img").width(414*0.7).height(24*0.7);


	$("#gua").width(width/10).height(width/10);
	$("#gua_div").css({"line-height":width/10+"px","width":width/10+"px","height":width/10+"px","margin-top":"-"+($("#gua").height())+"px","margin-left":$("#gua").height()+5+"px","font-size": $("#gua").height()/1.6+"px"});
	$("#re").width(width/10).height(width/10);
	$("#re_div").css({ "line-height":width/10+"px","width":width/10+"px","height":width/10+"px","margin-top":"-"+($("#gua").height())+"px","margin-left":$("#gua").height()+5+"px","font-size": $("#gua").height()/1.6+"px"});
	var gua1_img_width = $("#gua1_img").width();
	$("#front").css({"margin-top":9.3+"px","margin-left":7.5+"px"});
	if(gua > 0){
		bodys(height,width);
	}
});
function bodys(height,width){
	var img = new Image();         
	var canvas = document.querySelector('canvas');         
	canvas.style.position = 'absolute';           
	img.addEventListener('load',function(e){  
		var ctx;
		var w = width, h = height;             
		var offsetX = canvas.offsetLeft, offsetY = canvas.offsetTop;             
		var mousedown = false;               
		function layer(ctx){        //�޸�layer�����ɸ���Ϳ����ʽ        
			ctx.fillStyle = 'gray';                 
			ctx.fillRect(0, 0, w, h);             
		}
		 
		function eventDown(e){                 
			e.preventDefault();                 
			mousedown=true;   
	      
		}
		   
		function eventUp(e){  
		          
			e.preventDefault();                 
			mousedown=false;
			
			//��ε��������� ���ڱ�� ������ eventUP
			
			//�������ӵ� ��Ҫ�ж��Ƿ����ʱ����δ����滻ԭ�����eventUp�¼���������:
			//��δ����е�0.8��80%����˼,��Ϳ������С�ڵ���80%ʱ,�͵�������,��ʾ������,���Ը����������е���
			var data=ctx.getImageData(0,0,w,h).data;

			for(var i=0,j=0;i<data.length;i+=4){
                
			if(data[i] && data[i+1] && data[i+2] && data[i+3]){
			 

				   j++;

			   }
                
                    
			}


			if(j<=w*h*0.8){
			
			    
			
					//alert(j);
					//alert('ok');
					
					//���������ʲô���������ݿ�
					
					var zj1= num2+1;
					
					var opp = document.getElementById("opp").value;
				    //alert('����,'+zj1+" openid ,"+opp);
				 
				 
		            //var day=new Date().getDay();
					switch (zj1)
					{
						case 1:
  						x="��ϲ�������μӽ���������ר��һ��һ����";
  						break;
  						
  						case 2:
  						x="��ϲ�������μӽ���";
  						break;
						
						case 3:
  						x="лл����";
  						break;
					 }

                  // alert(x);
                  
                  
                    //���öԻ��򷵻ص�ֵ ��true ���� false��
                    
                    location.href="http://www.yqrb.com.cn/yqfb/gk/cj2.jsp?openid="+opp+"&zsm="+zj1+" ";

                    //var truthBeTold = window.confirm(x);
					//if (truthBeTold) {
						//window.alert("��ӭ�������ǵ� Web ҳ��");
						
					//	location.href="http://www.yqrb.com.cn/sxyqwx/cj2.jsp?openid="+opp+"&zsm="+zj1+" ";
						
					//}else{
					    //window.alert("�ټ�����");
					    
					//    location.href="http://www.yqrb.com.cn/sxyqwx/cj2.jsp?openid="+opp+"&zsm="+zj1+" ";
					    
					//}
                    
     
                    
				}	
                    
				
			             
		}
		               
		function eventMove(e){                 
			e.preventDefault();                 
			if(mousedown){                     
				if(e.changedTouches){                         
					e=e.changedTouches[e.changedTouches.length-1];                     
				}                     
				var x = (e.clientX + document.body.scrollLeft || e.pageX) - offsetX || 0,                         
				y = (e.clientY + document.body.scrollTop || e.pageY) - offsetY || 0;                     
				with(ctx){                    
					beginPath()                     
					arc(x, y, 15, 0, Math.PI * 2);                         
					fill();                     
				}
				
				
				                
			}
			
			
			             
		}               
		canvas.width=w;             
		canvas.height=h; 
		
		canvas.style.backgroundImage='url('+img.src+')';              
		ctx=canvas.getContext('2d');         
		ctx.fillStyle='b9b9b9';             
		ctx.fillRect(0, 0, w, h);

		layer(ctx);               
		ctx.globalCompositeOperation = 'destination-out';               
		canvas.addEventListener('touchstart', eventDown);             
		canvas.addEventListener('touchend', eventUp);             
		canvas.addEventListener('touchmove', eventMove);             
		canvas.addEventListener('mousedown', eventDown);             
		canvas.addEventListener('mouseup', eventUp);             
		canvas.addEventListener('mousemove', eventMove);       
	});
	
	//img.src = imgSrc;
	img.src = imgSrc[num2];
	

	
	(document.body.style);
}
</script>

<footer>
    <div class="ft-wrap">
  </div>
    <nav class="ft-nav"></nav>
  <div class="ft-partner"></div>
    <div class="ft-copyright"><span class="ft-copyright-text">2015 �й������� <a href="#" target="_blank">��ICP��05000063��</a></span></div>
</footer>

 
  </body>
</html>



<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //��΢���������������
	   
    }else{
	  // alert('not');
	  //��΢��������������ʾ�б���
	   var target=document.getElementById("contentid");
	   target.style.display="none";
	   alert('��΢���д�');
	  
	 
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

