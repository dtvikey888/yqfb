package org.liufeng.course.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.fjw.weixin.util.PublicFun;

/**
 * ʱ�����
 * 
 * @author Ben
 * @version 1.0
 * @date 2009-10-21 16:38:51
 */
public class DateDistance {

	/**
	 * ����ʱ��֮�������������
	 * 
	 * @param one
	 *            ʱ����� 1��
	 * @param two
	 *            ʱ����� 2��
	 * @return �������
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
	 * ����ʱ����������������Сʱ���ٷֶ�����
	 * 
	 * @param str1
	 *            ʱ����� 1 ��ʽ��1990-01-01 12:00:00
	 * @param str2
	 *            ʱ����� 2 ��ʽ��2009-01-01 12:00:00
	 * @return long[] ����ֵΪ��{��, ʱ, ��, ��}
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
	 * ����ʱ����������������Сʱ���ٷֶ�����
	 * 
	 * @param str1
	 *            ʱ����� 1 ��ʽ��1990-01-01 12:00:00
	 * @param str2
	 *            ʱ����� 2 ��ʽ��2009-01-01 12:00:00
	 * @return String ����ֵΪ��xx��xxСʱxx��xx��
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
		return day + "��" + hour + "Сʱ" + min + "��" + sec + "��";
	}
	
	/**
	 * ����ʱ�����������������¶��������Сʱ���ٷֶ�����
	 * 
	 * @param str1
	 *            ʱ����� 1 ��ʽ��1990-01-01 12:00:00
	 * @param str2
	 *            ʱ����� 2 ��ʽ��2009-01-01 12:00:00
	 * @return String ����ֵΪ��xx��xxСʱxx��xx��
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
		return year + "��" +  month + "��" + day_result + "��" + hour + "Сʱ" + min + "��" + sec + "��";
	}
	
	/**
	 * ����ʱ�����������������¶��������Сʱ���ٷֶ�����
	 * 
	 * @param str1
	 *            ʱ����� 1 ��ʽ��1990-01-01 12:00:00
	 * @param str2
	 *            ʱ����� 2 ��ʽ��2009-01-01 12:00:00
	 * @return String ����ֵΪ��xx��xxСʱxx��xx��
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
	

	// ��������֮���ж��ٸ�����
	public static int GetRnNum(int sy1,int ey2) {
		int sum = 0;
		for (int year = sy1; year <= ey2; year++) {
			if ((year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0)) {
				sum++;
				
			}
		}
		return sum;
		//System.out.println("��" + sum + "������");
	}

	//�����ǿ���ݵģ���һ����2012�꣬һ����2015���
	//����Ƿ������ƽ��ģ����Ե�������ͬ
	//���룺��������
    //���������������������
	/**
	 * date2��date1�������
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
	 if(year1 != year2) //ͬһ��
	 {
	  int timeDistance = 0 ;
	  for(int i = year1 ; i < year2 ; i ++)
	  {
	  if(i%4==0 && i%100!=0 || i%400==0) //����  
	  {
	   timeDistance += 366;
	  }
	  else //��������
	  {
	   timeDistance += 365;
	  }
	  }
	   
	  return timeDistance + (day2-day1) ;
	 }
	 else //��ͬ��
	 {
	  System.out.println("�ж�day2 - day1 : " + (day2-day1));
	  return day2-day1;
	 }
	 
	 }
	 
	 
	 /* 
		* ����ͷ��ע�Ϳ�ʼ   
		* ����İ�Ȩ�Ͱ汾��������   
		* Copyright (c) 2011, ��̨��ѧ�����ѧԺѧ��   
		* All rights reserved.   
		* �ļ����ƣ����㼸���м�����ж��Ƿ�Ϊ����Ĺ�����                            
		* ��    �ߣ�Ѧ�㳿                               
		* ������ڣ�2011  �� 09 ��  15  ��   
		* �� ���ţ�x1.0            
		   
		* ��������ⷽ������������   
		* ����������  
		* ��������:
		* ���������   
		* ����ͷ����ע�ͽ��� 
		*/
		 
		
			
			public static boolean judge(int year)
			{
				boolean yearleap = (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0);//���ò������ݼ����ж��Ƿ������� 
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
	 * ͨ��ʱ����������ж�����ʱ��ļ��
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

		//�������ˣ���������
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
		   
		  System.out.println("�������ڵĲ�ࣺ" + differentDays(date,date2));
		  System.out.println("�������ڵĲ�ࣺ" + differentDaysByMillisecond(date,date2));
		 } catch (ParseException e) {
		  e.printStackTrace();
		 }
		
	}
}