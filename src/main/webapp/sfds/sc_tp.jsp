<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
   String openid = request.getParameter("openid");
   int lb = new Integer(request.getParameter("lb"));
   String[] values=request.getParameterValues("ArticleId");
   
   
  
   if(values!=null){
      if(values.length!=10){
      
            out.println("<script>alert('请选择10位进行投票！');window.location.href='tp.jsp?openid="+openid+"&lb="+lb+"'</script>");
           
      }else{
      
          if(ZghTools.IsCz10(openid)){
          
          	 out.println("<script>window.location.href='tp.jsp?openid="+openid+"&lb="+lb+"'</script>");
          	 
          }else{
          	 	
             //录入
             ZghTools.TpForLcb2(openid,values,lb);
             
             out.println("<script>alert('投票已经成功，谢谢参与！');window.location.href='tp.jsp?openid="+openid+"&lb="+lb+"'</script>");
             
          }
      }
     
   }else{
   
     out.println("<script>alert('请选择10位进行投票！');window.location.href='tp.jsp?openid="+openid+"&lb="+lb+"'</script>");
     
   }
   
   
   
%>