package org.liufeng.course.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class ChangeTime {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//ʱ���ܵ�����  
        int seconds = 30654;  
        //��ʼʱ��  
        int startHours = seconds/3600;  
        int startMinutes = (seconds%3600)/60;  
        int startSeconds = (seconds%3600)%60;  
          
        Calendar cal=Calendar.getInstance();//ʹ��������  
        SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//ʱ���ʽ  
          
        //ʱ�䣺yyyy-MM-dd HH:mm:ss  
        String startDateStr = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH)+1)  
                   + "-" + cal.get(Calendar.DAY_OF_MONTH) + " " + startHours  
                   + ":" + startMinutes + ":" + startSeconds;  
        System.out.println("ʱ�䣺" + startDateStr);  
	}

}
