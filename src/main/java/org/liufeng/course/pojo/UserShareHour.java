package org.liufeng.course.pojo;
//����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ�ķ���ת����ʱ����pojo
/**
 *  create table wxinterface_yqfbwx_usersharehour
(
id int identity,
ref_date varchar(50),
ref_hour int,
share_scene int,
share_user int,
share_count int,
)
 */
public class UserShareHour {
	
	//���ݵ�����
	private String ref_date;
	//���ݵ�Сʱ��������000��2300���ֱ�������[000,100)��[2300,2400)����ÿ�յĵ�1Сʱ�����1Сʱ
	private int ref_hour;
	//����ĳ���
	//1�������ת�� 2��������Ȧ 3������Ѷ΢�� 255��������
	private int share_scene;
	//����Ĵ���
	private int share_count; 
	//���������
	private int share_user;
	
	
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
	public int getShare_scene() {
		return share_scene;
	}
	public void setShare_scene(int share_scene) {
		this.share_scene = share_scene;
	}
	public int getShare_count() {
		return share_count;
	}
	public void setShare_count(int share_count) {
		this.share_count = share_count;
	}
	public int getShare_user() {
		return share_user;
	}
	public void setShare_user(int share_user) {
		this.share_user = share_user;
	}
	
	

}
