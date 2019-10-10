package org.liufeng.course.pojo;
//数据统计接口_图文分析数据接口_获取图文分享转发数据pojo
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

	//数据的日期
	private String ref_date;
	//分享的场景
	//1代表好友转发 2代表朋友圈 3代表腾讯微博 255代表其他
	private int share_scene;
	//分享的次数
	private int share_count;
	//分享的人数
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