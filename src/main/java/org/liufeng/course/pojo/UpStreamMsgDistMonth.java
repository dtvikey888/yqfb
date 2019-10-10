package org.liufeng.course.pojo;
//数据统计接口_消息分析数据接口_获取消息发送分布月数据pojo
/**
 * create table wxinterface_yqfbwx_upstreammsgdistmonth
 (
 id int identity,
 ref_date varchar(50),
 count_interval int,
 msg_user int,
 )
 */
public class UpStreamMsgDistMonth {

	//数据的日期，需在begin_date和end_date之间
	private String ref_date;
	//当日发送消息量分布的区间，0代表 “0”，1代表“1-5”，2代表“6-10”，3代表“10次以上”
	private int count_interval;
	//上行发送了（向公众号发送了）消息的用户数
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