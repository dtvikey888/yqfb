package org.liufeng.course.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fjw.weixin.util.AllValus;
import org.fjw.weixin.util.PublicFun;
import org.liufeng.course.pojo.SNSUserInfo;
import org.liufeng.course.pojo.WeixinOauth2Token;
import org.liufeng.course.util.AdvancedUtil;

/**
 * 授权后的回调请求处理
 *
 * @author liufeng
 * @date 2013-11-12
 * 授期网址
 * https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx03c461977443af41&redirect_uri=http%3a%2f%2fwww.yqrb.com.cn%2fyqzgh%2foauthServlet&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect
 */
public class OAuthServlet7 extends HttpServlet {
	private static final long serialVersionUID = -1847238807216447030L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");

		// 用户同意授权后，能获取到code
		String code = request.getParameter("code");

		String bzlopenid = request.getParameter("bzlopenid");

		String state = request.getParameter("state");

		String temp[] = PublicFun.split(state, "|");


		System.out.println("被助力者的 bzlopeind : "+bzlopenid);
		System.out.println("state : "+state);






		// 用户同意授权
		if (!"authdeny".equals(code)) {

			// 获取网页授权access_token
			//WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken("APPID", "APPSECRET", code);
			WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(AllValus.appid, AllValus.appsecret, code);

			// 网页授权接口访问凭证
			String accessToken = weixinOauth2Token.getAccessToken();
			// 用户标识
			String openId = weixinOauth2Token.getOpenId();
			// 获取用户信息
			SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken, openId);


			// 设置要传递的参数
			request.setAttribute("snsUserInfo", snsUserInfo);
		}
		// 跳转到index.jsp
		request.getRequestDispatcher("qm/hd.jsp?bzlopenid="+temp[0]+"&px="+temp[1]+"").forward(request, response);
	}
}