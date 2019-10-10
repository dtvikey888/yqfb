package org.liufeng.course.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fjw.weixin.util.AllValus;
import org.liufeng.course.pojo.SNSUserInfo;
import org.liufeng.course.pojo.WeixinOauth2Token;
import org.liufeng.course.util.AdvancedUtil;

/**
 * ��Ȩ��Ļص�������
 * 
 * @author liufeng
 * @date 2013-11-12
 * ������ַ
 * https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2foauthServlet&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect
 */
public class OAuthServlet5 extends HttpServlet {
	private static final long serialVersionUID = -1847238807216447030L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");

		// �û�ͬ����Ȩ���ܻ�ȡ��code
		String code = request.getParameter("code");

		// �û�ͬ����Ȩ
		if (!"authdeny".equals(code)) {
			
			// ��ȡ��ҳ��Ȩaccess_token
			//WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken("APPID", "APPSECRET", code);
			WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(AllValus.appid, AllValus.appsecret, code);
			
			// ��ҳ��Ȩ�ӿڷ���ƾ֤
			String accessToken = weixinOauth2Token.getAccessToken();
			// �û���ʶ
			String openId = weixinOauth2Token.getOpenId();
			// ��ȡ�û���Ϣ
			SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken, openId);

			// ����Ҫ���ݵĲ���
			request.setAttribute("snsUserInfo", snsUserInfo);
		}
		// ��ת��index.jsp
		request.getRequestDispatcher("whlt/index.jsp").forward(request, response);
	}
}
