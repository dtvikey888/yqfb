<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="org.liufeng.course.util.ZghTools"%>
<%
//���������1.���� ���� openid ����zgh_cj �е� zlopenid �ֶΣ�����ҵ�
//˵���Ѿ�������������
// 2. û�ҵ��͸��½�ȥ�������β��
String bzlopenid = request.getParameter("bzlopenid");
String zlopenid = request.getParameter("zlopenid");
String px = request.getParameter("px");

ZghTools.HelpCz(bzlopenid,zlopenid);

out.println("<script>window.location.href='index5.jsp?bzlopenid="+bzlopenid+"&px="+px+"'</script>");

%>

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

