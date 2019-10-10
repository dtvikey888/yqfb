<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>“随手拍”拍下“不文明”</title>
<style>
body{font-size:13px;color:#3f3e3d; font-family:微软雅黑; background-color:#f1f1f3; padding:0px; width:1195px; margin:0 auto; }
a{color:#3f3e3d; text-decoration:none; line-height:25px;}
a:hover{ color:#de1d60; text-decoration:none;}
h1{font-size:16px; line-height:25px;}
h2{font-size:16px;line-height:25px; font-weight:bold; color:#c1262c;}
d{font-size:16px; color:#ffffff; text-indent:2em;}
e{color:#b1b1b1;}

</style>


<script language="JavaScript">
function checkinput(){


   if(form1.img1.value == "" ){
      alert("请点击加号按钮上传图片!");
      form1.img1.focus();
      return false;
    }

	if(form1.xm.value == "" ){
      alert("请输入您的姓名(昵称)!");
      form1.xm.focus();
      return false;
    }	
   
   if(form1.tel.value == "" ){
      alert("请输入您的电话!");
      form1.tel.focus();
      return false;
    }
    
   if(form1.pssj.value == "" ){
      alert("请输入您的拍摄时间!");
      form1.pssj.focus();
      return false;
    }	
    
    
    if(form1.psdd.value == "" ){
      alert("请输入您的拍摄地点!");
      form1.psdd.focus();
      return false;
    }	
	
	if(form1.memo.value == "" ){
      alert("请输入您的说明!");
      form1.memo.focus();
      return false;
    }		  
}
</script>   



</head>

<body>
<form id="form1" name="form1" method="post" action="sc_chk.jsp" onSubmit="return checkinput()">
<input type="hidden" id="img1" name="img1" value=""/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="150" align="center" valign="top" ><table width="1195" height="102" border="0" cellspacing="10">
      <tr valign="bottom">
        <td height="308" colspan="6" align="center"  background="IMG/suishoupai-banner.png" style="background-repeat:no-repeat">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="10" align="center" valign="top" ><table width="1195" border="0" cellpadding="0" cellspacing="0" style="background:url(IMG/round.png) no-repeat top left;">
      <tr>
        <td height="500" align="center" valign="top">
		
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color:#FFF">
          <tr>
            <td height="300" align="center"><table width="100" height="100" border="0" cellpadding="0" cellspacing="0" style="border:3px dashed #f8b62c; font-family:Arial; font-size:90px; color:#f8b62c ">
              <tr>
                <td align="center" valign="middle"><img name="imageList" id="imageList" width="100px;" height="100px;" style="display:none;"/><div onClick="window.open('test/upload.htm','upload','top=30,left=100,width=480,height=230,scrollbars=yes')" id="imageList2"  style="cursor:pointer;">+</div></td>
              </tr>
            </table>
              <p>点击上传图片（请上传清晰完整照、虚化照无效）</p></td>
          </tr>
          <tr>
            <td align="center"><table width="50%" border="0" cellspacing="10"  style="background-color:#FFF;" >
              <tr>
                <td width="10%" height="30">姓名：</td>
                <td width="90%" height="20" bgcolor="#F1F1F3" style="color:#888888"><input type="text"  name="xm" id="xm"  placeholder="姓名(昵称)"  style="width:100%; height:35px; border-radius:6px; "/></td>
              </tr>
              <tr>
                <td height="30">电话：</td>
                <td bgcolor="#F1F1F3" style="color:#888888"><input type="text"  name="tel" id="tel"  placeholder="用于领奖核对，不公开"  style="width:100%; height:35px; border-radius:6px; "/></td>
              </tr>
              <tr>
                <td height="30">时间：</td>
                <td bgcolor="#F1F1F3" style="color:#888888"><input type="text"  name="pssj" id="pssj"  placeholder="拍摄时间"  style="width:100%; height:35px; border-radius:6px; "/></td>
              </tr>
              <tr>
                <td height="30">地点：</td>
                <td bgcolor="#F1F1F3" style="color:#888888"><input type="text"  name="psdd" id="psdd"  placeholder="拍摄地点"  style="width:100%; height:35px; border-radius:6px; "/></td>
              </tr>
              <tr>
                <td align="left" valign="top">说明：</td>
                <td bgcolor="#F1F1F3" style="color:#888888"><textarea id="memo" name="memo"  placeholder="说明：请简单描述所拍摄图片的内容"   style="width:100%; height:90px; border-radius:6px; "></textarea></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="100" align="center" valign="middle"><div style="width:350px; height:50px; border-radius:10px; background-color:#de1d60; font-size:16px; font-family:微软雅黑; color:#FFF; line-height:50px;" ><input type="image" src="IMG/sc.jpg" onClick="CheckForm();"/></div></td>
          </tr>
        </table>
		</td>
      </tr>
    </table>
    </form>
    
    </td>
  </tr>
 
  <tr>
    <td height="50" align="center" valign="top"><a href="#"></a></td>
  </tr>
  <tr>
    <td height="70" align="center" valign="top" bgcolor="#f8b62c" ><table width="100%" height="80" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f8b62c">
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
