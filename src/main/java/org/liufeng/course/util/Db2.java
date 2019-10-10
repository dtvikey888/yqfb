package org.liufeng.course.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.fjw.weixin.util.PublicFun;

public class Db2 {
	// ���ַ���תΪdate
	public static Date getTimeForString(String datestr) {
		if (null == datestr || "" == datestr) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return sdf.parse(datestr);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * �������»�õ�ǰ������
	 * 
	 * @param dyear
	 *            ��
	 * @param dmouth
	 *            ��
	 * @return
	 */
	public static int calDayByYearAndMonth(String dyear, String dmouth) {
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy/MM");
		Calendar rightNow = Calendar.getInstance();
		try {
			rightNow.setTime(simpleDate.parse(dyear + "/" + dmouth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return rightNow.getActualMaximum(Calendar.DAY_OF_MONTH);// �������� ��ȡ�·�����
	}

	/**
	 * �õ��������������㼸��
	 * 
	 * @param startDate
	 *            ��ʼ���� 0000-00-00
	 * @param endDate
	 *            �������� 0000-00-00
	 * @return �·ݣ��㼸�� 1,2 ��һ���������죩 ����0���������С�ڿ�ʼ����
	 * @throws ParseException
	 */
	public static String getMonthDiff(String startDate, String endDate)
			throws ParseException {
		Date Date1 = getTimeForString(startDate);
		Date Date2 = getTimeForString(endDate);
		String str = "0";
		if (Date2.getTime() >= Date1.getTime()) {
			String[] split1 = startDate.split("-");
			int year1 = Integer.parseInt(split1[0]);
			int month1 = Integer.parseInt(split1[1]);
			int day1 = Integer.parseInt(split1[2]);

			String[] split2 = endDate.split("-");
			int year2 = Integer.parseInt(split2[0]);
			int month2 = Integer.parseInt(split2[1]);
			int day2 = Integer.parseInt(split2[2]);

			int year = year2 - year1;
			int month = month2 - month1;
			int day = day2 - day1;

			if (day <= 0) { // ���������� - ��ʼ������Ϊ�����������½�λ �� ��λ�� -1 �������Ϊ ��λ������+
							// ԭ���������� - ��ʼ������
				month--;
				if (month < 0) {// ��λ�¼���С�ڵ���0�������λ
					year--;// ��--
					if (year >= 0) {// �������ڵ��ڿ�ʼ�����꣬���λ��ֵΪ12�������������С�ڿ�ʼ���ڣ��쳣
						month = year * 12 + 11;
						int monthday = calDayByYearAndMonth(String
								.valueOf(year), String.valueOf(month));
						day = monthday + day2 - day1;
						if (monthday == day) {
							month++;
							day = 0;
						}
					} else {
						month = 0;
						day = 0;
					}
				} else {
					month = year * 12 + month;
					int monthday = calDayByYearAndMonth(String.valueOf(year),
							String.valueOf(month));
					day = monthday + day2 - day1;
					if (monthday == day) {
						month++;
						day = 0;
					}
				}
			} else {
				month = month + year * 12;
				int monthday = calDayByYearAndMonth(String.valueOf(year2),
						String.valueOf(month2));
				if (monthday == day) {
					month++;
					day = 0;
				}
			}
			str = month + "," + day;
		}
		return str;
	}
	
	
	/**
	 * �õ�����������㼸��
	 * 
	 * @param startDate
	 *            ��ʼ���� 0000-00-00
	 * @param endDate
	 *            �������� 0000-00-00
	 * @return �·ݣ��㼸�� 1,2 ��һ���������죩 ����0���������С�ڿ�ʼ����
	 * @throws ParseException
	 */
	public static String getMonthDayDiff2(String startDate, String endDate)
			throws ParseException {
		
		long mo1 = VeDate2.getBetween(startDate, endDate,VeDate2.YYYYMMDD, VeDate2.MONTH_RETURN);
		long mo2 = mo1%12;
		
		Date Date1 = getTimeForString(startDate);
		Date Date2 = getTimeForString(endDate);
		String str = "0";
		if (Date2.getTime() >= Date1.getTime()) {
			String[] split1 = startDate.split("-");
			int year1 = Integer.parseInt(split1[0]);
			int month1 = Integer.parseInt(split1[1]);
			int day1 = Integer.parseInt(split1[2]);

			String[] split2 = endDate.split("-");
			int year2 = Integer.parseInt(split2[0]);
			int month2 = Integer.parseInt(split2[1]);
			int day2 = Integer.parseInt(split2[2]);

			int year = year2 - year1;
			int month = month2 - month1;
			int day = day2 - day1;

			if (day <= 0) { // ���������� - ��ʼ������Ϊ�����������½�λ �� ��λ�� -1 �������Ϊ ��λ������+
							// ԭ���������� - ��ʼ������
				month--;
				if (month < 0) {// ��λ�¼���С�ڵ���0�������λ
					year--;// ��--
					if (year >= 0) {// �������ڵ��ڿ�ʼ�����꣬���λ��ֵΪ12�������������С�ڿ�ʼ���ڣ��쳣
						month = year * 12 + 11;
						int monthday = calDayByYearAndMonth(String
								.valueOf(year), String.valueOf(month));
						day = monthday + day2 - day1;
						if (monthday == day) {
							month++;
							day = 0;
						}
					} else {
						month = 0;
						day = 0;
					}
				} else {
					month = year * 12 + month;
					int monthday = calDayByYearAndMonth(String.valueOf(year),
							String.valueOf(month));
					day = monthday + day2 - day1;
					if (monthday == day) {
						month++;
						day = 0;
					}
				}
			} else {
				month = month + year * 12;
				int monthday = calDayByYearAndMonth(String.valueOf(year2),
						String.valueOf(month2));
				if (monthday == day) {
					month++;
					day = 0;
				}
			}
			str = mo2+","+day;
		}
		return str;
	}

	public static void main(String[] args) throws ParseException {
		System.out.println(Db2.getMonthDayDiff2("2007-12-29", "2018-06-27"));
		
		
	}

}
