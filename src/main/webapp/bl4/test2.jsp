<%--<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>--%>
<%--<%@page import="com.component.Topay"%>--%>
<%--<%@page import="org.fjw.weixin.util.MyUtils7"%>--%>
<%--<%@page import="org.fjw.weixin.util.MyUtils25"%>--%>
<%--<%@page import="org.fjw.weixin.util.AllValus"%>--%>
<%--<%@page import="org.liufeng.course.util.ZghTools"%>--%>
<%--<%--%>
	<%--//����ʱ��--%>
	<%--int kz =0;--%>
	<%--String tt1=AllValus.daf_t1;--%>
	<%--String tt2=AllValus.daf_t2;--%>
    <%--Date c1=MyUtils7.CharDate(tt1);--%>
    <%--Date c2=MyUtils7.CharDate(tt2);--%>
    <%--kz= MyUtils7.TimeKZ(c1,c2);--%>
    <%--//1: //��ʼ�齱--%>
    <%--//2: //�齱�Ѿ�����,��л��ע��--%>
    <%--//3: //�齱��û��ʼ�أ�--%>
    <%--//out.println(kz);--%>
<%--%>--%>

<%--<%--%>

<%--String urlname ="bl2/test2.jsp";--%>
<%--String openid =request.getParameter("openid");--%>

   <%--String from="";--%>
   <%--String check="";--%>
   <%----%>
<%--if(from!=null){--%>
  <%--check=Topay.WxJsApiCheck48(urlname,openid,from);--%>
<%--}else{--%>
  <%--check=Topay.WxJsApiCheck4(urlname,openid);--%>
<%--}--%>
   <%----%>

<%--%>--%>


<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<%--<head>--%>

<%--<script src="http://res2.wx.qq.com/open/js/jweixin-1.4.0.js"></script>--%>
		<%--<script type="text/javascript">--%>
		<%--wx.config({--%>
		    <%--debug: true, // ��������ģʽ,���õ�����api�ķ���ֵ���ڿͻ���alert��������Ҫ�鿴����Ĳ�����������pc�˴򿪣�������Ϣ��ͨ��log���������pc��ʱ�Ż��ӡ��--%>
		    <%--<%=check%>,// ���ǩ��������¼1--%>
		    <%--jsApiList: [--%>
        <%--'updateTimelineShareData',--%>
        <%--'updateAppMessageShareData'--%>
      <%--]// �����Ҫʹ�õ�JS�ӿ��б�����JS�ӿ��б����¼2--%>
		<%--});--%>
		<%----%>
		<%----%>
		<%----%>
		<%----%>
		<%--wx.ready(function(){--%>
		   <%--//alert("config ok...");--%>
		   <%--//�������Ͻǲ˵��ӿ�--%>
		   	  <%--//wx.hideOptionMenu();--%>
		   <%----%>

		   <%--wx.checkJsApi({--%>
           <%--jsApiList: [--%>
              <%--'updateTimelineShareData',--%>
        <%--'updateAppMessageShareData'--%>
           <%--],--%>
           <%--success: function (res) {--%>
             <%--//alert(JSON.stringify(res));--%>
           <%--}--%>
          <%--});--%>
          <%----%>
		<%--});--%>
		<%--wx.error(function(res){--%>
			<%--//alert(res);--%>
		    <%--// config��Ϣ��֤ʧ�ܻ�ִ��error��������ǩ�����ڵ�����֤ʧ�ܣ����������Ϣ���Դ�config��debugģʽ�鿴��Ҳ�����ڷ��ص�res�����в鿴������SPA�������������ǩ����--%>
		<%--});--%>
		<%----%>
		<%----%>
			<%----%>
			<%--// 2.2 ������������Ȧ��ť������Զ���������ݼ��������ӿ�--%>
  <%--function  sharefriendRound2() {--%>
     <%--//��ʾ���Ͻǲ˵��ӿ�--%>
      <%--// wx.showOptionMenu();--%>
	   <%----%>
    <%--wx.onMenuShareTimeline({--%>
      <%--title: '�й��������������齱',--%>
      <%--link: 'http://www.yqrb.com.cn/yqcnwx2/err.jsp',--%>
      <%--imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo9.jpg',--%>
      <%--trigger: function (res) {--%>
        <%--// ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���--%>
       <%--// alert('�û������������Ȧ');--%>
      <%--},--%>
      <%--success: function (res) {--%>
        <%--alert('�ѷ���');--%>
      <%--},--%>
      <%--cancel: function (res) {--%>
        <%--alert('��ȡ��');--%>
      <%--},--%>
      <%--fail: function (res) {--%>
       <%--// alert(JSON.stringify(res));--%>
      <%--}--%>
    <%--});--%>
	<%----%>
    <%--//alert('��ע���ȡ����������Ȧ��״̬�¼�');--%>
	<%--//alert('����ȥ��������Ѱɣ�������Ҳ���μ�ԤԼ����!');--%>
  <%--};--%>
  <%----%>

	<%--// 2.2 ���������͸����ѡ���ť������Զ���������ݼ��������ӿ�--%>
  <%--function  sharefriendRound3() {--%>
     <%--//��ʾ���Ͻǲ˵��ӿ�--%>
       <%--//wx.showOptionMenu();--%>
	   <%----%>
    <%--wx.onMenuShareAppMessage({--%>
      <%--title: '�й��������������齱',--%>
      <%--desc: '�����μӳ齱',--%>
      <%--link: 'http://www.yqrb.com.cn/yqcnwx2/err.jsp',--%>
      <%--imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo9.jpg',--%>
      <%--type: '', // ��������,music��video��link������Ĭ��Ϊlink--%>
      <%--dataUrl: '', // ���type��music��video����Ҫ�ṩ�������ӣ�Ĭ��Ϊ��--%>
      <%--trigger: function (res) {--%>
        <%--// ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���--%>
       <%--// alert('�û�������͸�����');--%>
      <%--},--%>
      <%--success: function (res) {--%>
        <%--alert('�ѷ���');--%>
      <%--},--%>
      <%--cancel: function (res) {--%>
        <%--alert('��ȡ��');--%>
      <%--},--%>
      <%--fail: function (res) {--%>
       <%--// alert(JSON.stringify(res));--%>
      <%--}--%>
    <%--});--%>
	<%----%>
    <%--//alert('��ע���ȡ����������Ȧ��״̬�¼�');--%>
	<%--//alert('����ȥ���͸����Ѱɣ�������Ҳ���μ�ԤԼ����!');--%>
  <%--};--%>
  			<%----%>
	<%--// 2.2 ���������͸�qq���ѡ���ť�������ȡ������QQ����ť���״̬���Զ���������ݽӿ�--%>
  <%--function  sharefriendRound4() {--%>
     <%--//��ʾ���Ͻǲ˵��ӿ�--%>
      <%--// wx.showOptionMenu();--%>
	   <%----%>
    <%--wx.onMenuShareQQ({--%>
      <%--title: '�й��������������齱',--%>
      <%--desc: '�����μӳ齱',--%>
      <%--link: 'http://www.yqrb.com.cn/yqcnwx2/err.jsp',--%>
      <%--imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo9.jpg',--%>
     <%----%>
      <%--trigger: function (res) {--%>
        <%--// ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���--%>
       <%--// alert('�û�������͸�QQ����');--%>
      <%--},--%>
      <%--success: function (res) {--%>
        <%--alert('�ѷ���');--%>
      <%--},--%>
      <%--cancel: function (res) {--%>
        <%--alert('��ȡ��');--%>
      <%--},--%>
      <%--fail: function (res) {--%>
      <%--//  alert(JSON.stringify(res));--%>
      <%--}--%>
    <%--});--%>
	<%----%>
    <%--//alert('��ע���ȡ����������Ȧ��״̬�¼�');--%>
	<%--//alert('����ȥ���͸�QQ���Ѱɣ�������Ҳ���μ�ԤԼ����!');--%>
  <%--};	--%>
		<%----%>
		<%----%>
		<%----%>
				<%----%>
	<%--// 2.2 ������������Ѷ΢������ť�������ȡ��������Ѷ΢������ť���״̬���Զ���������ݽӿ�--%>
  <%--function  sharefriendRound5() {--%>
     <%--//��ʾ���Ͻǲ˵��ӿ�--%>
       <%--//wx.showOptionMenu();--%>
	   <%----%>
    <%--wx.onMenuShareWeibo({--%>
      <%--title: '�й��������������齱',--%>
      <%--desc: '�����μӻ',--%>
      <%--link: 'http://www.yqrb.com.cn/yqcnwx2/err.jsp',--%>
      <%--imgUrl: 'http://v.yqcn.com/bmwj/asp/sxbook/images/logo9.jpg',--%>
     <%----%>
      <%--trigger: function (res) {--%>
        <%--// ��Ҫ������trigger��ʹ��ajax�첽�����޸ı��η�������ݣ���Ϊ�ͻ��˷��������һ��ͬ����������ʱ��ʹ��ajax�Ļذ��ỹû�з���--%>
       <%--// alert('�û�������͸���Ѷ΢��');--%>
      <%--},--%>
      <%--success: function (res) {--%>
        <%--alert('�ѷ���');--%>
      <%--},--%>
      <%--cancel: function (res) {--%>
        <%--alert('��ȡ��');--%>
      <%--},--%>
      <%--fail: function (res) {--%>
       <%--// alert(JSON.stringify(res));--%>
      <%--}--%>
    <%--});--%>
	<%----%>
    <%--//alert('��ע���ȡ����������Ȧ��״̬�¼�');--%>
	<%--//alert('����ȥ���͸���Ѷ΢���ɣ�������Ҳ���μ�ԤԼ����!');--%>
  <%--};	--%>
			<%----%>
				<%----%>
	<%--// 2.2 �������ύ����ť�������ȡ���������ز˵��� ��--%>
  <%--function  sharefriendRound6() {--%>
     <%--//��ʾ���Ͻǲ˵��ӿ�--%>
      <%--// wx.showOptionMenu();--%>
      <%--//�������Ͻǲ˵��ӿ�--%>
	 <%--wx.hideOptionMenu();--%>
	   <%----%>
   <%--wx.hideMenuItems({ --%>
      <%--menuList: [ --%>
        <%--'menuItem:readMode', // �Ķ�ģʽ --%>
        <%--'menuItem:openWithQQBrowser', // ��	QQ������д�--%>
        <%--'menuItem:openWithSafari', //��Safari�д�--%>
        <%--'menuItem:share:email', //�ʼ�--%>
        <%--'menuItem:copyUrl', // �������� --%>
        <%--'menuItem:favorite', //�ղ�--%>
        <%--'menuItem:share:brand', //һЩ���⹫�ں�--%>
        <%--'menuItem:jsDebug',  //����:--%>
		<%--'menuItem:editTag', //�༭��ǩ: --%>
	    <%--'menuItem:delete',  //ɾ��:--%>
 		<%--'menuItem:originPage', //ԭ��ҳ:--%>
 		<%--'menuItem:share:qq',  //����QQ:--%>
 		<%--'menuItem:share:weiboApp',  //����Weibo:--%>
		<%--'menuItem:favorite',  //�ղ�: --%>
 		<%--'menuItem:share:facebook', //����FB:--%>
		<%--'menuItem:share:QZone'  //���� QQ �ռ�--%>
	<%----%>

      <%--], --%>
      <%--success: function (res) { --%>
      <%--//  alert('������һϵ�а�ť'); --%>
      <%--}, --%>
      <%--fail: function (res) { --%>
       <%--//alert(JSON.stringify(res)); --%>
      <%--} --%>
    <%--}); --%>
	<%----%>
    <%--//alert('��ע���ȡ����������Ȧ��״̬�¼�');--%>
	<%--//alert('��֪���������ڿ�չ��̬����������?');--%>
  <%--};		--%>


		<%--</script>--%>
