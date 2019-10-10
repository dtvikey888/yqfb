package org.liufeng.course.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.fjw.weixin.util.PublicFun;

public class Db2 {
	// 将字符串转为date
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
	 * 根据年月获得当前月天数
	 * 
	 * @param dyear
	 *            年
	 * @param dmouth
	 *            月
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
		return rightNow.getActualMaximum(Calendar.DAY_OF_MONTH);// 根据年月 获取月份天数
	}

	/**
	 * 得到两日期相差几个月零几天
	 * 
	 * @param startDate
	 *            开始日期 0000-00-00
	 * @param endDate
	 *            结束日期 0000-00-00
	 * @return 月份，零几天 1,2 （一个月零两天） 返回0则结束日期小于开始日期
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

			if (day <= 0) { // 结束日期天 - 开始日期天为负数，则向月借位 ， 借位月 -1 ，天计算为 借位月天数+
							// 原结束日期天 - 开始日期天
				month--;
				if (month < 0) {// 借位月减后小于等于0则向年借位
					year--;// 年--
					if (year >= 0) {// 如果年大于等于开始日期年，则借位月值为12，否则结束日期小于开始日期，异常
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
	 * 得到两日期相差零几天
	 * 
	 * @param startDate
	 *            开始日期 0000-00-00
	 * @param endDate
	 *            结束日期 0000-00-00
	 * @return 月份，零几天 1,2 （一个月零两天） 返回0则结束日期小于开始日期
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

			if (day <= 0) { // 结束日期天 - 开始日期天为负数，则向月借位 ， 借位月 -1 ，天计算为 借位月天数+
							// 原结束日期天 - 开始日期天
				month--;
				if (month < 0) {// 借位月减后小于等于0则向年借位
					year--;// 年--
					if (year >= 0) {// 如果年大于等于开始日期年，则借位月值为12，否则结束日期小于开始日期，异常
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
