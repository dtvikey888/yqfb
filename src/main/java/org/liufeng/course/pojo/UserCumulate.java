package org.liufeng.course.pojo;
//����ͳ�ƽӿ�_�û��������ݽӿ�_��ȡ�ۼ��û�����pojo
/**
 * 
 * create table wxinterface_yqfbwx_usercumulate
(
id int identity,
ref_date varchar(50),
cumulate_user int,
)
 */
public class UserCumulate {
	
	//���ݵ�����
	private String ref_date;
	//���û���
	private int cumulate_user;
	
	public String getRef_date() {
		return ref_date;
	}
	public void setRef_date(String ref_date) {
		this.ref_date = ref_date;
	}
	public int getCumulate_user() {
		return cumulate_user;
	}
	public void setCumulate_user(int cumulate_user) {
		this.cumulate_user = cumulate_user;
	}
	

	
	
	
	
}
