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
 * �߼��ӿڹ�����
 * 
 * @author liufeng
 * @date 2013-11-9
 */
public class AdvancedUtil {
	private static Logger log = LoggerFactory.getLogger(AdvancedUtil.class);

	/**
	 * ��װ�ı��ͷ���Ϣ
	 * 
	 * @param openId ��Ϣ���Ͷ���
	 * @param content �ı���Ϣ����
	 * @return
	 */
	public static String makeTextCustomMessage(String openId, String content) {
		// ����Ϣ�����е�˫���Ž���ת��
		content = content.replace("\"", "\\\"");
		String jsonMsg = "{\"touser\":\"%s\",\"msgtype\":\"text\",\"text\":{\"content\":\"%s\"}}";
		return String.format(jsonMsg, openId, content);
	}

	/**
	 * ��װͼƬ�ͷ���Ϣ
	 * 
	 * @param openId ��Ϣ���Ͷ���
	 * @param mediaId ý���ļ�id
	 * @return
	 */
	public static String makeImageCustomMessage(String openId, String mediaId) {
		String jsonMsg = "{\"touser\":\"%s\",\"msgtype\":\"image\",\"image\":{\"media_id\":\"%s\"}}";
		return String.format(jsonMsg, openId, mediaId);
	}

	/**
	 * ��װ�����ͷ���Ϣ
	 * 
	 * @param openId ��Ϣ���Ͷ���
	 * @param mediaId ý���ļ�id
	 * @return
	 */
	public static String makeVoiceCustomMessage(String openId, String mediaId) {
		String jsonMsg = "{\"touser\":\"%s\",\"msgtype\":\"voice\",\"voice\":{\"media_id\":\"%s\"}}";
		return String.format(jsonMsg, openId, mediaId);
	}

	/**
	 * ��װ��Ƶ�ͷ���Ϣ
	 * 
	 * @param openId ��Ϣ���Ͷ���
	 * @param mediaId ý���ļ�id
	 * @param thumbMediaId ��Ƶ��Ϣ����ͼ��ý��id
	 * @return
	 */
	public static String makeVideoCustomMessage(String openId, String mediaId, String thumbMediaId) {
		String jsonMsg = "{\"touser\":\"%s\",\"msgtype\":\"video\",\"video\":{\"media_id\":\"%s\",\"thumb_media_id\":\"%s\"}}";
		return String.format(jsonMsg, openId, mediaId, thumbMediaId);
	}

	/**
	 * ��װ���ֿͷ���Ϣ
	 * 
	 * @param openId ��Ϣ���Ͷ���
	 * @param music ���ֶ���
	 * @return
	 */
	public static String makeMusicCustomMessage(String openId, Music music) {
		String jsonMsg = "{\"touser\":\"%s\",\"msgtype\":\"music\",\"music\":%s}";
		jsonMsg = String.format(jsonMsg, openId, JSONObject.fromObject(music).toString());
		// ��jsonMsg�е�thumbmediaid�滻Ϊthumb_media_id
		jsonMsg = jsonMsg.replace("thumbmediaid", "thumb_media_id");
		return jsonMsg;
	}

	/**
	 * ��װͼ�Ŀͷ���Ϣ
	 * 
	 * @param openId ��Ϣ���Ͷ���
	 * @param articleList ͼ����Ϣ�б�
	 * @return
	 */
	public static String makeNewsCustomMessage(String openId, List<Article> articleList) {
		String jsonMsg = "{\"touser\":\"%s\",\"msgtype\":\"news\",\"news\":{\"articles\":%s}}";
		jsonMsg = String.format(jsonMsg, openId, JSONArray.fromObject(articleList).toString().replaceAll("\"", "\\\""));
		// ��jsonMsg�е�picUrl�滻Ϊpicurl
		jsonMsg = jsonMsg.replace("picUrl", "picurl");
		return jsonMsg;
	}

	/**
	 * ���Ϳͷ���Ϣ
	 * 
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param jsonMsg json��ʽ�Ŀͷ���Ϣ������touser��msgtype����Ϣ���ݣ�
	 * @return true | false
	 */
	public static boolean sendCustomMessage(String accessToken, String jsonMsg) {
		log.info("��Ϣ���ݣ�{}", jsonMsg);
		boolean result = false;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ���Ϳͷ���Ϣ
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", jsonMsg);

		if (null != jsonObject) {
			int errorCode = jsonObject.getInt("errcode");
			String errorMsg = jsonObject.getString("errmsg");
			if (0 == errorCode) {
				result = true;
				log.info("�ͷ���Ϣ���ͳɹ� errcode:{} errmsg:{}", errorCode, errorMsg);
			} else {
				log.error("�ͷ���Ϣ����ʧ�� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}

		return result;
	}

	/**
	 * ��ȡ��ҳ��Ȩƾ֤
	 * 
	 * @param appId �����˺ŵ�Ψһ��ʶ
	 * @param appSecret �����˺ŵ���Կ
	 * @param code
	 * @return WeixinAouth2Token
	 */
	public static WeixinOauth2Token getOauth2AccessToken(String appId, String appSecret, String code) {
		WeixinOauth2Token wat = null;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
		//String requestUrl ="https://api.weixin.qq.com/sns/oauth2/component/access_token?appid=APPID&code=CODE&grant_type=authorization_code&component_appid=COMPONENT_APPID&component_access_token=COMPONENT_ACCESS_TOKEN";
		requestUrl = requestUrl.replace("APPID", appId);
		requestUrl = requestUrl.replace("SECRET", appSecret);
		requestUrl = requestUrl.replace("CODE", code);
		
		// ��ȡ��ҳ��Ȩƾ֤
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);
		if (null != jsonObject) {
			try {
				wat = new WeixinOauth2Token();
				System.out.println("ʱ��:"+TimeString.nowTime());
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
				log.error("��ȡ��ҳ��Ȩƾ֤ʧ�� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return wat;
	}
	
	
	//�Լ������Ļ�ȡ��ҳƾ֤
	


	/**
	 * ˢ����ҳ��Ȩƾ֤
	 * 
	 * @param appId �����˺ŵ�Ψһ��ʶ
	 * @param refreshToken
	 * @return WeixinAouth2Token
	 */
	public static WeixinOauth2Token refreshOauth2AccessToken(String appId, String refreshToken) {
		WeixinOauth2Token wat = null;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN";
		requestUrl = requestUrl.replace("APPID", appId);
		requestUrl = requestUrl.replace("REFRESH_TOKEN", refreshToken);
		// ˢ����ҳ��Ȩƾ֤
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
				log.error("ˢ����ҳ��Ȩƾ֤ʧ�� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return wat;
	}

	/**
	 * ͨ����ҳ��Ȩ��ȡ�û���Ϣ
	 * 
	 * @param accessToken ��ҳ��Ȩ�ӿڵ���ƾ֤
	 * @param openId �û���ʶ
	 * @return SNSUserInfo
	 */
	@SuppressWarnings( { "deprecation", "unchecked" })
	public static SNSUserInfo getSNSUserInfo(String accessToken, String openId) {
		SNSUserInfo snsUserInfo = null;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("OPENID", openId);
		// ͨ����ҳ��Ȩ��ȡ�û���Ϣ
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);

		if (null != jsonObject) {
			try {
				snsUserInfo = new SNSUserInfo();
				// �û��ı�ʶ
				snsUserInfo.setOpenId(jsonObject.getString("openid"));
				// �ǳ�
				snsUserInfo.setNickname(jsonObject.getString("nickname"));
				// �Ա�1�����ԣ�2��Ů�ԣ�0��δ֪��
				snsUserInfo.setSex(jsonObject.getInt("sex"));
				// �û����ڹ���
				snsUserInfo.setCountry(jsonObject.getString("country"));
				// �û�����ʡ��
				snsUserInfo.setProvince(jsonObject.getString("province"));
				// �û����ڳ���
				snsUserInfo.setCity(jsonObject.getString("city"));
				// �û�ͷ��
				snsUserInfo.setHeadImgUrl(jsonObject.getString("headimgurl"));
				// �û���Ȩ��Ϣ
				snsUserInfo.setPrivilegeList(JSONArray.toList(jsonObject.getJSONArray("privilege"), List.class));
				//
				
			} catch (Exception e) {
				snsUserInfo = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡ�û���Ϣʧ�� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return snsUserInfo;
	}

	/**
	 * ������ʱ���ζ�ά��
	 * 
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param expireSeconds ��ά����Чʱ�䣬��λΪ�룬��󲻳���1800
	 * @param sceneId ����ID
	 * @return WeixinQRCode
	 */
	public static WeixinQRCode createTemporaryQRCode(String accessToken, int expireSeconds, int sceneId) {
		WeixinQRCode weixinQRCode = null;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		String jsonMsg = "{\"expire_seconds\": %d, \"action_name\": \"QR_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": %d}}}";
		// ������ʱ���ζ�ά��
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonMsg, expireSeconds, sceneId));

		if (null != jsonObject) {
			try {
				weixinQRCode = new WeixinQRCode();
				weixinQRCode.setTicket(jsonObject.getString("ticket"));
				weixinQRCode.setExpireSeconds(jsonObject.getInt("expire_seconds"));
				log.info("������ʱ���ζ�ά��ɹ� ticket:{} expire_seconds:{}", weixinQRCode.getTicket(), weixinQRCode.getExpireSeconds());
			} catch (Exception e) {
				weixinQRCode = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("������ʱ���ζ�ά��ʧ�� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return weixinQRCode;
	}

	/**
	 * �������ô��ζ�ά��
	 * 
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param sceneId ����ID
	 * @return ticket
	 */
	public static String createPermanentQRCode(String accessToken, int sceneId) {
		String ticket = null;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		String jsonMsg = "{\"action_name\": \"QR_LIMIT_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": %d}}}";
		// �������ô��ζ�ά��
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonMsg, sceneId));

		if (null != jsonObject) {
			try {
				ticket = jsonObject.getString("ticket");
				log.info("�������ô��ζ�ά��ɹ� ticket:{}", ticket);
			} catch (Exception e) {
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("�������ô��ζ�ά��ʧ�� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return ticket;
	}

	/**
	 * ����ticket��ȡ��ά��
	 * 
	 * @param ticket ��ά��ticket
	 * @param savePath ����·��
	 */
	public static String getQRCode(String ticket, String savePath) {
		String filePath = null;
		// ƴ�������ַ
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
			// ��ticket��Ϊ�ļ���
			filePath = savePath + ticket + ".jpg";

			// ��΢�ŷ��������ص�������д���ļ�
			BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
			FileOutputStream fos = new FileOutputStream(new File(filePath));
			byte[] buf = new byte[8096];
			int size = 0;
			while ((size = bis.read(buf)) != -1)
				fos.write(buf, 0, size);
			fos.close();
			bis.close();

			conn.disconnect();
			log.info("����ticket��ȡ��ά��ɹ���filePath=" + filePath);
		} catch (Exception e) {
			filePath = null;
			log.error("����ticket��ȡ��ά��ʧ�ܣ�{}", e);
		}
		return filePath;
	}

	/**
	 * ��ȡ�û���Ϣ
	 * 
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param openId �û���ʶ
	 * @return WeixinUserInfo
	 */
	public static WeixinUserInfo getUserInfo(String accessToken, String openId) {
		WeixinUserInfo weixinUserInfo = null;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("OPENID", openId);
		// ��ȡ�û���Ϣ
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);

		if (null != jsonObject) {
			try {
				weixinUserInfo = new WeixinUserInfo();
				// �û��ı�ʶ
				weixinUserInfo.setOpenId(jsonObject.getString("openid"));
				// ��ע״̬��1�ǹ�ע��0��δ��ע����δ��עʱ��ȡ����������Ϣ
				weixinUserInfo.setSubscribe(jsonObject.getInt("subscribe"));
				// �û���עʱ��
				weixinUserInfo.setSubscribeTime(jsonObject.getString("subscribe_time"));
				// �ǳ�
				weixinUserInfo.setNickname(jsonObject.getString("nickname"));
				// �û����Ա�1�����ԣ�2��Ů�ԣ�0��δ֪��
				weixinUserInfo.setSex(jsonObject.getInt("sex"));
				// �û����ڹ���
				weixinUserInfo.setCountry(jsonObject.getString("country"));
				// �û�����ʡ��
				weixinUserInfo.setProvince(jsonObject.getString("province"));
				// �û����ڳ���
				weixinUserInfo.setCity(jsonObject.getString("city"));
				// �û������ԣ���������Ϊzh_CN
				weixinUserInfo.setLanguage(jsonObject.getString("language"));
				// �û�ͷ��
				weixinUserInfo.setHeadImgUrl(jsonObject.getString("headimgurl"));
			} catch (Exception e) {
				if (0 == weixinUserInfo.getSubscribe()) {
					log.error("�û�{}��ȡ����ע", weixinUserInfo.getOpenId());
				} else {
					int errorCode = jsonObject.getInt("errcode");
					String errorMsg = jsonObject.getString("errmsg");
					log.error("��ȡ�û���Ϣʧ�� errcode:{} errmsg:{}", errorCode, errorMsg);
				}
			}
		}
		return weixinUserInfo;
	}

	/**
	 * ��ȡ��ע���б�
	 * 
	 * @param accessToken ���ýӿ�ƾ֤
	 * @param nextOpenId ��һ����ȡ��openId������Ĭ�ϴ�ͷ��ʼ��ȡ
	 * @return WeixinUserList
	 */
	@SuppressWarnings( { "unchecked", "deprecation" })
	public static WeixinUserList getUserList(String accessToken, String nextOpenId) {
		WeixinUserList weixinUserList = null;

		if (null == nextOpenId)
			nextOpenId = "";

		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("NEXT_OPENID", nextOpenId);
		// ��ȡ��ע���б�
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);
		// �������ɹ�
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
				log.error("��ȡ��ע���б�ʧ�� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return weixinUserList;
	}

	/**
	 * ��ѯ����
	 * 
	 * @param accessToken ���ýӿ�ƾ֤
	 */
	@SuppressWarnings( { "unchecked", "deprecation" })
	public static List<WeixinGroup> getGroups(String accessToken) {
		List<WeixinGroup> weixinGroupList = null;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/groups/get?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��ѯ����
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);

		if (null != jsonObject) {
			try {
				weixinGroupList = JSONArray.toList(jsonObject.getJSONArray("groups"), WeixinGroup.class);
			} catch (JSONException e) {
				weixinGroupList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ѯ����ʧ�� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return weixinGroupList;
	}

	/**
	 * ��������
	 * 
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	public static WeixinGroup createGroup(String accessToken, String groupName) {
		WeixinGroup weixinGroup = null;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/groups/create?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		String jsonData = "{\"group\" : {\"name\" : \"%s\"}}";
		// ��������
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
				log.error("��������ʧ�� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return weixinGroup;
	}

	/**
	 * �޸ķ�����
	 * 
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupId ����id
	 * @param groupName �޸ĺ�ķ�����
	 * @return true | false
	 */
	public static boolean updateGroup(String accessToken, int groupId, String groupName) {
		boolean result = false;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/groups/update?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		String jsonData = "{\"group\": {\"id\": %d, \"name\": \"%s\"}}";
		// �޸ķ�����
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, groupId, groupName));

		if (null != jsonObject) {
			int errorCode = jsonObject.getInt("errcode");
			String errorMsg = jsonObject.getString("errmsg");
			if (0 == errorCode) {
				result = true;
				log.info("�޸ķ������ɹ� errcode:{} errmsg:{}", errorCode, errorMsg);
			} else {
				log.error("�޸ķ�����ʧ�� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return result;
	}

	/**
	 * �ƶ��û�����
	 * 
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param openId �û���ʶ
	 * @param groupId ����id
	 * @return true | false
	 */
	public static boolean updateMemberGroup(String accessToken, String openId, int groupId) {
		boolean result = false;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/groups/members/update?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		String jsonData = "{\"openid\":\"%s\",\"to_groupid\":%d}";
		// �ƶ��û�����
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, openId, groupId));

		if (null != jsonObject) {
			int errorCode = jsonObject.getInt("errcode");
			String errorMsg = jsonObject.getString("errmsg");
			if (0 == errorCode) {
				result = true;
				log.info("�ƶ��û�����ɹ� errcode:{} errmsg:{}", errorCode, errorMsg);
			} else {
				log.error("�ƶ��û�����ʧ�� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return result;
	}

	/**
	 * �ϴ�ý���ļ�
	 * 
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param type ý���ļ����ͣ�image��voice��video��thumb��
	 * @param mediaFileUrl ý���ļ���url
	 */
	public static WeixinMedia uploadMedia(String accessToken, String type, String mediaFileUrl) {
		WeixinMedia weixinMedia = null;
		// ƴװ�����ַ
		String uploadMediaUrl = "http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
		uploadMediaUrl = uploadMediaUrl.replace("ACCESS_TOKEN", accessToken).replace("TYPE", type);

		// �������ݷָ���
		String boundary = "------------7da2e536604c8";
		try {
			URL uploadUrl = new URL(uploadMediaUrl);
			HttpURLConnection uploadConn = (HttpURLConnection) uploadUrl.openConnection();
			uploadConn.setDoOutput(true);
			uploadConn.setDoInput(true);
			uploadConn.setRequestMethod("POST");
			// ��������ͷContent-Type
			uploadConn.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);
			// ��ȡý���ļ��ϴ������������΢�ŷ�����д���ݣ�
			OutputStream outputStream = uploadConn.getOutputStream();

			URL mediaUrl = new URL(mediaFileUrl);
			HttpURLConnection meidaConn = (HttpURLConnection) mediaUrl.openConnection();
			meidaConn.setDoOutput(true);
			meidaConn.setRequestMethod("GET");

			// ������ͷ�л�ȡ��������
			String contentType = meidaConn.getHeaderField("Content-Type");
			// �������������ж��ļ���չ��
			String fileExt = CommonUtil.getFileExt(contentType);
			// �����忪ʼ
			outputStream.write(("--" + boundary + "\r\n").getBytes());
			outputStream.write(String.format("Content-Disposition: form-data; name=\"media\"; filename=\"file1%s\"\r\n", fileExt).getBytes());
			outputStream.write(String.format("Content-Type: %s\r\n\r\n", contentType).getBytes());

			// ��ȡý���ļ�������������ȡ�ļ���
			BufferedInputStream bis = new BufferedInputStream(meidaConn.getInputStream());
			byte[] buf = new byte[8096];
			int size = 0;
			while ((size = bis.read(buf)) != -1) {
				// ��ý���ļ�д�����������΢�ŷ�����д���ݣ�
				outputStream.write(buf, 0, size);
			}
			// ���������
			outputStream.write(("\r\n--" + boundary + "--\r\n").getBytes());
			outputStream.close();
			bis.close();
			meidaConn.disconnect();

			// ��ȡý���ļ��ϴ�������������΢�ŷ����������ݣ�
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
			// �ͷ���Դ
			inputStream.close();
			inputStream = null;
			uploadConn.disconnect();

			// ʹ��JSON-lib�������ؽ��
			JSONObject jsonObject = JSONObject.fromObject(buffer.toString());
			weixinMedia = new WeixinMedia();
			weixinMedia.setType(jsonObject.getString("type"));
			// type����thumbʱ�ķ��ؽ�����������Ͳ�һ��
			if ("thumb".equals(type))
				weixinMedia.setMediaId(jsonObject.getString("thumb_media_id"));
			else
				weixinMedia.setMediaId(jsonObject.getString("media_id"));
			weixinMedia.setCreatedAt(jsonObject.getInt("created_at"));
		} catch (Exception e) {
			weixinMedia = null;
			log.error("�ϴ�ý���ļ�ʧ�ܣ�{}", e);
		}
		return weixinMedia;
	}

	/**
	 * ����ý���ļ�
	 * 
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param mediaId ý���ļ���ʶ
	 * @param savePath �ļ��ڷ������ϵĴ洢·��
	 * @return
	 */
	public static String getMedia(String accessToken, String mediaId, String savePath) {
		String filePath = null;
		
		// ƴ�������ַ
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
			// �����������ͻ�ȡ��չ��
			String fileExt = CommonUtil.getFileExt(conn.getHeaderField("Content-Type"));
			// ��mediaId��Ϊ�ļ���
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
			log.info("����ý���ļ��ɹ���filePath=" + filePath);
		} catch (Exception e) {
			filePath = null;
			log.error("����ý���ļ�ʧ�ܣ�{}", e);
		}
		return filePath;
	}
	
	
	/**
	 * ����ý���ļ� (ֻ�õ� �ļ���)
	 * 
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param mediaId ý���ļ���ʶ
	 * @param savePath �ļ��ڷ������ϵĴ洢·��
	 * @return
	 */
	public static String getMedia2(String accessToken, String mediaId, String savePath) {
		String filePath = null;
		String filePath2 = null;
		String img2 = null;
		
		// ƴ�������ַ
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
			// �����������ͻ�ȡ��չ��
			String fileExt = CommonUtil.getFileExt(conn.getHeaderField("Content-Type"));
			// ��mediaId��Ϊ�ļ���
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
			log.info("����ý���ļ��ɹ���filePath=" + filePath2);
			
			
			//��Ӳ��ֿ�ʼ
			String fromPicName = savePath+filePath2;  //ѹ��·���ļ���
			img2 = "ys_"+filePath2;  
			String toPicName =  savePath+img2;//ѹ����·���ļ���
			ThumbTest Ys = new ThumbTest();
			Ys.testHandlePicture2(fromPicName,toPicName);//ѹ��ͼƬ����
			DeleteFileUtil.deleteFile(fromPicName);//ɾ��ԭͼ
			//��Ӳ������
			
		} catch (Exception e) {
			filePath = null;
			log.error("����ý���ļ�ʧ�ܣ�{}", e);
		}
		return img2;
	}
	
	
	public static String getMedia3(String accessToken, String mediaId, String savePath) {
		String filePath = null;
		String filePath2 = null;
		
		// ƴ�������ַ
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
			// �����������ͻ�ȡ��չ��
			String fileExt = CommonUtil.getFileExt(conn.getHeaderField("Content-Type"));
			// ��mediaId��Ϊ�ļ���
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
			log.info("����ý���ļ��ɹ���filePath=" + filePath2);
			
		} catch (Exception e) {
			filePath = null;
			log.error("����ý���ļ�ʧ�ܣ�{}", e);
		}
		return filePath2;
	}
	
	//**�Լ�д�Ľӿڷ���
	
	
	/**
	 * ����ͳ�ƽӿ�_�û��������ݽӿ�_��ȡ�û���������
	 * ʱ���� 7
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UserSummary> getUserSummary(String accessToken, String begin_date, String end_date) {
		List<UserSummary> userSummaryList = null;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getusersummary?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
				userSummaryList = JSONArray.toList(jsonObject.getJSONArray("list"), UserSummary.class);
			} catch (JSONException e) {
				userSummaryList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡ�û��������� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return userSummaryList;
	}
	
	
	/**
	 * ����ͳ�ƽӿ�_�û��������ݽӿ�_��ȡ�ۼ��û�����
	 * ʱ���� 7
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UserCumulate> getUserCumulate(String accessToken, String begin_date, String end_date) {
		List<UserCumulate> userCumulateList = null;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getusercumulate?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
				userCumulateList = JSONArray.toList(jsonObject.getJSONArray("list"), UserCumulate.class);
			} catch (JSONException e) {
				userCumulateList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡ�ۼ��û����� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return userCumulateList;
	}
	
	
	/**
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ��Ⱥ��ÿ������
	 * ʱ���� 1
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<ArticleSummary> getArticleSummary(String accessToken, String begin_date, String end_date) {
		List<ArticleSummary> articleSummaryList = null;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getarticlesummary?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
				articleSummaryList = JSONArray.toList(jsonObject.getJSONArray("list"), ArticleSummary.class);
			} catch (JSONException e) {
				articleSummaryList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡͼ��Ⱥ��ÿ������ errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return articleSummaryList;
	}
	
	
	/**
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ��Ⱥ��������
	 * ʱ���� 1
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<ArticleTotal> getArticleTotal(String accessToken, String begin_date, String end_date) {
		
		
		List<ArticleTotal> articleTotalList = null;
		

	
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getarticletotal?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
				
		
				articleTotalList = JSONArray.toList(jsonObject.getJSONArray("list"), ArticleTotal.class);
				
				
			} catch (JSONException e) {
				articleTotalList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡͼ��Ⱥ�������� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return articleTotalList;
	}
	
	
	/**
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ��ͳ������
	 * ʱ���� 3
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UserRead> getUserRead(String accessToken, String begin_date, String end_date) {
		
		
		List<UserRead> userReadList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getuserread?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				//System.out.println(jsonObject.getJSONArray("list"));
				userReadList = JSONArray.toList(jsonObject.getJSONArray("list"), UserRead.class);
				
				
			} catch (JSONException e) {
				userReadList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡͼ��ͳ������ errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return userReadList;
	}
	
	
	/**
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ��ͳ�Ʒ�ʱ����
	 * ʱ���� 1
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UserReadHour> getUserReadHour(String accessToken, String begin_date, String end_date) {
		
		
		List<UserReadHour> userReadHourList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getuserreadhour?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				userReadHourList = JSONArray.toList(jsonObject.getJSONArray("list"), UserReadHour.class);
				
				
			} catch (JSONException e) {
				userReadHourList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡͼ��ͳ�Ʒ�ʱ���� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return userReadHourList;
	}
	
	
	/**
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ�ķ���ת������
	 * ʱ���� 7
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UserShare> getUserShare(String accessToken, String begin_date, String end_date) {
		
		
		List<UserShare> userSharList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getusershare?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				//System.out.println(jsonObject.getJSONArray("list"));
				userSharList = JSONArray.toList(jsonObject.getJSONArray("list"), UserShare.class);
				
				
			} catch (JSONException e) {
				userSharList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡͼ�ķ���ת������ errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return userSharList;
	}
	
	/**
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ�ķ���ת����ʱ����
	 * ʱ���� 1
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UserShareHour> getUserShareHour(String accessToken, String begin_date, String end_date) {
		
		
		List<UserShareHour> userSharHourList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getusersharehour?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				userSharHourList = JSONArray.toList(jsonObject.getJSONArray("list"), UserShareHour.class);
				
				
			} catch (JSONException e) {
				userSharHourList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡͼ�ķ���ת����ʱ���� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return userSharHourList;
	}
	
	/**
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ���͸ſ�����
	 * ʱ���� 7
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsg> getUpStreamMsg(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsg> upStreamMsgList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsg?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				upStreamMsgList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsg.class);
				
				
			} catch (JSONException e) {
				upStreamMsgList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡ��Ϣ���͸ſ����� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgList;
	}
	
	/**
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ���͸ſ�����
	 * ʱ���� 1
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsgHour> getUpStreamMsgHour(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsgHour> upStreamMsgHourList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsghour?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				upStreamMsgHourList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsgHour.class);
				
				
			} catch (JSONException e) {
				upStreamMsgHourList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡ��Ϣ���ͷ�ʱ���� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgHourList;
	}
	
	

	/**
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ����������
	 * ʱ���� 30
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsgWeek> getUpStreamMsgWeek(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsgWeek> upStreamMsgHourList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsgweek?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				upStreamMsgHourList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsgWeek.class);
				
				
			} catch (JSONException e) {
				upStreamMsgHourList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡ��Ϣ���������� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgHourList;
	}
	

	/**
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ����������
	 * ʱ���� 30
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsgMonth> getUpStreamMsgMonth(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsgMonth> upStreamMsgMonthList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsgmonth?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				upStreamMsgMonthList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsgMonth.class);
				
				
			} catch (JSONException e) {
				upStreamMsgMonthList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡ��Ϣ���������� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgMonthList;
	}
	

	/**
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ���ͷֲ�����
	 * ʱ���� 15
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsgDist> getUpStreamMsgDist(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsgDist> upStreamMsgDistList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsgdist?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				//System.out.println(jsonObject.getJSONArray("list"));
				upStreamMsgDistList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsgDist.class);
				
				
			} catch (JSONException e) {
				upStreamMsgDistList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡ��Ϣ���ͷֲ����� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgDistList;
	}
	
	/**
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ���ͷֲ�������
	 * ʱ���� 30
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsgDistWeek> getUpStreamMsgDistWeek(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsgDistWeek> upStreamMsgDistWeekList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsgdistweek?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				upStreamMsgDistWeekList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsgDistWeek.class);
				
				
			} catch (JSONException e) {
				upStreamMsgDistWeekList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡ��Ϣ���ͷֲ������� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgDistWeekList;
	}
	
	/**
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ���ͷֲ�������
	 * ʱ���� 30
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<UpStreamMsgDistMonth> getUpStreamMsgDistMonth(String accessToken, String begin_date, String end_date) {
		
		
		List<UpStreamMsgDistMonth> upStreamMsgDistMonthList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getupstreammsgdistmonth?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				upStreamMsgDistMonthList = JSONArray.toList(jsonObject.getJSONArray("list"), UpStreamMsgDistMonth.class);
				
				
			} catch (JSONException e) {
				upStreamMsgDistMonthList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡ��Ϣ���ͷֲ������� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return upStreamMsgDistMonthList;
	}
	
	/**
	 * ����ͳ�ƽӿ�_�ӿڷ������ݽӿ�_��ȡ�ӿڷ�������
	 * ʱ���� 30
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<InterfaceSummary> getInterfaceSummary(String accessToken, String begin_date, String end_date) {
		
		
		List<InterfaceSummary> interfaceSummaryList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getinterfacesummary?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				//System.out.println(jsonObject.getJSONArray("list"));
				interfaceSummaryList = JSONArray.toList(jsonObject.getJSONArray("list"), InterfaceSummary.class);
				
				
			} catch (JSONException e) {
				interfaceSummaryList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡ�ӿڷ������� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return interfaceSummaryList;
	}
	
	/**
	 * ����ͳ�ƽӿ�_�ӿڷ������ݽӿ�_��ȡ�ӿڷ�����ʱ����
	 * ʱ���� 1
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<InterfaceSummaryHour> getInterfaceSummaryHour(String accessToken, String begin_date, String end_date) {
		
		
		List<InterfaceSummaryHour> interfaceSummaryHourList = null;
		
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/datacube/getinterfacesummaryhour?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"begin_date\":\"%s\",\"end_date\":\"%s\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, begin_date, end_date));

		if (null != jsonObject) {
			try {
			
				
				interfaceSummaryHourList = JSONArray.toList(jsonObject.getJSONArray("list"), InterfaceSummaryHour.class);
				
				
			} catch (JSONException e) {
				interfaceSummaryHourList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡ�ӿڷ�����ʱ���� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return interfaceSummaryHourList;
	}
	
	
	
	//�Լ�д�Ļ�ȡ�ӿڲ���¼�����ݿ�ķ���(yqcndata�б���ǰ׺ͳһ wxinterface)

	/**
	 * ����ͳ�ƽӿ�_�û��������ݽӿ�_��ȡ�û���������(¼�����ݿ�)(��wxinterface_yqfbwx_usersummary)
	 * ʱ����7
	 * @throws ParseException 
	 */
	public void idb_getUserSummary(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UserSummary> userSummaryList = getUserSummary(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		for (UserSummary usl : userSummaryList) {
			System.out.println(String.format("���ݵ����ڣ�%s �û���������%d �������û�������%d ȡ����ע���û�������%d", usl.getRef_date(), usl.getUser_source(), usl.getNew_user(),usl.getCancel_user()));

			
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
	 * ����ͳ�ƽӿ�_�û��������ݽӿ�_��ȡ�û���������(¼�����ݿ�)(��wxinterface_yqfbwx_usercumulate)
	 * ʱ����7
	 * @throws ParseException 
	 */
	public void idb_getUserCumulate(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UserCumulate> userCumulateList = getUserCumulate(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		for (UserCumulate ucl : userCumulateList) {
			System.out.println(String.format("���ݵ����ڣ�%s ���û�����%d", ucl.getRef_date(), ucl.getCumulate_user()));
			
			
			
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
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ��Ⱥ��ÿ������(¼�����ݿ�)(��wxinterface_yqfbwx_articlesummary)
	 * ʱ����1
	 * @throws ParseException 
	 */
	public void idb_getArticleSummary(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<ArticleSummary> articleSummaryList = getArticleSummary(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (ArticleSummary asl : articleSummaryList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s msgid��%s ͼ����Ϣ�ı���: %s ͼ��ҳ�����Ⱥ��ͼ�Ŀ�Ƭ�����ҳ�棩���Ķ�����: %d ͼ��ҳ���Ķ�����: %d ԭ��ҳ�Ķ�����: %d ����ĳ���: %d ����Ĵ���: %d �ղص�����: %d �ղصĴ���: %d", asl.getRef_date(), asl.getMsgid(),asl.getTitle(),asl.getInt_page_read_user(),asl.getInt_page_read_count(),asl.getOri_page_read_user(),asl.getOri_page_read_count(),asl.getShare_user(),asl.getShare_count(),asl.getAdd_to_fav_user(),asl.getAdd_to_fav_count()));
			
			
			
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
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ��Ⱥ��������(¼�����ݿ�)(��wxinterface_yqfbwx_articletotal)
	 * ʱ����1
	 * @throws ParseException 
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public void idb_getArticleTotal(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<ArticleTotal> articleTotalList = getArticleTotal(accessToken,begin_date,end_date);
		
		// ѭ�������������Ϣ
		

		for (ArticleTotal asl : articleTotalList) {
		
			System.out.println(String.format("���ݵ����ڣ�%s msgid��%s ͼ����Ϣ�ı���: %s ", asl.getRef_date(), asl.getMsgid(),asl.getTitle()));

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
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ��ͳ������(¼�����ݿ�)(��wxinterface_yqfbwx_userread)
	 * ʱ����3
	 * @throws ParseException 
	 */
	public void idb_getUserRead(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UserRead> userReadList = getUserRead(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (UserRead asl : userReadList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s �����û�������������Ķ���ͼ��: %d ͼ��ҳ�����Ⱥ��ͼ�Ŀ�Ƭ�����ҳ�棩���Ķ�������%d ͼ��ҳ���Ķ�����: %d ԭ��ҳ�����ͼ��ҳ���Ķ�ԭ�ġ������ҳ�棩���Ķ�����: %d ԭ��ҳ���Ķ�����: %d ���������: %d ����Ĵ���: %d �ղص�����: %d �ղصĴ���: %d", asl.getRef_date(),asl.getUser_source(), asl.getInt_page_read_user(),asl.getInt_page_read_count(),asl.getOri_page_read_user(),asl.getOri_page_read_count(),asl.getShare_user(),asl.getShare_count(),asl.getAdd_to_fav_user(),asl.getAdd_to_fav_count()));
			
			
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
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ��ͳ�Ʒ�ʱ����(¼�����ݿ�)(��wxinterface_yqfbwx_userreadhour)
	 * ʱ����1
	 * @throws ParseException 
	 */
	public void idb_getUserReadHour(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UserReadHour> userReadHourList = getUserReadHour(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (UserReadHour asl : userReadHourList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s ��ʱ��%d �û���Դ: %d  ͼ��ҳ���Ķ�����: %d ͼ��ҳ���Ķ�����: %d", asl.getRef_date(), asl.getRef_hour(),asl.getUser_source(),asl.getInt_page_read_user(),asl.getInt_page_read_count()));
			
			
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
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ�ķ���ת������(¼�����ݿ�)(��wxinterface_yqfbwx_usershare)
	 * ʱ����7
	 * @throws ParseException 
	 */
	public void idb_getUserShare(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UserShare> userShareList = getUserShare(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (UserShare asl : userShareList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s  ����ĳ���: %d  ����Ĵ���: %d ���������: %d", asl.getRef_date(), asl.getShare_scene(),asl.getShare_count(),asl.getShare_user()));
			
			
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
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ�ķ���ת����ʱ����(¼�����ݿ�)(��wxinterface_yqfbwx_usersharehour)
	 * ʱ����1
	 * @throws ParseException 
	 */
	public void idb_getUserShareHour(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UserShareHour> userShareHourList = getUserShareHour(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (UserShareHour asl : userShareHourList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s  ��ʱ: %d ����ĳ���: %d  ����Ĵ���: %d ���������: %d", asl.getRef_date(), asl.getRef_hour(), asl.getShare_scene(),asl.getShare_count(),asl.getShare_user()));
			
			
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
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ���͸ſ�����(¼�����ݿ�)(��wxinterface_yqfbwx_upstreammsg)
	 * ʱ����7
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsg(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsg> upStreamMsgList = getUpStreamMsg(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (UpStreamMsg asl : upStreamMsgList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s  ��Ϣ����: %d ���з����ˣ����ںŷ����ˣ���Ϣ���û���: %d  ���з�������Ϣ����Ϣ����: %d", asl.getRef_date(), asl.getMsg_type(), asl.getMsg_user(),asl.getMsg_count()));
			
			
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
	 * ����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡ��Ϣ���ͷ�ʱ����(¼�����ݿ�)(��wxinterface_yqfbwx_upstreammsghour)
	 * ʱ����1
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsgHour(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsgHour> upStreamMsgHourList = getUpStreamMsgHour(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (UpStreamMsgHour asl : upStreamMsgHourList) {
		
			System.out.println(String.format("���ݵ����ڣ�%s ��ʱ: %d ��Ϣ����: %d ���з����ˣ����ںŷ����ˣ���Ϣ���û���: %d  ���з�������Ϣ����Ϣ����: %d", asl.getRef_date(),asl.getRef_hour(), asl.getMsg_type(), asl.getMsg_user(),asl.getMsg_count()));
			
			
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
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ����������(¼�����ݿ�)(��wxinterface_yqfbwx_upstreammsgweek)
	 * ʱ����30
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsgWeek(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsgWeek> upStreamMsgWeekList = getUpStreamMsgWeek(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (UpStreamMsgWeek asl : upStreamMsgWeekList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s  ��Ϣ����: %d ���з����ˣ����ںŷ����ˣ���Ϣ���û���: %d  ���з�������Ϣ����Ϣ����: %d", asl.getRef_date(), asl.getMsg_type(), asl.getMsg_user(),asl.getMsg_count()));
			
			
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
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ����������(¼�����ݿ�)(��wxinterface_yqfbwx_upstreammsgmonth)
	 * ʱ����30
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsgMonth(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsgMonth> upStreamMsgMonthList = getUpStreamMsgMonth(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (UpStreamMsgMonth asl : upStreamMsgMonthList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s  ��Ϣ����: %d ���з����ˣ����ںŷ����ˣ���Ϣ���û���: %d  ���з�������Ϣ����Ϣ����: %d", asl.getRef_date(), asl.getMsg_type(), asl.getMsg_user(),asl.getMsg_count()));
			
			
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
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ���ͷֲ�����(¼�����ݿ�)(��wxinterface_yqfbwx_upstreammsgdist)
	 * ʱ����15
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsgDist(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsgDist> upStreamMsgDistList = getUpStreamMsgDist(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (UpStreamMsgDist asl : upStreamMsgDistList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s  ���շ�����Ϣ���ֲ�������: %d ���з����ˣ����ںŷ����ˣ���Ϣ���û���: %d ", asl.getRef_date(), asl.getCount_interval(), asl.getMsg_user()));
			
			
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
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ���ͷֲ�������(¼�����ݿ�)(��wxinterface_yqfbwx_upstreammsgdistweek)
	 * ʱ����30
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsgDistWeek(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsgDistWeek> upStreamMsgDistWeekList = getUpStreamMsgDistWeek(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (UpStreamMsgDistWeek asl : upStreamMsgDistWeekList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s  ���շ�����Ϣ���ֲ�������: %d ���з����ˣ����ںŷ����ˣ���Ϣ���û���: %d ", asl.getRef_date(), asl.getCount_interval(), asl.getMsg_user()));
			
			
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
	 * ����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ���ͷֲ�������(¼�����ݿ�)(��wxinterface_yqfbwx_upstreammsgdistmonth)
	 * ʱ����30
	 * @throws ParseException 
	 */
	public void idb_getUpStreamMsgDistMonth(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<UpStreamMsgDistMonth> upStreamMsgDistMonthList = getUpStreamMsgDistMonth(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (UpStreamMsgDistMonth asl : upStreamMsgDistMonthList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s  ���շ�����Ϣ���ֲ�������: %d ���з����ˣ����ںŷ����ˣ���Ϣ���û���: %d ", asl.getRef_date(), asl.getCount_interval(), asl.getMsg_user()));
			
			
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
	 * ����ͳ�ƽӿ�_�ӿڷ������ݽӿ�_��ȡ�ӿڷ�������(¼�����ݿ�)(��wxinterface_yqfbwx_interfacesummary)
	 * ʱ����30
	 * @throws ParseException 
	 */
	public void idb_getInterfaceSummary(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<InterfaceSummary> interfaceSummaryList = getInterfaceSummary(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (InterfaceSummary asl : interfaceSummaryList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s  ͨ�����������õ�ַ�����Ϣ�󣬱����ظ��û���Ϣ�Ĵ���: %d ����������ʧ�ܴ���: %d �ܺ�ʱ: %d ����ʱ: %d", asl.getRef_date(), asl.getCallback_count(),asl.getFail_count(),asl.getTotal_time_cost(),asl.getMax_time_cost()));
			
			
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
	 * ����ͳ�ƽӿ�_�ӿڷ������ݽӿ�_��ȡ�ӿڷ�����ʱ����(¼�����ݿ�)(��wxinterface_yqfbwx_interfacesummaryhour)
	 * ʱ����30
	 * @throws ParseException 
	 */
	public void idb_getInterfaceSummaryHour(String accessToken, String begin_date, String end_date) throws ParseException{
		
		List<InterfaceSummaryHour> interfaceSummaryHourList = getInterfaceSummaryHour(accessToken,begin_date,end_date);
		// ѭ�������������Ϣ
		

		for (InterfaceSummaryHour asl : interfaceSummaryHourList) {
		
			
			System.out.println(String.format("���ݵ����ڣ�%s  ͨ�����������õ�ַ�����Ϣ�󣬱����ظ��û���Ϣ�Ĵ���: %d ����������ʧ�ܴ���: %d �ܺ�ʱ: %d ����ʱ: %d", asl.getRef_date(), asl.getCallback_count(),asl.getFail_count(),asl.getTotal_time_cost(),asl.getMax_time_cost()));
			
			
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
		// ��ȡ�ӿڷ���ƾ֤
		//String accessToken = CommonUtil.getToken("APPID", "APPSECRET").getAccessToken();
		//String accessToken = CommonUtil.getToken(AllValus.appid, AllValus.appsecret).getAccessToken();

		String accessToken = WeixinChaOpenId.GetDBAccessToken(""+AllValus.memo+"");
		
	    System.out.println("token= "+accessToken);
		
		
		
		//����
		AdvancedUtil adu = new AdvancedUtil();
		
		//adu.GetShareFileName3(accessToken,);
		
		
		adu.idb_getUserSummary(accessToken,"2016-04-17","2016-04-17"); //���ʱ���� 7
		adu.idb_getUserCumulate(accessToken,"2016-04-17","2016-04-17"); //���ʱ���� 7
		adu.idb_getArticleSummary(accessToken,"2016-04-17","2016-04-17"); //���ʱ���� 1
		adu.idb_getArticleTotal(accessToken,"2016-04-18","2016-04-18");//���ʱ���� 1
		adu.idb_getUserRead(accessToken,"2016-04-17","2016-04-17"); //���ʱ���� 3
		adu.idb_getUserReadHour(accessToken,"2016-04-17","2016-04-17"); //���ʱ���� 1 
		adu.idb_getUserShare(accessToken,"2016-04-17","2016-04-17"); //���ʱ���� 7
		adu.idb_getUserShareHour(accessToken,"2016-04-17","2016-04-17"); //���ʱ���� 1

		
		/**
		 * ���Ϳͷ���Ϣ���ı���Ϣ��
		
		// ��װ�ı��ͷ���Ϣ
		String jsonTextMsg = makeTextCustomMessage("oEdzejiHCDqafJbz4WNJtWTMbDcE", "����鿴<a href=\"http://blog.csdn.net/lyq8479\">����Ĳ���</a>");
		// ���Ϳͷ���Ϣ
		sendCustomMessage(accessToken, jsonTextMsg);
 */
		/**
		 * ���Ϳͷ���Ϣ��ͼ����Ϣ��
		 
		Article article1 = new Article();
		article1.setTitle("΢����Ҳ�ܶ�����");
		article1.setDescription("");
		article1.setPicUrl("http://www.egouji.com/xiaoq/game/doudizhu_big.png");
		article1.setUrl("http://resource.duopao.com/duopao/games/small_games/weixingame/Doudizhu/doudizhu.htm");
		Article article2 = new Article();
		article2.setTitle("������ӥ\n80�󲻵ò���ľ�����Ϸ");
		article2.setDescription("");
		article2.setPicUrl("http://www.egouji.com/xiaoq/game/aoqixiongying.png");
		article2.setUrl("http://resource.duopao.com/duopao/games/small_games/weixingame/Plane/aoqixiongying.html");
		List<Article> list = new ArrayList<Article>();
		list.add(article1);
		list.add(article2);
		// ��װͼ�Ŀͷ���Ϣ
		String jsonNewsMsg = makeNewsCustomMessage("oEdzejiHCDqafJbz4WNJtWTMbDcE", list);
		// ���Ϳͷ���Ϣ
		sendCustomMessage(accessToken, jsonNewsMsg);
*/
		/**
		 * ������ʱ��ά��
		 
		WeixinQRCode weixinQRCode = createTemporaryQRCode(accessToken, 900, 111111);
		// ��ʱ��ά���ticket
		System.out.println(weixinQRCode.getTicket());
		// ��ʱ��ά�����Чʱ��
		System.out.println(weixinQRCode.getExpireSeconds());
*/
		/**
		 * ����ticket��ȡ��ά��
		
		String ticket = "gQEg7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2lIVVJ3VmJsTzFsQ0ZuQ0Y1bG5WAAIEW35+UgMEAAAAAA==";
		String savePath = "G:/download";
		// ����ticket��ȡ��ά��
		getQRCode(ticket, savePath);
 */
		/**
		 * ��ȡ�û���Ϣ
		 */
		WeixinUserInfo user = getUserInfo(accessToken, "odQ9Pt2ixPiHd8JSbLz9ytWzkIN4");
		System.out.println("OpenID��" + user.getOpenId());
		System.out.println("��ע״̬��" + user.getSubscribe());
		System.out.println("��עʱ�䣺" + user.getSubscribeTime());
		System.out.println("�ǳƣ�" + user.getNickname());
		System.out.println("�Ա�" + user.getSex());
		System.out.println("���ң�" + user.getCountry());
		System.out.println("ʡ�ݣ�" + user.getProvince());
		System.out.println("���У�" + user.getCity());
		System.out.println("���ԣ�" + user.getLanguage());
		System.out.println("ͷ��" + user.getHeadImgUrl());

		/**
		 * ��ȡ��ע���б�
		 */
		WeixinUserList weixinUserList = getUserList(accessToken, "");
		System.out.println("�ܹ�ע�û�����" + weixinUserList.getTotal());
		System.out.println("���λ�ȡ�û�����" + weixinUserList.getCount());
		System.out.println("OpenID�б�" + weixinUserList.getOpenIdList().toString());
		System.out.println("next_openid��" + weixinUserList.getNextOpenId());

		/**
		 * ���û� opendID д��SQL_SERVER2000���ݿ�
		 */
		
		WeixinChaOpenId.ChaOpenId(weixinUserList.getOpenIdList());
		
		/**
		 * ��ѯ����
		 */
		List<WeixinGroup> groupList = getGroups(accessToken);
		// ѭ�������������Ϣ
		for (WeixinGroup group : groupList) {
			System.out.println(String.format("ID��%d ���ƣ�%s �û�����%d", group.getId(), group.getName(), group.getCount()));
		}

		
		
		/**
		 * ��������
		
		WeixinGroup group = createGroup(accessToken, "��˾Ա��");
		System.out.println(String.format("�ɹ��������飺%s id��%d", group.getName(), group.getId()));
 */
		/**
		 * �޸ķ�����
		 
		updateGroup(accessToken, 100, "ͬ��");
*/
		/**
		 * �ƶ��û�����
		 
		updateMemberGroup(accessToken, "oEdzejiHCDqafJbz4WNJtWTMbDcE", 100);
*/
		/**
		 * �ϴ���ý���ļ�
		
		
		//WeixinMedia weixinMedia = uploadMedia(accessToken, "voice", "http://localhost:8080/weixinmpapi/test.mp3");
		WeixinMedia weixinMedia = uploadMedia(accessToken, "image", "http://avatar.csdn.net/9/B/F/1_jspping.jpg");
		System.out.println(weixinMedia.getMediaId());
		System.out.println(weixinMedia.getType());
		System.out.println(weixinMedia.getCreatedAt());
		 */
		/**
		 * ���ض�ý���ļ�
		 
		//getMedia(accessToken, "N7xWhOGYSLWUMPzVcGnxKFbhXeD_lLT5sXxyxDGEsCzWIB2CcUijSeQOYjWLMpcn", "G:/download");
		//getMedia(accessToken, weixinMedia.getMediaId(), "d:/��������ʱ�ļ���/��������/download");
		getMedia(accessToken, weixinMedia.getMediaId(), "D:/website/yqrb/Yqvod/bmwj/asp/sxbook/download");
		*/
	}
	
	
    //���� MediaId ��ȡ ���ص� �ļ���
	public static String GetShareFileName(String MediaId,String openid){
		
		String accessToken = WeixinChaOpenId.GetDBAccessToken("��������");
		String wjm = "";
		
	    try {
			
	    	sql_data db = new sql_data();
	    	String sql ="select img1 from sxbook_bm where img1<>'' and openid='"+openid+"' ";
	    	ResultSet rs =  db.executeQuery(sql);
	    	if (rs.next()) { //���ݿ����� img1 ���� (���� �հ׵� )
	    		String fileName = AllValus.downloadpath+rs.getString(1);
	    		System.out.println(fileName);       
	            DeleteFileUtil.deleteFile(fileName);  //��ɾ��ԭ�����ļ�
	            wjm=getMedia2(accessToken, MediaId, "D:/website/yqrb/Yqvod/bmwj/asp/sxbook/download"); //������΢�ŵ�ͼƬ���������õ��ļ���
			}else {  //���ݿ���û�� д��img1���� ,����ɾ���ļ� ��ֱ������
				wjm=getMedia2(accessToken, MediaId, "D:/website/yqrb/Yqvod/bmwj/asp/sxbook/download"); //����΢�ŵ�ͼƬ���������õ��ļ���

			}
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return wjm;

	}
	
	
	
	

    //���� MediaId ��ȡ ���ص� �ļ��� (���巢��) �ϴ�����
	public static String GetShareFileName2(String MediaId,String openid){
		
		String accessToken = WeixinChaOpenId.GetDBAccessToken("���巢��");
		String wjm = "";
		
	    try {
			
	    	sql_data db = new sql_data();
	    	String sql ="select img1 from yqfbwx_face where img1<>'' and openid='"+openid+"' ";
	    	System.out.println(sql);
	    	ResultSet rs =  db.executeQuery(sql);
	    	if (rs.next()) { //���ݿ����� img1 ���� (���� �հ׵� )
	    		//String fileName = AllValus.downloadpath+rs.getString(1);
	    		//System.out.println(fileName);       
	          //  DeleteFileUtil.deleteFile(fileName);  //��ɾ��ԭ�����ļ�
	            wjm=getMedia2(accessToken, MediaId, AllValus.downloadpath); //������΢�ŵ�ͼƬ���������õ��ļ���
			}else {  //���ݿ���û�� д��img1���� ,����ɾ���ļ� ��ֱ������
				wjm=getMedia2(accessToken, MediaId, AllValus.downloadpath); //����΢�ŵ�ͼƬ���������õ��ļ���
			}
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return wjm;

	}
	
	
	 //���� MediaId ��ȡ ���ص� �ļ���
	public static String GetShareFileName3(String MediaId,String openid){
		
		String accessToken = WeixinChaOpenId.GetDBAccessToken("���巢��");
		String wjm = "";
		
	    try {
			
	    	sql_data db = new sql_data();
	    	String sql ="select img1 from yqcnwx_lp_up where img1<>'' and openid='"+openid+"' ";
	    	ResultSet rs =  db.executeQuery(sql);
	    	if (rs.next()) { //���ݿ����� img1 ���� (���� �հ׵� )
	    		
	    		String fileName = AllValus.downloadpath2+rs.getString(1);
	    		System.out.println(fileName);       
	            DeleteFileUtil.deleteFile(fileName);  //��ɾ��ԭ�����ļ�
	            wjm=getMedia2(accessToken, MediaId, AllValus.downloadpath2); //������΢�ŵ�ͼƬ���������õ��ļ���
	            
			}else {  //���ݿ���û�� д��img1���� ,����ɾ���ļ� ��ֱ������
				
				wjm=getMedia2(accessToken, MediaId, AllValus.downloadpath2); //����΢�ŵ�ͼƬ���������õ��ļ���

			}
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
				
		return wjm;

		
	}
	
	
	 //���� MediaId ��ȡ ���ص� �ļ��� (���巢��) �ϴ�����(�����������)
	public static String GetShareFileName4(String MediaId,String openid){
		
		String img2 ="";
		
		try {
			String accessToken = WeixinChaOpenId.GetDBAccessToken(""+AllValus.memo+"");
			String wjm= getMedia3(accessToken, MediaId, AllValus.downloadpath3); //����΢��ͼƬ���������õ��ļ���
			//ѹ����ʼ
			
			String fromPicName = AllValus.downloadpath3+wjm;  //ѹ��·���ļ���
			img2 = "ys_"+wjm;  
			String toPicName =  AllValus.downloadpath3+img2;//ѹ����·���ļ���
			ThumbTest Ys = new ThumbTest();
			Ys.testHandlePicture3(fromPicName,toPicName);//ѹ��ͼƬ����
			DeleteFileUtil.deleteFile(fromPicName);//ɾ��ԭͼ
		} catch (Exception e) {
			e.printStackTrace();
		}
		//ѹ�����
		
		return img2;
		
	}
	
	
	/**
	 * ͼ����Ϣ���Թ���ӿ�
	 * �鿴ָ�����µ���������
	 * @param accessToken �ӿڷ���ƾ֤
	 * @param groupName ��������
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<WeixinCommentList> getCommentList(String accessToken, String msg_data_id, int index, int begin, int count,int type) {
		List<WeixinCommentList> weixinCommentList = null;
		// ƴ�������ַ
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/comment/list?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// ��Ҫ�ύ��json����
		
		String jsonData = "{\"msg_data_id\":\"%s\",\"index\":\"%d\",\"begin\":\"%d\",\"count\":\"%d\",\"type\":\"%d\"}";
		

		// ��ȡ�û���������
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "POST", String.format(jsonData, msg_data_id, index,begin,count,type));

		if (null != jsonObject) {
			try {
				
				//weixinUserInfo.setCountry(jsonObject.getString("country"));
				
				weixinCommentList = JSONArray.toList(jsonObject.getJSONArray("comment"), WeixinCommentList.class);
				
			} catch (JSONException e) {
				weixinCommentList = null;
				int errorCode = jsonObject.getInt("errcode");
				String errorMsg = jsonObject.getString("errmsg");
				log.error("��ȡָ�����µ����������б� errcode:{} errmsg:{}", errorCode, errorMsg);
			}
		}
		return weixinCommentList;
	}
	
	
	
	
	
	/**
	 * ͼ����Ϣ���Թ���ӿ�
	 * �鿴ָ�����µ���������
	 * @throws ParseException 
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public void idb_getWeixincommentList(String accessToken, String msg_data_id, int index, int begin, int count,int type) throws ParseException{
		
		List<WeixinCommentList> weixinCommentlList = getCommentList(accessToken,msg_data_id,index,begin,count,type);
		
		// ѭ�������������Ϣ

		for (WeixinCommentList wcl : weixinCommentlList) {
		
			System.out.println(String.format("�û�����id ��%s �������ݣ�%s ", wcl.getUser_comment_id(), wcl.getContent()));

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
