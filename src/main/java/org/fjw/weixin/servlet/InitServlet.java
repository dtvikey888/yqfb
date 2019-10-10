package org.fjw.weixin.servlet;

import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import org.fjw.weixin.thread.TokenThread;  
import org.fjw.weixin.util.WeixinUtil;  
import org.slf4j.Logger;  
import org.slf4j.LoggerFactory;  
  
/** 
 *  
 * @author fjw 
 * @date 2015-04-18 
 */  
public class InitServlet extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
    private static Logger log = LoggerFactory.getLogger(WeixinUtil.class);  
  
    public void init() throws ServletException {  
        
        TokenThread.appid = getInitParameter("appid");  
        TokenThread.appsecret = getInitParameter("appsecret");  
  
        log.info("weixin api appid:{}", TokenThread.appid);  
        log.info("weixin api appsecret:{}", TokenThread.appsecret);  
  
        
        if ("".equals(TokenThread.appid) || "".equals(TokenThread.appsecret)) {  
            log.error("appid and appsecret configuration error, please check carefully.");  
        } else {  
            
            new Thread(new TokenThread()).start();
            
        }  
    }  
}  