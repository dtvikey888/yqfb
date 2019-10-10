package com.component;
import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fjw.weixin.util.AllValus;
import org.fjw.weixin.yy.WeixinChaOpenId;
import com.utils.GetWxOrderno;
import com.utils.RequestHandler;
import com.utils.Sha1Util;
import com.utils.TenpayUtil;
/**
 * @Author: dtvikey
 * @Date: 09/10/19 下午 04:38
 * @Version 1.0
 */

public class Topay extends HttpServlet {


    /**
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck(String openid) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";//看清楚.这是ticket..用token在https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url="http://tbpad.yqrb.cn/yqfb/index.jsp?openid="+openid+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp //微信个傻逼..这里的timestamp是小写~~
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }


    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck2() {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";//看清楚.这是ticket..用token在https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url="http://tbpad.yqrb.cn/yqfb/err.jsp";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp //微信个傻逼..这里的timestamp是小写~~
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }

    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck3(String urlname) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";//看清楚.这是ticket..用token在https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url=AllValus.propath+urlname+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp //微信个傻逼..这里的timestamp是小写~~
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }

    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck4(String urlname,String openid) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";
        //看清楚.这是ticket..
        //用token在 https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的

        //         https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi
        // $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$AppID.'&secret='.$AppSecret;
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url=AllValus.propath+urlname+"?openid="+openid+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }

    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck42(String urlname,String openid,int id) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";
        //看清楚.这是ticket..
        //用token在 https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的

        //         https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi
        // $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$AppID.'&secret='.$AppSecret;
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url=AllValus.propath+urlname+"?openid="+openid+"&id="+id+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }

    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck43(String urlname,String openid,String id) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";
        //看清楚.这是ticket..
        //用token在 https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的

        //         https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi
        // $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$AppID.'&secret='.$AppSecret;
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url=AllValus.propath+urlname+"?openid="+openid+"&id="+id+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }


    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck44(String urlname,String openid,String id) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";
        //看清楚.这是ticket..
        //用token在 https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的

        //         https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi
        // $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$AppID.'&secret='.$AppSecret;
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url=AllValus.propath+urlname+"?bzlopenid="+openid+"&id="+id+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        System.out.println("wx44-url: "+url);
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }


    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck45(String urlname,String openid,String id,String from) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";
        //看清楚.这是ticket..
        //用token在 https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的

        //         https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi
        // $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$AppID.'&secret='.$AppSecret;
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url=AllValus.propath+urlname+"?bzlopenid="+openid+"&id="+id+"&from="+from+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        System.out.println("wx44-url: "+url);
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }



    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck46(String urlname,String openid,int lb) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";
        //看清楚.这是ticket..
        //用token在 https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的

        //         https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi
        // $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$AppID.'&secret='.$AppSecret;
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url=AllValus.propath+urlname+"?openid="+openid+"&lb="+lb+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        System.out.println("wx44-url: "+url);
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }

    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck48(String urlname,String openid,int lb,String from) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";
        //看清楚.这是ticket..
        //用token在 https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的

        //         https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi
        // $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$AppID.'&secret='.$AppSecret;
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url=AllValus.propath+urlname+"?openid="+openid+"&lb="+lb+"&from="+from+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        System.out.println("wx44-url: "+url);
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }


    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck47(String urlname,String openid,String from) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";
        //看清楚.这是ticket..
        //用token在 https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的

        //         https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi
        // $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$AppID.'&secret='.$AppSecret;
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url=AllValus.propath+urlname+"?openid="+openid+"&from="+from+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        System.out.println("wx44-url: "+url);
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }


    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck48(String urlname,String openid,String from) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";
        //看清楚.这是ticket..
        //用token在 https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的

        //         https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi
        // $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$AppID.'&secret='.$AppSecret;
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url=AllValus.propath+urlname+"?openid="+openid+"&from="+from+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        System.out.println("wx44-url: "+url);
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }

    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck50(String urlname,int lb) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";
        //看清楚.这是ticket..
        //用token在 https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的

        //         https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi
        // $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$AppID.'&secret='.$AppSecret;
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url=AllValus.propath+urlname+"?lb="+lb+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        System.out.println("wx44-url: "+url);
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }





    /**
     * 获取JSAPI签名
     *
     * @throws NoSuchProviderException
     * @throws NoSuchAlgorithmException
     * @throws KeyManagementException
     */
    public static String WxJsApiCheck5(String urlname,String openid,String zsm) {


        //	String jsapi_ticket = TokenThread.jsapiTicket.getTicket();
        String jsapi_ticket = WeixinChaOpenId.GetDBJsapiTicket(AllValus.memo);
        //String jsapi_ticket ="sM4AOVdWfPE4DxkXGEs8VMbzBFvLPK5SomgRyYBFaPmVn1beFCAL7JjM19ik45_EEN4dhK8GNECiwzepBzsEUA";//看清楚.这是ticket..用token在https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi里换的
        String nonce_str = Sha1Util.getNonceStr();// 随机字符串
        String timestamp = Sha1Util.getTimeStamp();// 时间戳
        String appid = AllValus.appid;//APPID
        String url=AllValus.propath+urlname+"?openid="+openid+"&zsm="+zsm+"";//发起支付的前端页面的URL地址.而且...而且必须在微信支付里面配置才行!!!
        String sign = null;
        try {
            SortedMap<String, String> packageParams = new TreeMap<String, String>();
            packageParams.put("jsapi_ticket", jsapi_ticket);
            packageParams.put("noncestr", nonce_str);
            packageParams.put("timestamp", timestamp);
            packageParams.put("url", url);
            sign = Sha1Util.createSHA1Sign(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String res="appId : \"" + appid + "\",timestamp : \"" + timestamp //微信个傻逼..这里的timestamp是小写~~
                + "\", nonceStr : \"" + nonce_str
                + "\", signature : \"" + sign + "\"";
        return res;
    }


    public static String dopay() {

        // 网页授权后获取传递的参数
        String orderNo = "123121111153453235";
        // String money = "0.01";
        // 金额转化为分为单位
        // float sessionmoney = Float.parseFloat(money);
        // String finalmoney = String.format("%.2f", sessionmoney);
        // finalmoney = finalmoney.replace(".", "");

        // 商户相关资料
        String appid = "";
        String appsecret = "";
        String mch_id = "";//邮件里的MCHID
        String partnerkey = "";//在微信商户平台pay.weixin.com里自己生成的那个key

        String openId = "";//用oath授权得到的openid

        // 获取openId后调用统一支付接口https://api.mch.weixin.qq.com/pay/unifiedorder
        String currTime = TenpayUtil.getCurrTime();
        // 8位日期
        String strTime = currTime.substring(8, currTime.length());
        // 四位随机数
        String strRandom = TenpayUtil.buildRandom(4) + "";
        // 10位序列号,可以自行调整。
        String strReq = strTime + strRandom;

        // 子商户号 非必输
        // String sub_mch_id="";
        // 设备号 非必输
        String device_info = "";
        // 随机数
        String nonce_str = strReq;
        // 商品描述
        // String body = describe;

        // 商品描述根据情况修改
        String body = "美食";
        // 附加数据
        // String attach = userId;
        // 商户订单号
        String out_trade_no = orderNo;
        // int intMoney = Integer.parseInt(finalmoney);

        // 总金额以分为单位，不带小数点
        // int total_fee = intMoney;
        // 订单生成的机器 IP
        String spbill_create_ip = "192.168.1.32";
        // 订 单 生 成 时 间 非必输
        // String time_start ="";
        // 订单失效时间 非必输
        // String time_expire = "";
        // 商品标记 非必输
        // String goods_tag = "";

        // 这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
        String notify_url = "http://192.168.1.111:8082/testPay/aa.htm";

        String trade_type = "JSAPI";
        String openid = openId;
        // 非必输
        // String product_id = "";
        SortedMap<String, String> packageParams = new TreeMap<String, String>();
        packageParams.put("appid", appid);
        packageParams.put("mch_id", mch_id);
        packageParams.put("nonce_str", nonce_str);
        packageParams.put("body", body);
        // packageParams.put("attach", attach);
        packageParams.put("out_trade_no", out_trade_no);

        // 这里写的金额为1 分到时修改
        packageParams.put("total_fee", "1");
        // packageParams.put("total_fee", "finalmoney");
        packageParams.put("spbill_create_ip", spbill_create_ip);
        packageParams.put("notify_url", notify_url);

        packageParams.put("trade_type", trade_type);
        packageParams.put("openid", openid);

        RequestHandler reqHandler = new RequestHandler(null, null);
        reqHandler.init(appid, appsecret, partnerkey);

        String sign = reqHandler.createSign(packageParams);
        String xml = "<xml>" + "<appid>" + appid + "</appid>" + "<mch_id>"
                + mch_id + "</mch_id>" + "<nonce_str>" + nonce_str
                + "</nonce_str>" + "<sign><![CDATA[" + sign + "]]></sign>"
                + "<body><![CDATA[" + body + "]]></body>"
                + "<out_trade_no>"
                + out_trade_no
                + "</out_trade_no>"
                +

                // 金额，这里写的1 分到时修改
                "<total_fee>"
                + 1
                + "</total_fee>"
                +
                // "<total_fee>"+finalmoney+"</total_fee>"+
                "<spbill_create_ip>" + spbill_create_ip + "</spbill_create_ip>"
                + "<notify_url>" + notify_url + "</notify_url>"
                + "<trade_type>" + trade_type + "</trade_type>" + "<openid>"
                + openid + "</openid>" + "</xml>";
        System.out.println(xml);
        String allParameters = "";
        try {
            allParameters = reqHandler.genPackage(packageParams);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
        Map<String, Object> dataMap2 = new HashMap<String, Object>();
        String prepay_id = "";
        try {
            prepay_id = new GetWxOrderno().getPayNo(createOrderURL, xml);
            if (prepay_id.equals("")) {
                System.out.println("统一支付接口获取预支付订单出错");
            }
        } catch (Exception e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        System.out.println("prepay_id:"+prepay_id);
        SortedMap<String, String> finalpackage = new TreeMap<String, String>();
        String appid2 = appid;
        String timestamp = Sha1Util.getTimeStamp();
        String nonceStr2 = nonce_str;
        String prepay_id2 = "prepay_id=" + prepay_id;
        String packages = prepay_id2;
        finalpackage.put("appId", appid2);
        finalpackage.put("timeStamp", timestamp);
        finalpackage.put("nonceStr", nonceStr2);
        finalpackage.put("package", packages);
        finalpackage.put("signType", "MD5");
        String finalsign = reqHandler.createSign(finalpackage);
        return "timestamp:\"" + timestamp  //这里的也是小写~~
                + "\",nonceStr:\"" + nonceStr2 + "\",package:\""
                + packages + "\",signType: \"MD5" + "\",paySign:\""
                + finalsign + "\"";
    }
    /**
     * The doPost method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to
     * post.
     *
     * @param request
     *            the request send by the client to the server
     * @param response
     *            the response send by the server to the client
     * @throws ServletException
     *             if an error occurred
     * @throws IOException
     *             if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}