package org.liufeng.course.pojo;
//����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ�ķ���ת������pojo
/**
 *  create table wxinterface_yqfbwx_usershare
(
id int identity,
ref_date varchar(50),
share_scene int,
share_user int,
share_count int,
)
 */
public class UserShare {
	
	//���ݵ�����
	private String ref_date;
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
