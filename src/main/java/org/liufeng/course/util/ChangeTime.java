package org.liufeng.course.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class ChangeTime {

    /**
     * @param args
     */
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        //时间总的秒数
        int seconds = 30654;
        //开始时间
        int startHours = seconds/3600;
        int startMinutes = (seconds%3600)/60;
        int startSeconds = (seconds%3600)%60;

        Calendar cal=Calendar.getInstance();//使用日历类
        SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//时间格式

        //时间：yyyy-MM-dd HH:mm:ss
        String startDateStr = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH)+1)
                + "-" + cal.get(Calendar.DAY_OF_MONTH) + " " + startHours
                + ":" + startMinutes + ":" + startSeconds;
        System.out.println("时间：" + startDateStr);
    }

}