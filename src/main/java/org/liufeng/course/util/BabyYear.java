package org.liufeng.course.util;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class BabyYear {
	public static void main(String[] args){  
        Calendar birthday = new GregorianCalendar(2018,01,07);//2010��10��12�գ�month��0��ʼ  
        Calendar now = Calendar.getInstance();  
        int day = now.get(Calendar.DAY_OF_MONTH) - birthday.get(Calendar.DAY_OF_MONTH);  
        int month = now.get(Calendar.MONTH) - birthday.get(Calendar.MONTH);  
        int year = now.get(Calendar.YEAR) - birthday.get(Calendar.YEAR);  
        //���ռ���ԭ����day�����������month�裻Ȼ��month�����������year�裻���year�����  
        if(day<0){  
            month -= 1;  
            now.add(Calendar.MONTH, -1);//�õ���һ���£������õ��ϸ��µ�������  
            day = day + now.getActualMaximum(Calendar.DAY_OF_MONTH);  
        }  
        if(month<0){  
            month = (month+12)%12;  
            year--;  
        }  
        System.out.println("���䣺"+year+"��"+month+"��"+day+"��");  
    }  
}
