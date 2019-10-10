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
 * 核心服务类
 * 
 * @author fjw
 * @date 2015-03-18
 */
public class CoreService {

	public static String processRequest(HttpServletRequest request) {
		
		
		/**
		 * 处理微信发来的请求
		 * 
		 * @param request
		 * @return xml
		 */
		
		// xml格式的消息数据
		String respXml = null;
		try {
			// 调用parseXml方法解析请求消息
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			// 发送方帐号
			String fromUserName = requestMap.get("FromUserName");
			
			System.out.println("CoreService来自用户:"+fromUserName);
			
			// 开发者微信号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");
			
			//接收用户发送的文本消息内容
			String content = requestMap.get("Content");
			
			//接收用户发送的图片信息 MediaId
			String MediaId = requestMap.get("MediaId");
	
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
//			System.out.println("MediaId: "+MediaId);
		
			//首先将关注者写入sxbook_openid数据库
			WeixinChaOpenId.chaOpenId2(fromUserName);

			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			
			// 文本消息
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				//respContent = "您发送的是文本消息！";
				if("创跑乐清".equals(content)){
					
					Article article = new Article();
					article.setTitle("用脚步写出\"改革开放四十周年\"赢礼品");
					article.setDescription("以“创意步行 晒轨迹图”为主要方式，通过跑步软件写出“改革开放四十周年”任意一个字即有机会获得礼品，凑齐八个字更有豪礼相送。");
					article.setPicUrl("http://info.yqcn.com/otherimg/run.png");
					article.setUrl("https://file762d99333146.iamh5.cn/v3/idea/wUKCxQVS?from=singlemessage&isappinstalled=0&suid=9ABB0F03-0038-44BC-A7F4-764C7A07A3A2&sl=1");
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// 创建图文消息
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					
					
				}else if("笑脸".equals(content)){
					
					//textMessage.setContent("请发送活动消息的朋友圈截图，方可参与预约报名，参加书券抽奖。");
					//respXml = MessageUtil.messageToXml(textMessage);
					textMessage.setContent("活动完成，谢谢！");
					respXml = MessageUtil.messageToXml(textMessage);
					/**
					Article article = new Article();
					article.setTitle("与笑有关的好事都在了！约吗？");
					article.setDescription("点击进入");
					article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo5.jpg");
					article.setUrl("http://www.yqrb.com.cn/yqfb/index.jsp?openid="+fromUserName);
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// 创建图文消息
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					**/
					
				}else if("有礼".equals(content)){
					
					textMessage.setContent("活动完成，谢谢！");
					respXml = MessageUtil.messageToXml(textMessage);
					
					/**
					Article article = new Article();
					article.setTitle("有礼");
					article.setDescription("点击进入");
					article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo17.jpg");
					article.setUrl("http://www.yqrb.com.cn/yqfb/xm/dl.jsp?openid="+fromUserName);
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// 创建图文消息
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					**/
					
				}else if("高考".equals(content)){
					//textMessage.setContent("活动完成，谢谢！");
					//respXml = MessageUtil.messageToXml(textMessage);
					
					Article article = new Article();
					article.setTitle("高考志愿填报公益讲座报名入口");
					article.setDescription("点击进入");
					article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo11.jpg");
					article.setUrl("http://www.yqrb.com.cn/yqfb/gk/dl.jsp?openid="+fromUserName);
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// 创建图文消息
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					
				}else if("治堵".equals(content)){
					textMessage.setContent("活动完成，谢谢！");
					respXml = MessageUtil.messageToXml(textMessage);
					/**
					Article article = new Article();
					article.setTitle("乐清市治理交通拥堵满意度问卷调查");
					article.setDescription("1、选项提交后，请填写姓名和手机号码参加幸运抽奖！\n2、调查时间：12月2日至12月8日。\n3、本次调查设：20元(150份)、50元(30份)、100元(5份)等话费奖励。");
					article.setPicUrl("http://xadmin.yqcn.com/weixin/test/TOP700px.jpg");
					article.setUrl("http://zt1.yqcn.com/active/zdb/index.asp");
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// 创建图文消息
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					*/
				}else if("随手拍".equals(content)){
					
					//textMessage.setContent("请发送活动消息的朋友圈截图，方可参与预约报名，参加书券抽奖。");
					//respXml = MessageUtil.messageToXml(textMessage);
					textMessage.setContent("活动完成，谢谢！");
					respXml = MessageUtil.messageToXml(textMessage);
					/**
					Article article = new Article();
					article.setTitle("随手拍下不文明，百元话费悬赏曝光照。");
					article.setDescription("点击进入");
					article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo22.png");
					article.setUrl("http://www.yqrb.com.cn/yqfb/ssp/index.jsp?openid="+fromUserName);
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// 创建图文消息
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
					
					textMessage.setContent("活动完成，谢谢！");
					respXml = MessageUtil.messageToXml(textMessage);
					/**
					Article article = new Article();
					
					article.setTitle("“我承诺、我行动——文明有礼我先行”网络签名活动");
					article.setDescription("为迎接G20峰会，做文明有礼浙江人，乐清市文明办（联创办）和乐清日报社联合举办“我承诺、我行动——文明有礼我先行”网络签名活动，邀请大家一起行动，共建文明乐清。");
					article.setPicUrl("http://xadmin.yqcn.com/weixin/2016/wmyl/img/wx.jpg");
					article.setUrl("http://xadmin.yqcn.com/weixin/2016/wmyl/");

					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);

					// 创建单图文消息 
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
					
					article.setTitle("乐清市生态环境整治变脸大PK");
					article.setDescription("4000多个中奖名额，15000元话费等你来");
					article.setPicUrl("http://www.yqrb.com.cn/yqvod/bmwj/asp/h5/gt25/IMG/IMG_TOP.jpg");
					article.setUrl("http://www.yqrb.com.cn/yqvod/bmwj/asp/h5/gt25/index.asp?openid="+fromUserName);

					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);

					// 创建单图文消息 
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
					**/
					
					textMessage.setContent("此活动将于今晚开始，敬请关注！");
					respXml = MessageUtil.messageToXml(textMessage);
					
					
				}else if("变脸".equals(content)){
					
				
					
					Article article = new Article();
					
					article.setTitle("乐清市生态环境整治变脸大PK");
					article.setDescription("4000多个中奖名额，15000元话费等你来拿");
					article.setPicUrl("http://www.yqrb.com.cn/yqvod/bmwj/asp/h5/gt25/IMG/IMG_TOP.jpg");
					article.setUrl("http://www.yqrb.com.cn/yqvod/bmwj/asp/h5/gt25/index.asp?openid="+fromUserName);

					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);

					// 创建单图文消息 
					NewsMessage newsMessage = new NewsMessage();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(new Date().getTime());
					newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsMessage.setArticleCount(articleList.size());
					newsMessage.setArticles(articleList);
					respXml = MessageUtil.messageToXml(newsMessage);
	
					
				}else if("节俭养德".equals(content)){

					Article article = new Article();
					
					article.setTitle("光盘大作战，免费赢话费！");
					article.setDescription("3500元移动话费免费拿，手慢无！");
					article.setPicUrl("http://www.yqrb.com.cn/yqvod/bmwj/asp/sxbook/images/gp06.png");
					article.setUrl("http://www.yqrb.com.cn/yqfb/jsk/wel.jsp?openid="+fromUserName);

					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);

					// 创建单图文消息 
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
					
					textMessage.setContent("谢谢！");
					respXml = MessageUtil.messageToXml(textMessage);

					/**
					//对话框输入姓名/手机号
					//返回
					//1.不存在该编号(提示先发送截图)
					//2.已经抽过奖(弹出文字)
					//3.输入(更新)成功（弹出窗口入口）
					//4.输入格式不正确 
					//5.活动已经结束,感谢关注！
					//6.活动还没开始呢
					//7.电话号码已经存在，同一个号码不能参加
				    int tp = MyUtils6.Tp(fromUserName, content);
				    if (tp==1) {
						//1 不存在该编号
				    	textMessage.setContent("请先发送截图！");
						respXml = MessageUtil.messageToXml(textMessage);
				    }else if (tp==2) {
						//2.已经抽过奖
						textMessage.setContent("您已经参加过活动！");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if (tp==3) {
						//3.输入(更新)成功（弹出活动入口窗口）
						Article article = new Article();
						article.setTitle("乐清网络问效平台上线两周年 注册有好礼");
						article.setDescription("点击进入活动");
						article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo10.jpg");
						article.setUrl("http://www.yqrb.com.cn/yqfb/usb/cj_chk.jsp?openid="+fromUserName);
						List<Article> articleList = new ArrayList<Article>();
						articleList.add(article);
						// 创建图文消息
						NewsMessage newsMessage = new NewsMessage();
						newsMessage.setToUserName(fromUserName);
						newsMessage.setFromUserName(toUserName);
						newsMessage.setCreateTime(new Date().getTime());
						newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
						newsMessage.setArticleCount(articleList.size());
						newsMessage.setArticles(articleList);
						respXml = MessageUtil.messageToXml(newsMessage);
					}else if (tp==4) {
						// 4.输入格式不正确
						textMessage.setContent("格式输入不正确,正确格式应该是 姓名/手机号码");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if (tp==5) {
						// 5.活动已经结束
						//textMessage.setContent("活动已经结束,感谢关注！");
						textMessage.setContent("你终于来了，小布在此等你很久很久……");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if (tp==6) {
						// 6.活动还没开始呢
						textMessage.setContent("活动还没开始呢！");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if(tp==7){
						// 7.不能重复活动
						textMessage.setContent("电话号码已经存在，同一个号码不能参加");
						respXml = MessageUtil.messageToXml(textMessage);
					}
					/** 笑脸投票隐藏先
					int tp = MyUtils3.Tp(fromUserName, content);
					if (tp==1) {
						//1 不存在该编号
						textMessage.setContent("不存在该编号！");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if (tp==2) {
						//2.已经投过票 
						textMessage.setContent("您已经投过票！");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if(tp==3){
						//3.投票成功
						//textMessage.setContent("投票成功！");
						//respXml = MessageUtil.messageToXml(textMessage);
						//然后弹出抽奖
						/*
						Article article = new Article();
						article.setTitle("投票成功,试试运气抽100元新华书店书券");
						article.setDescription("点击进入");
						article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg");
						article.setUrl("http://www.yqrb.com.cn/yqfb/tp/cj.jsp?openid="+fromUserName);
						List<Article> articleList = new ArrayList<Article>();
						articleList.add(article);
						// 创建图文消息
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
						textMessage.setContent("投票已经结束,感谢关注！");
						respXml = MessageUtil.messageToXml(textMessage);
						
					}else if (tp==4) {
						// 4.输入格式不正确
						textMessage.setContent("格式输入不正确,正确格式应该是 姓名/手机号码/参赛序号！");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if (tp==5) {
						// 5.投票已经结束
						textMessage.setContent("投票已经结束,感谢关注！");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if (tp==6) {
						// 6.投票还没开始呢
						textMessage.setContent("投票还没开始呢！");
						respXml = MessageUtil.messageToXml(textMessage);
					}else if(tp==7){
						// 7.不能重复投票
						textMessage.setContent("该电话号码已经投过票，不能重复投票！");
						respXml = MessageUtil.messageToXml(textMessage);
					}
					*/
				}

			}
			
			
			// 图片消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
//				textMessage.setContent("您发送的是图片消息！");
//				respXml = MessageUtil.messageToXml(textMessage);
				

				/**
				 * 只让他们发一次图片 ，否则几万张 服务器吃不消
				 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 sxbook_bmcj  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 ）
				 */
				
				textMessage.setContent("谢谢！");
				respXml = MessageUtil.messageToXml(textMessage);
				/**
				WeixinChaOpenId.ReImgesToDB2(MediaId, fromUserName);
				
				//图片传好后给他们个提示 图片成功上传 ，现在请 输入格式"姓名/手机号"
				textMessage.setContent("图片成功上传 ，现在请 输入格式 \"姓名/手机号\" 参加活动");
				respXml = MessageUtil.messageToXml(textMessage);
				*/
				
			}
			
			
//			// 图片消息
//			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
////				textMessage.setContent("您发送的是图片消息！");
////				respXml = MessageUtil.messageToXml(textMessage);
//				
//
//				/**
//				 * 只让他们发一次图片 ，否则几万张 服务器吃不消
//				 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 sxbook_bmcj  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 ）
//				 */
//				
//				//WeixinChaOpenId.ReImgesToDB(MediaId, fromUserName);
//				
//				
//				Article article = new Article();
//				
//				article.setTitle("\"旧书相亲会\"预约报名入口");
//				article.setDescription("点击进入预约报名页面");
//				article.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo3.jpg");
//				article.setUrl("http://www.yqrb.com.cn/sxyqwx/index.jsp?openid="+fromUserName);
//				
//				Article article2 = new Article();
//				
//				article2.setTitle("\"旧书相亲会\"抽奖入口");
//				article2.setDescription("点击进入抽奖页面");
//				article2.setPicUrl("http://v.yqcn.com/bmwj/asp/sxbook/images/logo2.jpg");
//				article2.setUrl("http://www.yqrb.com.cn/sxyqwx/cj.jsp?openid="+fromUserName);	
//
//				List<Article> articleList = new ArrayList<Article>();
//				articleList.add(article);
//				articleList.add(article2);
//				// 创建单图文消息 
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
			// 事件推送
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				// 事件类型
				String eventType = requestMap.get("Event");
				// 订阅
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					
					
					// * 关注回复
					textMessage.setContent("盼星星盼月亮，终于把你盼来了！");
					// 将消息对象转换成xml
					respXml = MessageUtil.messageToXml(textMessage);
					
					
					/**
					Article article = new Article();
					article.setTitle("2015年中考体育公益游泳培训活动（第二阶段报名）");
					article.setDescription("点击进入报名页面");
					article.setPicUrl("http://v.yqcn.com/bmwj/asp/sst/images/logo.jpg");
					article.setUrl("http://www.yqrb.com.cn/yqvod/bmwj/asp/sst/ly.asp?openid="+fromUserName);
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					// 创建图文消息
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
				// 取消订阅
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					// TODO 暂不做处理
					textMessage.setContent("您好，请下次接着关注我们哦！");
					// 将消息对象转换成xml
					respXml = MessageUtil.messageToXml(textMessage);
				}

			}
			// 当用户发消息时
			else {
				//textMessage.setContent("请通过菜单使用导航服务！");
				textMessage.setContent("谢谢关注！");
				respXml = MessageUtil.messageToXml(textMessage);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respXml;
	}
}
