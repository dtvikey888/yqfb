package org.liufeng.course.pojo;

import java.util.List;

/**
 * 查看指定文章的评论数据（新增接口）
 * @author Administrator
 *
 */
public class WeixinCommentList {
	//用户评论id
	private int user_comment_id;
	//评论时间
	private String create_time;
	//评论内容
	private String content;
	//openid
	private String openid;
	//是否精选评论，0为即非精选，1为true，即精选
	private int comment_type ;

	// around reply列表
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
