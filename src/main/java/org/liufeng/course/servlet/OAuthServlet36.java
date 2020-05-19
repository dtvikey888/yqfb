package org.liufeng.course.servlet;

import org.fjw.weixin.util.AllValus;
import org.fjw.weixin.yy.WeixinChaOpenId;
import org.liufeng.course.pojo.WeixinOauth2Token;
import org.liufeng.course.pojo.WeixinUserInfo;
import org.liufeng.course.util.AdvancedUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 授权后的回调请求处理
 *
 * @author liufeng
 * @date 2013-11-12
 * 授期网址
 * https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2foauthServlet&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect
 */
public class OAuthServlet36 extends HttpServlet {
	private static final long serialVersionUID = -1847238807216447030L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");

		// 用户同意授权后，能获取到code
		String code = request.getParameter("code");
		System.out.println("OAuthServlet36.doGet() code= "+code);

		// 用户同意授权
		if (!"authdeny".equals(code)) {

			// 获取网页授权access_token
			//WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken("APPID", "APPSECRET", code);

			WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(AllValus.appid, AllValus.appsecret, code);


			// 网页授权接口访问凭证
			//String accessToken = weixinOauth2Token.getAccessToken();
			// 用户标识
			String openId = weixinOauth2Token.getOpenId();

			//以snsapi_userinfo为scope发起的网页授权
			// 获取用户信息
			//SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken, openId);

			//以snsapi_base为scope发起的网页授权
			//数据库保存的accessToken
			String accTok2=WeixinChaOpenId.GetDBAccessToken(AllValus.memo);

			WeixinUserInfo snsUserInfo = AdvancedUtil.getUserInfo(accTok2, openId);

			// 设置要传递的参数
			request.setAttribute("snsUserInfo", snsUserInfo);
		}
		// 跳转到index.jsp
		request.getRequestDispatcher("bl8/hd.jsp").forward(request, response);
	}
}