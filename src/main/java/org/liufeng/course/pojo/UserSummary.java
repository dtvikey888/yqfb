package org.liufeng.course.pojo;
//����ͳ�ƽӿ�_�û��������ݽӿ�_��ȡ�û���������pojo
/**
 *
 *create table wxinterface_yqfbwx_usersummary
(
id int identity,
ref_date varchar(50),
user_source int,
new_user int,
cancel_user int
)
 */
public class UserSummary {
	
	//���ݵ�����
	private String ref_date;
	//�û�������
	private int user_source;
	//�������û�����
	private int new_user;
	//ȡ����ע���û�������new_user��ȥcancel_user��Ϊ�����û�����
	private int cancel_user;
	
	public String getRef_date() {
		return ref_date;
	}
	public void setRef_date(String ref_date) {
		this.ref_date = ref_date;
	}
	public int getUser_source() {
		return user_source;
	}
	public void setUser_source(int user_source) {
		this.user_source = user_source;
	}
	public int getNew_user() {
		return new_user;
	}
	public void setNew_user(int new_user) {
		this.new_user = new_user;
	}
	public int getCancel_user() {
		return cancel_user;
	}
	public void setCancel_user(int cancel_user) {
		this.cancel_user = cancel_user;
	}
	
	

}
