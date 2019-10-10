package org.fjw.weixin.util;

import java.sql.ResultSet;

public class MyUtils24 {

	public static boolean IsGz(String id){
		boolean isgz = false;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select gz from yqxcb_openid where id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				if(rs.getInt(1)==1){
					isgz=true;

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isgz;
	}

	public static boolean IsGz2(String op){
		boolean isgz = false;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select * from yqxcb_openid2 where openid='"+op+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				isgz=true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isgz;
	}




	public static String Rk(String... objs){

		String id ="";

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select * from yqxcb_openid where openid='"+objs[0]+"'";
			System.out.println(sql);
			String sql2 = "";
			ResultSet rs = db.executeQuery(sql);
			if (!rs.next()) {
				sql2 = "insert into yqxcb_openid(openid,name1,headimg,fbsj) values('"+objs[0]+"','"+objs[1]+"','"+objs[2]+"','"+TimeString.nowTime()+"')";
				System.out.println(sql2);
				db.executeInsert(sql2);
			}else{
				id = rs.getString("id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return id;

	}






	public static String GetOpenid(String... objs){

		String openid="";

		try {
			MysqlDB db = new MysqlDB();
			String sql = "select openid from yqxcb_openid where id="+objs[0];
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				openid = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return openid;

	}


	public static String GetId(String... objs){

		String id="";

		try {
			MysqlDB db = new MysqlDB();
			String sql = "select id from yqxcb_openid where openid='"+objs[0]+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				id = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return id;

	}

	public static boolean IsXy(String...objs){

		boolean xy = false;

		try {
			MysqlDB db = new MysqlDB();
			String sql = "select id2 from yqxcb_zl where id1="+objs[0]+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				if(rs.getString(1).equals(objs[1])){
					xy=true;

				}

			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return xy;

	}


	//助力响应
	public static int Zl(String... objs){
		int bl=0;
		if (objs[0].equals(objs[1])) {
			bl=1;  //自己不能点自己
		}else{

			try {
				MysqlDB db = new MysqlDB();
				String sql = "select * from yqxcb_zl where id1="+objs[0]+" and id2="+objs[1]+"";
				ResultSet rs = db.executeQuery(sql);
				if (rs.next()) {
					bl = 2; //已经点过，不能重复助力
				}else{
					String sql2="insert into yqxcb_zl(id1,id2) values("+objs[0]+","+objs[1]+")";
					db.executeInsert(sql2);
					bl=3;   //第一次点，助力成功
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return bl;
	}



	//助力响应
	public static void ZlYX(String... objs){

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select id2 from yqxcb_zl where id1="+objs[0];
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);

			if (!rs.next()) {


				String sql2="insert into yqxcb_zl(id1,id2) values("+objs[0]+","+objs[1]+")";
				db.executeInsert(sql2);


			}

		} catch (Exception e) {
			e.printStackTrace();
		}


	}






	public static String GetName1(String... objs){
		String name1="";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select name1 from yqxcb_openid where id="+objs[0];
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				name1 = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("name1= "+name1);

		return name1;
	}



	public static String GetHeadImg(String... objs){
		String headimg="";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select headimg from yqxcb_openid where id="+objs[0];
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				headimg = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return headimg;
	}


	public static int GetPerNum(String... objs){

		int pn=0;

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select count(*) as ct from yqxcb_zl where id1="+objs[0];
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				pn = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return pn;

	}


	public static String GetHtmlZLPER(String...objs){
		String sc="";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select id2 from yqxcb_zl where id1="+objs[0]+" order by id desc limit 77";
			System.out.println(sql);
			String sql2="";
			ResultSet rs = db.executeQuery(sql);
			int i=1;
			while (rs.next()) {
				sql2="select headimg from yqxcb_openid where id="+rs.getInt("id2");
				System.out.println(sql2);
				ResultSet rs2 = db.executeQuery(sql2);
				if (rs2.next()) {
					sc+="<div class=\"div-inline\"><img src="+rs2.getString(1)+" class=\"circle\"/></div>";
				}

				if (i%7==0) {
					sc+="<br/>";
				}

				i++;
			}

			System.out.println(sc);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sc;
	}

	//排行榜 SQL语句: select id1,count(id1) ct from yqxcb_zl group by id1 DESC

	//圆角矩形 <div style="width:300px; height:45px;background:#f00;border-radius:80px"></div>

	public static String GetHtmlPHB(int...objs){
		String sc="";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select id1,count(id1) ct from yqxcb_zl group by id1  order by ct desc  limit "+objs[0]+"";
			System.out.println(sql);
			String sql2="";
			ResultSet rs = db.executeQuery(sql);
			int i=1;
			while (rs.next()) {
				sql2="select headimg,name1,DATE_FORMAT(fbsj,'%m-%d %H:%i') as fbsj from yqxcb_openid where id="+rs.getInt("id1");
				System.out.println(sql2);
				ResultSet rs2 = db.executeQuery(sql2);
				if (rs2.next()) {

					if (i%2==0) {

						sc+="<div id=\"phb33\"><div id=\"phb4\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width=\"11%\">NO."+i+"</td><td width=\"12%\">&nbsp;<img src="+rs2.getString(1)+" class=\"circle\"/></td><td width=\"35%\">"+rs2.getString(2)+"</td><td width=\"42%\">"+rs.getString("ct")+"人响应</td></tr></table></div></div>";

					}else {

						sc+="<div id=\"phb3\"><div id=\"phb4\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width=\"11%\">NO."+i+"</td><td width=\"12%\">&nbsp;<img src="+rs2.getString(1)+" class=\"circle\"/></td><td width=\"35%\">"+rs2.getString(2)+"</td><td width=\"42%\">"+rs.getString("ct")+"人响应</td></tr></table></div></div>";

					}

				}

				i++;


			}

			System.out.println(sc);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sc;
	}


	public static boolean iscz(String...objs)
	{
		boolean bz=false;

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select * from yqxcbm where openid='"+objs[0]+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				bz=true;

			}else {

				bz=false;

			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz;

	}

	public static boolean LrXx2(String... objs){
		boolean bz=false;
		try {

			MysqlDB db = new MysqlDB();
			String sql = "select * from yqxcbm where openid='"+objs[0]+"'";
			ResultSet rs=db.executeQuery(sql);

			if (!rs.next()) {

				db.executeInsert("insert into yqxcbm(openid,xm,tel) values('"+objs[0]+"','"+objs[1]+"','"+objs[2]+"')");
				bz=true;

			}else {

				bz=false;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz;
	}


	//丁可科普日活动录入姓名
	public static boolean LrXx(String... objs){
		boolean bz=false;
		try {

			MysqlDB db = new MysqlDB();
			String sql = "select * from kprbm where tel='"+objs[1]+"'";
			ResultSet rs=db.executeQuery(sql);

			if (!rs.next()) {

				db.executeInsert("insert into kprbm(xm,tel) values('"+objs[0]+"','"+objs[1]+"')");
				bz=true;

			}else {

				bz=false;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz;
	}


	//丁可科普日活动答题

	//save
	public static boolean save1(int...objs){

		boolean bz=false;
		try {
			if(objs[0]==4&&objs[1]==3&&objs[2]==3&&objs[3]==1&&objs[4]==2&&objs[5]==1&&objs[6]==1&&objs[7]==2&&objs[8]==1&&objs[9]==4){

				bz=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz;
	}


	//丁可科普日活动录入姓名
	public static String SCKPHTML(){
		String bz="";
		try {

			MysqlDB db = new MysqlDB();
			String sql = "select xm,tel from kprbm order by id desc";
			ResultSet rs=db.executeQuery(sql);

			while (rs.next()) {

				bz+="<div>"+rs.getString(1)+"    "+rs.getString(2)+"</div>";

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz;
	}

}