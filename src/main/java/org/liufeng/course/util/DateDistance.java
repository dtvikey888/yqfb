package org.liufeng.course.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.fjw.weixin.util.PublicFun;

/**
 * 时间相距
 * 
 * @author Ben
 * @version 1.0
 * @date 2009-10-21 16:38:51
 */
public class DateDistance {

	/**
	 * 两个时间之间相差距离多少天
	 * 
	 * @param one
	 *            时间参数 1：
	 * @param two
	 *            时间参数 2：
	 * @return 相差天数
	 */
	public static long getDistanceDays(String str1, String str2)
			throws Exception {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date one;
		Date two;
		long days = 0;
		try {
			one = df.parse(str1);
			two = df.parse(str2);
			long time1 = one.getTime();
			long time2 = two.getTime();
			long diff;
			if (time1 < time2) {
				diff = time2 - time1;
			} else {
				diff = time1 - time2;
			}
			days = diff / (1000 * 60 * 60 * 24);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return days;
	}

	/**
	 * 两个时间相差距离多少天多少小时多少分多少秒
	 * 
	 * @param str1
	 *            时间参数 1 格式：1990-01-01 12:00:00
	 * @param str2
	 *            时间参数 2 格式：2009-01-01 12:00:00
	 * @return long[] 返回值为：{天, 时, 分, 秒}
	 */
	public static long[] getDistanceTimes(String str1, String str2) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date one;
		Date two;
		long day = 0;
		long hour = 0;
		long min = 0;
		long sec = 0;
		try {
			one = df.parse(str1);
			two = df.parse(str2);
			long time1 = one.getTime();
			long time2 = two.getTime();
			long diff;
			if (time1 < time2) {
				diff = time2 - time1;
			} else {
				diff = time1 - time2;
			}
			day = diff / (24 * 60 * 60 * 1000);
			hour = (diff / (60 * 60 * 1000) - day * 24);
			min = ((diff / (60 * 1000)) - day * 24 * 60 - hour * 60);
			sec = (diff / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long[] times = { day, hour, min, sec };
		return times;
	}

	/**
	 * 两个时间相差距离多少天多少小时多少分多少秒
	 * 
	 * @param str1
	 *            时间参数 1 格式：1990-01-01 12:00:00
	 * @param str2
	 *            时间参数 2 格式：2009-01-01 12:00:00
	 * @return String 返回值为：xx天xx小时xx分xx秒
	 */
	public static String getDistanceTime(String str1, String str2) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date one;
		Date two;
		long day = 0;
		long hour = 0;
		long min = 0;
		long sec = 0;
		try {
			one = df.parse(str1);
			two = df.parse(str2);
			long time1 = one.getTime();
			long time2 = two.getTime();
			long diff;
			if (time1 < time2) {
				diff = time2 - time1;
			} else {
				diff = time1 - time2;
			}
			day = diff / (24 * 60 * 60 * 1000);
			hour = (diff / (60 * 60 * 1000) - day * 24);
			min = ((diff / (60 * 1000)) - day * 24 * 60 - hour * 60);
			sec = (diff / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return day + "天" + hour + "小时" + min + "分" + sec + "秒";
	}
	
	/**
	 * 两个时间相差距离多少年多少月多少天多少小时多少分多少秒
	 * 
	 * @param str1
	 *            时间参数 1 格式：1990-01-01 12:00:00
	 * @param str2
	 *            时间参数 2 格式：2009-01-01 12:00:00
	 * @return String 返回值为：xx天xx小时xx分xx秒
	 * @throws ParseException 
	 */
	public static String getDistanceTime2(String str1, String str2) throws ParseException {
		VeDate2 vd2= new VeDate2();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date one;
		Date two;
		
		long year=0;
		
		long day_temp = vd2.getBetween(str1, str2,VeDate2.YYYYMMDD, VeDate2.DAY_RETURN);
		if (day_temp<365) {
			year=0;
		}else {
			year = vd2.getBetween(str1, str2,VeDate2.YYYYMMDD, VeDate2.YEAR_RETURN);
		}
		
		String[] ss = PublicFun.split(str1, " ");
		String[] ss2=PublicFun.split(ss[0], "-");
		String noyString[] = TimeString.GetnowTimeYMD().split("-");
		String ynow_string=noyString[0];
		String str1_temp=ynow_string+"-"+ss2[1]+"-"+ss2[2];
		String md2[]= null;
		
		
		
		String md = Db2.getMonthDayDiff2(ss[0], TimeString.GetnowTimeYMD());
		System.out.println("ddd: "+md);
		if (md.equals("0")) {
			
			md="0,0";
			md2=PublicFun.split(md, ",");
			
		}else{
			
			md2=PublicFun.split(md, ",");
		}
		
		
		
		
		long month = Long.parseLong(md2[0]);
		
		long day_result = Long.parseLong(md2[1]);;
		
		
		long day = 0;
		long hour = 0;
		long min = 0;
		long sec = 0;
		try {
			one = df.parse(str1);
			two = df.parse(str2);
			long time1 = one.getTime();
			long time2 = two.getTime();
			long diff;
			if (time1 < time2) {
				diff = time2 - time1;
			} else {
				diff = time1 - time2;
			}
			day = diff / (24 * 60 * 60 * 1000);
			hour = (diff / (60 * 60 * 1000) - day * 24);
			min = ((diff / (60 * 1000)) - day * 24 * 60 - hour * 60);
			sec = (diff / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return year + "年" +  month + "月" + day_result + "天" + hour + "小时" + min + "分" + sec + "秒";
	}
	
	/**
	 * 两个时间相差距离多少年多少月多少天多少小时多少分多少秒
	 * 
	 * @param str1
	 *            时间参数 1 格式：1990-01-01 12:00:00
	 * @param str2
	 *            时间参数 2 格式：2009-01-01 12:00:00
	 * @return String 返回值为：xx天xx小时xx分xx秒
	 * @throws ParseException 
	 */
	public static String getDistanceTime3(String str1, String str2) throws ParseException {
		VeDate2 vd2= new VeDate2();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date one;
		Date two;
		long year=0;
		
		long day_temp = vd2.getBetween(str1, str2,VeDate2.YYYYMMDD, VeDate2.DAY_RETURN);
		if (day_temp<365) {
			year=0;
		}else {
			year = vd2.getBetween(str1, str2,VeDate2.YYYYMMDD, VeDate2.YEAR_RETURN);
		}
		
		
		
		String[] ss = PublicFun.split(str1, " ");
		String[] ss2=PublicFun.split(ss[0], "-");
		String noyString[] = TimeString.GetnowTimeYMD().split("-");
		String ynow_string=noyString[0];
		String str1_temp=ynow_string+"-"+ss2[1]+"-"+ss2[2];
		String md2[]= null;
		
		int mt = new Integer(ss2[2]);
		
		int m1 = new Integer(ss2[1]);
		int m2 = new Integer(noyString[1]);
		
		if (m1>m2) {
			year = vd2.getBetween(str1, str2,VeDate2.YYYYMMDD, VeDate2.YEAR_RETURN)-1;
		}
		
		
		
		
		
		String md = Db2.getMonthDayDiff2(ss[0], TimeString.GetnowTimeYMD());
		System.out.println("ddd: "+md);
		if (md.equals("0")) {
			
			md="0,0";
			md2=PublicFun.split(md, ",");
			
		}else{
			
			md2=PublicFun.split(md, ",");
		}
		
		
		
		
		long month = Long.parseLong(md2[0]);
		
		long day_result = Long.parseLong(md2[1]);;
		
		
		
		if (m1==12) {
			day_result = day_result+(31-mt);
		}
		
		if (m1==11 && mt==31) {
			day_result = day_result+31;
		}
		
		
		long day = 0;
		long hour = 0;
		long min = 0;
		long sec = 0;
		try {
			one = df.parse(str1);
			two = df.parse(str2);
			long time1 = one.getTime();
			long time2 = two.getTime();
			long diff;
			if (time1 < time2) {
				diff = time2 - time1;
			} else {
				diff = time1 - time2;
			}
			day = diff / (24 * 60 * 60 * 1000);
			hour = (diff / (60 * 60 * 1000) - day * 24);
			min = ((diff / (60 * 1000)) - day * 24 * 60 - hour * 60);
			sec = (diff / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return year + "," +  month + "," + day_result + "," + hour + "," + min + "," + sec + ",";
	}
	

	// 两个日期之间有多少个闰年
	public static int GetRnNum(int sy1,int ey2) {
		int sum = 0;
		for (int year = sy1; year <= ey2; year++) {
			if ((year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0)) {
				sum++;
				
			}
		}
		return sum;
		//System.out.println("有" + sum + "个闰年");
	}

	//日期是跨年份的，如一个是2012年，一个是2015年的
	//年份是分闰年和平年的，各自的天数不同
	//输入：两个日期
    //输出：两个日期相差的天数
	/**
	 * date2比date1多的天数
	 * @param date1 
	 * @param date2
	 * @return 
	 */
	 public static int differentDays(Date date1,Date date2)
	 {
	 Calendar cal1 = Calendar.getInstance();
	 cal1.setTime(date1);
	  
	 Calendar cal2 = Calendar.getInstance();
	 cal2.setTime(date2);
	 int day1= cal1.get(Calendar.DAY_OF_YEAR);
	 int day2 = cal2.get(Calendar.DAY_OF_YEAR);
	  
	 int year1 = cal1.get(Calendar.YEAR);
	 int year2 = cal2.get(Calendar.YEAR);
	 if(year1 != year2) //同一年
	 {
	  int timeDistance = 0 ;
	  for(int i = year1 ; i < year2 ; i ++)
	  {
	  if(i%4==0 && i%100!=0 || i%400==0) //闰年  
	  {
	   timeDistance += 366;
	  }
	  else //不是闰年
	  {
	   timeDistance += 365;
	  }
	  }
	   
	  return timeDistance + (day2-day1) ;
	 }
	 else //不同年
	 {
	  System.out.println("判断day2 - day1 : " + (day2-day1));
	  return day2-day1;
	 }
	 
	 }
	 
	 
	 /* 
		* 程序头部注释开始   
		* 程序的版权和版本声明部分   
		* Copyright (c) 2011, 烟台大学计算机学院学生   
		* All rights reserved.   
		* 文件名称：计算几月有几天和判断是否为闰年的工具类                            
		* 作    者：薛广晨                               
		* 完成日期：2011  年 09 月  15  日   
		* 版 本号：x1.0            
		   
		* 对任务及求解方法的描述部分   
		* 输入描述：  
		* 问题描述:
		* 程序输出：   
		* 程序头部的注释结束 
		*/
		 
		
			
			public static boolean judge(int year)
			{
				boolean yearleap = (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0);//采用布尔数据计算判断是否能整除 
				return yearleap;
			}
			
			public static int calculate(int year, int month)
			{
				boolean yearleap = judge(year);
		        int day;
		        if(yearleap && month == 2)
		        {
		        	day = 29;
		        }
		        else if(!yearleap && month == 2)
		        {
		        	day = 28;
		        }
		        else if(month == 4 || month == 6 || month == 9 || month == 11)
		        {
		        	day = 30;
		        }
		        else
		        {
		        	day = 31;
		        }
		        return day;
			}

	 
	 /**
	 * 通过时间秒毫秒数判断两个时间的间隔
	 * @param date1
	 * @param date2
	 * @return
	 */
	 public static int differentDaysByMillisecond(Date date1,Date date2)
	 {
	 int days = (int) ((date2.getTime() - date1.getTime()) / (1000*3600*24));
	 return days;
	 }
	 
	public static void main(String[] args) throws ParseException {
		
		
		System.out.println(DateDistance.getDistanceTime("1988-01-03 00:00:00",TimeString.nowTime()));

		//就是你了，哈哈哈！
		System.out.println(DateDistance.getDistanceTime2("2017-11-25 00:00:00",TimeString.nowTime()));
		
		System.out.println(DateDistance.getDistanceTime3("2017-11-25 00:00:00",TimeString.nowTime()));
		
		
		
		System.out.println(DateDistance.GetRnNum(1988, 2018));
		
		 String dateStr = "2017-12-31 00:00:00";
		 String dateStr2 = TimeString.nowTime();
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 //SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 try
		 {
		  Date date2 = format.parse(dateStr2);
		  Date date = format.parse(dateStr);
		   
		  System.out.println("两个日期的差距：" + differentDays(date,date2));
		  System.out.println("两个日期的差距：" + differentDaysByMillisecond(date,date2));
		 } catch (ParseException e) {
		  e.printStackTrace();
		 }
		
	}
}