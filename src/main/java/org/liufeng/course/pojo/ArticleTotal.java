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

//����ͳ�ƽӿ�_ͼ�ķ������ݽӿ�_��ȡͼ��Ⱥ��������pojo
public class ArticleTotal {
	
	//���ݵ�����
	private String ref_date;
	private String msgid;
	//ͼ����Ϣ�ı���
	private String title;
	// Details�б�
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
