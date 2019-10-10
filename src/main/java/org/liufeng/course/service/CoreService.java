package org.liufeng.course.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.fjw.weixin.util.MyUtils6;
import org.fjw.weixin.yy.WeixinChaOpenId;
import org.liufeng.course.message.resp.Article;
import org.liufeng.course.message.resp.NewsMessage;
import org.liufeng.course.message.resp.TextMessage;
import org.liufeng.course.util.MessageUtil;

/**
 * ���ķ�����
 * 
 * @author fjw
 * @date 2015-03-18
 */
public class CoreService {

	public static String processRequest(HttpServletRequest request) {
		
		
		/**
		 * ����΢�ŷ���������
		 * 
		 * @param request
		 * @return xml
		 */
		
		// xml��ʽ����Ϣ����
		String respXml = null;
		try {
			// ����parseXml��������������Ϣ
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			// ���ͷ��ʺ�
			String fromUserName = requestMap.get("FromUserName");
			
			System.out.println("CoreService�����û�:"+fromUserName);
			
			// ������΢�ź�
			String toUserName = requestMap.get("ToUserName");
			// ��Ϣ����
			String msgType = requestMap.get("MsgType");
			
			//�����û����͵��ı���Ϣ����
			String content = requestMap.get("Content");
			
			//�����û����͵�ͼƬ��Ϣ MediaId
			String MediaId = requestMap.get("MediaId");
	
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
		
			//���Ƚ���ע��д��sxbook_openid���ݿ�
			WeixinChaOpenId.chaOpenId2(fromUserName);

			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			
			// �ı���Ϣ
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				//respContent = "�����͵����ı���Ϣ��";
				if("��������".equals(content)){
					
					Article article = new Article();
					article.setTitle("�ýŲ�д��\"�ĸ￪����ʮ����\"Ӯ��Ʒ");
					article.setDescription("�ԡ����ⲽ�� ɹ�켣ͼ��Ϊ��Ҫ��ʽ��ͨ���ܲ����д�����ĸ￪����ʮ���ꡱ����һ���ּ��л�������Ʒ������˸��ָ��к������͡�");
					article.setPicUrl("http://info.yqcn.com/otherimg/run.png");
					article.setUrl("https://file762d99333146.iamh5.cn/v3/idea/wUKCxQVS?from=singlemessage&isappinstalled=0&suid=9ABB0F03-0038-44BC-A7F4-764C7A07A3A2&sl=1");
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// ����ͼ����Ϣ
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					
					
				}else if("Ц��".equals(content)){
					
					//textMessage.setContent("�뷢�ͻ��Ϣ������Ȧ��ͼ�����ɲ���ԤԼ�������μ���ȯ�齱��");
					//respXml = MessageUtil.messageToXml(textMessage);
					textMessage.setContent("���ɣ�лл��");
					respXml = MessageUtil.messageToXml(textMessage);
					/**
					Article article = new Article();
					article.setTitle("��Ц�йصĺ��¶����ˣ�Լ��");
					article.setDescription("�������");
					article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo5.jpg");
					article.setUrl("http://www.yqrb.com.cn/yqfb/index.jsp?openid="+fromUserName);
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// ����ͼ����Ϣ
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					**/
					
				}else if("����".equals(content)){
					
					textMessage.setContent("���ɣ�лл��");
					respXml = MessageUtil.messageToXml(textMessage);
					
					/**
					Article article = new Article();
					article.setTitle("����");
					article.setDescription("�������");
					article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo17.jpg");
					article.setUrl("http://www.yqrb.com.cn/yqfb/xm/dl.jsp?openid="+fromUserName);
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// ����ͼ����Ϣ
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					**/
					
				}else if("�߿�".equals(content)){
					//textMessage.setContent("���ɣ�лл��");
					//respXml = MessageUtil.messageToXml(textMessage);
					
					Article article = new Article();
					article.setTitle("�߿�־Ը����潲���������");
					article.setDescription("�������");
					article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo11.jpg");
					article.setUrl("http://www.yqrb.com.cn/yqfb/gk/dl.jsp?openid="+fromUserName);
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// ����ͼ����Ϣ
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					
				}else if("�ζ�".equals(content)){
					textMessage.setContent("���ɣ�лл��");
					respXml = MessageUtil.messageToXml(textMessage);
					/**
					Article article = new Article();
					article.setTitle("����������ͨӵ��������ʾ����");
					article.setDescription("1��ѡ���ύ������д�������ֻ�����μ����˳齱��\n2������ʱ�䣺12��2����12��8�ա�\n3�����ε����裺20Ԫ(150��)��50Ԫ(30��)��100Ԫ(5��)�Ȼ��ѽ�����");
					article.setPicUrl("http://xadmin.yqcn.com/weixin/test/TOP700px.jpg");
					article.setUrl("http://zt1.yqcn.com/active/zdb/index.asp");
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// ����ͼ����Ϣ
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					*/
				}else if("������".equals(content)){
					
					//textMessage.setContent("�뷢�ͻ��Ϣ������Ȧ��ͼ�����ɲ���ԤԼ�������μ���ȯ�齱��");
					//respXml = MessageUtil.messageToXml(textMessage);
					textMessage.setContent("���ɣ�лл��");
					respXml = MessageUtil.messageToXml(textMessage);
					/**
					Article article = new Article();
					article.setTitle("�������²���������Ԫ���������ع��ա�");
					article.setDescription("�������");
					article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo22.png");
					article.setUrl("http://www.yqrb.com.cn/yqfb/ssp/index.jsp?openid="+fromUserName);
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// ����ͼ����Ϣ
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					*/
					
				}else if("g20".equals(content)||"G20".equals(content)){
					
					textMessage.setContent("���ɣ�лл��");
					respXml = MessageUtil.messageToXml(textMessage);
					/**
					Article article = new Article();
					
					article.setTitle("���ҳ�ŵ�����ж������������������С�����ǩ���");
					article.setDescription("Ϊӭ��G20��ᣬ�����������㽭�ˣ������������죨�����죩�������ձ������Ͼٰ조�ҳ�ŵ�����ж������������������С�����ǩ�����������һ���ж��������������塣");
					article.setPicUrl("http://xadmin.yqcn.com/weixin/2016/wmyl/img/wx.jpg");
					article.setUrl("http://xadmin.yqcn.com/weixin/2016/wmyl/");

					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);

					// ������ͼ����Ϣ 
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					*/
					
				}else if("caocao".equals(content)){
					
				
					/**
					Article article = new Article();
					
					article.setTitle("��������̬�������α�����PK");
					article.setDescription("4000����н����15000Ԫ���ѵ�����");
					article.setPicUrl("http://www.yqrb.com.cn/yqvod/bmwj/asp/h5/gt25/IMG/IMG_TOP.jpg");
					article.setUrl("http://www.yqrb.com.cn/yqvod/bmwj/asp/h5/gt25/index.asp?openid="+fromUserName);

					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);

					// ������ͼ����Ϣ 
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					**/
					
					textMessage.setContent("�˻���ڽ���ʼ�������ע��");
					respXml = MessageUtil.messageToXml(textMessage);
					
					
				}else if("����".equals(content)){
					
				
					
					Article article = new Article();
					
					article.setTitle("��������̬�������α�����PK");
					article.setDescription("4000����н����15000Ԫ���ѵ�������");
					article.setPicUrl("http://www.yqrb.com.cn/yqvod/bmwj/asp/h5/gt25/IMG/IMG_TOP.jpg");
					article.setUrl("http://www.yqrb.com.cn/yqvod/bmwj/asp/h5/gt25/index.asp?openid="+fromUserName);

					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);

					// ������ͼ����Ϣ 
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
	
					
				}else if("�ڼ�����".equals(content)){

					Article article = new Article();
					
					article.setTitle("���̴���ս�����Ӯ���ѣ�");
					article.setDescription("3500Ԫ�ƶ���������ã������ޣ�");
					article.setPicUrl("http://www.yqrb.com.cn/yqvod/bmwj/asp/sxbook/images/gp06.png");
					article.setUrl("http://www.yqrb.com.cn/yqfb/jsk/wel.jsp?openid="+fromUserName);

					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);

					// ������ͼ����Ϣ 
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
	
					
				}else if("333".equals(content)){
					
					textMessage.setContent(fromUserName);
					respXml = MessageUtil.messageToXml(textMessage);
					
				}else {
					
					textMessage.setContent("лл��");
					respXml = MessageUtil.messageToXml(textMessage);

					/**
					//�Ի�����������/�ֻ���
					//����
					//1.�����ڸñ��(��ʾ�ȷ��ͽ�ͼ)
					//2.�Ѿ������(��������)
					//3.����(����)�ɹ�������������ڣ�
					//4.�����ʽ����ȷ 
					//5.��Ѿ�����,��л��ע��
					//6.���û��ʼ��
					//7.�绰�����Ѿ����ڣ�ͬһ�����벻�ܲμ�
				    int tp = MyUtils6.Tp(fromUserName, content);
				    if (tp==1) {
						//1 �����ڸñ��
				    	textMessage.setContent("���ȷ��ͽ�ͼ��");
						respXml = MessageUtil.messageToXml(textMessage);
				    }else if (tp==2) {
						//2.�Ѿ������
						textMessage.setContent("���Ѿ��μӹ����");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if (tp==3) {
						//3.����(����)�ɹ����������ڴ��ڣ�
						Article article = new Article();
						article.setTitle("����������Чƽ̨���������� ע���к���");
						article.setDescription("�������");
						article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo10.jpg");
						article.setUrl("http://www.yqrb.com.cn/yqfb/usb/cj_chk.jsp?openid="+fromUserName);
						List<Article> articleList = new ArrayList<Article>();
						articleList.add(article);
						// ����ͼ����Ϣ
						NewsMessage newsMessage = new NewsMessage();
						newsMessage.setToUserName(fromUserName);
						newsMessage.setFromUserName(toUserName);
						newsMessage.setCreateTime(new Date().getTime());
						newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
						newsMessage.setArticleCount(articleList.size());
						newsMessage.setArticles(articleList);
						respXml = MessageUtil.messageToXml(newsMessage);
					}else if (tp==4) {
						// 4.�����ʽ����ȷ
						textMessage.setContent("��ʽ���벻��ȷ,��ȷ��ʽӦ���� ����/�ֻ�����");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if (tp==5) {
						// 5.��Ѿ�����
						//textMessage.setContent("��Ѿ�����,��л��ע��");
						textMessage.setContent("���������ˣ�С���ڴ˵���ܾúܾá���");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if (tp==6) {
						// 6.���û��ʼ��
						textMessage.setContent("���û��ʼ�أ�");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if(tp==7){
						// 7.�����ظ��
						textMessage.setContent("�绰�����Ѿ����ڣ�ͬһ�����벻�ܲμ�");
						respXml = MessageUtil.messageToXml(textMessage);
					}
					/** Ц��ͶƱ������
					int tp = MyUtils3.Tp(fromUserName, content);
					if (tp==1) {
						//1 �����ڸñ��
						textMessage.setContent("�����ڸñ�ţ�");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if (tp==2) {
						//2.�Ѿ�Ͷ��Ʊ 
						textMessage.setContent("���Ѿ�Ͷ��Ʊ��");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if(tp==3){
						//3.ͶƱ�ɹ�
						//textMessage.setContent("ͶƱ�ɹ���");
						//respXml = MessageUtil.messageToXml(textMessage);
						//Ȼ�󵯳��齱
						/*
						Article article = new Article();
						article.setTitle("ͶƱ�ɹ�,����������100Ԫ�»������ȯ");
						article.setDescription("�������");
						article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg");
						article.setUrl("http://www.yqrb.com.cn/yqfb/tp/cj.jsp?openid="+fromUserName);
						List<Article> articleList = new ArrayList<Article>();
						articleList.add(article);
						// ����ͼ����Ϣ
						NewsMessage newsMessage = new NewsMessage();
						newsMessage.setToUserName(fromUserName);
						newsMessage.setFromUserName(toUserName);
						newsMessage.setCreateTime(new Date().getTime());
						newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
						newsMessage.setArticleCount(articleList.size());
						newsMessage.setArticles(articleList);
						respXml = MessageUtil.messageToXml(newsMessage);
						*/
						/**
						textMessage.setContent("ͶƱ�Ѿ�����,��л��ע��");
						respXml = MessageUtil.messageToXml(textMessage);
						
					}else if (tp==4) {
						// 4.�����ʽ����ȷ
						textMessage.setContent("��ʽ���벻��ȷ,��ȷ��ʽӦ���� ����/�ֻ�����/������ţ�");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if (tp==5) {
						// 5.ͶƱ�Ѿ�����
						textMessage.setContent("ͶƱ�Ѿ�����,��л��ע��");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if (tp==6) {
						// 6.ͶƱ��û��ʼ��
						textMessage.setContent("ͶƱ��û��ʼ�أ�");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if(tp==7){
						// 7.�����ظ�ͶƱ
						textMessage.setContent("�õ绰�����Ѿ�Ͷ��Ʊ�������ظ�ͶƱ��");
						respXml = MessageUtil.messageToXml(textMessage);
					}
					*/
				}

			}
			
			
			// ͼƬ��Ϣ
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
//				textMessage.setContent("�����͵���ͼƬ��Ϣ��");
//				respXml = MessageUtil.messageToXml(textMessage);
				

				/**
				 * ֻ�����Ƿ�һ��ͼƬ ���������� �������Բ���
				 * �յ��ظ�ͼƬ��Ϣʱ��MediaId�� ���ص����ط����� ��Ȼ����ļ���д�����ݿ� sxbook_bmcj  ��д���� fromUserName���� openid , ���аѷ���ͼƬ���浽���� �� �ļ��� ��
				 */
				
				textMessage.setContent("лл��");
				respXml = MessageUtil.messageToXml(textMessage);
				/**
				WeixinChaOpenId.ReImgesToDB2(MediaId, fromUserName);
				
				//ͼƬ���ú�����Ǹ���ʾ ͼƬ�ɹ��ϴ� �������� �����ʽ"����/�ֻ���"
				textMessage.setContent("ͼƬ�ɹ��ϴ� �������� �����ʽ \"����/�ֻ���\" �μӻ");
				respXml = MessageUtil.messageToXml(textMessage);
				*/
				
			}
			
			
//			// ͼƬ��Ϣ
//			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
////				textMessage.setContent("�����͵���ͼƬ��Ϣ��");
////				respXml = MessageUtil.messageToXml(textMessage);
//				
//
//				/**
//				 * ֻ�����Ƿ�һ��ͼƬ ���������� �������Բ���
//				 * �յ��ظ�ͼƬ��Ϣʱ��MediaId�� ���ص����ط����� ��Ȼ����ļ���д�����ݿ� sxbook_bmcj  ��д���� fromUserName���� openid , ���аѷ���ͼƬ���浽���� �� �ļ��� ��
//				 */
//				
//				//WeixinChaOpenId.ReImgesToDB(MediaId, fromUserName);
//				
//				
//				Article article = new Article();
//				
//				article.setTitle("\"�������׻�\"ԤԼ�������");
//				article.setDescription("�������ԤԼ����ҳ��");
//				article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo3.jpg");
//				article.setUrl("http://www.yqrb.com.cn/sxyqwx/index.jsp?openid="+fromUserName);
//				
//				Article article2 = new Article();
//				
//				article2.setTitle("\"�������׻�\"�齱���");
//				article2.setDescription("�������齱ҳ��");
//				article2.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg");
//				article2.setUrl("http://www.yqrb.com.cn/sxyqwx/cj.jsp?openid="+fromUserName);	
//
//				List<Article> articleList = new ArrayList<Article>();
//				articleList.add(article);
//				articleList.add(article2);
//				// ������ͼ����Ϣ 
//				NewsMessage newsMessage = new NewsMessage();
//				newsMessage.setToUserName(fromUserName);
//				newsMessage.setFromUserName(toUserName);
//				newsMessage.setCreateTime(new Date().getTime());
//				newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
//				newsMessage.setArticleCount(articleList.size());
//				newsMessage.setArticles(articleList);
//				respXml = MessageUtil.messageToXml(newsMessage);
//				
//			}
//			
			// �¼�����
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				// �¼�����
				String eventType = requestMap.get("Event");
				// ����
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					
					
					// * ��ע�ظ�
					textMessage.setContent("�����������������ڰ��������ˣ�");
					// ����Ϣ����ת����xml
					respXml = MessageUtil.messageToXml(textMessage);
					
					
					/**
					Article article = new Article();
					article.setTitle("2015���п�����������Ӿ��ѵ����ڶ��׶α�����");
					article.setDescription("������뱨��ҳ��");
					article.setPicUrl("http://v.yqcn.com/bmwj/asp/sst/images/logo.jpg");
					article.setUrl("http://www.yqrb.com.cn/yqvod/bmwj/asp/sst/ly.asp?openid="+fromUserName);
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// ����ͼ����Ϣ
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					**/
					
				}
				// ȡ������
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					// TODO �ݲ�������
					textMessage.setContent("���ã����´ν��Ź�ע����Ŷ��");
					// ����Ϣ����ת����xml
					respXml = MessageUtil.messageToXml(textMessage);
				}

			}
			// ���û�����Ϣʱ
			else {
				//textMessage.setContent("��ͨ���˵�ʹ�õ�������");
				textMessage.setContent("лл��ע��");
				respXml = MessageUtil.messageToXml(textMessage);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respXml;
	}
}
