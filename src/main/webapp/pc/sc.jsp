<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��������Ц������</title>
<style>
body{font-size:13px;color:#3f3e3d; font-family:΢���ź�; background-color:#f1f1f3; padding:0px;margin:0px; }
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
      alert("�����ӺŰ�ť�ϴ���ͼ!");
      form1.img1.focus();
      return false;
    }

	if(form1.xm.value == "" ){
      alert("������������ʵ����!");
      form1.xm.focus();
      return false;
    }	
   
   if(form1.tel.value == "" ){
      alert("���������ĵ绰!");
      form1.tel.focus();
      return false;
    }	
	
	
  	
		  
}
</script>   



</head>

<body>
 <form id="form1" name="form1" method="post" action="sc_chk.jsp" onSubmit="return checkinput()">
  <input type="hidden" id="img1" name="img1" value=""/>
  
<table width="100%" border="0" cellpadding="0" cellspacing="0"style="background:url(IMG/TOP_D.png) no-repeat top center;">
  <tr style="background:url(IMG/wlwhj3.png) no-repeat top left;">
    <td height="150" align="center" valign="top" ><table width="1195" height="102" border="0" cellspacing="10">
      <tr>
        <td align="center" valign="bottom"><img src="IMG/PIC_theme.png" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="10" align="center" valign="top" ><table width="1195" border="0" cellpadding="0" cellspacing="0" style="background:url(IMG/round.png) no-repeat top left;">
      <tr>
        <td height="500" align="center" valign="top">
		
		
   
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color:#FFF">
          <tr>
            <td height="300" align="center"><table width="100" height="100" border="0" cellpadding="0" cellspacing="0" style="border:3px dashed #dd1c60; font-family:Arial; font-size:90px; color:#dd1c60 ">
              <tr>
                <td align="center" valign="middle"><div><img name="imageList" id="imageList" width="100px;" height="100px;" style="display:none;"/><div style="font-size:12px;">���ϴ�������������������������Ϊ����Ц���գ������ա�ȫ���ա������ա������ա��黯����Ч��</div></div><div onClick="window.open('test/upload.htm','upload','top=30,left=100,width=480,height=230,scrollbars=yes')" id="imageList2"  style="cursor:pointer;">+</div></td>
              </tr>
            </table>
              <p>����ϴ�ͼƬ</p></td>
          </tr>
          <tr>
            <td align="center"><table width="47%" border="0" cellspacing="10"  style="background-color:#FFF;" >
              <tr>
                <td width="10%" height="30">������</td>
                <td width="90%" height="20" bgcolor="#F1F1F3" style="color:#888888"><input type="text"  name="xm" id="xm"  placeholder="��������ʵ����"  style="width:100%; height:35px; border-radius:6px; "/></td>
              </tr>
              <tr>
                <td height="30">�绰��</td>
                <td bgcolor="#F1F1F3" style="color:#888888"><input type="text"  name="tel" id="tel"  placeholder="�����콱�˶ԣ�������"  style="width:100%; height:35px; border-radius:6px; "/></td>
              </tr>
              <tr>
                <td height="30">�Ŷӣ�</td>
                <td bgcolor="#F1F1F3" style="color:#888888">
                  <input type="text"  name="td" id="td"  placeholder="���˿ɲ���"  style="width:100%; height:35px; border-radius:6px; "/></td>
              </tr>
              <tr>
                <td align="left" valign="top">���</td>
                <td bgcolor="#F1F1F3" style="color:#888888"><textarea id="memo" name="memo"  placeholder="������ݿ�������Ը��ף�������ǶԳ��н����ϣ������140�����ڣ��õļ��ｫ��ͬ��Ƭ�������ڡ������ձ����ַ���'Ц��'"   style="width:100%; height:90px; border-radius:6px; "></textarea></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="100" align="center" valign="middle"><div style="width:350px; height:50px; border-radius:10px; background-color:#de1d60; font-size:16px; font-family:΢���ź�; color:#FFF; line-height:50px;" ><input type="image" src="IMG/sc.jpg" onClick="CheckForm();"/></div></td>
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
