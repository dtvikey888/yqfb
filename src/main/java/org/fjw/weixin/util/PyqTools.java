package org.fjw.weixin.util;

import java.sql.ResultSet;


public class PyqTools {
	//该openid 是否存在于yqcn_openid中
	public static boolean IsCz(String openid){
		boolean cjg=false;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select * from yqcn_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				cjg = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;

	}

	//录入
	public static void Rlk(String openid,String nickname,int sex,String country,String province,String city,String himg){
		try {

			PyqTools.ClearNull(openid);
			//PyqTools.ClearOpenid(openid);
			PyqTools.ClearNickNameIsNull(openid);

			MysqlDB db = new MysqlDB();
			String sqlpd = "select * from yqcn_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sqlpd);
			if (!rs.next()) {

				String sql="INSERT INTO yqcn_openid (openid,subscribe,subscribetime,nickname,sex,country,province,city,lg,himg) Values ('"+openid+"','1','0','"+nickname+"','"+sex+"','"+country+"','"+province+"','"+city+"','zh_CN','"+himg+"')";
				db.executeInsert(sql);
				System.out.println(sql);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//获取头像
	public static String GetImg(String openid){
		String tx = "";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select *  from  yqcn_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString("himg");
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return tx;
	}


	//获取头像
	public static String GetImgById(String uid){
		String tx = "";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select *  from  yqcn_openid where id="+uid;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString("himg");
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return tx;
	}

	//获取头像
	public static String GetImgById2(String uid){
		String tx = "";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select *  from  yqfb_openid where id="+uid;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString("himg");
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return tx;
	}

	//获取昵称
	public static String GetNick(String openid){
		String tx = "";
		try {
			MysqlDB db = new MysqlDB();
			String sql="select *  from  yqcn_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString("nickname");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;
	}

	//获取昵称
	public static String GetNickById(String uid){
		String tx = "";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select *  from  yqcn_openid where id="+uid;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString("nickname");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;
	}



	//获取昵称
	public static String GetNickById2(String uid){
		String tx = "";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select *  from  yqfb_openid where id="+uid;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString("nickname");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;
	}


	//获取uid
	public static String GetId(String openid){
		String tx = "";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select *  from  yqcn_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString("id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;
	}


	public static int GetLikeVoteNo(String tid){
		int sl=0;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select count(*) as ct from yqcnwx_pyq_vote where tid="+tid+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				sl = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sl;

	}


	public static int GetCountOfComment(String tid){
		int sl=0;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select count(*) as ct from yqcnwx_pyq_comment where tid="+tid+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				sl = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sl;

	}


	//显示点赞的前4个昵称
	public static String GetVoteNickName(String tid){
		String tx = "";
		String tx2="";
		String uid="";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select *  from yqcnwx_pyq_vote where tid="+tid+" order by fbsj desc limit 4";
			ResultSet rs = db.executeQuery(sql);
			while (rs.next()) {

				uid = rs.getString("uid");

				tx+=GetNickById(uid)+",";

			}

			if (PyqTools.GetLikeVoteNo(tid)>4) {

				tx2=tx.substring(0,tx.length()-1)+"...";

			}else if(PyqTools.GetLikeVoteNo(tid)>0){

				tx2=tx.substring(0,tx.length()-1);

			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx2;
	}

	public static boolean IsUpVote(String uid,String tid){

		boolean iz = false;

		try{

			MysqlDB db = new MysqlDB();
			String pd = "select * from yqcnwx_pyq_vote where uid="+uid+" and tid="+tid+"";
			System.out.println(pd);
			ResultSet rs = db.executeQuery(pd);

			if (rs.next()){

				iz=true;

			}

		}catch(Exception e){

			e.printStackTrace();

		}

		return iz;
	}


	//显示评论内容变成html输出
	public static String GetCommentToHtmlByTid(String tid,String dquid,String openid,String bz){

		String tx = "";
		String uid="";
		int id=0;

		try {
			MysqlDB db = new MysqlDB();
			String sql = "";

			if (bz.equals("0")||bz.length()<=0||bz==null) {
				sql = "select * from yqcnwx_pyq_comment where tid="+tid+" order by fbsj desc limit 5";
			}else {
				sql = "select * from yqcnwx_pyq_comment where tid="+tid+" order by fbsj desc";
			}
			System.out.println(sql);

			ResultSet rs = db.executeQuery(sql);
			while (rs.next()) {

				id = rs.getInt("id");
				uid = rs.getString("uid");

				if (openid.equals("o3P6kjsMBqsjIoiv4wpsVtHpk95o")) {
					tx+="<p><span class=\"data-name\"></span>"+GetNickById(uid)+"<span>：</span>"+rs.getString("memo")+"<a href=\"http://www.yqrb.com.cn/yqcnwx2/pyq/dz.jsp?openid="+openid+"&action=6&id="+id+"\"><img class=\"c-icon\" src=\"picture/del.png\"></a></p>";
				}else {
					if (dquid.equals(uid)) {
						tx+="<p><span class=\"data-name\"></span>"+GetNickById(uid)+"<span>：</span>"+rs.getString("memo")+"<a href=\"http://www.yqrb.com.cn/yqcnwx2/pyq/dz.jsp?openid="+openid+"&action=6&id="+id+"\"><img class=\"c-icon\" src=\"picture/del.png\"></a></p>";
					}else {
						tx+="<p><span class=\"data-name\"></span>"+GetNickById(uid)+"<span>：</span>"+rs.getString("memo")+"</p>";
					}
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;

	}



	//显示评论内容变成html输出小明用
	public static String GetCommentToHtmlByTid2(String tid,String dquid,String openid){

		String tx = "";
		String uid="";
		int id=0;

		try {
			MysqlDB db = new MysqlDB();
			String sql = "select * from yqcnwx_pyq_comment where tid="+tid+" order by fbsj desc";

			System.out.println(sql);

			ResultSet rs = db.executeQuery(sql);
			while (rs.next()) {

				id = rs.getInt("id");
				uid = rs.getString("uid");

				if (openid.equals("o3P6kjsMBqsjIoiv4wpsVtHpk95o")) {
					tx+="<p><span class=\"data-name\"></span>"+GetNickById(uid)+"<span>：</span>"+rs.getString("memo")+"<a href=\"http://www.yqrb.com.cn/yqcnwx2/pyq/dz.jsp?openid="+openid+"&action=7&id="+id+"\"><img class=\"c-icon\" src=\"picture/del.png\"></a></p>";
				}else {
					if (dquid.equals(uid)) {
						tx+="<p><span class=\"data-name\"></span>"+GetNickById(uid)+"<span>：</span>"+rs.getString("memo")+"<a href=\"http://www.yqrb.com.cn/yqcnwx2/pyq/dz.jsp?openid="+openid+"&action=7&id="+id+"\"><img class=\"c-icon\" src=\"picture/del.png\"></a></p>";
					}else {
						tx+="<p><span class=\"data-name\"></span>"+GetNickById(uid)+"<span>：</span>"+rs.getString("memo")+"</p>";
					}
				}



			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;

	}

	//VR加载更多的
	public static String GetMorForVr(String bc){
		String tx = "";

		try {



		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;

	}


	//是否验证
	public static int IsYz(String tid){

		int yz =0;

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select yz from yqcnwx_pyq_theme where id="+tid;
			ResultSet rs =  db.executeQuery(sql);

			if (rs.next()) {
				yz = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return yz;

	}


	//清除openid
	public static void ClearOpenid(String openid){
		try {
			MysqlDB db = new MysqlDB();
			String sql = "delete from yqcn_openid where openid='"+openid+"'";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//清除nickname is null
	public static void ClearNickNameIsNull(String openid){
		try {
			MysqlDB db = new MysqlDB();
			String sql = "delete from yqcn_openid where nickname is null and openid='"+openid+"'";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//清除null
	public static void ClearNull(String openid){
		try {
			MysqlDB db = new MysqlDB();
			String sql = "delete from yqcn_openid where subscribe='0' and openid='"+openid+"'";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}