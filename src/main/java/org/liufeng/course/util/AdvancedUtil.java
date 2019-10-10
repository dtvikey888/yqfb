package org.liufeng.course.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.fjw.weixin.util.AllValus;
import org.fjw.weixin.util.DeleteFileUtil;
import org.fjw.weixin.util.sql_data;
import org.fjw.weixin.yy.WeixinChaOpenId;
import org.liufeng.course.message.resp.Article;
import org.liufeng.course.message.resp.Music;
import org.liufeng.course.pojo.Reply;
import org.liufeng.course.pojo.ArticleSummary;
import org.liufeng.course.pojo.ArticleTotal;
import org.liufeng.course.pojo.ArticleTotal2;
import org.liufeng.course.pojo.InterfaceSummary;
import org.liufeng.course.pojo.InterfaceSummaryHour;
import org.liufeng.course.pojo.SNSUserInfo;
import org.liufeng.course.pojo.UpStreamMsg;
import org.liufeng.course.pojo.UpStreamMsgDist;
import org.liufeng.course.pojo.UpStreamMsgDistMonth;
import org.liufeng.course.pojo.UpStreamMsgDistWeek;
import org.liufeng.course.pojo.UpStreamMsgHour;
import org.liufeng.course.pojo.UpStreamMsgMonth;
import org.liufeng.course.pojo.UpStreamMsgWeek;
import org.liufeng.course.pojo.UserCumulate;
import org.liufeng.course.pojo.UserRead;
import org.liufeng.course.pojo.UserReadHour;
import org.liufeng.course.pojo.UserShare;
import org.liufeng.course.pojo.UserShareHour;
import org.liufeng.course.pojo.UserSummary;
import org.liufeng.course.pojo.WeixinCommentList;
import org.liufeng.course.pojo.WeixinGroup;
import org.liufeng.course.pojo.WeixinMedia;
import org.liufeng.course.pojo.WeixinOauth2Token;
import org.liufeng.course.pojo.WeixinQRCode;
import org.liufeng.course.pojo.WeixinUserInfo;
import org.liufeng.course.pojo.WeixinUserList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 高级接口工具类
 * 
 * @author liufeng
 * @date 2013-11-9
 */
public class AdvancedUtil {
	private static Logger log = LoggerFactory.getLogger(AdvancedUtil.class);

	/**
	 * 组装文本客服消息
	 * 
	 * @param openId 消息发送对象
	 * @param content 文本消息内容
	 * @return
	 */
	public static String makeTextCustomMessage(String openId, String content) {
		// 对消息内容中的双引号进行转义
		content = content.replace("\"", "\\\"");
		String jsonMsg = "{\"touser\":\"%s\",\"msgtype\":\"text\",\"text\":{\"content\":\"%s\"}}";
		return String.format(jsonMsg, openId, content);
	}

	/**
	 * 组装图片客服消息
	 * 
	 * @param openId 消息发送对象
	 * @param mediaId 媒体文件id
	 * @return
	 */
	public static String makeImageCustomMessage(String openId, String mediaId) {
		String jsonMsg = "{\"touser\":\"%s\",\"msgtype\":\"image\",\"image\":{\"media_id\":\"%s\"}}";
		return String.format(jsonMsg, openId, mediaId);
	}

	/**
	 * 组装语音客服消息
	 * 
	 * @param openId 消息发送对象
	 * @param mediaId 媒体文件id
	 * @return
	 */
	public static String makeVoiceCustomMessage(String openId, String mediaId) {
		String jsonMsg = "{\"touser\":\"%s\",\"msgtype\":\"voice\",\"voice\":{\"media_id\":\"%s\"}}";
		return String.format(jsonMsg, openId, mediaId);
	}

	/**
	 * 组装视频客服消息
	 * 
	 * @param openId 消息发送对象
	 * @param mediaId 媒体文件id
	 * @param thumbMediaId 视频消息缩略图的媒体id
	 * @return
	 */
	public static String makeVideoCustomMessage(String openId, String mediaId, String thumbMediaId) {
		String jsonMsg = "{\"touser\":\"%s\",\"msgtype\":\"video\",\"video\":{\"media_id\":\"%s\",\"thumb_media_id\":\"%s\"}}";
		return String.format(jsonMsg, openId, mediaId, thumbMediaId);
	}

	/**
	 * 组装音乐客服消息
	 * 
	 * @param openId 消息发送对象
	 * @param music 音乐对象
	 * @return
	 */
	public static String makeMusicCustomMessage(String openId, Music music) {
		String jsonMsg = "{\"touser\":\"%s\",\"msgtype\":\"music\",\"music\":%s}";
		jsonMsg = String.format(jsonMsg, openId, JSONObject.fromObject(music).toString());
		// 将jsonMsg中的thumbmediaid替换为thumb_media_id
		jsonMsg = jsonMsg.replace("thumbmediaid", "thumb_media_id");
		return jsonMsg;
	}

	/**
	 * 组装图文客服消息
	 * 
	 * @param openId 消息发送对象
	 * @param articleList 图文消息列表
	 * @return
	 */
	public static String makeNewsCustomMessage(String openId, List<Article> articleList) {
		String jsonMsg = "{\"touser\":\"%s\",\"msgtype\":\"news\",\"news\":{\"articles\":%s}}";
		jsonMsg = String.format(jsonMsg, openId, JSONArray.fromObject(articleList).toString().replaceAll("\"", "\\\""));
		// 将jsonMsg中的picUrl替换为picurl
		jsonMsg = jsonMsg.replace("picUrl", "picurl");
		return jsonMsg;
	}

	/**
	 * 发送客服消息
	 * 
	 * @param accessToken 接口访问凭证
	 * @param jsonMsg json格式的客服消息（包括touser、msgtype和消息内容）
	 * @return true | false
	 */
	public static boolean sendCustomMessage(String accessToken, String jsonMsg) {
		log.info("消息内容：{}", jsonMsg);
		boolean result = false;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 发送客服消息
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", jsonMsg);

		if (null != jsonObject) {
			int errorCode = jsonObject.getInt("errcode");
			String errorMsg = jsonObject.getString("errmsg");
			if (0 == errorCode) {
				result = true;
				log.info("客服消息发送成功 errcode:{} errmsg:{}", errorCode, errorMsg);
			} else {
				log.error("客服消息发送失败 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}

		return result;
	}

	/**
	 * 获取网页授权凭证
	 * 
	 * @param appId 公众账号的唯一标识
	 * @param appSecret 公众账号的密钥
	 * @param code
	 * @return WeixinAouth2Token
	 */
	public static WeixinOauth2Token getOauth2AccessToken(String appId, String appSecret, String code) {
		WeixinOauth2Token wat = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
		//String requestUrl ="https://api.weixin.qq.com/sns/oauth2/component/access_token?appid=APPID&code=CODE&grant_type=authorization_code&component_appid=COMPONENT_APPID&component_access_token=COMPONENT_ACCESS_TOKEN";
		requestUrl = requestUrl.replace("APPID", appId);
		requestUrl = requestUrl.replace("SECRET", appSecret);
		requestUrl = requestUrl.replace("CODE", code);
		
		// 获取网页授权凭证
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);
		if (null != jsonObject) {
			try {
				wat = new WeixinOauth2Token();
				System.out.println("时间:"+TimeString.nowTime());
				System.out.println("access_token:"+jsonObject.getString("access_token"));
//				System.out.println("openid:"+jsonObject.getString("openid"));
//				System.out.println("scope:"+jsonObject.getString("scope"));
//				System.out.println("expires_in:"+jsonObject.getString("expires_in"));
//				System.out.println("refresh_token:"+jsonObject.getString("refresh_token"));
				
				wat.setAccessToken(jsonObject.getString("access_token"));
				wat.setExpiresIn(jsonObject.getInt("expires_in"));
				wat.setRefreshToken(jsonObject.getString("refresh_token"));
				wat.setOpenId(jsonObject.getString("openid"));
				wat.setScope(jsonObject.getString("scope"));
			} catch (Exception e) {
				wat = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取网页授权凭证失败 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return wat;
	}
	
	
	//自己开发的获取网页凭证
	


	/**
	 * 刷新网页授权凭证
	 * 
	 * @param appId 公众账号的唯一标识
	 * @param refreshToken
	 * @return WeixinAouth2Token
	 */
	public static WeixinOauth2Token refreshOauth2AccessToken(String appId, String refreshToken) {
		WeixinOauth2Token wat = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN";
		requestUrl = requestUrl.replace("APPID", appId);
		requestUrl = requestUrl.replace("REFRESH_TOKEN", refreshToken);
		// 刷新网页授权凭证
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);
		if (null != jsonObject) {
			try {
				wat = new WeixinOauth2Token();
				wat.setAccessToken(jsonObject.getString("access_token"));
				wat.setExpiresIn(jsonObject.getInt("expires_in"));
				wat.setRefreshToken(jsonObject.getString("refresh_token"));
				wat.setOpenId(jsonObject.getString("openid"));
				wat.setScope(jsonObject.getString("scope"));
			} catch (Exception e) {
				wat = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("刷新网页授权凭证失败 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return wat;
	}

	/**
	 * 通过网页授权获取用户信息
	 * 
	 * @param accessToken 网页授权接口调用凭证
	 * @param openId 用户标识
	 * @return SNSUserInfo
	 */
	@SuppressWarnings( { "deprecation", "unchecked" })
	public static SNSUserInfo getSNSUserInfo(String accessToken, String openId) {
		SNSUserInfo snsUserInfo = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("OPENID", openId);
		// 通过网页授权获取用户信息
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);

		if (null != jsonObject) {
			try {
				snsUserInfo = new SNSUserInfo();
				// 用户的标识
				snsUserInfo.setOpenId(jsonObject.getString("openid"));
				// 昵称
				snsUserInfo.setNickname(jsonObject.getString("nickname"));
				// 性别（1是男性，2是女性，0是未知）
				snsUserInfo.setSex(jsonObject.getInt("sex"));
				// 用户所在国家
				snsUserInfo.setCountry(jsonObject.getString("country"));
				// 用户所在省份
				snsUserInfo.setProvince(jsonObject.getString("province"));
				// 用户所在城市
				snsUserInfo.setCity(jsonObject.getString("city"));
				// 用户头像
				snsUserInfo.setHeadImgUrl(jsonObject.getString("headimgurl"));
				// 用户特权信息
				snsUserInfo.setPrivilegeList(JSONArray.toList(jsonObject.getJSONArray("privilege"), List.class));
				//
				
			} catch (Exception e) {
				snsUserInfo = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取用户信息失败 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return snsUserInfo;
	}

	/**
	 * 创建临时带参二维码
	 * 
	 * @param accessToken 接口访问凭证
	 * @param expireSeconds 二维码有效时间，单位为秒，最大不超过1800
	 * @param sceneId 场景ID
	 * @return WeixinQRCode
	 */
	public static WeixinQRCode createTemporaryQRCode(String accessToken, int expireSeconds, int sceneId) {
		WeixinQRCode weixinQRCode = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		String jsonMsg = "{\"expire_seconds\": %d, \"action_name\": \"QR_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": %d}}}";
		// 创建临时带参二维码
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonMsg, expireSeconds, sceneId));

		if (null != jsonObject) {
			try {
				weixinQRCode = new WeixinQRCode();
				weixinQRCode.setTicket(jsonObject.getString("ticket"));
				weixinQRCode.setExpireSeconds(jsonObject.getInt("expire_seconds"));
				log.info("创建临时带参二维码成功 ticket:{} expire_seconds:{}", weixinQRCode.getTicket(), weixinQRCode.getExpireSeconds());
			} catch (Exception e) {
				weixinQRCode = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("创建临时带参二维码失败 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return weixinQRCode;
	}

	/**
	 * 创建永久带参二维码
	 * 
	 * @param accessToken 接口访问凭证
	 * @param sceneId 场景ID
	 * @return ticket
	 */
	public static String createPermanentQRCode(String accessToken, int sceneId) {
		String ticket = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		String jsonMsg = "{\"action_name\": \"QR_LIMIT_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": %d}}}";
		// 创建永久带参二维码
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonMsg, sceneId));

		if (null != jsonObject) {
			try {
				ticket = jsonObject.getString("ticket");
				log.info("创建永久带参二维码成功 ticket:{}", ticket);
			} catch (Exception e) {
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("创建永久带参二维码失败 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return ticket;
	}

	/**
	 * 根据ticket换取二维码
	 * 
	 * @param ticket 二维码ticket
	 * @param savePath 保存路径
	 */
	public static String getQRCode(String ticket, String savePath) {
		String filePath = null;
		// 拼接请求地址
		String requestUrl = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=TICKET";
		requestUrl = requestUrl.replace("TICKET", CommonUtil.urlEncodeUTF8(ticket));
		try {
			URL url = new URL(requestUrl);
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setRequestMethod("GET");

			if (!savePath.endsWith("/")) {
				savePath += "/";
			}
			// 将ticket作为文件名
			filePath = savePath + ticket + ".jpg";

			// 将微信服务器返回的输入流写入文件
			BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
			FileOutputStream fos = new FileOutputStream(new File(filePath));
			byte[] buf = new byte[8096];
			int size = 0;
			while ((size = bis.read(buf)) != -1)
				fos.write(buf, 0, size);
			fos.close();
			bis.close();

			conn.disconnect();
			log.info("根据ticket换取二维码成功，filePath=" + filePath);
		} catch (Exception e) {
			filePath = null;
			log.error("根据ticket换取二维码失败：{}", e);
		}
		return filePath;
	}

	/**
	 * 获取用户信息
	 * 
	 * @param accessToken 接口访问凭证
	 * @param openId 用户标识
	 * @return WeixinUserInfo
	 */
	public static WeixinUserInfo getUserInfo(String accessToken, String openId) {
		WeixinUserInfo weixinUserInfo = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("OPENID", openId);
		// 获取用户信息
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);

		if (null != jsonObject) {
			try {
				weixinUserInfo = new WeixinUserInfo();
				// 用户的标识
				weixinUserInfo.setOpenId(jsonObject.getString("openid"));
				// 关注状态（1是关注，0是未关注），未关注时获取不到其余信息
				weixinUserInfo.setSubscribe(jsonObject.getInt("subscribe"));
				// 用户关注时间
				weixinUserInfo.setSubscribeTime(jsonObject.getString("subscribe_time"));
				// 昵称
				weixinUserInfo.setNickname(jsonObject.getString("nickname"));
				// 用户的性别（1是男性，2是女性，0是未知）
				weixinUserInfo.setSex(jsonObject.getInt("sex"));
				// 用户所在国家
				weixinUserInfo.setCountry(jsonObject.getString("country"));
				// 用户所在省份
				weixinUserInfo.setProvince(jsonObject.getString("province"));
				// 用户所在城市
				weixinUserInfo.setCity(jsonObject.getString("city"));
				// 用户的语言，简体中文为zh_CN
				weixinUserInfo.setLanguage(jsonObject.getString("language"));
				// 用户头像
				weixinUserInfo.setHeadImgUrl(jsonObject.getString("headimgurl"));
			} catch (Exception e) {
				if (0 == weixinUserInfo.getSubscribe()) {
					log.error("用户{}已取消关注", weixinUserInfo.getOpenId());
				} else {
					int errorCode = jsonObject.getInt("errcode");
					String errorMsg = jsonObject.getString("errmsg");
					log.error("获取用户信息失败 errcode:{} errmsg:{}", errorCode, errorMsg);
				}
			}
		}
		return weixinUserInfo;
	}

	/**
	 * 获取关注者列表
	 * 
	 * @param accessToken 调用接口凭证
	 * @param nextOpenId 第一个拉取的openId，不填默认从头开始拉取
	 * @return WeixinUserList
	 */
	@SuppressWarnings( { "unchecked", "deprecation" })
	public static WeixinUserList getUserList(String accessToken, String nextOpenId) {
		WeixinUserList weixinUserList = null;

		if (null == nextOpenId)
			nextOpenId = "";

		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("NEXT_OPENID", nextOpenId);
		// 获取关注者列表
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);
		// 如果请求成功
		if (null != jsonObject) {
			try {
				weixinUserList = new WeixinUserList();
				weixinUserList.setTotal(jsonObject.getInt("total"));
				weixinUserList.setCount(jsonObject.getInt("count"));
				weixinUserList.setNextOpenId(jsonObject.getString("next_openid"));
				JSONObject dataObject = (JSONObject) jsonObject.get("data");
				weixinUserList.setOpenIdList(JSONArray.toList(dataObject.getJSONArray("openid"), List.class));
			} catch (JSONException e) {
				weixinUserList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取关注者列表失败 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return weixinUserList;
	}

	/**
	 * 查询分组
	 * 
	 * @param accessToken 调用接口凭证
	 */
	@SuppressWarnings( { "unchecked", "deprecation" })
	public static List<WeixinGroup> getGroups(String accessToken) {
		List<WeixinGroup> weixinGroupList = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/groups/get?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 查询分组
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);

		if (null != jsonObject) {
			try {
				weixinGroupList = JSONArray.toList(jsonObject.getJSONArray("groups"), WeixinGroup.class);
			} catch (JSONException e) {
				weixinGroupList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("查询分组失败 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return weixinGroupList;
	}

	/**
	 * 创建分组
	 * 
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	public static WeixinGroup createGroup(String accessToken, String groupName) {
		WeixinGroup weixinGroup = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/groups/create?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		String jsonData = "{\"group\" : {\"name\" : \"%s\"}}";
		// 创建分组
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, groupName));

		if (null != jsonObject) {
			try {
				weixinGroup = new WeixinGroup();
				weixinGroup.setId(jsonObject.getJSONObject("group").getInt("id"));
				weixinGroup.setName(jsonObject.getJSONObject("group").getString("name"));
			} catch (JSONException e) {
				weixinGroup = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("创建分组失败 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return weixinGroup;
	}

	/**
	 * 修改分组名
	 * 
	 * @param accessToken 接口访问凭证
	 * @param groupId 分组id
	 * @param groupName 修改后的分组名
	 * @return true | false
	 */
	public static boolean updateGroup(String accessToken, int groupId, String groupName) {
		boolean result = false;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/groups/update?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		String jsonData = "{\"group\": {\"id\": %d, \"name\": \"%s\"}}";
		// 修改分组名
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, groupId, groupName));

		if (null != jsonObject) {
			int errorCode = jsonObject.getInt("errcode");
			String errorMsg = jsonObject.getString("errmsg");
			if (0 == errorCode) {
				result = true;
				log.info("修改分组名成功 errcode:{} errmsg:{}", errorCode, errorMsg);
			} else {
				log.error("修改分组名失败 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return result;
	}

	/**
	 * 移动用户分组
	 * 
	 * @param accessToken 接口访问凭证
	 * @param openId 用户标识
	 * @param groupId 分组id
	 * @return true | false
	 */
	public static boolean updateMemberGroup(String accessToken, String openId, int groupId) {
		boolean result = false;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/groups/members/update?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		String jsonData = "{\"openid\":\"%s\",\"to_groupid\":%d}";
		// 移动用户分组
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, openId, groupId));

		if (null != jsonObject) {
			int errorCode = jsonObject.getInt("errcode");
			String errorMsg = jsonObject.getString("errmsg");
			if (0 == errorCode) {
				result = true;
				log.info("移动用户分组成功 errcode:{} errmsg:{}", errorCode, errorMsg);
			} else {
				log.error("移动用户分组失败 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return result;
	}

	/**
	 * 上传媒体文件
	 * 
	 * @param accessToken 接口访问凭证
	 * @param type 媒体文件类型（image、voice、video和thumb）
	 * @param mediaFileUrl 媒体文件的url
	 */
	public static WeixinMedia uploadMedia(String accessToken, String type, String mediaFileUrl) {
		WeixinMedia weixinMedia = null;
		// 拼装请求地址
		String uploadMediaUrl = "http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
		uploadMediaUrl = uploadMediaUrl.replace("ACCESS_TOKEN", accessToken).replace("TYPE", type);

		// 定义数据分隔符
		String boundary = "------------7da2e536604c8";
		try {
			URL uploadUrl = new URL(uploadMediaUrl);
			HttpURLConnection uploadConn = (HttpURLConnection) uploadUrl.openConnection();
			uploadConn.setDoOutput(true);
			uploadConn.setDoInput(true);
			uploadConn.setRequestMethod("POST");
			// 设置请求头Content-Type
			uploadConn.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);
			// 获取媒体文件上传的输出流（往微信服务器写数据）
			OutputStream outputStream = uploadConn.getOutputStream();

			URL mediaUrl = new URL(mediaFileUrl);
			HttpURLConnection meidaConn = (HttpURLConnection) mediaUrl.openConnection();
			meidaConn.setDoOutput(true);
			meidaConn.setRequestMethod("GET");

			// 从请求头中获取内容类型
			String contentType = meidaConn.getHeaderField("Content-Type");
			// 根据内容类型判断文件扩展名
			String fileExt = CommonUtil.getFileExt(contentType);
			// 请求体开始
			outputStream.write(("--" + boundary + "\r\n").getBytes());
			outputStream.write(String.format("Content-Disposition: form-data; name=\"media\"; filename=\"file1%s\"\r\n", fileExt).getBytes());
			outputStream.write(String.format("Content-Type: %s\r\n\r\n", contentType).getBytes());

			// 获取媒体文件的输入流（读取文件）
			BufferedInputStream bis = new BufferedInputStream(meidaConn.getInputStream());
			byte[] buf = new byte[8096];
			int size = 0;
			while ((size = bis.read(buf)) != -1) {
				// 将媒体文件写到输出流（往微信服务器写数据）
				outputStream.write(buf, 0, size);
			}
			// 请求体结束
			outputStream.write(("\r\n--" + boundary + "--\r\n").getBytes());
			outputStream.close();
			bis.close();
			meidaConn.disconnect();

			// 获取媒体文件上传的输入流（从微信服务器读数据）
			InputStream inputStream = uploadConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			StringBuffer buffer = new StringBuffer();
			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// 释放资源
			inputStream.close();
			inputStream = null;
			uploadConn.disconnect();

			// 使用JSON-lib解析返回结果
			JSONObject jsonObject = JSONObject.fromObject(buffer.toString());
			weixinMedia = new WeixinMedia();
			weixinMedia.setType(jsonObject.getString("type"));
			// type等于thumb时的返回结果和其它类型不一样
			if ("thumb".equals(type))
				weixinMedia.setMediaId(jsonObject.getString("thumb_media_id"));
			else
				weixinMedia.setMediaId(jsonObject.getString("media_id"));
			weixinMedia.setCreatedAt(jsonObject.getInt("created_at"));
		} catch (Exception e) {
			weixinMedia = null;
			log.error("上传媒体文件失败：{}", e);
		}
		return weixinMedia;
	}

	/**
	 * 下载媒体文件
	 * 
	 * @param accessToken 接口访问凭证
	 * @param mediaId 媒体文件标识
	 * @param savePath 文件在服务器上的存储路径
	 * @return
	 */
	public static String getMedia(String accessToken, String mediaId, String savePath) {
		String filePath = null;
		
		// 拼接请求地址
		String requestUrl = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("MEDIA_ID", mediaId);
		System.out.println(requestUrl);
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setRequestMethod("GET");

			if (!savePath.endsWith("/")) {
				savePath += "/";
			}
			// 根据内容类型获取扩展名
			String fileExt = CommonUtil.getFileExt(conn.getHeaderField("Content-Type"));
			// 将mediaId作为文件名
			filePath = savePath + mediaId + fileExt;

			BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
			FileOutputStream fos = new FileOutputStream(new File(filePath));
			byte[] buf = new byte[8096];
			int size = 0;
			while ((size = bis.read(buf)) != -1)
				fos.write(buf, 0, size);
			fos.close();
			bis.close();

			conn.disconnect();
			log.info("下载媒体文件成功，filePath=" + filePath);
		} catch (Exception e) {
			filePath = null;
			log.error("下载媒体文件失败：{}", e);
		}
		return filePath;
	}
	
	
	/**
	 * 下载媒体文件 (只得到 文件名)
	 * 
	 * @param accessToken 接口访问凭证
	 * @param mediaId 媒体文件标识
	 * @param savePath 文件在服务器上的存储路径
	 * @return
	 */
	public static String getMedia2(String accessToken, String mediaId, String savePath) {
		String filePath = null;
		String filePath2 = null;
		String img2 = null;
		
		// 拼接请求地址
		String requestUrl = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("MEDIA_ID", mediaId);
		System.out.println(requestUrl);
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setRequestMethod("GET");

			if (!savePath.endsWith("/")) {
				savePath += "/";
			}
			// 根据内容类型获取扩展名
			String fileExt = CommonUtil.getFileExt(conn.getHeaderField("Content-Type"));
			// 将mediaId作为文件名
			filePath = savePath + mediaId + fileExt;
			filePath2 = mediaId + fileExt;
			
			BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
			FileOutputStream fos = new FileOutputStream(new File(filePath));
			byte[] buf = new byte[8096];
			int size = 0;
			while ((size = bis.read(buf)) != -1)
				fos.write(buf, 0, size);
			fos.close();
			bis.close();

			conn.disconnect();
			log.info("下载媒体文件成功，filePath=" + filePath2);
			
			
			//添加部分开始
			String fromPicName = savePath+filePath2;  //压缩路径文件名
			img2 = "ys_"+filePath2;  
			String toPicName =  savePath+img2;//压缩后路径文件名
			ThumbTest Ys = new ThumbTest();
			Ys.testHandlePicture2(fromPicName,toPicName);//压缩图片处理
			DeleteFileUtil.deleteFile(fromPicName);//删除原图
			//添加部分完成
			
		} catch (Exception e) {
			filePath = null;
			log.error("下载媒体文件失败：{}", e);
		}
		return img2;
	}
	
	
	public static String getMedia3(String accessToken, String mediaId, String savePath) {
		String filePath = null;
		String filePath2 = null;
		
		// 拼接请求地址
		String requestUrl = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("MEDIA_ID", mediaId);
		System.out.println(requestUrl);
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setRequestMethod("GET");

			if (!savePath.endsWith("/")) {
				savePath += "/";
			}
			// 根据内容类型获取扩展名
			String fileExt = CommonUtil.getFileExt(conn.getHeaderField("Content-Type"));
			// 将mediaId作为文件名
			filePath = savePath + mediaId + fileExt;
			filePath2 = mediaId + fileExt;
			BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
			FileOutputStream fos = new FileOutputStream(new File(filePath));
			byte[] buf = new byte[8096];
			int size = 0;
			while ((size = bis.read(buf)) != -1)
				fos.write(buf, 0, size);
			fos.close();
			bis.close();

			conn.disconnect();
			log.info("下载媒体文件成功，filePath=" + filePath2);
			
		} catch (Exception e) {
			filePath = null;
			log.error("下载媒体文件失败：{}", e);
		}
		return filePath2;
	}
	
	//**自己写的接口方法
	
	
	/**
	 * 数据统计接口_用户分析数据接口_获取用户增减数据
	 * 时间跨度 7
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UserSummary> getUserSummary(String accessToken, String begin_date, String end_date) {
		List<UserSummary> userSummaryList = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getusersummary?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
				userSummaryList = JSONArray.toList(jsonObject.getJSONArray("list"), UserSummary.class);
			} catch (JSONException e) {
				userSummaryList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取用户增减数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return userSummaryList;
	}
	
	
	/**
	 * 数据统计接口_用户分析数据接口_获取累计用户数据
	 * 时间跨度 7
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UserCumulate> getUserCumulate(String accessToken, String begin_date, String end_date) {
		List<UserCumulate> userCumulateList = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getusercumulate?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
				userCumulateList = JSONArray.toList(jsonObject.getJSONArray("list"), UserCumulate.class);
			} catch (JSONException e) {
				userCumulateList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取累计用户数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return userCumulateList;
	}
	
	
	/**
	 * 数据统计接口_图文分析数据接口_获取图文群发每日数据
	 * 时间跨度 1
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<ArticleSummary> getArticleSummary(String accessToken, String begin_date, String end_date) {
		List<ArticleSummary> articleSummaryList = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getarticlesummary?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
				articleSummaryList = JSONArray.toList(jsonObject.getJSONArray("list"), ArticleSummary.class);
			} catch (JSONException e) {
				articleSummaryList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取图文群发每日数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return articleSummaryList;
	}
	
	
	/**
	 * 数据统计接口_图文分析数据接口_获取图文群发总数据
	 * 时间跨度 1
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<ArticleTotal> getArticleTotal(String accessToken, String begin_date, String end_date) {
		
		
		List<ArticleTotal> articleTotalList = null;
		

	
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getarticletotal?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
				
		
				articleTotalList = JSONArray.toList(jsonObject.getJSONArray("list"), ArticleTotal.class);
				
				
			} catch (JSONException e) {
				articleTotalList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取图文群发总数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return articleTotalList;
	}
	
	
	/**
	 * 数据统计接口_图文分析数据接口_获取图文统计数据
	 * 时间跨度 3
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UserRead> getUserRead(String accessToken, String begin_date, String end_date) {
		
		
		List<UserRead> userReadList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getuserread?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				//System.out.println(jsonObject.getJSONArray("list"));
				userReadList = JSONArray.toList(jsonObject.getJSONArray("list"), UserRead.class);
				
				
			} catch (JSONException e) {
				userReadList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取图文统计数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return userReadList;
	}
	
	
	/**
	 * 数据统计接口_图文分析数据接口_获取图文统计分时数据
	 * 时间跨度 1
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UserReadHour> getUserReadHour(String accessToken, String begin_date, String end_date) {
		
		
		List<UserReadHour> userReadHourList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getuserreadhour?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				userReadHourList = JSONArray.toList(jsonObject.getJSONArray("list"), UserReadHour.class);
				
				
			} catch (JSONException e) {
				userReadHourList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取图文统计分时数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return userReadHourList;
	}
	
	
	/**
	 * 数据统计接口_图文分析数据接口_获取图文分享转发数据
	 * 时间跨度 7
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UserShare> getUserShare(String accessToken, String begin_date, String end_date) {
		
		
		List<UserShare> userSharList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getusershare?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				//System.out.println(jsonObject.getJSONArray("list"));
				userSharList = JSONArray.toList(jsonObject.getJSONArray("list"), UserShare.class);
				
				
			} catch (JSONException e) {
				userSharList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取图文分享转发数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return userSharList;
	}
	
	/**
	 * 数据统计接口_图文分析数据接口_获取图文分享转发分时数据
	 * 时间跨度 1
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UserShareHour> getUserShareHour(String accessToken, String begin_date, String end_date) {
		
		
		List<UserShareHour> userSharHourList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getusersharehour?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				userSharHourList = JSONArray.toList(jsonObject.getJSONArray("list"), UserShareHour.class);
				
				
			} catch (JSONException e) {
				userSharHourList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取图文分享转发分时数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return userSharHourList;
	}
	
	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送概况数据
	 * 时间跨度 7
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsg> getUpStreamMsg(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsg> upStreamMsgList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsg?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				upStreamMsgList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsg.class);
				
				
			} catch (JSONException e) {
				upStreamMsgList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取消息发送概况数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgList;
	}
	
	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送概况数据
	 * 时间跨度 1
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsgHour> getUpStreamMsgHour(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsgHour> upStreamMsgHourList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsghour?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				upStreamMsgHourList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsgHour.class);
				
				
			} catch (JSONException e) {
				upStreamMsgHourList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取消息分送分时数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgHourList;
	}
	
	

	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送周数据
	 * 时间跨度 30
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsgWeek> getUpStreamMsgWeek(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsgWeek> upStreamMsgHourList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsgweek?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				upStreamMsgHourList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsgWeek.class);
				
				
			} catch (JSONException e) {
				upStreamMsgHourList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取消息发送周数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgHourList;
	}
	

	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送月数据
	 * 时间跨度 30
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsgMonth> getUpStreamMsgMonth(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsgMonth> upStreamMsgMonthList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsgmonth?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				upStreamMsgMonthList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsgMonth.class);
				
				
			} catch (JSONException e) {
				upStreamMsgMonthList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取消息发送月数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgMonthList;
	}
	

	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送分布数据
	 * 时间跨度 15
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsgDist> getUpStreamMsgDist(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsgDist> upStreamMsgDistList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsgdist?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				//System.out.println(jsonObject.getJSONArray("list"));
				upStreamMsgDistList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsgDist.class);
				
				
			} catch (JSONException e) {
				upStreamMsgDistList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取消息发送分布数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgDistList;
	}
	
	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送分布周数据
	 * 时间跨度 30
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsgDistWeek> getUpStreamMsgDistWeek(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsgDistWeek> upStreamMsgDistWeekList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsgdistweek?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				upStreamMsgDistWeekList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsgDistWeek.class);
				
				
			} catch (JSONException e) {
				upStreamMsgDistWeekList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取消息发送分布周数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgDistWeekList;
	}
	
	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送分布月数据
	 * 时间跨度 30
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsgDistMonth> getUpStreamMsgDistMonth(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsgDistMonth> upStreamMsgDistMonthList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsgdistmonth?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				upStreamMsgDistMonthList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsgDistMonth.class);
				
				
			} catch (JSONException e) {
				upStreamMsgDistMonthList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取消息发送分布月数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgDistMonthList;
	}
	
	/**
	 * 数据统计接口_接口分析数据接口_获取接口分析数据
	 * 时间跨度 30
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<InterfaceSummary> getInterfaceSummary(String accessToken, String begin_date, String end_date) {
		
		
		List<InterfaceSummary> interfaceSummaryList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getinterfacesummary?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				//System.out.println(jsonObject.getJSONArray("list"));
				interfaceSummaryList = JSONArray.toList(jsonObject.getJSONArray("list"), InterfaceSummary.class);
				
				
			} catch (JSONException e) {
				interfaceSummaryList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取接口分析数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return interfaceSummaryList;
	}
	
	/**
	 * 数据统计接口_接口分析数据接口_获取接口分析分时数据
	 * 时间跨度 1
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<InterfaceSummaryHour> getInterfaceSummaryHour(String accessToken, String begin_date, String end_date) {
		
		
		List<InterfaceSummaryHour> interfaceSummaryHourList = null;
		
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/datacube/getinterfacesummaryhour?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				interfaceSummaryHourList = JSONArray.toList(jsonObject.getJSONArray("list"), InterfaceSummaryHour.class);
				
				
			} catch (JSONException e) {
				interfaceSummaryHourList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取接口分析分时数据 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return interfaceSummaryHourList;
	}
	
	
	
	//自己写的获取接口并且录入数据库的方法(yqcndata中表面前缀统一 wxinterface)

	/**
	 * 数据统计接口_用户分析数据接口_获取用户增减数据(录入数据库)(表：wxinterface_yqfbwx_usersummary)
	 * 时间跨度7
	 * @throws ParseException 
	 */
	public void idb_getUserSummary(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UserSummary> userSummaryList = getUserSummary(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		for (UserSummary usl : userSummaryList) {
			System.out.println(String.format("数据的日期：%s 用户的渠道：%d 新增的用户数量：%d 取消关注的用户数量：%d", usl.getRef_date(), usl.getUser_source(), usl.getNew_user(),usl.getCancel_user()));

			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select ref_date,user_source from wxinterface_yqfbwx_usersummary where ref_date='"+usl.getRef_date()+"' and user_source="+usl.getUser_source()+"";
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_usersummary(ref_date,user_source,new_user,cancel_user) values('"+usl.getRef_date()+"',"+usl.getUser_source()+","+usl.getNew_user()+","+usl.getCancel_user()+")";
					db.executeInsert(sql2);
					
				}else{
					
					String sql2 = "update wxinterface_yqfbwx_usersummary set ref_date='"+usl.getRef_date()+",user_source="+usl.getUser_source()+",new_user="+usl.getNew_user()+",cancel_user="+usl.getCancel_user()+"  where ref_date='"+usl.getRef_date()+"' and user_source="+usl.getUser_source()+" ";
					db.executeUpdate(sql2);
					
					
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	/**
	 * 数据统计接口_用户分析数据接口_获取用户增减数据(录入数据库)(表：wxinterface_yqfbwx_usercumulate)
	 * 时间跨度7
	 * @throws ParseException 
	 */
	public void idb_getUserCumulate(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UserCumulate> userCumulateList = getUserCumulate(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		for (UserCumulate ucl : userCumulateList) {
			System.out.println(String.format("数据的日期：%s 总用户量：%d", ucl.getRef_date(), ucl.getCumulate_user()));
			
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_usercumulate where ref_date='"+ucl.getRef_date()+"' ";
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_usercumulate(ref_date,cumulate_user) values('"+ucl.getRef_date()+"',"+ucl.getCumulate_user()+")";
					db.executeInsert(sql2);
				}else {
					String sql2 = "update wxinterface_yqfbwx_usercumulate set ref_date='"+ucl.getRef_date()+"',cumulate_user="+ucl.getCumulate_user()+" where ref_date='"+ucl.getRef_date()+"'";
					db.executeUpdate(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	
	/**
	 * 数据统计接口_图文分析数据接口_获取图文群发每日数据(录入数据库)(表：wxinterface_yqfbwx_articlesummary)
	 * 时间跨度1
	 * @throws ParseException 
	 */
	public void idb_getArticleSummary(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<ArticleSummary> articleSummaryList = getArticleSummary(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (ArticleSummary asl : articleSummaryList) {
		
			
			System.out.println(String.format("数据的日期：%s msgid：%s 图文消息的标题: %s 图文页（点击群发图文卡片进入的页面）的阅读人数: %d 图文页的阅读次数: %d 原文页阅读人数: %d 分享的场景: %d 分享的次数: %d 收藏的人数: %d 收藏的次数: %d", asl.getRef_date(), asl.getMsgid(),asl.getTitle(),asl.getInt_page_read_user(),asl.getInt_page_read_count(),asl.getOri_page_read_user(),asl.getOri_page_read_count(),asl.getShare_user(),asl.getShare_count(),asl.getAdd_to_fav_user(),asl.getAdd_to_fav_count()));
			
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_articlesummary where ref_date='"+asl.getRef_date()+"' and msgid='"+asl.getMsgid()+"' ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_articlesummary(ref_date,msgid,title,int_page_read_user,int_page_read_count,ori_page_read_user,ori_page_read_count,share_user,share_count,add_to_fav_user,add_to_fav_count) values('"+asl.getRef_date()+"','"+asl.getMsgid()+"','"+asl.getTitle()+"',"+asl.getInt_page_read_user()+","+asl.getInt_page_read_count()+","+asl.getOri_page_read_user()+","+asl.getOri_page_read_count()+","+asl.getShare_user()+","+asl.getShare_count()+","+asl.getAdd_to_fav_user()+","+asl.getAdd_to_fav_count()+")";
					db.executeInsert(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	
	

	
	/**
	 * 数据统计接口_图文分析数据接口_获取图文群发总数据(录入数据库)(表：wxinterface_yqfbwx_articletotal)
	 * 时间跨度1
	 * @throws ParseException 
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public void idb_getArticleTotal(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<ArticleTotal> articleTotalList = getArticleTotal(accessToken,begin_date,end_date);
		
		// 循环输出各分组信息
		

		for (ArticleTotal asl : articleTotalList) {
		
			System.out.println(String.format("数据的日期：%s msgid：%s 图文消息的标题: %s ", asl.getRef_date(), asl.getMsgid(),asl.getTitle()));

			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_articletotal where ref_date='"+asl.getRef_date()+"' and msgid='"+asl.getMsgid()+"' ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_articletotal(ref_date,msgid,title) values('"+asl.getRef_date()+"','"+asl.getMsgid()+"','"+asl.getTitle()+"')";
					db.executeInsert(sql2);
					
					ResultSet rs2 = db.executeQuery("select top 1 id from wxinterface_yqfbwx_articletotal order by id desc");
					int fid =0;
					if (rs2.next()) {
						fid = rs2.getInt(1);
					}
					
					List<ArticleTotal2> at2 = asl.getDetails();
					
					for (int i = 0; i < at2.size(); i++) {
			
						
						System.out.println("details:"+ at2.get(i));
						
						
						JSONArray jsonArray = JSONArray.fromObject(at2.get(i));
						Map<String, Class> classMap = new HashMap<String, Class>();
						classMap.put("details", ArticleTotal2.class);
						List<ArticleTotal2> atalList = (List<ArticleTotal2>)JSONArray.toList(jsonArray, ArticleTotal2.class,classMap);
						for (int j = 0; j < atalList.size(); j++) {
							
							System.out.println("getStat_date: "+atalList.get(j).getStat_date());
							
							String sql3 = "insert into wxinterface_yqfbwx_articletotal2(fid,stat_date,target_user,int_page_read_user,int_page_read_count,ori_page_read_user,ori_page_read_count,share_user,share_count,add_to_fav_user,add_to_fav_count,int_page_from_session_read_user,int_page_from_session_read_count,int_page_from_hist_msg_read_user,int_page_from_hist_msg_read_count,int_page_from_feed_read_user,int_page_from_feed_read_count,int_page_from_friends_read_user,int_page_from_friends_read_count,int_page_from_other_read_user,int_page_from_other_read_count,feed_share_from_session_user,feed_share_from_session_cnt,feed_share_from_feed_user,feed_share_from_feed_cnt,feed_share_from_other_user,feed_share_from_other_cnt) values("+fid+",'"+atalList.get(j).getStat_date()+"',"+atalList.get(j).getTarget_user()+","+atalList.get(j).getInt_page_read_user()+","+atalList.get(j).getInt_page_read_count()+","+atalList.get(j).getOri_page_read_user()+","+atalList.get(j).getOri_page_read_count()+","+atalList.get(j).getShare_user()+","+atalList.get(j).getShare_count()+","+atalList.get(j).getAdd_to_fav_user()+","+atalList.get(j).getAdd_to_fav_count()+","+atalList.get(j).getInt_page_from_session_read_user()+","+atalList.get(j).getInt_page_from_session_read_count()+","+atalList.get(j).getInt_page_from_hist_msg_read_user()+","+atalList.get(j).getInt_page_from_hist_msg_read_count()+","+atalList.get(j).getInt_page_from_feed_read_user()+","+atalList.get(j).getInt_page_from_feed_read_count()+","+atalList.get(j).getInt_page_from_friends_read_user()+","+atalList.get(j).getInt_page_from_friends_read_count()+","+atalList.get(j).getInt_page_from_other_read_user()+","+atalList.get(j).getInt_page_from_other_read_count()+","+atalList.get(j).getFeed_share_from_session_user()+","+atalList.get(j).getFeed_share_from_session_cnt()+","+atalList.get(j).getFeed_share_from_feed_user()+","+atalList.get(j).getFeed_share_from_feed_cnt()+","+atalList.get(j).getFeed_share_from_other_user()+","+atalList.get(j).getFeed_share_from_other_cnt()+")";
							
							System.out.println(sql3);
							db.executeInsert(sql3);
						}
							
						
						
						//System.out.println(String.format("stat_date: %s",atalList.get(j).getStat_date()));
						
						//String sql3 = "insert into wxinterface_yqfbwx_articletotal2(fid,stat_date,target_user,int_page_read_user,int_page_read_count,ori_page_read_user,ori_page_read_count,share_user,share_count,add_to_fav_user,add_to_fav_count) values("+fid+",'"+at2.get(i).getStat_date()+"',"+at2.get(i).getTarget_user()+","+at2.get(i).getInt_page_read_user()+","+at2.get(i).getInt_page_read_count()+","+at2.get(i).getOri_page_read_user()+","+at2.get(i).getOri_page_read_count()+","+at2.get(i).getShare_user()+","+at2.get(i).getShare_count()+","+at2.get(i).getAdd_to_fav_user()+","+at2.get(i).getAdd_to_fav_count()+")";
						//System.out.println(sql3);
						
						//db.executeInsert(sql3);
					}
				
				}else {
					
					int fid = rs.getInt("id");
					
					List<ArticleTotal2> at2 = asl.getDetails();
					
					for (int i = 0; i < at2.size(); i++) {
			
						
						System.out.println("details:"+ at2.get(i));
						
						
						JSONArray jsonArray = JSONArray.fromObject(at2.get(i));
						Map<String, Class> classMap = new HashMap<String, Class>();
						classMap.put("details", ArticleTotal2.class);
						List<ArticleTotal2> atalList = (List<ArticleTotal2>)JSONArray.toList(jsonArray, ArticleTotal2.class,classMap);
						for (int j = 0; j < atalList.size(); j++) {
							
							System.out.println("getStat_date: "+atalList.get(j).getStat_date());
							
							//String sql3 = "insert into wxinterface_yqfbwx_articletotal2(fid,stat_date,target_user,int_page_read_user,int_page_read_count,ori_page_read_user,ori_page_read_count,share_user,share_count,add_to_fav_user,add_to_fav_count) values("+fid+",'"+atalList.get(j).getStat_date()+"',"+atalList.get(j).getTarget_user()+","+atalList.get(j).getInt_page_read_user()+","+atalList.get(j).getInt_page_read_count()+","+atalList.get(j).getOri_page_read_user()+","+atalList.get(j).getOri_page_read_count()+","+atalList.get(j).getShare_user()+","+atalList.get(j).getShare_count()+","+atalList.get(j).getAdd_to_fav_user()+","+atalList.get(j).getAdd_to_fav_count()+")";
							//String sql3 = "update wxinterface_yqfbwx_articletotal2 set fid="+fid+",stat_date='"+atalList.get(j).getStat_date()+"',target_user="+atalList.get(j).getTarget_user()+",int_page_read_user="+atalList.get(j).getInt_page_read_user()+",int_page_read_count="+atalList.get(j).getInt_page_read_count()+",ori_page_read_user="+atalList.get(j).getOri_page_read_user()+",ori_page_read_count="+atalList.get(j).getOri_page_read_count()+",share_user="+atalList.get(j).getShare_user()+",share_count="+atalList.get(j).getShare_count()+",add_to_fav_user="+atalList.get(j).getAdd_to_fav_user()+",add_to_fav_count="+atalList.get(j).getAdd_to_fav_count()+" where fid="+fid+" ";
							
							String sql3 = "update wxinterface_yqfbwx_articletotal2 set fid="+fid+",stat_date='"+atalList.get(j).getStat_date()+"',target_user="+atalList.get(j).getTarget_user()+",int_page_read_user="+atalList.get(j).getInt_page_read_user()+",int_page_read_count="+atalList.get(j).getInt_page_read_count()+",ori_page_read_user="+atalList.get(j).getOri_page_read_user()+",ori_page_read_count="+atalList.get(j).getOri_page_read_count()+",share_user="+atalList.get(j).getShare_user()+",share_count="+atalList.get(j).getShare_count()+",add_to_fav_user="+atalList.get(j).getAdd_to_fav_user()+",add_to_fav_count="+atalList.get(j).getAdd_to_fav_count()+",int_page_from_session_read_user="+atalList.get(j).getInt_page_from_session_read_user()+",int_page_from_session_read_count="+atalList.get(j).getInt_page_from_session_read_count()+",int_page_from_hist_msg_read_user="+atalList.get(j).getInt_page_from_hist_msg_read_user()+",int_page_from_hist_msg_read_count="+atalList.get(j).getInt_page_from_hist_msg_read_count()+",int_page_from_feed_read_user="+atalList.get(j).getInt_page_from_feed_read_user()+",int_page_from_feed_read_count="+atalList.get(j).getInt_page_from_feed_read_count()+",int_page_from_friends_read_user="+atalList.get(j).getInt_page_from_friends_read_user()+",int_page_from_friends_read_count="+atalList.get(j).getInt_page_from_friends_read_count()+",int_page_from_other_read_user="+atalList.get(j).getInt_page_from_other_read_user()+",int_page_from_other_read_count="+atalList.get(j).getInt_page_from_other_read_count()+",feed_share_from_session_user="+atalList.get(j).getFeed_share_from_session_user()+",feed_share_from_session_cnt="+atalList.get(j).getFeed_share_from_session_cnt()+",feed_share_from_feed_user="+atalList.get(j).getFeed_share_from_feed_user()+",feed_share_from_feed_cnt="+atalList.get(j).getFeed_share_from_feed_cnt()+",feed_share_from_other_user="+atalList.get(j).getFeed_share_from_other_user()+",feed_share_from_other_cnt="+atalList.get(j).getFeed_share_from_other_cnt()+" where fid="+fid+" ";
							
							
							System.out.println(sql3);
							db.executeUpdate(sql3);
						}
						
					}
					
					
				}
				
				
				
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	

	/**
	 * 数据统计接口_图文分析数据接口_获取图文统计数据(录入数据库)(表：wxinterface_yqfbwx_userread)
	 * 时间跨度3
	 * @throws ParseException 
	 */
	public void idb_getUserRead(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UserRead> userReadList = getUserRead(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (UserRead asl : userReadList) {
		
			
			System.out.println(String.format("数据的日期：%s 代表用户从哪里进入来阅读该图文: %d 图文页（点击群发图文卡片进入的页面）的阅读人数：%d 图文页的阅读次数: %d 原文页（点击图文页“阅读原文”进入的页面）的阅读人数: %d 原文页的阅读次数: %d 分享的人数: %d 分享的次数: %d 收藏的人数: %d 收藏的次数: %d", asl.getRef_date(),asl.getUser_source(), asl.getInt_page_read_user(),asl.getInt_page_read_count(),asl.getOri_page_read_user(),asl.getOri_page_read_count(),asl.getShare_user(),asl.getShare_count(),asl.getAdd_to_fav_user(),asl.getAdd_to_fav_count()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_userread where ref_date='"+asl.getRef_date()+"' and user_source="+asl.getUser_source()+" ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_userread(ref_date,user_source,int_page_read_user,int_page_read_count,ori_page_read_user,ori_page_read_count,share_user,share_count,add_to_fav_user,add_to_fav_count) values('"
							+ asl.getRef_date()
							+ "',"
							+ asl.getUser_source()
							+ ","
							+ asl.getInt_page_read_user()
							+ ","
							+ asl.getInt_page_read_count()
							+ ","
							+ asl.getOri_page_read_user()
							+ ","
							+ asl.getOri_page_read_count()
							+ ","
							+ asl.getShare_user()
							+ ","
							+ asl.getShare_count()
							+ ","
							+ asl.getAdd_to_fav_user()
							+ ","
							+ asl.getAdd_to_fav_count() + ")";
					db.executeInsert(sql2);
				}else {
					
					String sql2 = "update wxinterface_yqfbwx_userread set ref_date='"+asl.getRef_date()+"' ,user_source="+asl.getUser_source()+",int_page_read_user="+asl.getInt_page_read_user()+",int_page_read_count="+asl.getInt_page_read_count()+",ori_page_read_user="+asl.getOri_page_read_user()+",ori_page_read_count="+asl.getOri_page_read_count()+",share_user="+asl.getShare_user()+",share_count="+asl.getShare_count()+",add_to_fav_user="+asl.getAdd_to_fav_user()+",add_to_fav_count="+asl.getAdd_to_fav_count()+"  where ref_date='"+asl.getRef_date()+"' and user_source="+asl.getUser_source()+" ";
				    db.executeUpdate(sql2);
					
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	/**
	 * 数据统计接口_图文分析数据接口_获取图文统计分时数据(录入数据库)(表：wxinterface_yqfbwx_userreadhour)
	 * 时间跨度1
	 * @throws ParseException 
	 */
	public void idb_getUserReadHour(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UserReadHour> userReadHourList = getUserReadHour(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (UserReadHour asl : userReadHourList) {
		
			
			System.out.println(String.format("数据的日期：%s 分时：%d 用户来源: %d  图文页的阅读人数: %d 图文页的阅读次数: %d", asl.getRef_date(), asl.getRef_hour(),asl.getUser_source(),asl.getInt_page_read_user(),asl.getInt_page_read_count()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_userreadhour where ref_date='"+asl.getRef_date()+"' and ref_hour="+asl.getRef_hour()+" and user_source="+asl.getUser_source()+" ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_userreadhour(ref_date,ref_hour,user_source,int_page_read_user,int_page_read_count,ori_page_read_user,ori_page_read_count,share_user,share_count,add_to_fav_user,add_to_fav_count) values('"
							+ asl.getRef_date()
							+ "',"
							+ asl.getRef_hour()
							+ ","
							+ asl.getUser_source()
							+ ","
							+ asl.getInt_page_read_user()
							+ ","
							+ asl.getInt_page_read_count()
							+ ","
							+ asl.getOri_page_read_user()
							+ ","
							+ asl.getOri_page_read_count()
							+ ","
							+ asl.getShare_user()
							+ ","
							+ asl.getShare_count()
							+ ","
							+ asl.getAdd_to_fav_user()
							+ ","
							+ asl.getAdd_to_fav_count() + ")";
					db.executeInsert(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	

	/**
	 * 数据统计接口_图文分析数据接口_获取图文分享转发数据(录入数据库)(表：wxinterface_yqfbwx_usershare)
	 * 时间跨度7
	 * @throws ParseException 
	 */
	public void idb_getUserShare(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UserShare> userShareList = getUserShare(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (UserShare asl : userShareList) {
		
			
			System.out.println(String.format("数据的日期：%s  分享的场景: %d  分享的次数: %d 分享的人数: %d", asl.getRef_date(), asl.getShare_scene(),asl.getShare_count(),asl.getShare_user()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_usershare where ref_date='"+asl.getRef_date()+"' and share_scene="+asl.getShare_scene()+" ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_usershare(ref_date,share_scene,share_count,share_user) values('"+asl.getRef_date()+"',"+asl.getShare_scene()+","+asl.getShare_count()+","+asl.getShare_user()+")";
					db.executeInsert(sql2);
				}else {
					String sql2 = "update wxinterface_yqfbwx_usershare set ref_date='"+asl.getRef_date()+"',share_scene="+asl.getShare_scene()+",share_count="+asl.getShare_count()+",share_user="+asl.getShare_user()+"  where ref_date='"+asl.getRef_date()+"' and share_scene="+asl.getShare_scene()+" ";
					db.executeUpdate(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	/**
	 * 数据统计接口_图文分析数据接口_获取图文分享转发分时数据(录入数据库)(表：wxinterface_yqfbwx_usersharehour)
	 * 时间跨度1
	 * @throws ParseException 
	 */
	public void idb_getUserShareHour(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UserShareHour> userShareHourList = getUserShareHour(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (UserShareHour asl : userShareHourList) {
		
			
			System.out.println(String.format("数据的日期：%s  分时: %d 分享的场景: %d  分享的次数: %d 分享的人数: %d", asl.getRef_date(), asl.getRef_hour(), asl.getShare_scene(),asl.getShare_count(),asl.getShare_user()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_usersharehour where ref_date='"+asl.getRef_date()+"' and ref_hour="+asl.getRef_hour()+"  and share_scene="+asl.getShare_scene()+" ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_usersharehour(ref_date,ref_hour,share_scene,share_count,share_user) values('"+asl.getRef_date()+"',"+asl.getRef_hour()+","+asl.getShare_scene()+","+asl.getShare_count()+","+asl.getShare_user()+")";
					db.executeInsert(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	
	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送概况数据(录入数据库)(表：wxinterface_yqfbwx_upstreammsg)
	 * 时间跨度7
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsg(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsg> upStreamMsgList = getUpStreamMsg(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (UpStreamMsg asl : upStreamMsgList) {
		
			
			System.out.println(String.format("数据的日期：%s  消息类型: %d 上行发送了（向公众号发送了）消息的用户数: %d  上行发送了消息的消息总数: %d", asl.getRef_date(), asl.getMsg_type(), asl.getMsg_user(),asl.getMsg_count()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_upstreammsg where ref_date='"+asl.getRef_date()+"' and msg_type="+asl.getMsg_type()+" ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_upstreammsg(ref_date,msg_type,msg_user,msg_count) values('"+asl.getRef_date()+"',"+asl.getMsg_type()+","+asl.getMsg_user()+","+asl.getMsg_count()+")";
					db.executeInsert(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	
	/**
	 * 数据统计接口_图文分析数据接口_获取消息分送分时数据(录入数据库)(表：wxinterface_yqfbwx_upstreammsghour)
	 * 时间跨度1
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsgHour(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsgHour> upStreamMsgHourList = getUpStreamMsgHour(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (UpStreamMsgHour asl : upStreamMsgHourList) {
		
			System.out.println(String.format("数据的日期：%s 分时: %d 消息类型: %d 上行发送了（向公众号发送了）消息的用户数: %d  上行发送了消息的消息总数: %d", asl.getRef_date(),asl.getRef_hour(), asl.getMsg_type(), asl.getMsg_user(),asl.getMsg_count()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_upstreammsghour where ref_date='"+asl.getRef_date()+"' and ref_hour="+asl.getRef_hour()+"  and msg_type="+asl.getMsg_type()+" ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_upstreammsghour(ref_date,ref_hour,msg_type,msg_user,msg_count) values('"+asl.getRef_date()+"',"+asl.getRef_hour()+","+asl.getMsg_type()+","+asl.getMsg_user()+","+asl.getMsg_count()+")";
					db.executeInsert(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送周数据(录入数据库)(表：wxinterface_yqfbwx_upstreammsgweek)
	 * 时间跨度30
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsgWeek(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsgWeek> upStreamMsgWeekList = getUpStreamMsgWeek(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (UpStreamMsgWeek asl : upStreamMsgWeekList) {
		
			
			System.out.println(String.format("数据的日期：%s  消息类型: %d 上行发送了（向公众号发送了）消息的用户数: %d  上行发送了消息的消息总数: %d", asl.getRef_date(), asl.getMsg_type(), asl.getMsg_user(),asl.getMsg_count()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_upstreammsgweek where ref_date='"+asl.getRef_date()+"' and msg_type="+asl.getMsg_type()+" ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_upstreammsgweek(ref_date,msg_type,msg_user,msg_count) values('"+asl.getRef_date()+"',"+asl.getMsg_type()+","+asl.getMsg_user()+","+asl.getMsg_count()+")";
					db.executeInsert(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	

	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送月数据(录入数据库)(表：wxinterface_yqfbwx_upstreammsgmonth)
	 * 时间跨度30
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsgMonth(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsgMonth> upStreamMsgMonthList = getUpStreamMsgMonth(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (UpStreamMsgMonth asl : upStreamMsgMonthList) {
		
			
			System.out.println(String.format("数据的日期：%s  消息类型: %d 上行发送了（向公众号发送了）消息的用户数: %d  上行发送了消息的消息总数: %d", asl.getRef_date(), asl.getMsg_type(), asl.getMsg_user(),asl.getMsg_count()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_upstreammsgmonth where ref_date='"+asl.getRef_date()+"' and msg_type="+asl.getMsg_type()+" ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_upstreammsgmonth(ref_date,msg_type,msg_user,msg_count) values('"+asl.getRef_date()+"',"+asl.getMsg_type()+","+asl.getMsg_user()+","+asl.getMsg_count()+")";
					db.executeInsert(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送分布数据(录入数据库)(表：wxinterface_yqfbwx_upstreammsgdist)
	 * 时间跨度15
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsgDist(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsgDist> upStreamMsgDistList = getUpStreamMsgDist(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (UpStreamMsgDist asl : upStreamMsgDistList) {
		
			
			System.out.println(String.format("数据的日期：%s  当日发送消息量分布的区间: %d 上行发送了（向公众号发送了）消息的用户数: %d ", asl.getRef_date(), asl.getCount_interval(), asl.getMsg_user()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_upstreammsgdist where ref_date='"+asl.getRef_date()+"' and count_interval="+asl.getCount_interval()+" ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_upstreammsgdist(ref_date,count_interval,msg_user) values('"+asl.getRef_date()+"',"+asl.getCount_interval()+","+asl.getMsg_user()+")";
					db.executeInsert(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送分布周数据(录入数据库)(表：wxinterface_yqfbwx_upstreammsgdistweek)
	 * 时间跨度30
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsgDistWeek(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsgDistWeek> upStreamMsgDistWeekList = getUpStreamMsgDistWeek(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (UpStreamMsgDistWeek asl : upStreamMsgDistWeekList) {
		
			
			System.out.println(String.format("数据的日期：%s  当日发送消息量分布的区间: %d 上行发送了（向公众号发送了）消息的用户数: %d ", asl.getRef_date(), asl.getCount_interval(), asl.getMsg_user()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_upstreammsgdistweek where ref_date='"+asl.getRef_date()+"' and count_interval="+asl.getCount_interval()+" ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_upstreammsgdistweek(ref_date,count_interval,msg_user) values('"+asl.getRef_date()+"',"+asl.getCount_interval()+","+asl.getMsg_user()+")";
					db.executeInsert(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	/**
	 * 数据统计接口_消息分析数据接口_获取消息发送分布月数据(录入数据库)(表：wxinterface_yqfbwx_upstreammsgdistmonth)
	 * 时间跨度30
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsgDistMonth(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsgDistMonth> upStreamMsgDistMonthList = getUpStreamMsgDistMonth(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (UpStreamMsgDistMonth asl : upStreamMsgDistMonthList) {
		
			
			System.out.println(String.format("数据的日期：%s  当日发送消息量分布的区间: %d 上行发送了（向公众号发送了）消息的用户数: %d ", asl.getRef_date(), asl.getCount_interval(), asl.getMsg_user()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_upstreammsgdistmonth where ref_date='"+asl.getRef_date()+"' and count_interval="+asl.getCount_interval()+" ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_upstreammsgdistmonth(ref_date,count_interval,msg_user) values('"+asl.getRef_date()+"',"+asl.getCount_interval()+","+asl.getMsg_user()+")";
					db.executeInsert(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	/**
	 * 数据统计接口_接口分析数据接口_获取接口分析数据(录入数据库)(表：wxinterface_yqfbwx_interfacesummary)
	 * 时间跨度30
	 * @throws ParseException 
	 */
	public void idb_getInterfaceSummary(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<InterfaceSummary> interfaceSummaryList = getInterfaceSummary(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (InterfaceSummary asl : interfaceSummaryList) {
		
			
			System.out.println(String.format("数据的日期：%s  通过服务器配置地址获得消息后，被动回复用户消息的次数: %d 上述动作的失败次数: %d 总耗时: %d 最大耗时: %d", asl.getRef_date(), asl.getCallback_count(),asl.getFail_count(),asl.getTotal_time_cost(),asl.getMax_time_cost()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_interfacesummary where ref_date='"+asl.getRef_date()+"' ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_interfacesummary(ref_date,callback_count,fail_count,total_time_cost,max_time_cost) values('"+asl.getRef_date()+"',"+asl.getCallback_count()+","+asl.getFail_count()+","+asl.getTotal_time_cost()+","+asl.getMax_time_cost()+")";
					db.executeInsert(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	/**
	 * 数据统计接口_接口分析数据接口_获取接口分析分时数据(录入数据库)(表：wxinterface_yqfbwx_interfacesummaryhour)
	 * 时间跨度30
	 * @throws ParseException 
	 */
	public void idb_getInterfaceSummaryHour(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<InterfaceSummaryHour> interfaceSummaryHourList = getInterfaceSummaryHour(accessToken,begin_date,end_date);
		// 循环输出各分组信息
		

		for (InterfaceSummaryHour asl : interfaceSummaryHourList) {
		
			
			System.out.println(String.format("数据的日期：%s  通过服务器配置地址获得消息后，被动回复用户消息的次数: %d 上述动作的失败次数: %d 总耗时: %d 最大耗时: %d", asl.getRef_date(), asl.getCallback_count(),asl.getFail_count(),asl.getTotal_time_cost(),asl.getMax_time_cost()));
			
			
			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_interfacesummaryhour where ref_date='"+asl.getRef_date()+"' and ref_hour="+asl.getRef_hour()+" ";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_interfacesummaryhour(ref_date,ref_hour,callback_count,fail_count,total_time_cost,max_time_cost) values('"+asl.getRef_date()+"',"+asl.getRef_hour()+","+asl.getCallback_count()+","+asl.getFail_count()+","+asl.getTotal_time_cost()+","+asl.getMax_time_cost()+")";
					db.executeInsert(sql2);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}

	public static void main(String args[]) throws ParseException {
		// 获取接口访问凭证
		//String accessToken = CommonUtil.getToken("APPID", "APPSECRET").getAccessToken();
		//String accessToken = CommonUtil.getToken(AllValus.appid, AllValus.appsecret).getAccessToken();

		String accessToken = WeixinChaOpenId.GetDBAccessToken(""+AllValus.memo+"");
		
	    System.out.println("token= "+accessToken);
		
		
		
		//测试
		AdvancedUtil adu = new AdvancedUtil();
		
		//adu.GetShareFileName3(accessToken,);
		
		
		adu.idb_getUserSummary(accessToken,"2016-04-17","2016-04-17"); //最大时间跨度 7
		adu.idb_getUserCumulate(accessToken,"2016-04-17","2016-04-17"); //最大时间跨度 7
		adu.idb_getArticleSummary(accessToken,"2016-04-17","2016-04-17"); //最大时间跨度 1
		adu.idb_getArticleTotal(accessToken,"2016-04-18","2016-04-18");//最大时间跨度 1
		adu.idb_getUserRead(accessToken,"2016-04-17","2016-04-17"); //最大时间跨度 3
		adu.idb_getUserReadHour(accessToken,"2016-04-17","2016-04-17"); //最大时间跨度 1 
		adu.idb_getUserShare(accessToken,"2016-04-17","2016-04-17"); //最大时间跨度 7
		adu.idb_getUserShareHour(accessToken,"2016-04-17","2016-04-17"); //最大时间跨度 1

		
		/**
		 * 发送客服消息（文本消息）
		
		// 组装文本客服消息
		String jsonTextMsg = makeTextCustomMessage("oEdzejiHCDqafJbz4WNJtWTMbDcE", "点击查看<a href=\"http://blog.csdn.net/lyq8479\">柳峰的博客</a>");
		// 发送客服消息
		sendCustomMessage(accessToken, jsonTextMsg);
 */
		/**
		 * 发送客服消息（图文消息）
		 
		Article article1 = new Article();
		article1.setTitle("微信上也能斗地主");
		article1.setDescription("");
		article1.setPicUrl("http://www.egouji.com/xiaoq/game/doudizhu_big.png");
		article1.setUrl("http://resource.duopao.com/duopao/games/small_games/weixingame/Doudizhu/doudizhu.htm");
		Article article2 = new Article();
		article2.setTitle("傲气雄鹰\n80后不得不玩的经典游戏");
		article2.setDescription("");
		article2.setPicUrl("http://www.egouji.com/xiaoq/game/aoqixiongying.png");
		article2.setUrl("http://resource.duopao.com/duopao/games/small_games/weixingame/Plane/aoqixiongying.html");
		List<Article> list = new ArrayList<Article>();
		list.add(article1);
		list.add(article2);
		// 组装图文客服消息
		String jsonNewsMsg = makeNewsCustomMessage("oEdzejiHCDqafJbz4WNJtWTMbDcE", list);
		// 发送客服消息
		sendCustomMessage(accessToken, jsonNewsMsg);
*/
		/**
		 * 创建临时二维码
		 
		WeixinQRCode weixinQRCode = createTemporaryQRCode(accessToken, 900, 111111);
		// 临时二维码的ticket
		System.out.println(weixinQRCode.getTicket());
		// 临时二维码的有效时间
		System.out.println(weixinQRCode.getExpireSeconds());
*/
		/**
		 * 根据ticket换取二维码
		
		String ticket = "gQEg7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2lIVVJ3VmJsTzFsQ0ZuQ0Y1bG5WAAIEW35+UgMEAAAAAA==";
		String savePath = "G:/download";
		// 根据ticket换取二维码
		getQRCode(ticket, savePath);
 */
		/**
		 * 获取用户信息
		 */
		WeixinUserInfo user = getUserInfo(accessToken, "odQ9Pt2ixPiHd8JSbLz9ytWzkIN4");
		System.out.println("OpenID：" + user.getOpenId());
		System.out.println("关注状态：" + user.getSubscribe());
		System.out.println("关注时间：" + user.getSubscribeTime());
		System.out.println("昵称：" + user.getNickname());
		System.out.println("性别：" + user.getSex());
		System.out.println("国家：" + user.getCountry());
		System.out.println("省份：" + user.getProvince());
		System.out.println("城市：" + user.getCity());
		System.out.println("语言：" + user.getLanguage());
		System.out.println("头像：" + user.getHeadImgUrl());

		/**
		 * 获取关注者列表
		 */
		WeixinUserList weixinUserList = getUserList(accessToken, "");
		System.out.println("总关注用户数：" + weixinUserList.getTotal());
		System.out.println("本次获取用户数：" + weixinUserList.getCount());
		System.out.println("OpenID列表：" + weixinUserList.getOpenIdList().toString());
		System.out.println("next_openid：" + weixinUserList.getNextOpenId());

		/**
		 * 将用户 opendID 写入SQL_SERVER2000数据库
		 */
		
		WeixinChaOpenId.ChaOpenId(weixinUserList.getOpenIdList());
		
		/**
		 * 查询分组
		 */
		List<WeixinGroup> groupList = getGroups(accessToken);
		// 循环输出各分组信息
		for (WeixinGroup group : groupList) {
			System.out.println(String.format("ID：%d 名称：%s 用户数：%d", group.getId(), group.getName(), group.getCount()));
		}

		
		
		/**
		 * 创建分组
		
		WeixinGroup group = createGroup(accessToken, "公司员工");
		System.out.println(String.format("成功创建分组：%s id：%d", group.getName(), group.getId()));
 */
		/**
		 * 修改分组名
		 
		updateGroup(accessToken, 100, "同事");
*/
		/**
		 * 移动用户分组
		 
		updateMemberGroup(accessToken, "oEdzejiHCDqafJbz4WNJtWTMbDcE", 100);
*/
		/**
		 * 上传多媒体文件
		
		
		//WeixinMedia weixinMedia = uploadMedia(accessToken, "voice", "http://localhost:8080/weixinmpapi/test.mp3");
		WeixinMedia weixinMedia = uploadMedia(accessToken, "image", "http://avatar.csdn.net/9/B/F/1_jspping.jpg");
		System.out.println(weixinMedia.getMediaId());
		System.out.println(weixinMedia.getType());
		System.out.println(weixinMedia.getCreatedAt());
		 */
		/**
		 * 下载多媒体文件
		 
		//getMedia(accessToken, "N7xWhOGYSLWUMPzVcGnxKFbhXeD_lLT5sXxyxDGEsCzWIB2CcUijSeQOYjWLMpcn", "G:/download");
		//getMedia(accessToken, weixinMedia.getMediaId(), "d:/工作用临时文件夹/书香乐清/download");
		getMedia(accessToken, weixinMedia.getMediaId(), "D:/website/yqrb/Yqvod/bmwj/asp/sxbook/download");
		*/
	}
	
	
    //根据 MediaId 获取 下载的 文件名
	public static String GetShareFileName(String MediaId,String openid){
		
		String accessToken = WeixinChaOpenId.GetDBAccessToken("书香乐清");
		String wjm = "";
		
	    try {
			
	    	sql_data db = new sql_data();
	    	String sql ="select img1 from sxbook_bm where img1<>'' and openid='"+openid+"' ";
	    	ResultSet rs =  db.executeQuery(sql);
	    	if (rs.next()) { //数据库中有 img1 数据 (不是 空白的 )
	    		String fileName = AllValus.downloadpath+rs.getString(1);
	    		System.out.println(fileName);       
	            DeleteFileUtil.deleteFile(fileName);  //先删除原来的文件
	            wjm=getMedia2(accessToken, MediaId, "D:/website/yqrb/Yqvod/bmwj/asp/sxbook/download"); //再下载微信的图片到服务器得到文件名
			}else {  //数据库中没有 写入img1数据 ,不用删除文件 ，直接下载
				wjm=getMedia2(accessToken, MediaId, "D:/website/yqrb/Yqvod/bmwj/asp/sxbook/download"); //下载微信的图片到服务器得到文件名

			}
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return wjm;

	}
	
	
	
	

    //根据 MediaId 获取 下载的 文件名 (乐清发布) 上传下载
	public static String GetShareFileName2(String MediaId,String openid){
		
		String accessToken = WeixinChaOpenId.GetDBAccessToken("乐清发布");
		String wjm = "";
		
	    try {
			
	    	sql_data db = new sql_data();
	    	String sql ="select img1 from yqfbwx_face where img1<>'' and openid='"+openid+"' ";
	    	System.out.println(sql);
	    	ResultSet rs =  db.executeQuery(sql);
	    	if (rs.next()) { //数据库中有 img1 数据 (不是 空白的 )
	    		//String fileName = AllValus.downloadpath+rs.getString(1);
	    		//System.out.println(fileName);       
	          //  DeleteFileUtil.deleteFile(fileName);  //先删除原来的文件
	            wjm=getMedia2(accessToken, MediaId, AllValus.downloadpath); //再下载微信的图片到服务器得到文件名
			}else {  //数据库中没有 写入img1数据 ,不用删除文件 ，直接下载
				wjm=getMedia2(accessToken, MediaId, AllValus.downloadpath); //下载微信的图片到服务器得到文件名
			}
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return wjm;

	}
	
	
	 //根据 MediaId 获取 下载的 文件名
	public static String GetShareFileName3(String MediaId,String openid){
		
		String accessToken = WeixinChaOpenId.GetDBAccessToken("乐清发布");
		String wjm = "";
		
	    try {
			
	    	sql_data db = new sql_data();
	    	String sql ="select img1 from yqcnwx_lp_up where img1<>'' and openid='"+openid+"' ";
	    	ResultSet rs =  db.executeQuery(sql);
	    	if (rs.next()) { //数据库中有 img1 数据 (不是 空白的 )
	    		
	    		String fileName = AllValus.downloadpath2+rs.getString(1);
	    		System.out.println(fileName);       
	            DeleteFileUtil.deleteFile(fileName);  //先删除原来的文件
	            wjm=getMedia2(accessToken, MediaId, AllValus.downloadpath2); //再下载微信的图片到服务器得到文件名
	            
			}else {  //数据库中没有 写入img1数据 ,不用删除文件 ，直接下载
				
				wjm=getMedia2(accessToken, MediaId, AllValus.downloadpath2); //下载微信的图片到服务器得到文件名

			}
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
				
		return wjm;

		
	}
	
	
	 //根据 MediaId 获取 下载的 文件名 (乐清发布) 上传下载(经过处理过的)
	public static String GetShareFileName4(String MediaId,String openid){
		
		String img2 ="";
		
		try {
			String accessToken = WeixinChaOpenId.GetDBAccessToken(""+AllValus.memo+"");
			String wjm= getMedia3(accessToken, MediaId, AllValus.downloadpath3); //下载微信图片到服务器得到文件名
			//压缩开始
			
			String fromPicName = AllValus.downloadpath3+wjm;  //压缩路径文件名
			img2 = "ys_"+wjm;  
			String toPicName =  AllValus.downloadpath3+img2;//压缩后路径文件名
			ThumbTest Ys = new ThumbTest();
			Ys.testHandlePicture3(fromPicName,toPicName);//压缩图片处理
			DeleteFileUtil.deleteFile(fromPicName);//删除原图
		} catch (Exception e) {
			e.printStackTrace();
		}
		//压缩完成
		
		return img2;
		
	}
	
	
	/**
	 * 图文消息留言管理接口
	 * 查看指定文章的评论数据
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<WeixinCommentList> getCommentList(String accessToken, String msg_data_id, int index, int begin, int count,int type) {
		List<WeixinCommentList> weixinCommentList = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/comment/list?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		
		String jsonData = "{\"msg_data_id\":\"%s\",\"index\":\"%d\",\"begin\":\"%d\",\"count\":\"%d\",\"type\":\"%d\"}";
		

		// 获取用户增减数据
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, msg_data_id, index,begin,count,type));

		if (null != jsonObject) {
			try {
				
				//weixinUserInfo.setCountry(jsonObject.getString("country"));
				
				weixinCommentList = JSONArray.toList(jsonObject.getJSONArray("comment"), WeixinCommentList.class);
				
			} catch (JSONException e) {
				weixinCommentList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("获取指定文章的评论数据列表 errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return weixinCommentList;
	}
	
	
	
	
	
	/**
	 * 图文消息留言管理接口
	 * 查看指定文章的评论数据
	 * @throws ParseException 
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public void idb_getWeixincommentList(String accessToken, String msg_data_id, int index, int begin, int count,int type) throws ParseException{
		
		List<WeixinCommentList> weixinCommentlList = getCommentList(accessToken,msg_data_id,index,begin,count,type);
		
		// 循环输出各分组信息

		for (WeixinCommentList wcl : weixinCommentlList) {
		
			System.out.println(String.format("用户评论id ：%s 评论内容：%s ", wcl.getUser_comment_id(), wcl.getContent()));

			try {
				
				
				sql_data db = new sql_data();
				String sql = "select * from wxinterface_yqfbwx_commentlist where user_comment_id ="+wcl.getUser_comment_id()+" and create_time='"+wcl.getCreate_time()+"'";
				System.out.println(sql);
				ResultSet rs = db.executeQuery(sql);
				if (!rs.next()) {
				
					String sql2 = "insert into wxinterface_yqfbwx_commentlist(user_comment_id,openid,create_time,content,comment_type) values('"+wcl.getUser_comment_id()+"','"+wcl.getOpenid()+"','"+wcl.getCreate_time()+"','"+wcl.getContent()+"',"+wcl.getComment_type()+")";
					db.executeInsert(sql2);
					
					ResultSet rs2 = db.executeQuery("select top 1 id from wxinterface_yqfbwx_commentlist order by id desc");
					int fid =0;
					if (rs2.next()) {
						fid = rs2.getInt(1);
					}
					
					List<Reply> at2 = wcl.getReply();
					
					for (int i = 0; i < at2.size(); i++) {
			
						
						System.out.println("details:"+ at2.get(i));
						
						
						JSONArray jsonArray = JSONArray.fromObject(at2.get(i));
						Map<String, Class> classMap = new HashMap<String, Class>();
						classMap.put("details", Reply.class);
						List<Reply> atalList = (List<Reply>)JSONArray.toList(jsonArray, Reply.class,classMap);
						for (int j = 0; j < atalList.size(); j++) {
							
							System.out.println("getAround_create_time: "+atalList.get(j).getCreate_time());
							
							String sql3 = "insert into wxinterface_yqfbwx_commentlist2(fid,content,create_time) values("+fid+",'"+atalList.get(j).getContent()+"','"+atalList.get(j).getCreate_time()+"')";
							
							System.out.println(sql3);
							db.executeInsert(sql3);
						}
							
					}
				
				}

				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
		}

	}
	
	

	
}
