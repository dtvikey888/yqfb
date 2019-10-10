<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="com.fjw.utils.InterfaceTools"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="sqlbean" scope="page" class="org.fjw.weixin.util.sql_data"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>乐清发布微信统计数据</title>
    <script language="JavaScript" src="mydate.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
.chaolianjie {
	text-decoration: none;
a:link { 
color:#C24354; 
text-decoration:underline; 
} 
a:visited { 
color:#00FF00; 
text-decoration:none; 
} 
a:hover { 
color:#FAB455; 
text-decoration:none; 
} 
a:active { 
color:#FFFFFF; 
text-decoration:none; 
} 
}
</style>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>


  </head>
  
  <body>
  <style>
body{font-size:13px;color:#3f3e3d; font-family:微软雅黑; padding:0px; width:1195px; margin:0 auto;}
.bottom {
	float: right;
	width: 500px;
	font-family:"微软雅黑";
}
</style>
  
 <table width="980" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th scope="col">
    <table width="980" cellspacing="0" cellpadding="0">
      <tr height="60">
        <th height="14" scope="col">&nbsp;</th>
        <th scope="col">&nbsp;</th>
        <th scope="col">&nbsp;</th>
        <th scope="col"><a href="/yqfb/UpdateInterfaceData">刷新</a></th>
      </tr>
      <tr height="60">
        <th width="241" height="14" scope="col"><div align="left">&nbsp;&nbsp;乐清发布昨日关键指标：</div></th>
        <th width="232" scope="col"><br></th>
        <th width="209" scope="col">&nbsp;</th>
        <th width="296" scope="col">&nbsp;</th>
      </tr>
      <!-- 
       
      <tr height="60">
        <th scope="col"><img src="http://www.yqrb.com.cn/yqfb/interface/images/slogo01.png" width="100" height="47"></th>
        <th scope="col"><img src="http://www.yqrb.com.cn/yqfb/interface/images/slogo02.png" width="100" height="47"></th>
        <th scope="col"><img src="http://www.yqrb.com.cn/yqfb/interface/images/slogo03.png" width="100" height="47"></th>
        <th scope="col"><img src="http://www.yqrb.com.cn/yqfb/interface/images/slogo04.png" width="100" height="47"></th>
      </tr>
      <tr height="20" style="font-size:14px">
        <td><div align="center">新关注人数</div></td>
        <td><div align="center">取消关注人数</div></td>
        <td><div align="center">净增关注人数</div></td>
        <td><div align="center">累计关注人数</div></td>
      </tr>
      <tr height="60" style=" font-family:'Arial Black', Gadget, sans-serif; font-size:30px; color:#FAB455;" >
        <td><div align="center"><=InterfaceTools.newuser()%></div></td>
        <td><div align="center"><=InterfaceTools.canceluser()%></div></td>
        <td><div align="center"><=InterfaceTools.jzuser()%></div></td>
        <td><div align="center"><=InterfaceTools.cumulateuser()%></div></td>
      </tr>
     -->
      <tr height="60">
        <th scope="col"><img src="http://www.yqrb.com.cn/yqfb/interface/images/slogo05.png" width="100" height="47"></th>
        <th scope="col"><img src="http://www.yqrb.com.cn/yqfb/interface/images/slogo06.png" width="100" height="47"></th>
        <th scope="col"><img src="http://www.yqrb.com.cn/yqfb/interface/images/slogo07.png" width="100" height="47"></th>
        <th scope="col"><img src="http://www.yqrb.com.cn/yqfb/interface/images/slogo08.png" width="100" height="47"></th>
      </tr>
      <tr height="20" style="font-size:14px">
        <td><div align="center">图文页阅读次数</div></td>
        <td><div align="center">原文阅读次数</div></td>
        <td><div align="center">分享转发次数</div></td>
        <td><div align="center">微信收藏人数</div></td>
      </tr>
      <tr height="60" style=" font-family:'Arial Black', Gadget, sans-serif; font-size:30px; color:#FAB455;" >
        <td><div align="center"><%=InterfaceTools.newintpagecount()%></div></td>
        <td><div align="center"><%=InterfaceTools.neworipagecount()%></div></td>
        <td><div align="center"><%=InterfaceTools.sharecount()%></div></td>
        <td><div align="center"><%=InterfaceTools.addtofavuser()%></div></td>
      </tr>
    </table></th>
  </tr>
  <tr>
    <td><table width="980" border="1" bordercolor="#f1f1f3" cellspacing="0" cellpadding="5" >
     
      <tr bgcolor="#C24354" height="35" style="font-family:'微软雅黑'; font-size:14px; color:#FFF;">
        <td width="529">&nbsp;&nbsp;文章标题</td>
        <td width="100" align="center">时间</td>
        <td width="80" align="center">送达人数</td>
        <td width="100" align="center">图文阅读人数</td>
        <td align="center">分享人数</td>
        </tr>
       
       
       <!--start-->									
<% 

String sql,dte,title,news,id,tempclass,parentclass,ispass,islock,ipadd,content,keyword,px,ref_date,target_user,int_page_read_user,share_user;

keyword=request.getParameter("keyword");

String typeid=request.getParameter("typeid");

px =request.getParameter("px");

String kk=request.getParameter("kk");

String yn = request.getParameter("yn");

String ys = request.getParameter("ys");

String lx=request.getParameter("lx");

if(keyword!=""&&kk!=null){
sql = "Select * FROM zt_kaoqin_pro2 where name like '%"+keyword+"%'  or  pname like '%"+keyword+"%'  and delyz=0   order by name desc";
}
else if(typeid!=null){
   if(px!=null){
   
      sql="Select * FROM sst_baoming where tp ="+typeid+" and lx="+lx+" order by fbsj asc";
      
   }else{
   
      sql="Select * FROM sxbook_bm where dz ="+typeid+"  order by bh asc";
      
   }



}else if(yn!=null){

sql = "Select * FROM zt_kaoqin_pro2 where yz=0 and delyz=0 and name like '%"+yn+"%' order by name desc";

}else if(ys!=null){

sql = "Select * FROM zt_kaoqin_pro2 where yz=0 and delyz=0 and ysname like '%"+ys+"%' order by name desc";

}else{

typeid="全部";
sql ="SELECT distinct wxinterface_yqfbwx_articletotal.title as title , wxinterface_yqfbwx_articletotal.ref_date as ref_date ,wxinterface_yqfbwx_articletotal2.target_user as target_user,wxinterface_yqfbwx_articletotal2.int_page_read_user as int_page_read_user,wxinterface_yqfbwx_articletotal2.int_page_read_count as int_page_read_count,wxinterface_yqfbwx_articletotal2.ori_page_read_user as ori_page_user,wxinterface_yqfbwx_articletotal2.ori_page_read_count as ori_page_read_count,wxinterface_yqfbwx_articletotal2.share_user as share_user,wxinterface_yqfbwx_articletotal2.share_count as share_count,wxinterface_yqfbwx_articletotal2.add_to_fav_user as add_to_fav_user,wxinterface_yqfbwx_articletotal2.add_to_fav_count as add_to_fav_count FROM  wxinterface_yqfbwx_articletotal2,wxinterface_yqfbwx_articletotal WHERE wxinterface_yqfbwx_articletotal2.fid=wxinterface_yqfbwx_articletotal.id order by wxinterface_yqfbwx_articletotal.ref_date desc, wxinterface_yqfbwx_articletotal2.int_page_read_user desc";

}



ResultSet RS=sqlbean.executeQuery(sql); 

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
i = 0;%>

<%	while((i<intPageSize && !RS.isAfterLast()))
{



 title = RS.getString("title");
 ref_date = RS.getString("ref_date");
 target_user = RS.getString("target_user");
 int_page_read_user = RS.getString("int_page_read_user");
 share_user = RS.getString("share_user");



%>			
       
        <tr height="35">
        <td>&nbsp;<%=title%></td>
        <td align="center"><%=ref_date%></td>
        <td align="center"><%=target_user%></td>
        <td align="center"><%=int_page_read_user%></td>
        <td align="center"><%=share_user%></td>
        </tr>
      
      <%
		  RS.next();

i++;}
}
RS.close();
%>	
      
     <tr align="right"  class="biaoti">
    <td colspan="9" >	   </td>
  </tr>
  
  
  <tr align="right"  class="biaoti">
    <td height="22" colspan="11" ><div align="right">第<%=intPage%>页/共<%=intPageCount%>页/<%=intRowCount %>条&nbsp;&nbsp;
          <%if(intPage>1){%>
      <a href="interface/index.jsp?page=<%=intPage-1%>">上一页</a>
      <%}%>
  &nbsp;&nbsp;
  <%if(intPage<intPageCount){%>
  <a href="interface/index.jsp?page=<%=intPage+1%>">下一页</a>
  <%}%>
 &nbsp;&nbsp;选择页码：
  <select name="page" onChange="MM_jumpMenu('this',this,0)" style="width:80px;">
    <option value="interface/index.jsp?page=<%=intPage%>" selected><%=intPage%></option>
    <%int j;
	  for (j=1;j<=intPageCount;j++){%>
    <option value="interface/index.jsp?page=<%=j%>"><%=j%></option>
    <%}%>
  </select>
  
  </div></td>
  </tr>
    </table></td>
  </tr>
</table>

  </body>
</html>
