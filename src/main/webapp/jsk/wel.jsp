<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="org.liufeng.course.util.ZghTools"%>

<%

String openid =request.getParameter("openid");

String welsession = (String)session.getAttribute("welsession");

if(welsession!=null){
   
      if(welsession.equals(openid)){
      
   	      //out.println("�����Լ���ģ����ص�");
   	      
      }else{
        
          //out.println("�����˵����Ժ󣬲��ص�");
           response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet3&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
   
      }
   
   }else{
   
  		//��û��Ҫ�ص�
         response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet3&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
   
   }
   

%> 

<%



if(ZghTools.IsCz2(openid)==false){

	//�ص�
	  response.setHeader("Refresh","1;url=https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2fOAuthServlet3&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");        
   
}
%>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

		<title>��������֮���̴���ս</title>
    	<meta name="author" content="">
        			<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	            <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
		
	  				<link rel="stylesheet" type="text/css" href="css/base2013.css" charset="gbk">
		
		
							<link rel="stylesheet" type="text/css" href="css/index.css" charset="gbk">	
				
					
		        <link rel="apple-touch-icon-precomposed" href="http://www.17sucai.com/preview/1/2014-12-15/m.jd.com/images/apple-touch-icon.png">
						<script type="text/javascript">
			var _winLocation=window.location.href;//��õ�ǰҳ���·��������·�����������ҳ�滻
			var _isWebKit = '__proto__' in {};//�Ƿ���webkit�ں�
			if(_isWebKit){//�����webkit�ںˣ����ģ��ʹ��zepto
				//Ҫʹ��zeptojs��·���б�������Ϊ��ģ���滻�Ŀ���
				var _locationList=new Array();
				//�ģ��
				_locationList.push('activity/proActList');
				_locationList.push('activity/proActWareList');
				_locationList.push('activity/list');
				//��Ʒ����ģ��
				_locationList.push('category/');
				//������Ѷģ��
				_locationList.push('newslist.html');
				_locationList.push('newslist/');
				_locationList.push('news/');
				//��Ʊģ��
				_locationList.push('airline/');
				//�Ƶ�ģ��
				_locationList.push('hotel/');
				//�Ź�ģ��
				_locationList.push('tuan/');
				//��ҳ���
				_locationList.push('hotbrand.html');//Ʒ�ƹ�
				//��Ʒɸѡ���
				_locationList.push('ware/expandSort.action');
				_locationList.push('ware/categoryFilter.action');
				_locationList.push('ware/search.action');
				_locationList.push('products/');
				
				_locationList.push('notice/');//ͨ��ģ��
				_locationList.push('coupons/');//��ػ�ģ��
				_locationList.push('chongzhi/');//�ֻ���ֵģ��
				_locationList.push('comment/');//�ֻ��Ƽ�ģ��
				_locationList.push('pay/');//֧��
				_locationList.push('order/');//����
				var _needReplace = false;
				//�����ǰ·������Ҫʹ�õ�·������������滻
				for(var i=0;i<_locationList.length;i++){
					if(_winLocation.indexOf(_locationList[i])!=-1){
						_needReplace=true;
						break;
					}
				}
				//�������ҳ�Ļ�����ʹ��zepto
				var _tmp = _winLocation.replace(/(^http:\/\/)|(\/*$)/g,'');
				if(_tmp.indexOf('/')<0 || (_tmp.split('/').length<=2 && _tmp.indexOf('/index')>=0)){
					_needReplace=true;
				}
				//�������Ʒ����ҳ�Ļ�����ʹ��zepto
                var _dlocationList=new Array();
                _dlocationList.push(/\/product\/([0-9]+)\.html/);
                _dlocationList.push(/\/orderComment\/([0-9]+)\.html/);
                _dlocationList.push(/\/consultations\/([0-9]+)\.html/);
                _dlocationList.push(/\/consultations\/([0-9]+)-([0-9]+)\.html/);
                _dlocationList.push(/\/comments\/([0-9]+)\.html/);
                for(var i=0,len=_dlocationList.length;i<len;i++){
                	if(_dlocationList[i].test(_winLocation)){
                		_needReplace=true;
               			 break;
               		 }
                }
				if(_needReplace){
					document.write('<script src="js/zepto.min.js"><\/script>');
					document.write('<script type="text/javascript">window.jQuery=window.Zepto;<\/script>');
				}else{
					document.write('<script src="js/jquery-1.6.2.min.js"><\/script>');
				}
			}else{//����Ƿ�webkit�ں�ֱ��ʹ��jquery
				document.write('<script src="js/jquery-1.6.2.min.js"><\/script>');
			}
		</script><script src="./js/jquery-1.6.2.min.js"></script>
				        <script type="text/javascript" src="./js/common.js"></script>
        <script type="text/javascript" src="./js/spin.min.js"></script><style>body {
	background-color: #FFDB31;
}
</style>
	<script src="./js/installapp.js@v=20140319100001" type="text/javascript"></script></head>

<body id="body" style="background: rgb(213, 213, 214);">
<div id="contentid">

<a name="top"></a>
<header>
	<div id="unsupport" style="cursor: pointer; display: none; font-size: 0.925em; height: 44px; line-height: 44px; margin: 0px auto; text-align: center; width: 100%; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(218, 212, 207); border-top-width: 1px; border-top-style: solid; border-top-color: rgb(252, 250, 249);">
    		<span>
    			��ʾЧ�����ѣ�
    		</span>
    		<a href="#" style="text-decoration:underline;color:blue;">
    			�л�����׼��
    		</a>
    	</div>
		
	</header>
<script type="text/javascript" src="./js/index.js@v=20140319100001"></script>
<script type="text/javascript">$('body').css('background','#EAEBEF');$(function(){$('.new-footer').css('margin-top','0px');})</script>
<div class="download-con" id="down_app" style="display:none;">
	<div class="down_app">
		<div class="download-logo"></div>
		
		
		<div class="close-btn-con close-btn">
			<span class="close-btn-icon"></span>
		</div>
	</div>
</div>
<div class="new-ct main">
	<div class="banner scroll-wrapper" id="idContainer2" ontouchstart="touchStart(event)" ontouchmove="touchMove(event);" ontouchend="touchEnd(event);" style="overflow: hidden;">
	  <ul class="new-banner-num new-tbl-type" id="idNum">
        <li class="new-tbl-cell"></li><li class="new-tbl-cell"></li><li class="new-tbl-cell on"></li><li class="new-tbl-cell"></li><li class="new-tbl-cell"></li><li class="new-tbl-cell"></li></ul>
  </div>
    <div class="logo"></div>
	
    <div class="ad2 ad2-v1">
	
      <div class="ad2-big-img"><img src="./img/bg.jpg" class="full-img" width="320" /></div>
<script>
setTimeout(function(){document.getElementById("test").style.display="block";},2000);
//2000�Ƕ�ñ���ʾ����λ����
</script>
      
	  <%if(ZghTools.IsCz2(openid)==true){%>
      
	  <div id="test" align="center" onClick="javascript:window.open('index.jsp?openid=<%=openid%>','_blank')" style="margin-top:-80px;display: none;"><img src="./img/join.png" width="50%" height="38px" /></div>
      
      <%}%>
      
     
      <div style="margin-top:50px;"></div>
	 
  </div>
												

								
				</div>
<div style="display:none;">
    					<img src="./ja.html">
			    </div>
<script type="text/javascript">
$("#unsupport").hide();
if(!testLocalStorage()){ //not support html5
    if(0!=0 && !$clearCart && !$teamId){
		$("#html5_cart_num").text(0>0>0);
	}
}else{
	updateToolBar('index');
}

$("#html5_cart").click(function(){
//	syncCart('e0d0f025d6d3e8e8d7be5428c43ef911',true);
	location.href='cart/cart.action';
});

function reSearch(){
var depCity = window.sessionStorage.getItem("airline_depCityName");
	if(testSessionStorage() && isNotBlank(depCity) && !/^\s*$/.test(depCity) && depCity!=""){
    	var airStr = '<form action="airline/list.action" method="post" id="reseach">'
        +'<input type="hidden" name="sid"  value="e0d0f025d6d3e8e8d7be5428c43ef911"/>'
        +'<input type="hidden" name="depCity" value="'+ window.sessionStorage.getItem("airline_depCityName") +'"/>'
        +'<input type="hidden" name="arrCity" value="'+ window.sessionStorage.getItem("airline_arrCityName") +'"/>'
        +'<input type="hidden" name="depDate" value="'+ window.sessionStorage.getItem("airline_depDate") +'"/>'
        +'<input type="hidden" name="depTime" value="'+ window.sessionStorage.getItem("airline_depTime") +'"/>'
        +'<input type="hidden" name="classNo" value="'+ window.sessionStorage.getItem("airline_classNo") +'"/>'
        +'</form>';
    	$("body").append(airStr);
    	$("#reseach").submit();
	}else{
    	window.location.href='airline/index.action@sid=e0d0f025d6d3e8e8d7be5428c43ef911';
	}
}
 //banner �رյ��
    $('.div_banner_close').click(function(){
        $('#div_banner_header').unbind('click');
        jQuery.post('index/addClientCookieVal.json',function(d){
              $('#div_banner_header').slideUp(500);
        });
    });
    //banner ���ص��
    $('.div_banner_download').click(function(){
         var downloadUrl = $(this).attr('url');
         jQuery.post('index/addClientCookieVal.json',function(d){
               window.location.href=downloadUrl;
        });
    });
	
</script>
</div>
</body></html>

<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
       //��΢���������������
	   
    }else{
	  // alert('not');
	  //��΢��������������ʾ�б��
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

