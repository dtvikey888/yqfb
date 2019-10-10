package org.liufeng.course.pojo;
//数据统计接口_用户分析数据接口_获取用户增减数据pojo
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
	
	//数据的日期
	private String ref_date;
	//用户的渠道
	private int user_source;
	//新增的用户数量
	private int new_user;
	//取消关注的用户数量，new_user减去cancel_user即为净增用户数量
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
