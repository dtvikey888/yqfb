package org.liufeng.course.pojo;
//����ͳ�ƽӿ�_��Ϣ�������ݽӿ�_��ȡ��Ϣ���ͷֲ�����pojo
/**
 * create table wxinterface_yqfbwx_upstreammsgdist
(
id int identity,
ref_date varchar(50),
count_interval int,
msg_user int,
)
 */
public class UpStreamMsgDist {
	
	//���ݵ����ڣ�����begin_date��end_date֮��
	private String ref_date;
	//���շ�����Ϣ���ֲ������䣬0���� ��0����1����1-5����2����6-10����3����10�����ϡ�
    private int count_interval;
    //���з����ˣ����ںŷ����ˣ���Ϣ���û���
    private int msg_user;
    
	public String getRef_date() {
		return ref_date;
	}
	public void setRef_date(String ref_date) {
		this.ref_date = ref_date;
	}
	public int getCount_interval() {
		return count_interval;
	}
	public void setCount_interval(int count_interval) {
		this.count_interval = count_interval;
	}
	public int getMsg_user() {
		return msg_user;
	}
	public void setMsg_user(int msg_user) {
		this.msg_user = msg_user;
	}
    
    

}
