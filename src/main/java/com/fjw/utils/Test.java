package com.fjw.utils;

import java.io.UnsupportedEncodingException;

import org.apache.commons.codec.binary.Base64;
import org.liufeng.course.util.TimeString;

public class Test {
	public static void main(String[] args){
//		 String nowDayMYD = TimeString.GetnowTimeYMD();
//		 System.out.println(nowDayMYD);
//		
		try {

			String nickname = "苏苏";//jsonObject对象是查询出来的用户信息转化为json对象，用的是阿里巴巴的fastjson
			nickname =Base64.encodeBase64String(nickname.getBytes("UTF-8"));
			//进行解码
			nickname = new String(Base64.decodeBase64(nickname),"UTF-8");

			System.out.println(nickname);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}


}