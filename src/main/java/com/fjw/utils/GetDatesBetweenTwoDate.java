package com.fjw.utils;

/**
 * @Author: dtvikey
 * @Date: 09/10/19 下午 04:41
 * @Version 1.0
 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class GetDatesBetweenTwoDate {

    public static void main(String[] args) throws Exception {

        String start = "2016-04-01";
        String end = "2016-04-07";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dBegin = sdf.parse(start);
        Date dEnd = sdf.parse(end);
        List<Date> listDate = getDatesBetweenTwoDate2(dBegin, dEnd);
        for(int i=0;i<listDate.size();i++){
            System.out.println(sdf.format(listDate.get(i)));

        }

        List<String> listString = ChangerToStringList(listDate,start,end);
        for (int i = 0; i < listString.size(); i++) {
            System.out.println(listString.get(i));
        }
        System.out.println("list对象中是否包含元素 " + listString.contains("2016-04-07"));

        System.out.println("list对象中是否包含元素-- " + IsContainsForCell(start,end,"2016-04-02"));


    }


    //判断列表中是否包含指定元素
    public static boolean IsContainsForCell(String start,String end,String hao) throws ParseException{

        boolean iscz = false;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dBegin = sdf.parse(start);
        Date dEnd = sdf.parse(end);
        List<Date> listDate = getDatesBetweenTwoDate2(dBegin, dEnd);
        List<String> listString  = ChangerToStringList(listDate,start,end);
        iscz = listString.contains(hao);

        return iscz;
    }



    /**
     *  List<Date> 转 list<String >
     * @throws ParseException
     *
     */
    public static List<String> ChangerToStringList(List<Date> listDate,String start,String end) throws ParseException{

        List<String> list = new ArrayList<String>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dBegin = sdf.parse(start);
        Date dEnd = sdf.parse(end);
        listDate = getDatesBetweenTwoDate2(dBegin, dEnd);
        for(int i=0;i<listDate.size();i++){
            //System.out.println(sdf.format(listDate.get(i)));
            list.add(sdf.format(listDate.get(i)).toString());

        }

        return list;




    }



    /**
     * 根据开始时间和结束时间返回时间段内的时间集合
     *
     * @param beginDate
     * @param endDate
     * @return List
     */
    public static List<Date> getDatesBetweenTwoDate2(Date beginDate, Date endDate) {
        List<Date> lDate = new ArrayList<Date>();
        lDate.add(beginDate);// 把开始时间加入集合
        Calendar cal = Calendar.getInstance();
        // 使用给定的 Date 设置此 Calendar 的时间
        cal.setTime(beginDate);
        boolean bContinue = true;
        while (bContinue) {
            // 根据日历的规则，为给定的日历字段添加或减去指定的时间量
            cal.add(Calendar.DAY_OF_MONTH, 1);
            // 测试此日期是否在指定日期之后
            if (endDate.after(cal.getTime())) {
                lDate.add(cal.getTime());
            } else {
                break;
            }
        }
        lDate.add(endDate);// 把结束时间加入集合
        return lDate;
    }

}