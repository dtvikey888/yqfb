package org.liufeng.course.pojo;
//数据统计接口_图文分析数据接口_获取图文群发总数据_details的 pojo
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
	//统计的日期，在getarticletotal接口中，ref_date指的是文章群发出日期， 而stat_date是数据统计日期
	public String stat_date;
	//送达人数，一般约等于总粉丝数（需排除黑名单或其他异常情况下无法收到消息的粉丝）
	public int target_user;
	//图文页（点击群发图文卡片进入的页面）的阅读人数
	public int int_page_read_user;
	//图文页的阅读次数
	public int int_page_read_count;
	//原文页（点击图文页“阅读原文”进入的页面）的阅读人数，无原文页时此处数据为0
	public int ori_page_read_user;
	//原文页的阅读次数
	public int ori_page_read_count;
	//分享的人数
	public int share_user;
	//分享的次数
	public int share_count;
	//收藏的人数
	public int add_to_fav_user;
	//收藏的次数
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
