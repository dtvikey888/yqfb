package org.liufeng.course.menu;

/**
 * ������:ToXcx.java
 * ������:С����˵�ʵ����
 * ��    ��:why
 * ʱ    ��:2017��4��21��
 */
public class ToXcx extends Button {
	private String type;		//����
	private String name;		//�˵�����
	private String url;			//��֧��С������ת��ַ
	private String appid;		//С����appid
	private String pagepath;	//С����ҳ��·��
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
