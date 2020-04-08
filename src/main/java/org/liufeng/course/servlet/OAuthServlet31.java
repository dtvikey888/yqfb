package org.liufeng.course.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fjw.weixin.util.AllValus;
import org.fjw.weixin.util.JsonUtil;
import org.liufeng.course.pojo.MyUserInfo;
import org.liufeng.course.pojo.SNSUserInfo;
import org.liufeng.course.pojo.WeixinOauth2Token;
import org.liufeng.course.util.AdvancedUtil;

/**
 * 授权后的回调请求处理
 *
 * @author liufeng
 * @date 2013-11-12
 * 授期网址
 * https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx86facd0a863aca12&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqfb%2foauthServlet&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect
 */
public class OAuthServlet31 extends HttpServlet {
	private static final long serialVersionUID = -1847238807216447030L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");

		// 用户同意授权后，能获取到code
		String code = request.getParameter("code");
		System.out.println("code: "+code);


		// 用户同意授权
		if (!"authdeny".equals(code)) {

			// 获取网页授权access_token
			//WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken("APPID", "APPSECRET", code);
			//WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(AllValus.appid, AllValus.appsecret, code);

			// 网页授权接口访问凭证
			//String accessToken = weixinOauth2Token.getAccessToken();
			// 用户标识
			//String openId = weixinOauth2Token.getOpenId();


			// 获取用户信息
			//SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken, openId);

			//获取用户信息 snsapi_userinfo 使用     需用户授权
			String snsUserInfoUrl = "http://kzgl.yueqing.gov.cn/mywx/port/getUserInfo.do?code="+code;

//			System.out.println(snsUserInfo);
			String snsUserInfoJsonString = JsonUtil.getjson(snsUserInfoUrl);
			System.out.println("获取用户信息 snsapi_userinfo 使用: "+snsUserInfoJsonString);
			MyUserInfo myUserInfo = JsonUtil.getMyUserInfo(snsUserInfoJsonString);
			System.out.println(myUserInfo.getOpenid());
			System.out.println(myUserInfo.getCity());
			System.out.println(myUserInfo.getProvince());
			System.out.println(myUserInfo.getHeadimgurl());
			System.out.println(myUserInfo.getGender());
			System.out.println(myUserInfo.getCode());
			System.out.println(myUserInfo.getNickname());
			System.out.println(myUserInfo.getCountry());

			// 设置要传递的参数
			request.setAttribute("snsUserInfo", myUserInfo);



		}
		// 跳转到index.jsp
		request.getRequestDispatcher("bl2/hd.jsp").forward(request, response);

	}
}
