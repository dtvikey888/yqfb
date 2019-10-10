package org.liufeng.course.menu;

/**
 * 类名称:ToXcx.java
 * 类描述:小程序菜单实体类
 * 作    者:why
 * 时    间:2017年4月21日
 */
public class ToXcx extends Button {
	private String type;		//类型
	private String name;		//菜单名称
	private String url;			//不支持小程序跳转地址
	private String appid;		//小程序appid
	private String pagepath;	//小程序页面路径
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getPagepath() {
		return pagepath;
	}
	public void setPagepath(String pagepath) {
		this.pagepath = pagepath;
	}
	
}
