package org.liufeng.course.pojo;

import java.util.List;

/**
 * �鿴ָ�����µ��������ݣ������ӿڣ�
 * @author Administrator
 *
 */
public class WeixinCommentList {
	//�û�����id
	private int user_comment_id;
	//����ʱ��
	private String create_time;
	//��������
	private String content;
	//openid
	private String openid;
	//�Ƿ�ѡ���ۣ�0Ϊ���Ǿ�ѡ��1Ϊtrue������ѡ
	private int comment_type ;

	// around reply�б�
	private List<Reply> reply;

	public int getUser_comment_id() {
		return user_comment_id;
	}

	public void setUser_comment_id(int user_comment_id) {
		this.user_comment_id = user_comment_id;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public int getComment_type() {
		return comment_type;
	}

	public void setComment_type(int comment_type) {
		this.comment_type = comment_type;
	}

	public List<Reply> getReply() {
		return reply;
	}

	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}


	
	
}
