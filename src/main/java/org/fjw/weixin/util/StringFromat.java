package org.fjw.weixin.util;

import java.io.UnsupportedEncodingException;

public class StringFromat {
	public static String codetoString(String str) {
		String s = str;
		try {
			byte tempB[] = str.getBytes("ISO-8859-1");
			s = new String(tempB);
			return s;
		} catch (Exception e) {

			return s;
		}
	}
	
	public static String codetoString2(String str) throws UnsupportedEncodingException {
		
		String s = str;
		String sString ="";
		
		sString = new String(s.getBytes("ISO-8859-1"),"gb2312");
		
		return sString;
		
	}
	
}
