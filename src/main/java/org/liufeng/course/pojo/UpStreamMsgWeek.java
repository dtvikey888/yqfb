package org.liufeng.course.pojo;
//����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ����������pojo
/**
 * create table wxinterface_yqfbwx_upstreammsgweek
(
id int identity,
ref_date varchar(50),
msg_type int,
msg_user int,
msg_count int
)
 */
public class UpStreamMsgWeek {
	//���ݵ�����
	private String ref_date; 
	//��Ϣ���ͣ����������£�
	//1�������� 2����ͼƬ 3�������� 4������Ƶ 6���������Ӧ����Ϣ��������Ϣ��
	private int msg_type;
	//���з����ˣ����ںŷ����ˣ���Ϣ���û���
	private int msg_user;
	//���з�������Ϣ����Ϣ����
	private int msg_count;
	
	public String getRef_date() {
		return ref_date;
	}
	public void setRef_date(String ref_date) {
		this.ref_date = ref_date;
	}
	public int getMsg_type() {
		return msg_type;
	}
	public void setMsg_type(int msg_type) {
		this.msg_type = msg_type;
	}
	public int getMsg_user() {
		return msg_user;
	}
	public void setMsg_user(int msg_user) {
		this.msg_user = msg_user;
	}
	public int getMsg_count() {
		return msg_count;
	}
	public void setMsg_count(int msg_count) {
		this.msg_count = msg_count;
	}
	
	
}
