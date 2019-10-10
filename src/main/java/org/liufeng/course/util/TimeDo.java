package org.liufeng.course.util;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class TimeDo {
	
	/**
	 * �ɹ�ȥ��ĳһʱ��,������뵱ǰ��ʱ��
	 * */
	public String CalculateTime(String time){
		long nowTime=System.currentTimeMillis();  //��ȡ��ǰʱ��ĺ�����
		String msg = null;
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//ָ��ʱ���ʽ
		 Date setTime = null;  //ָ��ʱ��
		try {
			setTime = sdf.parse(time);  //���ַ���ת��Ϊָ����ʱ���ʽ
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
	    long reset=setTime.getTime();   //��ȡָ��ʱ��ĺ�����
	 	long dateDiff=nowTime-reset;
	 	
	 	if(dateDiff<0){
	 		msg="�����ʱ�䲻��";
	 	}else{
	 	
		long dateTemp1=dateDiff/1000; //��
		long dateTemp2=dateTemp1/60; //����
		long dateTemp3=dateTemp2/60; //Сʱ
		long dateTemp4=dateTemp3/24; //����
		long dateTemp5=dateTemp4/30; //����
		long dateTemp6=dateTemp5/12; //����
		
		if(dateTemp6>0){
			msg = dateTemp6+"��ǰ";
			
		}else if(dateTemp5>0){
			msg = dateTemp5+"����ǰ";
			
		}else if(dateTemp4>0){
			msg = dateTemp4+"��ǰ";
			
		}else if(dateTemp3>0){
			msg = dateTemp3+"Сʱǰ";
			
		}else if(dateTemp2>0){
			msg = dateTemp2+"����ǰ";
			
		}else if(dateTemp1>0){
			msg = "�ո�";
			
		}	
		
		
	}
		return msg;
		
	}
	
	public static void main(String[] args) {
		Scanner input=new Scanner(System.in);  
        String time=input.nextLine();  
        TimeDo date = new TimeDo();  
        String ss=date.CalculateTime(time);  
        System.out.println(ss);  
	}
}
