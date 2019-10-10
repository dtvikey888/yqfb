package org.liufeng.course.pojo;
//数据统计接口_消息分析数据接口_获取消息发送月数据pojo
/**
 * create table wxinterface_yqfbwx_upstreammsgmonth
 (
 id int identity,
 ref_date varchar(50),
 msg_type int,
 msg_user int,
 msg_count int
 )
 */
public class UpStreamMsgMonth {

	//数据的日期
	private String ref_date;
	//消息类型，代表含义如下：
	//1代表文字 2代表图片 3代表语音 4代表视频 6代表第三方应用消息（链接消息）
	private int msg_type;
	//上行发送了（向公众号发送了）消息的用户数
	private int msg_user;
	//上行发送了消息的消息总数
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