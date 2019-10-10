package org.liufeng.course.pojo;

import java.util.List;
/**
 * create table wxinterface_yqfbwx_articletotal
 (
 id int identity,
 ref_date varchar(50),
 msgid varchar(50),
 title varchar(2000)
 )
 *
 *
 *
 */

//数据统计接口_图文分析数据接口_获取图文群发总数据pojo
public class ArticleTotal {

	//数据的日期
	private String ref_date;
	private String msgid;
	//图文消息的标题
	private String title;
	// Details列表
	private List<ArticleTotal2> details;



	public String getRef_date() {
		return ref_date;
	}
	public void setRef_date(String ref_date) {
		this.ref_date = ref_date;
	}
	public String getMsgid() {
		return msgid;
	}
	public void setMsgid(String msgid) {
		this.msgid = msgid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<ArticleTotal2> getDetails() {
		return details;
	}
	public void setDetails(List<ArticleTotal2> details) {
		this.details = details;
	}



}