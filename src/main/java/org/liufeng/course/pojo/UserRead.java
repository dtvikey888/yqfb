package org.liufeng.course.pojo;
//����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ��ͳ������pojo
/**
 * create table wxinterface_yqfbwx_userread
(
id int identity,
ref_date varchar(50),
user_source int,
int_page_read_user int,
int_page_read_count int,
ori_page_read_user int,
ori_page_read_count int,
share_user int,
share_count int,
add_to_fav_user int,
add_to_fav_count int

)
 */
public class UserRead {
	//���ݵ�����
	private String ref_date;
	//�ڻ�ȡͼ���Ķ���ʱ����ʱ���и��ֶΣ������û�������������Ķ���ͼ�ġ�0:�Ự;1.����;2.����Ȧ;3.��Ѷ΢��;4.��ʷ��Ϣҳ;5.����
	private int user_source;
	//ͼ��ҳ�����Ⱥ��ͼ�Ŀ�Ƭ�����ҳ�棩���Ķ�����
	private int int_page_read_user;
	//ͼ��ҳ���Ķ�����
	private int int_page_read_count;
	//ԭ��ҳ�����ͼ��ҳ���Ķ�ԭ�ġ������ҳ�棩���Ķ���������ԭ��ҳʱ�˴�����Ϊ0
	private int ori_page_read_user;
	//ԭ��ҳ���Ķ�����
	private int ori_page_read_count;
	//���������
	private int share_user;
	//����Ĵ���
	private int share_count;
	//�ղص�����
	private int add_to_fav_user;
	//�ղصĴ���
	private int add_to_fav_count;
	
	
	public String getRef_date() {
		return ref_date;
	}
	public void setRef_date(String ref_date) {
		this.ref_date = ref_date;
	}
	public int getInt_page_read_user() {
		return int_page_read_user;
	}
	public void setInt_page_read_user(int int_page_read_user) {
		this.int_page_read_user = int_page_read_user;
	}
	public int getInt_page_read_count() {
		return int_page_read_count;
	}
	public void setInt_page_read_count(int int_page_read_count) {
		this.int_page_read_count = int_page_read_count;
	}
	public int getOri_page_read_user() {
		return ori_page_read_user;
	}
	public void setOri_page_read_user(int ori_page_read_user) {
		this.ori_page_read_user = ori_page_read_user;
	}
	public int getOri_page_read_count() {
		return ori_page_read_count;
	}
	public void setOri_page_read_count(int ori_page_read_count) {
		this.ori_page_read_count = ori_page_read_count;
	}
	public int getShare_user() {
		return share_user;
	}
	public void setShare_user(int share_user) {
		this.share_user = share_user;
	}
	public int getShare_count() {
		return share_count;
	}
	public void setShare_count(int share_count) {
		this.share_count = share_count;
	}
	public int getAdd_to_fav_user() {
		return add_to_fav_user;
	}
	public void setAdd_to_fav_user(int add_to_fav_user) {
		this.add_to_fav_user = add_to_fav_user;
	}
	public int getAdd_to_fav_count() {
		return add_to_fav_count;
	}
	public void setAdd_to_fav_count(int add_to_fav_count) {
		this.add_to_fav_count = add_to_fav_count;
	}
	public int getUser_source() {
		return user_source;
	}
	public void setUser_source(int user_source) {
		this.user_source = user_source;
	}
	
	
	
	
	
}
