package org.liufeng.course.pojo;
//����ͳ�ƽӿ�_�ӿڷ������ݽӿ�_��ȡ�ӿڷ�����ʱ����pojo
/**
 * create table wxinterface_yqfbwx_interfacesummaryhour
(
id int identity,
ref_date varchar(50),
ref_hour int,
callback_count int,
fail_count int,
total_time_cost int,
max_time_cost int
)
 */
public class InterfaceSummaryHour {
	 //���ݵ����ڣ�����begin_date��end_date֮��
	 private String ref_date;
	 //���ݵ�Сʱ
	 private int ref_hour;
	 //ͨ�����������õ�ַ�����Ϣ�󣬱����ظ��û���Ϣ�Ĵ���
	 private int callback_count;
	 //����������ʧ�ܴ���
	 private int fail_count;
	 //�ܺ�ʱ������callback_count��Ϊƽ����ʱ
	 private int total_time_cost;
	 //����ʱ
	 private int max_time_cost;
	 
	public String getRef_date() {
		return ref_date;
	}
	public void setRef_date(String ref_date) {
		this.ref_date = ref_date;
	}
	public int getRef_hour() {
		return ref_hour;
	}
	public void setRef_hour(int ref_hour) {
		this.ref_hour = ref_hour;
	}
	public int getCallback_count() {
		return callback_count;
	}
	public void setCallback_count(int callback_count) {
		this.callback_count = callback_count;
	}
	public int getFail_count() {
		return fail_count;
	}
	public void setFail_count(int fail_count) {
		this.fail_count = fail_count;
	}
	public int getTotal_time_cost() {
		return total_time_cost;
	}
	public void setTotal_time_cost(int total_time_cost) {
		this.total_time_cost = total_time_cost;
	}
	public int getMax_time_cost() {
		return max_time_cost;
	}
	public void setMax_time_cost(int max_time_cost) {
		this.max_time_cost = max_time_cost;
	}
	 
	 
}
