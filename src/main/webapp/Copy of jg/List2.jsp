<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<jsp:useBean id="sqlbean" scope="page" class="org.fjw.weixin.util.MysqlDB"/>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/<c>1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<title><%=AllValus.title2 %></title>
<style>
body{font-size:30px; font-family:微软雅黑; background:url(IMG/bodybg.jpg); padding:0px;margin:0px; }
a{text-decoration:none; color:#000000;}
a:hover{ color:##d73615; text-decoration:none;}
p{text-indent:2em;}
m{font-size:45px; color:#ffffff;}
c{font-size:35px; font-family:Arial;}
d{color:#ffffff; text-indent:2em;}
e{color:#b1b1b1;}
h1{font-size:30px;}
#m1{width:50%;float:left;}
</style>
</head>
<body >

<table width="100%" border="1">
<tr>
    <td>图片</td>
    <td>姓名</td>
    <td>电话</td>
    <td width="24%">分类
    <form method=post name=form  action=?kk=1>

    <select  id="lb" name=lb style="border:1px solid #294121;border-radius:10px;border-color:#294121;width:100%;height:120px;font-size:25px;">
			    <option value="0" selected>选择类型</option>
				<option value="1">为祖国唱一首歌（读诗）</option>
				<option value="2">为祖国绘一副画</option>
				<option value="3">为祖国拍一张照</option>
				<option value="4">为家乡打一处卡</option>
	    </select>
			  <br/><br/>
			  <input name="submit"  type="submit" value="搜 索..." class="button" style="width:100%;height:100px;font-size:35px;"/>
    </form>
    </td>
    <td width="5%">打卡地</td>
    <td width="8%">打卡理由</td>
    <td>状态</td>
    <td>操作</td>
  </tr>
<% 
String kk=request.getParameter("kk");
String sql="";
if(kk!=""&&kk!=null){
if(request.getParameter("lb")!=null&&request.getParameter("lb").equals("0")){
    sql="select * from jg ORDER BY istop DESC,fbsj DESC";
}else{
sql="select * from jg where lb="+request.getParameter("lb")+" ORDER BY istop DESC,fbsj DESC";
}

}else{

sql="select * from jg ORDER BY istop DESC,fbsj DESC";
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
intPageSize = 10000;
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

<%while((i<intPageSize && !RS.isAfterLast()))
{
String id,lb2,oid,tel,istop,yz2,memo,video1,xm,story;
int lb=0;
int yz=0;

id = RS.getString("id");
lb=RS.getInt("lb");
oid=RS.getString("oid");
tel=ZghTools.GetTel(oid);
istop=RS.getString("istop");
memo=RS.getString("memo");
video1=RS.getString("video1");
xm=ZghTools.GetXm4(oid);
story=RS.getString("story");

if(lb==1){
   lb2="为祖国唱一首歌";
}else if(lb==2){
   lb2="为祖国绘一副画";
}else if(lb==3){
   lb2="为祖国拍一张照";
}else{
   lb2="为家乡打一处卡";
}

yz=RS.getInt("yz");
if(yz==1){
   yz2="<font color=red>显示</font>";
}else if(yz==3){
   yz2="<font color=red>待处理</font>";
}else{
   yz2="<font color=blue>隐藏</font>";
}


String images ="";
images = RS.getString("img1");
String images2="";
if(images.length()>0 && !images.equals("0") ){
images2 = AllValus.videopath+images;
}else{
   if(video1.indexOf(".mp3")!=-1||video1.indexOf(".mp4")!=-1||video1.indexOf(".MP3")!=-1||video1.indexOf(".MP4")!=-1){
      images2 = AllValus.videopath+"video.png";
   }else{
      images2 = AllValus.nopicpath;
   }
}


video1= RS.getString("video1");

String vd=AllValus.videopath+video1;

String tzurl = "";


String bzlopenid=ZghTools.GetOpenidFromOid(new Integer(oid));

if(video1.equals("0")){

    tzurl="Pic1.jsp?bzlopenid="+bzlopenid+"&id="+id+"";

}else{

	tzurl="video.jsp?bzlopenid="+bzlopenid+"&id="+id+"";
}


%>
  
  <tr>
    <td width="13%">
    <div onClick="javascript:location.href='<%=tzurl%>';">
    <img src="<%=images2%>" width="100%;"/>    </div>    </td>
    <td width="6%"><%=xm%></td>
    <td width="6%"><%=tel%></td>
    <td><%=lb2%></td>
    <td><%=memo %></td>
    <td><%=story %></td>
    <td width="5%"><%=yz2%></td>
	<td width="33%">
	<a href="/yqfb/del?action=1&id=<%=id%>" class="btn" rel="tooltip" title="显示">显示</a>
	&nbsp;&nbsp;
	<a href="/yqfb/del?action=2&id=<%=id%>" class="btn" rel="tooltip" title="隐藏">隐藏</a>
	&nbsp;&nbsp;
	<a href="/yqfb/del?action=3&id=<%=id%>" title="置顶">置顶</a>
    &nbsp;&nbsp;<br/>
    &nbsp;&nbsp;<br/>
    <%if(video1.indexOf(".mp3")!=-1||video1.indexOf(".mp4")!=-1||video1.indexOf(".MP3")!=-1||video1.indexOf(".MP4")!=-1){ %>
    <a href="<%=vd%>" title="下载">下载</a>
    <%}else{ %>
    <a href="<%=images2%>" title="下载">下载</a>
    <%} %>
    &nbsp;&nbsp;<br/>
    <br/><br/>
    <div style="float:right;"><a href="/yqfb/del?action=8&id=<%=id%>&lb=<%=lb%>" onClick="return confirm('确定删除?');">
	        <img src="IMG/del.png" width="60" height="60"/>
    </a>    </div>    	</td>
  </tr>
<%
RS.next();
i++;}
}
RS.close();
%>  
</table>




</body>
</html>
