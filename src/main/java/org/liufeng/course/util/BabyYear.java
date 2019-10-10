package org.liufeng.course.util;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class BabyYear {
	public static void main(String[] args){  
        Calendar birthday = new GregorianCalendar(2018,01,07);//2010年10月12日，month从0开始  
        Calendar now = Calendar.getInstance();  
        int day = now.get(Calendar.DAY_OF_MONTH) - birthday.get(Calendar.DAY_OF_MONTH);  
        int month = now.get(Calendar.MONTH) - birthday.get(Calendar.MONTH);  
        int year = now.get(Calendar.YEAR) - birthday.get(Calendar.YEAR);  
        //按照减法原理，先day相减，不够向month借；然后month相减，不够向year借；最后year相减。  
        if(day<0){  
            month -= 1;  
            now.add(Calendar.MONTH, -1);//得到上一个月，用来得到上个月的天数。  
            day = day + now.getActualMaximum(Calendar.DAY_OF_MONTH);  
        }  
        if(month<0){  
            month = (month+12)%12;  
            year--;  
        }  
        System.out.println("年龄："+year+"年"+month+"月"+day+"天");  
    }  
}
