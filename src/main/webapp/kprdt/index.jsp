<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<html>
<title>2018乐清全国科普日</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030"/>
<meta name="description" content="倡导绿色生活">
<meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
<meta name="viewport" content="initial-scale=1,user-scalable=no,maximum-scale=1" media="(device-height: 568px)">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="full-screen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<style>
body{
	padding:0px;
	margin:0px;
	background-color: #E8F7FC;
}
td{font-size:14px;font-family:微软雅黑}
.style3 {
	font-size: 18px;
	color: #459B38;
}
.style16 {color: #333333}
.style17 {color: #03398F}
.style18 {color: #FFFFFF}
.style20 {color: #FFFFFF; font-size: 18px; }
</style>
<style>
label {                 /*设置label的样式*/
    width: 100%;
    padding: 10px 0px;
    display: block;
    line-height: 20px;
    position: relative;
    font-weight: normal;
}
.radio .option {      /*把优化后的按钮图片设置为该div的背景图片，把该div定位到原生样式的上方，遮盖住原生样式。*/
    width: 25px;
    height: 25px;
    position: absolute;
    top: 6px;
    left: 0px;
    background-size: cover;
    background: url(img/001.png) no-repeat;
    background-size: cover;
}
.radio input[type="radio"] {  /*为了保险起见，把原生样式隐藏掉*/
    display: inline-block ;
    margin-right: 15px ;
    opacity: 0 ;
}
input[type="radio"]:checked+div {  /*当radiuo被选中时，把input下边的div标签的背景图片替换掉*/
    background: url(img/002.png) no-repeat;
    background-size: cover;
}

.login-button { /* 按钮美化 */
	width: 270px; /* 宽度 */
	height: 40px; /* 高度 */
	border-width: 0px; /* 边框宽度 */
	border-radius: 3px; /* 边框半径 */
	background: #71D3E9; /* 背景颜色 */
	cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
	outline: none; /* 不显示轮廓线 */
	font-family: Microsoft YaHei; /* 设置字体 */
	color: white; /* 字体颜色 */
	font-size: 17px; /* 字体大小 */
}
.login-button:hover { /* 鼠标移入按钮范围时改变颜色 */
	background: #71D3E9;

</style>




<script language="javascript">
            //表单验证
            function processForm(){               
                var ids = document.getElementsByName("c1");               
                var flag = false ;               
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请最少选择一项！");
                    return false ;
                }
                //
                var ids = document.getElementsByName("c2");               
                var flag = false ;               
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请最少选择一项！");
                    return false ;
                }
                //
                var ids = document.getElementsByName("c3");               
                var flag = false ;               
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请最少选择一项！");
                    return false ;
                }
                //
                var ids = document.getElementsByName("c4");               
                var flag = false ;               
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请最少选择一项！");
                    return false ;
                }
                //
                var ids = document.getElementsByName("c5");               
                var flag = false ;               
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请最少选择一项！");
                    return false ;
                }
                //
                var ids = document.getElementsByName("c6");               
                var flag = false ;               
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请最少选择一项！");
                    return false ;
                }
                //
                var ids = document.getElementsByName("c7");               
                var flag = false ;               
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请最少选择一项！");
                    return false ;
                }

                //
                var ids = document.getElementsByName("c8");               
                var flag = false ;               
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请最少选择一项！");
                    return false ;
                }

        	    //
                var ids = document.getElementsByName("c9");               
                var flag = false ;               
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请最少选择一项！");
                    return false ;
                }
                
                //
                var ids = document.getElementsByName("c10");               
                var flag = false ;               
                for(var i=0;i<ids.length;i++){
                    if(ids[i].checked){
                        flag = true ;
                        break ;
                    }
                }
                if(!flag){
                    alert("请最少选择一项！");
                    return false ;
                }
                
            }
            
            
            
        </script>


<body>

<div  id="contentid" style="display:block">

<table width="100%"  border="0" cellspacing="0">
  <tr>
    <td valign="top"><img src="img/01.png" width="100%"  /></td>
  </tr>
</table>

<form id="form1" name="form1" method="post" action="dt_chk.jsp">
<table width="80%" height="0"  border="0" align="center" style="border:1px solid #71D3E9;border-radius:10px;background-color:#71D3E9;border-color:#71D3E9">
  <tr>
    <th bgcolor="#71D3E9" scope="row"><table width="100%"  border="0" cellspacing="5">
        <tr>
          <th align="left" scope="row"><span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;全国科普日由中国科协发起，全国各级科协组织和系统为纪念《中华人民共和国科学技术普及法》的颁布和实施而举办的各类科普活动，定在每年九月的第三个双休日。</span></th>
        </tr>
    </table></th>
  </tr>
</table>
<table width="100%"  border="0"  align="center" cellspacing="15" style="border-bottom:1px solid #03398F;">
  <tr>
    <td><table width="100%"  border="0" align="center">
        <tr>
          <td align="left"><span class="style3 style17">1、今年是中国科协连续举办的第（ ）届全国科普日活动。</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
            <tr>
              <td height="24">
              
            <div class="radio"> 
            <label>
        	<input type="radio" name="c1" value="1" /> A、12
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>      
       
              </td>
            </tr>
            <tr>
              <td height="0">
              
               <div class="radio"> 
            <label>
        	<input type="radio" name="c1" value="2" />  B、13
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>      
       
        
              </td>
            </tr>
            <tr>
              <td height="0">
              
               <div class="radio"> 
            <label>
        	<input type="radio" name="c1" value="3" />   C、14
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>      
                 
        
        
              </td>
            </tr>
            <tr>
              <td>
              
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c1" value="4" />  D、15
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>      
              
                  
        
              </td>
            </tr>
          </table>            </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%"  border="0"  align="center" cellspacing="15" style="border-bottom:1px solid #03398F;">
  <tr>
    <td><table width="100%"  border="0" align="center">
        <tr>
          <td align="left"><span class="style3 style17">2、全民健康生活方式活动日是（ ）</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
            <div class="radio"> 
            <label>
        	<input type="radio" name="c2" value="1" />  A、8月1日
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>      
                
                
                    
                </td>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c2" value="2" />   B、8月8日
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                   
                </td>
              </tr>
              <tr>
                <td>
                
            <div class="radio"> 
            <label>
        	<input type="radio" name="c2" value="3" />  C、9月1日
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
            
                   
                </td>
                <td>
                
            <div class="radio"> 
            <label>
        	<input type="radio" name="c2" value="4" />  D、9月8日
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                   
                    
                </td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="100%"  border="0"  align="center" cellspacing="15" style="border-bottom:1px solid #03398F;">
  <tr>
    <td><table width="100%"  border="0" align="center">
        <tr>
          <td align="left"><span class="style3 style17">3、以下哪一项不属于我国的五岳？</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
            <div class="radio"> 
            <label>
        	<input type="radio" name="c3" value="1" />   A、恒山
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                   
                </td>
                <td>
                
                  <div class="radio"> 
            <label>
        	<input type="radio" name="c3" value="2" />   B、衡山
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                
                    
                </td>
              </tr>
              <tr>
                <td>
                
                   <div class="radio"> 
            <label>
        	<input type="radio" name="c3" value="3" />  C、雁荡山
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                   
                </td>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c3" value="4" />  D、华山
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
            
                    
                </td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="100%"  border="0"  align="center" cellspacing="15" style="border-bottom:1px solid #03398F;">
  <tr>
    <td><table width="100%"  border="0" align="center">
        <tr>
          <td align="left"><span class="style3 style17">4、汽车是谁发明的？</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c4" value="1" />   A、奔驰
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                  
                </td>
                <td>
                
                  <div class="radio"> 
            <label>
        	<input type="radio" name="c4" value="2" />   B、诺贝尔
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                </td>
              </tr>
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c4" value="3" />  C、爱迪生
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                  
                </td>
                <td>
                
                    <div class="radio"> 
            <label>
        	<input type="radio" name="c4" value="4" /> D、莱特兄弟
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                   
                </td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="100%"  border="0"  align="center" cellspacing="15" style="border-bottom:1px solid #03398F;">
  <tr>
    <td><table width="100%"  border="0" align="center">
        <tr>
          <td align="left"><span class="style3 style17">5、中国的“导弹之父”是谁？</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c5" value="1" /> A、袁隆平
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                   
                </td>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c5" value="2" /> B、钱学森
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                    
                </td>
              </tr>
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c5" value="3" /> C、钱三强
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c5" value="4" /> D、邓稼先
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                 
                </td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="100%"  border="0"  align="center" cellspacing="15" style="border-bottom:1px solid #03398F;">
  <tr>
    <td><table width="100%"  border="0" align="center">
        <tr>
          <td align="left"><span class="style3 style17">6.经国务院批复，同意自2017年起，将每年的（ ）设立为全国科技工作者日。</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c6" value="1" /> A、5月30日
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c6" value="2" /> B、6月5日
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                    
                </td>
              </tr>
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c6" value="3" />  C、9月23日
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c6" value="4" /> D、12月15日
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                   
                </td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="100%"  border="0"  align="center" cellspacing="15" style="border-bottom:1px solid #03398F;">
  <tr>
    <td><table width="100%"  border="0" align="center">
        <tr>
          <td align="left"><span class="style3 style17">7、新的《食品安全法》于2015年10月1日起施行，明确规定食品包装上应当标注食品生产许可证编号，没有要求标注食品生产许可证标志。新的食品生产许可证编号是字母（）加上（）位阿拉伯数字组成。</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c7" value="1" /> A、SC 14
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c7" value="2" /> B、QS 15
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                   
                </td>
              </tr>
              <tr>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c7" value="3" /> C、AB 12
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c7" value="4" /> D、SQ 10
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                   
                    
                </td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="100%"  border="0"  align="center" cellspacing="15" style="border-bottom:1px solid #03398F;">
  <tr>
    <td><table width="100%"  border="0" align="center">
        <tr>
          <td align="left"><span class="style3 style17">8、叶类蔬菜中都含有硝酸盐（主要来自肥料），在储藏了一段时间后，由于酶和细菌的作用，硝酸盐被还原成（  ），这却是一种有毒物质，在人体内与蛋白质类物质结合可生成致癌性的亚硝胺类物质。</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c8" value="1" />   A、黄曲霉素
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c8" value="2" />  B、亚硝酸盐
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                </td>
              </tr>
              <tr>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c8" value="3" />   C、不饱和脂肪酸
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
            
                    
                </td>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c8" value="4" />   D、霉菌
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                    
                </td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="100%"  border="0"  align="center" cellspacing="15" style="border-bottom:1px solid #03398F;">
  <tr>
    <td><table width="100%"  border="0" align="center">
        <tr>
          <td align="left"><span class="style3 style17">9、大地震的预警时间，从人感觉震动开始，到房屋倒塌，一般有(    )</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c9" value="1" />  A、十几秒
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                    
                </td>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c9" value="2" />  B、一分钟
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                    
                </td>
              </tr>
              <tr>
                <td>
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c9" value="3" />  C、三分钟
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c9" value="4" />  D、十分钟
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                    
                </td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="100%"  border="0"  align="center" cellspacing="15" style="border-bottom:1px solid #03398F;">
  <tr>
    <td><table width="100%"  border="0" align="center">
        <tr>
          <td align="left"><span class="style3 style17">10、在交通事故现场抢救脊柱骨折的伤员时，您认为下列做法错误的是(    )</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td height="24">
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c10" value="1" />  A、不乱加搬动
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                    
                </td>
              </tr>
              <tr>
                <td height="0">
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c10" value="2" />  B、保持脊柱安定
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                   
                </td>
              </tr>
              <tr>
                <td height="0">
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c10" value="3" />   C、勿扶持伤者走动
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                    
                </td>
              </tr>
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c10" value="4" />  D、使用软担架运送
        	<div class="option"></div><!--该div盛放的是优化后的按钮图片-->
    		</label>
            </div>  
                
                   
                </td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="95%"  border="0" align="center" cellspacing="10">
  <tr>
    <th scope="row"><table width="80%" height="0"  border="0" align="center" style="border:1px solid #71D3E9;border-radius:10px;background-color:#71D3E9;border-color:#71D3E9">
        <tr>
          <th bgcolor="#71D3E9" scope="row"><table width="100%"  border="0" cellspacing="5">
            <tr>
              <th align="center" scope="row">
              
               <button type="submit" class="login-button" onclick="return processForm(this.form);">提交</button>
              
              
              </th>
            </tr>
          </table></th>
        </tr>
        </table></th>
  </tr>
</table>

</form>

<table width="100%"  border="0">
  <tr>
    <td bgcolor="#03398F"><img src="img/05.png" width="100%" /></td>
  </tr>
</table>

</div>
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
	   alert('非微信中打开'); 
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