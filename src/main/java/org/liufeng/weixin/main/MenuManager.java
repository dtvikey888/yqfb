package org.liufeng.weixin.main;

import org.fjw.weixin.util.AllValus;
import org.liufeng.course.menu.Button;
import org.liufeng.course.menu.ClickButton;
import org.liufeng.course.menu.ComplexButton;
import org.liufeng.course.menu.Menu;
import org.liufeng.course.menu.ToXcx;
import org.liufeng.course.menu.ViewButton;
import org.liufeng.course.pojo.Token;
import org.liufeng.course.util.CommonUtil;
import org.liufeng.course.util.MenuUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * �˵���������
 * 
 * @author liufeng
 * @date 2013-10-17
 */
public class MenuManager {
	public static Logger log = LoggerFactory.getLogger(MenuManager.class);

	/**
	 * ����˵��ṹ
	 * 
	 * @return
	 */
	public static Menu getMenu() {
		ViewButton btn11 = new ViewButton();
		btn11.setName("������Ч");
		btn11.setType("view");
		btn11.setUrl("http://wen.yqcn.com/wap/");

		
//		ViewButton btn21 = new ViewButton();
//		btn21.setName("��������");
//		btn21.setType("view");
//		btn21.setUrl("https://file762d99333146.iamh5.cn/v3/idea/wUKCxQVS?from=singlemessage&isappinstalled=0&suid=9ABB0F03-0038-44BC-A7F4-764C7A07A3A2&sl=1");

		
//		ViewButton btn21 = new ViewButton();
//		btn21.setName("�ֱ��");
//		btn21.setType("view");
//		btn21.setUrl("http://1011.hlsplay.aodianyun.com/mobile/program_live_channel_21590_copy.m3u8");
		
		ViewButton btn21 = new ViewButton();
		btn21.setName("2019�����Ļ���");
		btn21.setType("view");
		btn21.setUrl("https://file762d99333146.iamh5.cn/v3/idea/psEDU4DG");
		
		
		ViewButton btn22 = new ViewButton();
		btn22.setName("������Ч");
		btn22.setType("view");
		btn22.setUrl("http://wen.yqcn.com/");

		
		ViewButton btn23 = new ViewButton();
		btn23.setName("�ƹ���ƽ̨");
		btn23.setType("view");
		btn23.setUrl("http://zt1.yqcn.com/whlt/");
		
//		ViewButton btn23 = new ViewButton();
//		btn23.setName("�Ƽ��ɹ�");
//		btn23.setType("miniprogram");
//		btn23.setUrl("http://www.shangxunapp.com/");
		
		
		ToXcx xcxBtn1 = new ToXcx();
		xcxBtn1.setName("�Ƽ��ɹ�");
		xcxBtn1.setType("miniprogram");
		xcxBtn1.setUrl("http://www.shangxunapp.com/");
		xcxBtn1.setAppid("wx03c88babaf6767ed");
		xcxBtn1.setPagepath("pages/achi/achi");
		
//		ViewButton btn24 = new ViewButton();
//		btn24.setName("����ʵ��");
//		btn24.setType("view");
//		btn24.setUrl("http://xadmin.yqcn.com/zjxm/");
		
//		ViewButton btn25 = new ViewButton();
//		btn25.setName("�������ֱ��");
//		btn25.setType("view");
//		btn25.setUrl("http://wzqmt.tw.live.hoge.cn/share/15iacybUUbRoeA0MgQ.shtml?_hgOutLink=tuwenol/tuwenoldetail&id=18335");
		
//		ViewButton btn25 = new ViewButton();
//		btn25.setName("����������");
//		btn25.setType("view");
//		btn25.setUrl("https://www.wjx.top/jq/43176712.aspx");


		/**
		ViewButton btn31 = new ViewButton();
		btn31.setName("����");
		btn31.setType("view");
		btn31.setUrl("http://m.kuaidi100.com/");

		ViewButton btn32 = new ViewButton();
		btn32.setName("������");
		btn32.setType("view");
		btn32.setUrl("http://m.3gv.ifeng.com/weather/guonei//iweather.f?vt=5&citycode=101210707&mid=7oavBS");
		
		*/
		
		ViewButton btn31 = new ViewButton();
		btn31.setName("��֤40��");
		btn31.setType("view");
		btn31.setUrl("https://zj.zjol.com.cn/subject.html?id=1023951&from=singlemessage&isappinstalled=0");
		
		
		ViewButton btn32 = new ViewButton();
		btn32.setName("��Խʱ��");
		btn32.setType("view");
		btn32.setUrl("http://xadmin.yqcn.com/ggkf/wap/index.php?from=singlemessage&isappinstalled=0");
		
		ViewButton btn33 = new ViewButton();
		btn33.setName("Υ����ѯ");
		btn33.setType("view");
		btn33.setUrl("http://zz.wzsjj.cn:6088/zscg/wz_wap/vehQuery.do?clpt=weixin&from=singlemessage&isappinstalled=0");
		
		ViewButton btn34 = new ViewButton();
		btn34.setName("�鹫����");
		btn34.setType("view");
		btn34.setUrl("http://m.yqbus.cn/WeixinMP/WMPWeb/MPages/BM.GJ.ShiShiGJ/XianLuQuery.aspx");
		
		ViewButton btn35 = new ViewButton();
		btn35.setName("·����ѯ");
		btn35.setType("view");
		btn35.setUrl("http://node.wenzhousoft.cn/cloudvideo.html");
		
		ViewButton btn36 = new ViewButton();
		btn36.setName("����ֱ��");
		btn36.setType("view");
		btn36.setUrl("http://1011.hlsplay.aodianyun.com/mobile/program_live_channel_20569_copy.m3u8");
		
		ViewButton btn37 = new ViewButton();
		btn37.setName("����ר��");
		btn37.setType("view");
		btn37.setUrl("https://zj.zjol.com.cn/subject.html?id=1121554");

//		ComplexButton mainBtn1 = new ComplexButton();
//		mainBtn1.setName("������Ч");
//		mainBtn1.setSub_button(new Button[] { btn11});
		
		ViewButton mainBtn1 = new ViewButton();
		mainBtn1.setName("����г���æɶ");
		mainBtn1.setType("view");
		//mainBtn1.setUrl("https://zj.zjol.com.cn/subject.html?id=867086&from=singlemessage");
		mainBtn1.setUrl("https://zj.zjol.com.cn/subject.html?id=1110400");
		
		ComplexButton mainBtn2 = new ComplexButton();
		mainBtn2.setName("����ƽ̨");
		mainBtn2.setSub_button(new Button[] { btn21,btn22,btn23,xcxBtn1 });
		
//		ViewButton mainBtn2 = new ViewButton();
//		mainBtn2.setName("����+");
//		mainBtn2.setType("view");
//		mainBtn2.setUrl("http://ios.lifeyk.com/download/yueqing.html#rd");

		
//		ViewButton mainBtn3 = new ViewButton();
//		mainBtn3.setName("����ֱ��");
//		mainBtn3.setType("view");
//		mainBtn3.setUrl("https://zj.zjol.com.cn/news.html?id=853010&from=singlemessage");

//
		ComplexButton mainBtn3 = new ComplexButton();
		mainBtn3.setName("�������");
		mainBtn3.setSub_button(new Button[] { btn31, btn32, btn33, btn34, btn35 });
		
//		ComplexButton mainBtn3 = new ComplexButton();
//		mainBtn3.setName("���Ქ��");
//		mainBtn3.setSub_button(new Button[] { btn36, btn37 });
		
//		ViewButton mainBtn3 = new ViewButton();
//		mainBtn3.setName("���ƽ�ʦֱ��");
//		mainBtn3.setType("view");
//		mainBtn3.setUrl("http://www.yqbtv.cn/index.php?s=/Mobile/Index/live/l_id/150.html");


		Menu menu = new Menu();
		menu.setButton(new Button[] { mainBtn1, mainBtn2, mainBtn3 });

		return menu;
	}

	public static void main(String[] args) {
	
		
//		// �������û�Ψһƾ֤
		String appId = AllValus.appid;
//		// �������û�Ψһƾ֤��Կ0
		String appSecret = AllValus.appsecret;

		
		// ���ýӿڻ�ȡƾ֤
		Token token = CommonUtil.getToken(appId, appSecret);
		
		

		//ɾ���˵�
		System.out.println(MenuUtil.deleteMenu(token.getAccessToken()));

		if (null != token) {
			// �����˵�
			boolean result = MenuUtil.createMenu(getMenu(), token.getAccessToken());

			// �жϲ˵��������
			if (result)
				log.info("�˵������ɹ���");
			else
				log.info("�˵�����ʧ�ܣ�");
		}
	}
}
