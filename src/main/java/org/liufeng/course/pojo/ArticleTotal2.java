package org.liufeng.course.pojo;
//����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ��Ⱥ��������_details�� pojo
/**
 * create table wxinterface_yqfbwx_articletotal2
(
id int identity,
fid int,
stat_date varchar(50),
target_user int,
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


public class ArticleTotal2 {
	//ͳ�Ƶ����ڣ���getarticletotal�ӿ��У�ref_dateָ��������Ⱥ�������ڣ� ��stat_date������ͳ������
	public String stat_date;
	//�ʹ�������һ��Լ�����ܷ�˿�������ų��������������쳣������޷��յ���Ϣ�ķ�˿��
	public int target_user;
	//ͼ��ҳ�����Ⱥ��ͼ�Ŀ�Ƭ�����ҳ�棩���Ķ�����
	public int int_page_read_user;
	//ͼ��ҳ���Ķ�����
	public int int_page_read_count;
	//ԭ��ҳ�����ͼ��ҳ���Ķ�ԭ�ġ������ҳ�棩���Ķ���������ԭ��ҳʱ�˴�����Ϊ0
	public int ori_page_read_user;
	//ԭ��ҳ���Ķ�����
	public int ori_page_read_count;
	//���������
	public int share_user;
	//����Ĵ���
	public int share_count;
	//�ղص�����
	public int add_to_fav_user;
	//�ղصĴ���
	public int add_to_fav_count;
	
	
	public int int_page_from_friends_read_user;
	public int feed_share_from_feed_user;
	public int feed_share_from_feed_cnt;
	public int int_page_from_feed_read_user;
	public int int_page_from_hist_msg_read_count;
	public int int_page_from_friends_read_count;
	public int int_page_from_session_read_count;
	public int feed_share_from_other_cnt;
	public int int_page_from_other_read_count;
	public int feed_share_from_session_cnt;
	public int int_page_from_feed_read_count;
	public int feed_share_from_session_user;
	public int int_page_from_hist_msg_read_user;
	public int int_page_from_other_read_user;
	public int feed_share_from_other_user;
	public int int_page_from_session_read_user;
	
	
	
	public int getInt_page_from_friends_read_user() {
		return int_page_from_friends_read_user;
	}
	public void setInt_page_from_friends_read_user(
			int int_page_from_friends_read_user) {
		this.int_page_from_friends_read_user = int_page_from_friends_read_user;
	}
	public int getFeed_share_from_feed_user() {
		return feed_share_from_feed_user;
	}
	public void setFeed_share_from_feed_user(int feed_share_from_feed_user) {
		this.feed_share_from_feed_user = feed_share_from_feed_user;
	}
	public int getFeed_share_from_feed_cnt() {
		return feed_share_from_feed_cnt;
	}
	public void setFeed_share_from_feed_cnt(int feed_share_from_feed_cnt) {
		this.feed_share_from_feed_cnt = feed_share_from_feed_cnt;
	}
	public int getInt_page_from_feed_read_user() {
		return int_page_from_feed_read_user;
	}
	public void setInt_page_from_feed_read_user(int int_page_from_feed_read_user) {
		this.int_page_from_feed_read_user = int_page_from_feed_read_user;
	}
	public int getInt_page_from_hist_msg_read_count() {
		return int_page_from_hist_msg_read_count;
	}
	public void setInt_page_from_hist_msg_read_count(
			int int_page_from_hist_msg_read_count) {
		this.int_page_from_hist_msg_read_count = int_page_from_hist_msg_read_count;
	}
	public int getInt_page_from_friends_read_count() {
		return int_page_from_friends_read_count;
	}
	public void setInt_page_from_friends_read_count(
			int int_page_from_friends_read_count) {
		this.int_page_from_friends_read_count = int_page_from_friends_read_count;
	}
	public int getInt_page_from_session_read_count() {
		return int_page_from_session_read_count;
	}
	public void setInt_page_from_session_read_count(
			int int_page_from_session_read_count) {
		this.int_page_from_session_read_count = int_page_from_session_read_count;
	}
	public int getFeed_share_from_other_cnt() {
		return feed_share_from_other_cnt;
	}
	public void setFeed_share_from_other_cnt(int feed_share_from_other_cnt) {
		this.feed_share_from_other_cnt = feed_share_from_other_cnt;
	}
	public int getInt_page_from_other_read_count() {
		return int_page_from_other_read_count;
	}
	public void setInt_page_from_other_read_count(int int_page_from_other_read_count) {
		this.int_page_from_other_read_count = int_page_from_other_read_count;
	}
	public int getFeed_share_from_session_cnt() {
		return feed_share_from_session_cnt;
	}
	public void setFeed_share_from_session_cnt(int feed_share_from_session_cnt) {
		this.feed_share_from_session_cnt = feed_share_from_session_cnt;
	}
	public int getInt_page_from_feed_read_count() {
		return int_page_from_feed_read_count;
	}
	public void setInt_page_from_feed_read_count(int int_page_from_feed_read_count) {
		this.int_page_from_feed_read_count = int_page_from_feed_read_count;
	}
	public int getFeed_share_from_session_user() {
		return feed_share_from_session_user;
	}
	public void setFeed_share_from_session_user(int feed_share_from_session_user) {
		this.feed_share_from_session_user = feed_share_from_session_user;
	}
	public int getInt_page_from_hist_msg_read_user() {
		return int_page_from_hist_msg_read_user;
	}
	public void setInt_page_from_hist_msg_read_user(
			int int_page_from_hist_msg_read_user) {
		this.int_page_from_hist_msg_read_user = int_page_from_hist_msg_read_user;
	}
	public int getInt_page_from_other_read_user() {
		return int_page_from_other_read_user;
	}
	public void setInt_page_from_other_read_user(int int_page_from_other_read_user) {
		this.int_page_from_other_read_user = int_page_from_other_read_user;
	}
	public int getFeed_share_from_other_user() {
		return feed_share_from_other_user;
	}
	public void setFeed_share_from_other_user(int feed_share_from_other_user) {
		this.feed_share_from_other_user = feed_share_from_other_user;
	}
	public int getInt_page_from_session_read_user() {
		return int_page_from_session_read_user;
	}
	public void setInt_page_from_session_read_user(
			int int_page_from_session_read_user) {
		this.int_page_from_session_read_user = int_page_from_session_read_user;
	}
	public String getStat_date() {
		return stat_date;
	}
	public void setStat_date(String stat_date) {
		this.stat_date = stat_date;
	}
	public int getTarget_user() {
		return target_user;
	}
	public void setTarget_user(int target_user) {
		this.target_user = target_user;
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
	
	
	
	

}
