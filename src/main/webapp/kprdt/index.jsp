<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<html>
<title>2018����ȫ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030"/>
<meta name="description" content="������ɫ����">
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
td{font-size:14px;font-family:΢���ź�}
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
label {                 /*����label����ʽ*/
    width: 100%;
    padding: 10px 0px;
    display: block;
    line-height: 20px;
    position: relative;
    font-weight: normal;
}
.radio .option {      /*���Ż���İ�ťͼƬ����Ϊ��div�ı���ͼƬ���Ѹ�div��λ��ԭ����ʽ���Ϸ����ڸ�סԭ����ʽ��*/
    width: 25px;
    height: 25px;
    position: absolute;
    top: 6px;
    left: 0px;
    background-size: cover;
    background: url(img/001.png) no-repeat;
    background-size: cover;
}
.radio input[type="radio"] {  /*Ϊ�˱����������ԭ����ʽ���ص�*/
    display: inline-block ;
    margin-right: 15px ;
    opacity: 0 ;
}
input[type="radio"]:checked+div {  /*��radiuo��ѡ��ʱ����input�±ߵ�div��ǩ�ı���ͼƬ�滻��*/
    background: url(img/002.png) no-repeat;
    background-size: cover;
}

.login-button { /* ��ť���� */
	width: 270px; /* ��� */
	height: 40px; /* �߶� */
	border-width: 0px; /* �߿��� */
	border-radius: 3px; /* �߿�뾶 */
	background: #71D3E9; /* ������ɫ */
	cursor: pointer; /* ������밴ť��Χʱ�������� */
	outline: none; /* ����ʾ������ */
	font-family: Microsoft YaHei; /* �������� */
	color: white; /* ������ɫ */
	font-size: 17px; /* �����С */
}
.login-button:hover { /* ������밴ť��Χʱ�ı���ɫ */
	background: #71D3E9;

</style>




<script language="javascript">
            //����֤
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
                    alert("������ѡ��һ�");
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
                    alert("������ѡ��һ�");
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
                    alert("������ѡ��һ�");
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
                    alert("������ѡ��һ�");
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
                    alert("������ѡ��һ�");
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
                    alert("������ѡ��һ�");
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
                    alert("������ѡ��һ�");
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
                    alert("������ѡ��һ�");
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
                    alert("������ѡ��һ�");
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
                    alert("������ѡ��һ�");
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
          <th align="left" scope="row"><span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;ȫ�����������й���Э����ȫ��������Э��֯��ϵͳΪ����л����񹲺͹���ѧ�����ռ������İ䲼��ʵʩ���ٰ�ĸ�����ջ������ÿ����µĵ�����˫���ա�</span></th>
        </tr>
    </table></th>
  </tr>
</table>
<table width="100%"  border="0"  align="center" cellspacing="15" style="border-bottom:1px solid #03398F;">
  <tr>
    <td><table width="100%"  border="0" align="center">
        <tr>
          <td align="left"><span class="style3 style17">1���������й���Э�����ٰ�ĵڣ� ����ȫ�������ջ��</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
            <tr>
              <td height="24">
              
            <div class="radio"> 
            <label>
        	<input type="radio" name="c1" value="1" /> A��12
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>      
       
              </td>
            </tr>
            <tr>
              <td height="0">
              
               <div class="radio"> 
            <label>
        	<input type="radio" name="c1" value="2" />  B��13
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>      
       
        
              </td>
            </tr>
            <tr>
              <td height="0">
              
               <div class="radio"> 
            <label>
        	<input type="radio" name="c1" value="3" />   C��14
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>      
                 
        
        
              </td>
            </tr>
            <tr>
              <td>
              
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c1" value="4" />  D��15
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
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
          <td align="left"><span class="style3 style17">2��ȫ�񽡿����ʽ����ǣ� ��</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
            <div class="radio"> 
            <label>
        	<input type="radio" name="c2" value="1" />  A��8��1��
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>      
                
                
                    
                </td>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c2" value="2" />   B��8��8��
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                   
                </td>
              </tr>
              <tr>
                <td>
                
            <div class="radio"> 
            <label>
        	<input type="radio" name="c2" value="3" />  C��9��1��
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
            
                   
                </td>
                <td>
                
            <div class="radio"> 
            <label>
        	<input type="radio" name="c2" value="4" />  D��9��8��
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
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
          <td align="left"><span class="style3 style17">3��������һ������ҹ���������</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
            <div class="radio"> 
            <label>
        	<input type="radio" name="c3" value="1" />   A����ɽ
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                   
                </td>
                <td>
                
                  <div class="radio"> 
            <label>
        	<input type="radio" name="c3" value="2" />   B����ɽ
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                
                    
                </td>
              </tr>
              <tr>
                <td>
                
                   <div class="radio"> 
            <label>
        	<input type="radio" name="c3" value="3" />  C���㵴ɽ
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                   
                </td>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c3" value="4" />  D����ɽ
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
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
          <td align="left"><span class="style3 style17">4��������˭�����ģ�</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c4" value="1" />   A������
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                  
                </td>
                <td>
                
                  <div class="radio"> 
            <label>
        	<input type="radio" name="c4" value="2" />   B��ŵ����
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                </td>
              </tr>
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c4" value="3" />  C��������
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                  
                </td>
                <td>
                
                    <div class="radio"> 
            <label>
        	<input type="radio" name="c4" value="4" /> D�������ֵ�
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
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
          <td align="left"><span class="style3 style17">5���й��ġ�����֮������˭��</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c5" value="1" /> A��Ԭ¡ƽ
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                   
                </td>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c5" value="2" /> B��Ǯѧɭ
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                    
                </td>
              </tr>
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c5" value="3" /> C��Ǯ��ǿ
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c5" value="4" /> D���˼���
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
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
          <td align="left"><span class="style3 style17">6.������Ժ������ͬ����2017���𣬽�ÿ��ģ� ������Ϊȫ���Ƽ��������ա�</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c6" value="1" /> A��5��30��
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c6" value="2" /> B��6��5��
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                    
                </td>
              </tr>
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c6" value="3" />  C��9��23��
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c6" value="4" /> D��12��15��
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
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
          <td align="left"><span class="style3 style17">7���µġ�ʳƷ��ȫ������2015��10��1����ʩ�У���ȷ�涨ʳƷ��װ��Ӧ����עʳƷ�������֤��ţ�û��Ҫ���עʳƷ�������֤��־���µ�ʳƷ�������֤�������ĸ�������ϣ���λ������������ɡ�</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c7" value="1" /> A��SC 14
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c7" value="2" /> B��QS 15
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                   
                </td>
              </tr>
              <tr>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c7" value="3" /> C��AB 12
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c7" value="4" /> D��SQ 10
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
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
          <td align="left"><span class="style3 style17">8��Ҷ���߲��ж����������Σ���Ҫ���Է��ϣ����ڴ�����һ��ʱ�������ø��ϸ�������ã������α���ԭ�ɣ�  ������ȴ��һ���ж����ʣ����������뵰���������ʽ�Ͽ������°��Ե������������ʡ�</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c8" value="1" />   A������ù��
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c8" value="2" />  B����������
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                </td>
              </tr>
              <tr>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c8" value="3" />   C��������֬����
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
            
                    
                </td>
                <td>
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c8" value="4" />   D��ù��
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
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
          <td align="left"><span class="style3 style17">9��������Ԥ��ʱ�䣬���˸о��𶯿�ʼ�������ݵ�����һ����(    )</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c9" value="1" />  A��ʮ����
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                    
                </td>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c9" value="2" />  B��һ����
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                    
                </td>
              </tr>
              <tr>
                <td>
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c9" value="3" />  C��������
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                    
                </td>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c9" value="4" />  D��ʮ����
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
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
          <td align="left"><span class="style3 style17">10���ڽ�ͨ�¹��ֳ����ȼ������۵���Աʱ������Ϊ���������������(    )</span></td>
        </tr>
        <tr>
          <td align="left"><table width="100%" >
              <tr>
                <td height="24">
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c10" value="1" />  A�����ҼӰᶯ
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                    
                </td>
              </tr>
              <tr>
                <td height="0">
                
                <div class="radio"> 
            <label>
        	<input type="radio" name="c10" value="2" />  B�����ּ�������
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                
                   
                </td>
              </tr>
              <tr>
                <td height="0">
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c10" value="3" />   C������������߶�
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
    		</label>
            </div>  
                    
                </td>
              </tr>
              <tr>
                <td>
                
                 <div class="radio"> 
            <label>
        	<input type="radio" name="c10" value="4" />  D��ʹ����������
        	<div class="option"></div><!--��divʢ�ŵ����Ż���İ�ťͼƬ-->
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
              
               <button type="submit" class="login-button" onclick="return processForm(this.form);">�ύ</button>
              
              
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