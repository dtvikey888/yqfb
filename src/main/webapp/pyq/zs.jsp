<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="org.fjw.weixin.util.PyqTools"%>
<%@page import="org.fjw.weixin.util.sql_data"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="com.component.*"%>
<%@page import="org.fjw.weixin.util.MysqlDB"%>
<%@page import="org.fjw.weixin.util.AllValus"%>
<!-- 展示用 -->
<%
//String urlname ="pyq/index.jsp";
String openid =request.getParameter("openid");
String bz =request.getParameter("bz");
if(bz==null){
	bz="0";
}
%>
<html>
<head>
    <title>乐清两会朋友圈,邀您加入群聊!</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link href="css/1_style.css" rel="stylesheet">
    <style type="text/css">
        .text-box .comment { border: 1px solid #eee; display: block; height: 50px; width: 100%; padding: 5px; resize: none; color: #ccc}
        .text-box .btn { font-size: 12px; font-weight: bold; display: block; float: right; width: 65px; height: 25px; border: 1px solid #0C528D; color: #fff; background: #4679AC;}
        .text-box .btn-off { border: 1px solid #ccc; color: #ccc; background: #F7F7F7;}
        .text-box .word{ display: none; float: right; margin: 7px 10px 0 0; color: #666;}
        .text-box-on .comment{ height: 50px; color: #333;}
        .text-box-on .btn{ display: inline;}
        .text-box-on .word{ display: inline;}
    </style>
    <script src="css/jquery-1.8.3.min.js"></script>
 	
</head>

<body>

    <header>
        <img id="bg" src="picture/1_bg.png">

		<img id="avt2" class="data-avt" src="picture/ft.png">

		<div><img id="avt5" class="data-avt" src="picture/c3.png"></div>

        <p id="user-name" class="data-name"></p>

		
        <img id="avt" class="data-avt" src="picture/46_n3.png">
		
    </header>

     <div id="main">
        <!--<div id="share_show">
            <img src="images/share.png" style="width:90%;" />
        </div>-->
        <div id="list">
			 <ul>  
 
<%
String sql = "select * from yqcnwx_pyq_theme where yz=1 order by fbsj desc limit 100";
MysqlDB db = new MysqlDB();
ResultSet RS = db.executeQuery(sql);
if(RS.wasNull()) out.print("<br><font face=Arial color=navy size=2><b>暂无内容</b></font>");
%>
<%
int intPageSize; //一页显示的记录数
int intRowCount; //记录总数
int intPageCount; //总页数
int intPage; //待显示页码
java.lang.String strPage;
int i;
//设置一页显示的记录数
intPageSize = 100;
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
i = 0;
%>

<%while((i<intPageSize && !RS.isAfterLast())){

	String id = RS.getString("id");
	//String uid = RS.getString("uid");
	String uid = PyqTools.GetId(openid);
	String bzuid = RS.getString("uid");
	String memo = RS.getString("memo");
	String fbsj = RS.getString("fbsj");
	
	//out.println("uid:"+uid);
	//out.println("tzuid:"+bzuid);
	//out.println("tid:"+id);
	//out.println("PyqTools.IsUpVote(uid,id): "+PyqTools.IsUpVote(uid,id));
	
	String images ="";
	images = RS.getString("img1");
	String images2="";
	if(images.length()>0 && !images.equals("no.gif") ){
		images2 = AllValus.videopath+images;
	}else{
		images2 = "no.gif";
	}
	
%>
             <li>

                <div class="po-avt-wrap">
 				
                    <img class="po-avt" src="<%=PyqTools.GetImgById2(bzuid)%>">

                </div>

                <div class="po-cmt">

                    <div class="po-hd">

                        <p class="po-name"><%=PyqTools.GetNickById2(bzuid)%></p>
                        
                        
                        
					<%if(!images2.equals("no.gif")){ %>
                        <p class="post"><%=memo%><a href="<%=images2%>"><img src="<%=images2%>"></a></p>
                        
                        <%if(uid.equals(bzuid)){ %>
                        <div><img class="c-icon" src="picture/del.png"></div>
                        <%} %>
                        
                        <br><br>
                        
             		<%}else{ %>   
                     	<p class="post"><%=memo%></p>
                     	
                     	 <%if(uid.equals(bzuid)){ %>
                        <div><img class="c-icon" src="picture/del.png"></div>
                        <%} %>
                        
                        <br><br>
                     	
               		<%} %>
				
						<p class="time"><%=fbsj.substring(0,19)%></p><div><img class="c-icon" src="picture/xin1.png"></div>
				
                    </div>

                    <div class="r"></div>

                    <div class="cmt-wrap">
                  <%if(PyqTools.GetLikeVoteNo(id)>0){ %>
 						<div class="like"><img src="picture/3_l.png"><%=PyqTools.GetVoteNickName(id)%></div>
 				  <%}else{ %>
 				  		<div class="like"><%=PyqTools.GetVoteNickName(id)%></div>
 				  <%} %>
                        <div class="cmt-list">
 
                        <%if(PyqTools.GetCountOfComment(id)>5){ %>
                        <a href="index.jsp?openid=<%=openid%>&bz=1">...</a>
                        <%} %>
  
                        </div>
						 <form id="form1" name="form1" method="post" action="#">
						 <div class="text-box">
                    		<textarea class="comment" autocomplete="off" id="memo" name="memo" onClick="value=''">评论</textarea>
                   			<button type="submit" class="btn">回 复</button>
                    		<span class="word"><span class="length">0</span>/50</span>
                		</div>
                		</form>
						
                    </div>

                </div>

            </li>

<%
RS.next();
i++;}
}
RS.close();
%>



        </ul>  
        </div>

        <div id="guide" class="hide"></div>

    </div>

   

   
  
<style>body > span{display:none;}</style>

<script>
        $(function(){

           $("#share a").click(function(){
				$("#guide").show();
			}); 

			$("#guide").click(function(){
				$(this).hide();
			});

        });
    </script>
   

</body>

</html>