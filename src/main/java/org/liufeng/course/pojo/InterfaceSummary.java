package org.liufeng.course.pojo;
//数据统计接口_接口分析数据接口_获取接口分析数据pojo
/**
 * create table wxinterface_yqfbwx_interfacesummary
 (
 id int identity,
 ref_date varchar(50),
 callback_count int,
 fail_count int,
 total_time_cost int,
 max_time_cost int
 )
 */
public class InterfaceSummary {
	//数据的日期，需在begin_date和end_date之间
	private String ref_date;
	//通过服务器配置地址获得消息后，被动回复用户消息的次数
	private int callback_count;
	//上述动作的失败次数
	private int fail_count;
	//总耗时，除以callback_count即为平均耗时
	private int total_time_cost;
	//最大耗时
	private int max_time_cost;

	public String getRef_date() {
		return ref_date;
	}
	public void setRef_date(String ref_date) {
		this.ref_date = ref_date;
	}
	public int getCallback_count() {
		return callback_count;
	}
	public void setCallback_count(int callback_count) {
		this.callback_count = callback_count;
	}
	public int getFail_count() {
		return fail_count;
	}
	public void setFail_count(int fail_count) {
		this.fail_count = fail_count;
	}
	public int getTotal_time_cost() {
		return total_time_cost;
	}
	public void setTotal_time_cost(int total_time_cost) {
		this.total_time_cost = total_time_cost;
	}
	public int getMax_time_cost() {
		return max_time_cost;
	}
	public void setMax_time_cost(int max_time_cost) {
		this.max_time_cost = max_time_cost;
	}




}