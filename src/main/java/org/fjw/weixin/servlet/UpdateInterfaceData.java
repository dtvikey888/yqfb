package org.fjw.weixin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.fjw.weixin.thread.TokenThread;
import org.fjw.weixin.util.WeixinUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class UpdateInterfaceData extends HttpServlet {


	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private static Logger log = LoggerFactory.getLogger(WeixinUtil.class);


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);						//与doPost操作相同
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		TokenThread.appid = getInitParameter("appid");
		TokenThread.appsecret = getInitParameter("appsecret");

		log.info("weixin api appid:{}", TokenThread.appid);
		log.info("weixin api appsecret:{}", TokenThread.appsecret);


		if ("".equals(TokenThread.appid) || "".equals(TokenThread.appsecret)) {
			log.error("appid and appsecret configuration error, please check carefully.");
		} else {

			new Thread(new TokenThread()).start();
		}

		//设置返回文档类型
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		out.println("<script>history.back();window.location.href=document.referrer;</script>");
		//out.println("<script>history.back();window.location.href='mag_rwd.jsp?typeid="+typeid+"';</script>");

		out.flush();
		out.close();

	}


	public void init() throws ServletException {

	}

}