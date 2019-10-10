package org.fjw.weixin.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeString {

	public static String nowTime() {
		Calendar c = Calendar.getInstance();
		c.setTimeInMillis(new Date().getTime());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(c.getTime());
	}

	public static void main(String[] args) {
		System.out.println(TimeString.nowTime());
//		
//		if(TimeString.nowTime().indexOf("2015-04-20")!=-1){
//			System.out.println("4-19");
//		}else if(TimeString.nowTime().indexOf("2015-04-22")!=-1){
//			System.out.println("4-20");
//		}else {
//			System.out.print("other");
//		}
		System.out.println(TimeString.GetnowTimeYMD());
	}

	//获取日期的年月日
	public static String GetnowTimeYMD(){

		return TimeString.nowTime().substring(0,10);

	}


}