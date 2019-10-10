package org.liufeng.course.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class VeDate2 {
	/** �� */
	public static final int YEAR_RETURN = 0;
	/** �� */
	public static final int MONTH_RETURN = 1;
	/** �� */
	public static final int DAY_RETURN = 2;
	/** ʱ */
	public static final int HOUR_RETURN = 3;
	/** �� */
	public static final int MINUTE_RETURN = 4;
	/** �� */
	public static final int SECOND_RETURN = 5;

	/** �� */
	public static final String YYYY = "yyyy";
	/** ��-�� */
	public static final String YYYYMM = "yyyy-MM";
	/** ��-��-�� */
	public static final String YYYYMMDD = "yyyy-MM-dd";
	/** ��-��-��-ʱ */
	public static final String YYYYMMDDHH = "yyyy-MM-dd HH";
	/** ��-��-��-ʱ-�� */
	public static final String YYYYMMDDHHMM = "yyyy-MM-dd HH:mm";
	/** ��-��-��-ʱ-��-�� */
	public static final String YYYYMMDDHHMMSS = "yyyy-MM-dd HH:mm:ss";

	public static long getBetween(String beginTime, String endTime,
			String formatPattern, int returnPattern) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(formatPattern);
		Date beginDate = simpleDateFormat.parse(beginTime);
		Date endDate = simpleDateFormat.parse(endTime);

		Calendar beginCalendar = Calendar.getInstance();
		Calendar endCalendar = Calendar.getInstance();
		beginCalendar.setTime(beginDate);
		endCalendar.setTime(endDate);
		switch (returnPattern) {
		case YEAR_RETURN:
			return VeDate2
					.getByField(beginCalendar, endCalendar, Calendar.YEAR);
		case MONTH_RETURN:
			return VeDate2
					.getByField(beginCalendar, endCalendar, Calendar.YEAR)
					* 12
					+ VeDate2.getByField(beginCalendar, endCalendar,
							Calendar.MONTH);
		case DAY_RETURN:
			return VeDate2.getTime(beginDate, endDate) / (24 * 60 * 60 * 1000);
		case HOUR_RETURN:
			return VeDate2.getTime(beginDate, endDate) / (60 * 60 * 1000);
		case MINUTE_RETURN:
			return VeDate2.getTime(beginDate, endDate) / (60 * 1000);
		case SECOND_RETURN:
			return VeDate2.getTime(beginDate, endDate) / 1000;
		default:
			return 0;
		}
	}

	private static long getByField(Calendar beginCalendar,
			Calendar endCalendar, int calendarField) {
		return endCalendar.get(calendarField)
				- beginCalendar.get(calendarField);
	}

	private static long getTime(Date beginDate, Date endDate) {
		return endDate.getTime() - beginDate.getTime();
	}

	// new

	/**
	 * @param date1
	 *            ��Ҫ�Ƚϵ�ʱ�� ����Ϊ��(null),��Ҫ��ȷ�����ڸ�ʽ ,�磺2009-09-12
	 * @param date2
	 *            ���Ƚϵ�ʱ�� Ϊ��(null)��Ϊ��ǰʱ��
	 * @param stype
	 *            ����ֵ���� 0Ϊ�����죬1Ϊ���ٸ��£�2Ϊ������
	 * @return ������ compareDate("2009-09-12", null, 0);//�Ƚ���
	 *         compareDate("2009-09-12", null, 1);//�Ƚ���
	 *         compareDate("2009-09-12", null, 2);//�Ƚ���
	 */
	public static int compareDate(String startDay, String endDay, int stype) {
		int n = 0;
		String[] u = { "��", "��", "��" };
		String formatStyle = stype == 1 ? "yyyy-MM" : "yyyy-MM-dd";

		endDay = endDay == null ? getCurrentDate("yyyy-MM-dd") : endDay;

		DateFormat df = new SimpleDateFormat(formatStyle);
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		try {
			c1.setTime(df.parse(startDay));
			c2.setTime(df.parse(endDay));
		} catch (Exception e3) {
			System.out.println("wrong occured");
		}
		// List list = new ArrayList();
		while (!c1.after(c2)) { // ѭ���Աȣ�ֱ����ȣ�n ������Ҫ�Ľ��
			// list.add(df.format(c1.getTime())); // ������԰Ѽ�������ڴ浽������ ��ӡ����
			n++;
			if (stype == 1) {
				c1.add(Calendar.MONTH, 1); // �Ƚ��·ݣ��·�+1
			} else {
				c1.add(Calendar.DATE, 1); // �Ƚ�����������+1
			}
		}
		n = n - 1;
		if (stype == 2) {
			n = (int) n / 365;
		}
		System.out.println(startDay + " -- " + endDay + " ������" + u[stype]
				+ ":" + n);
		return n;
	}
	
	
	

	public static String getCurrentDate(String format) {
		Calendar day = Calendar.getInstance();
		day.add(Calendar.DATE, 0);
		SimpleDateFormat sdf = new SimpleDateFormat(format);// "yyyy-MM-dd"
		String date = sdf.format(day.getTime());
		return date;
	}
	
	

	

	public static void main(String[] args) throws ParseException {
		
		try {
		
			System.out.println(VeDate2.getBetween("2007-12-28", "2018-06-27",
					VeDate2.YYYYMMDD, VeDate2.YEAR_RETURN));
			System.out.println(VeDate2.getBetween("2007-12-29", "2018-06-27",
					VeDate2.YYYYMMDD, VeDate2.MONTH_RETURN));
			System.out.println(VeDate2.getBetween("2014-12-31", "2018-06-27",
					VeDate2.YYYYMMDD, VeDate2.DAY_RETURN));
			System.out.println(VeDate2.getBetween("2013-05-02", "2018-05-05",
					VeDate2.YYYYMMDD, VeDate2.HOUR_RETURN));
			System.out.println(VeDate2.getBetween("2013-05-02", "2018-05-05",
					VeDate2.YYYYMMDD, VeDate2.MINUTE_RETURN));
			System.out.println(VeDate2.getBetween("2013-05-02", "2018-05-05",
					VeDate2.YYYYMMDD, VeDate2.SECOND_RETURN));
					
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		//System.out.println(VeDate2.compareDate("2007-01-01", "2018-06-26", 2));
		/**
		   SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   java.util.Date begin=dfs.parse("2007-01-01 11:30:24");
		   java.util.Date end = dfs.parse("2018-06-26 15:44:40");
		   long between=(end.getTime()-begin.getTime())/1000;//����1000��Ϊ��ת������
		   long day1=between/(24*3600);
		   long hour1=between%(24*3600)/3600;
		   long minute1=between%3600/60;
		   long second1=between%60/60;
		   System.out.println(""+day1+"��"+hour1+"Сʱ"+minute1+"��"+second1+"��");
		**/
		/**
		String myString = "2007-05-31 00:00:00";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINA);
		Date now1 = new Date();
		String now=sdf.format(now1);
		Date date = null;
		try {
		now1 = sdf.parse(now);
		date = sdf.parse(myString);
		} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		long l=now1.getTime()-date.getTime();
		long day=l/(24*60*60*1000);
		long hour=day*24;
		long mon=day/30;
		long year=mon/12;
		System.out.println("���"+hour+"Сʱ");
		System.out.println("���"+day+"��");
		System.out.println("���"+mon+"��");
		System.out.println("���"+year+"��");
		**/
		
		}
		
	
}
