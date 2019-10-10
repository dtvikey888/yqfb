package org.fjw.weixin.thread;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

import org.fjw.weixin.pojo.AccessToken;
import org.fjw.weixin.pojo.JsapiTicket;
import org.fjw.weixin.util.AllValus;
import org.fjw.weixin.util.MysqlDB;
import org.fjw.weixin.util.WeixinUtil;
import org.fjw.weixin.util.sql_data;
import org.liufeng.course.pojo.Token;
import org.liufeng.course.util.AdvancedUtil;
import org.liufeng.course.util.CommonUtil;
import org.liufeng.course.util.TimeString;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author fjw
 * @date 2015-03-16 
 */
public class TokenThread implements Runnable {
    private static Logger log = LoggerFactory.getLogger(TokenThread.class);

    public static String appid = AllValus.appid;

    public static String appsecret = AllValus.appsecret;
    public static Token accessToken = null;
    public static JsapiTicket jsapiTicket = null;


    /*
     *
     * ccessTokent
     *  jsapi_ticket
     *
     */

    public void run() {
        while (true) {
            try {

                accessToken = CommonUtil.getToken(AllValus.appid, AllValus.appsecret);


                jsapiTicket = WeixinUtil.getJsapiTicket(accessToken.getAccessToken());

                // System.out.println("accessToken= "+accessToken.getToken());

                // 将 accessToken 写入数据库

                try {
                    MysqlDB db = new MysqlDB();
                    String sql = "select * from wx_bc where memo='"+AllValus.memo+"'";
                    ResultSet rs = db.executeQuery(sql);
                    String sql2="";

                    if (rs.next()) {

                        sql2="update wx_bc set accessToken='"+accessToken.getAccessToken()+"',jsapiTicket='"+jsapiTicket.getTicket()+"',fbsj='"+TimeString.nowTime()+"' where memo='"+AllValus.memo+"' ";

                        db.executeUpdate(sql2);
                    }else{

                        sql2="insert into wx_bc(accessToken,jsapiTicket,memo,fbsj) values('"+accessToken.getAccessToken()+"','"+jsapiTicket.getTicket()+"','"+AllValus.memo+"','"+TimeString.nowTime()+"')";
                        db.executeInsert(sql2);
                    }

                    System.out.println(sql2);

                    //2.写入数据统计接口数据库
//					AdvancedUtil adu = new AdvancedUtil();
//					adu.idb_getUserSummary(accessToken.getAccessToken(),TimeString.GetnowTimeYMD2(),TimeString.GetnowTimeYMD2());  //最大时间跨度 7  昨天
//					adu.idb_getUserCumulate(accessToken.getAccessToken(),TimeString.GetnowTimeYMD2(),TimeString.GetnowTimeYMD2()); //最大时间跨度 7  昨天
//					adu.idb_getArticleSummary(accessToken.getAccessToken(),TimeString.GetnowTimeYMD2(),TimeString.GetnowTimeYMD2()); //最大时间跨度 1 昨天
//					adu.idb_getArticleTotal(accessToken.getAccessToken(),TimeString.GetnowTimeYMD2(),TimeString.GetnowTimeYMD2());//最大时间跨度 1    昨天
//					adu.idb_getArticleTotal(accessToken.getAccessToken(),TimeString.GetnowTimeYMD3(),TimeString.GetnowTimeYMD3());//最大时间跨度 1    前天
//					adu.idb_getUserRead(accessToken.getAccessToken(),TimeString.GetnowTimeYMD2(),TimeString.GetnowTimeYMD2()); //最大时间跨度 3       昨天
//					adu.idb_getUserReadHour(accessToken.getAccessToken(),TimeString.GetnowTimeYMD2(),TimeString.GetnowTimeYMD2()); //最大时间跨度 1   昨天
//					adu.idb_getUserShare(accessToken.getAccessToken(),TimeString.GetnowTimeYMD2(),TimeString.GetnowTimeYMD2()); //最大时间跨度 7      昨天
//					adu.idb_getUserShareHour(accessToken.getAccessToken(),TimeString.GetnowTimeYMD2(),TimeString.GetnowTimeYMD2()); //最大时间跨度 1  昨天

//					adu.idb_getWeixincommentList(accessToken.getAccessToken(),"2651523274_3",0,0,20,0); //查看指定文章的评论数据（新增接口）

                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }


                if (null != accessToken) {

                    log.info("access_token token:{}", accessToken.getExpiresIn(), accessToken.getAccessToken());
                    log.info("jsapi_ticket ticket:{}", jsapiTicket.getExpiresIn(), jsapiTicket.getTicket());

                    // 7000

                    Thread.sleep((accessToken.getExpiresIn() - 200) * 1000);


                } else {

                    Thread.sleep(60 * 1000);

                }

            } catch (InterruptedException e) {
                try {
                    Thread.sleep(60 * 1000);
                } catch (InterruptedException e1) {
                    log.error("{}", e1);
                }
                log.error("{}", e);
            }
        }
    }
}  