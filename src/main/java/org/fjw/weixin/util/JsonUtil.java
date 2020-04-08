package org.fjw.weixin.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.liufeng.course.pojo.JsSdkUser;
import org.liufeng.course.pojo.MyUserInfo;
import org.liufeng.course.pojo.SNSUserInfo;
import org.liufeng.course.util.CommonUtil;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.alibaba.fastjson.JSON;

public class JsonUtil {
	public static String getjson(String url) {
		StringBuilder json = new StringBuilder();
		try {
			URL urlObject = new URL(url);
			URLConnection uc = urlObject.openConnection();
			// uc.setRequestProperty("cookie", sessionId);
			BufferedReader in = new BufferedReader(new InputStreamReader(uc
					.getInputStream(), "utf-8"));
			String inputLine = null;
			while ((inputLine = in.readLine()) != null) {
				json.append(inputLine);
			}
			in.close();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return json.toString();
	}

	public static MyUserInfo getMyUserInfo(String result) {
		MyUserInfo user1 = JSON.parseObject(result, MyUserInfo.class);
		System.out.println(user1.getCity());
		return user1;
	}


	public static JsSdkUser getMyJsSdkInfo(String result) {
		JsSdkUser user1 = JSON.parseObject(result, JsSdkUser.class);
		System.out.println(user1.getAppId());
		return user1;
	}


	public static String getDecoder(String encodedText) throws IOException{
		//	final BASE64Encoder encoder = new BASE64Encoder();
		//final BASE64Decoder decoder = new BASE64Decoder();
//		final String text = "字串文字";
//		final byte[] textByte = text.getBytes("UTF-8");
		//编码
//		final String encodedText = encoder.encode(textByte);
//		System.out.println(encodedText);
		//解码
		//System.out.println(new String(decoder.decodeBuffer(encodedText), "UTF-8"));
		//return new String(decoder.decodeBuffer(encodedText), "UTF-8");
		return URLDecoder.decode(encodedText, "UTF-8");
	}

//	public static void main(String[] args) throws IOException {
//		System.out.println(getDecoder(""));
//	}
}
