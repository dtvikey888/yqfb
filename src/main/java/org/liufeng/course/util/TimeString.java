package org.liufeng.course.util;

import java.text.DateFormat;
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

		if(TimeString.nowTime().indexOf("2015-04-20")!=-1){
			System.out.println("4-19");
		}else if(TimeString.nowTime().indexOf("2015-04-22")!=-1){
			System.out.println("4-20");
		}else {
			System.out.println("other");
		}

		System.out.println(TimeString.GetnowTimeYMD());
		System.out.println(TimeString.GetnowTimeYMD2());
		System.out.println(TimeString.GetnowTimeYMD3());

	}



	//获取当天日期的年月日
	public static String GetnowTimeYMD(){

		Date date = new Date();
		DateFormat matter = new SimpleDateFormat("yyyy-MM-dd");
		return matter.format(date);

	}

	//获取昨天日期的年月日
	public static String GetnowTimeYMD2(){

		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   -1);
		String yesterday = new SimpleDateFormat( "yyyy-MM-dd ").format(cal.getTime());
		return yesterday;

	}


	//获取前天日期的年月日
	public static String GetnowTimeYMD3(){

		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   -2);
		String yesterday = new SimpleDateFormat( "yyyy-MM-dd ").format(cal.getTime());
		return yesterday;

	}

}