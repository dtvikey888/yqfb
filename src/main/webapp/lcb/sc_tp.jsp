<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
   String openid = request.getParameter("openid");
   String[] values=request.getParameterValues("ArticleId");
  
   if(values!=null){
      if(values.length!=3){
      
            out.println("<script>alert('请选择3位进行投票！');window.location.href='tp.jsp?openid="+openid+"'</script>");
           
      }else{
      
          if(ZghTools.IsCz6(openid)){
          
          	 out.println("<script>window.location.href='tp.jsp?openid="+openid+"'</script>");
          	 
          }else{
          	 	
             //录入
             ZghTools.TpForLcb(openid,values);
             
             out.println("<script>alert('投票已经成功，谢谢参与！');window.location.href='tp.jsp?openid="+openid+"'</script>");
             
          }
      }
     
   }else{
     out.println("<script>alert('请选择3位进行投票！');window.location.href='tp.jsp?openid="+openid+"'</script>");
   }
   
   
   
%>