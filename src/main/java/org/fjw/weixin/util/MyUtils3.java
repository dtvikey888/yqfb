package org.fjw.weixin.util;

import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class MyUtils3 {

	//获取最后一个编号
	public static String GetBENBH(){

		String bh ="";

		try {
			sql_data db = new sql_data();
			String sql= "select top 1 bh from yqfbwx_face where bh<>'' order by bh desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String ss = rs.getString(1);
				int ss2 = (new Integer(ss));

				NumberFormat f=new DecimalFormat("00000");
				for(int i=ss2;i<=ss2;i++){

					bh= f.format(i);
				}

			}else {
				bh="00001";
			}

		} catch (Exception e) {

			e.printStackTrace();

		}


		return bh;
	}

	//获取下一个编号
	public static String GetNextBH(){

		String bh ="";

		try {
			sql_data db = new sql_data();
			String sql= "select top 1 bh from yqfbwx_face where bh<>'' order by bh desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String ss = rs.getString(1);
				int ss2 = (new Integer(ss))+1;

				NumberFormat f=new DecimalFormat("00000");
				for(int i=ss2;i<=ss2;i++){

					bh= f.format(i);
				}

			}else {
				bh="00001";
			}

		} catch (Exception e) {

			e.printStackTrace();

		}


		return bh;
	}


	//获取下一个编号
	public static String GetNextBH2(){

		String bh ="";

		try {
			sql_data db = new sql_data();
			String sql= "select top 1 bh from yqfbwx_whlt where bh<>'' order by bh desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String ss = rs.getString(1);
				int ss2 = (new Integer(ss))+1;

				NumberFormat f=new DecimalFormat("000");
				for(int i=ss2;i<=ss2;i++){

					bh= f.format(i);
				}

			}else {
				bh="001";
			}

		} catch (Exception e) {

			e.printStackTrace();

		}


		return bh;
	}


	//姓名/手机号/编号
	//投票 返回 1 不存在该编号, 2.已经投过票 3.投票成功 4.输入格式不正确 5.投票已经结束,感谢关注！ 6.投票还没开始呢 7.电话号码已经存在，同一个号码不能重复投票
	public static int Tp(String openid,String content){
		int cz =0;
		try {

			//控制时间
			int kz =0;
			String tt1=AllValus.ff1;
			String tt2=AllValus.ff2;
			Date c1=MyUtils2.CharDate(tt1);
			Date c2=MyUtils2.CharDate(tt2);
			kz= MyUtils2.TimeKZ(c1,c2);
			//1: //开始投票
			//2: //投票已经结束,感谢关注！
			//3: //投票还没开始呢
			if (kz==1) {




				//先判断格式是否正确
				String dd[] = PublicFun.split(content, "/");
				if (dd.length==3) {




					//1.先查询在yqfbwx_face 中是否存在该 bh ，如果存在再进行投票，如果不存在就返回false
					sql_data db = new sql_data();

					ResultSet rs3= db.executeQuery("select * from yqfbwx_tp where tel='"+dd[1]+"'");
					//电话号码是否已经存在
					if (rs3.next()) {

						cz=7;

					}else{

						ResultSet rs = db.executeQuery("select * from yqfbwx_face where bh='"+dd[2]+"'");
						if (rs.next()) {
							//存在就进行投票 首先判断是表 yqfbwx_tp 中是否存在该openid
							ResultSet rs2 = db.executeQuery("select * from yqfbwx_tp where openid='"+openid+"'");
							if (rs2.next()) {

								cz=2;

							}else {
								String sql = "insert into yqfbwx_tp(openid,xm,tel,faceid,fbsj) values('"+openid+"','"+dd[0]+"','"+dd[1]+"',"+rs.getInt("id")+",'"+TimeString.nowTime()+"')";
								db.executeInsert(sql);

								//把 yqfbwx_face zan+1
								String sql2="update yqfbwx_face set zan=zan+1 where id="+rs.getInt("id");
								db.executeUpdate(sql2);
								cz=3;
							}

						}else {
							cz=1;
						}

					}

				}else {
					cz=4;
				}

			}else if(kz==2){


				cz=5;

			}else if (kz==3) {
				cz=6;
			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return cz;
	}


	//根据faceid获取票数
	public static int GetPS(String id){
		int ps =0;
		try {
			sql_data db = new sql_data();
			String sql="select count(*) as ct from yqfbwx_tp where faceid="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				ps = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}

	//根据id获取票数
	public static int GetPS2(String id,String lb){
		int ps =0;
		try {
			sql_data db = new sql_data();
			String sql="select ps from yqfbwx_whlt where lb="+lb+" and id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				ps = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}





	//根据id获取票数
	public static int GetPS3(String id,String lb){
		int ps =0;
		try {
			sql_data db = new sql_data();
			String sql="select ps from yqsjwx_bdsp where lb="+lb+" and id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				ps = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}



	//根据id获取票数
	public static int GetPS4(String id){
		int ps =0;
		try {
			MysqlDB db = new MysqlDB();
			String sql="select ps from yqcnwx_twb where id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				ps = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}

	//根据id获取票数
	public static int GetPS5(String id){
		int ps =0;
		try {
			sql_data db = new sql_data();
			String sql="select ps from yqcnwx_lcb where id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				ps = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}

	//根据id获取票数
	public static int GetPS6(String id,int lb){
		int ps =0;
		try {
			MysqlDB db = new MysqlDB();
			String sql="select ps from yqcnwx_lcb where lb="+lb+" and id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				ps = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}


	//根据id获取票数
	public static int GetPS7(String id){
		int ps =0;
		try {
			MysqlDB db = new MysqlDB();
			String sql="select ps from yqcnwx_ddmf where id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				ps = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}

	//根据faceid 获取排名
	public static int GetPM(String id){
		int pm =0;
		try {
			HashMap<String,Integer> map = new HashMap<String,Integer>();

			sql_data db = new sql_data();
			String sql ="select * from yqfbwx_face order by zan desc";
			ResultSet rs = db.executeQuery(sql);
			int i=1;

			while (rs.next()) {
				map.put(rs.getString("id"), i);

				i++;
			}

			int obj = map.get(id);
			pm=new Integer(obj);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pm;

	}

	//根据id,lb 获取排名
	public static int GetPM2(String id,String lb){
		int pm =0;
		try {
			HashMap<String,Integer> map = new HashMap<String,Integer>();

			sql_data db = new sql_data();
			String sql ="select * from yqfbwx_whlt where lb="+lb+" order by ps desc";
			ResultSet rs = db.executeQuery(sql);
			int i=1;

			while (rs.next()) {

				map.put(rs.getString("id"), i);

				i++;
			}

			int obj = map.get(id);
			pm=new Integer(obj);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pm;

	}

	//根据faceid 获取排名
	public static int GetPM3(String id,String lb){
		int pm =0;
		try {
			HashMap<String,Integer> map = new HashMap<String,Integer>();

			sql_data db = new sql_data();
			String sql ="select * from yqsjwx_bdsp where lb="+lb+" order by ps desc";
			ResultSet rs = db.executeQuery(sql);
			int i=1;

			while (rs.next()) {

				map.put(rs.getString("id"), i);

				i++;
			}

			int obj = map.get(id);
			pm=new Integer(obj);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pm;

	}


	//根据faceid 获取排名
	public static int GetPM4(String id){
		int pm =0;
		try {
			HashMap<String,Integer> map = new HashMap<String,Integer>();

			MysqlDB db = new MysqlDB();
			String sql ="select * from yqcnwx_twb order by ps desc";
			ResultSet rs = db.executeQuery(sql);
			int i=1;

			while (rs.next()) {

				map.put(rs.getString("id"), i);

				i++;
			}

			int obj = map.get(id);
			pm=new Integer(obj);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pm;

	}


	//根据faceid 获取排名
	public static int GetPM5(String id){
		int pm =0;
		try {
			HashMap<String,Integer> map = new HashMap<String,Integer>();

			sql_data db = new sql_data();
			String sql ="select * from yqcnwx_lcb order by ps desc";
			ResultSet rs = db.executeQuery(sql);
			int i=1;

			while (rs.next()) {

				map.put(rs.getString("id"), i);

				i++;
			}

			int obj = map.get(id);
			pm=new Integer(obj);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pm;

	}


	//根据faceid 获取排名
	public static int GetPM6(String id,int lb){
		int pm =0;
		try {
			HashMap<String,Integer> map = new HashMap<String,Integer>();

			MysqlDB db = new MysqlDB();
			String sql ="select * from yqcnwx_lcb where lb="+lb+" order by ps desc";
			ResultSet rs = db.executeQuery(sql);
			int i=1;

			while (rs.next()) {

				map.put(rs.getString("id"), i);

				i++;
			}

			int obj = map.get(id);
			pm=new Integer(obj);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pm;

	}


	//根据faceid 获取排名
	public static int GetPM7(String id){
		int pm =0;
		try {
			HashMap<String,Integer> map = new HashMap<String,Integer>();

			MysqlDB db = new MysqlDB();
			String sql ="select * from yqcnwx_ddmf order by ps desc";
			ResultSet rs = db.executeQuery(sql);
			int i=1;

			while (rs.next()) {

				map.put(rs.getString("id"), i);

				i++;
			}

			int obj = map.get(id);
			pm=new Integer(obj);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pm;

	}

	//根据faceid 获取具体第一名的差距票数
	public static int GetJLFirstPS(String id){
		int ps=0;
		//获取该人票数
		int gr = MyUtils3.GetPS(id);
		int fs =0;
		//获取第一名的票数
		try {
			sql_data db =  new sql_data();
			String sql="select top 1 zan from yqfbwx_face order by zan desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				fs = rs.getInt(1);

			}

			ps = fs-gr;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}



	//根据id 获取具体第一名的差距票数
	public static int GetJLFirstPS2(String id,String lb){
		int ps=0;
		//获取该人票数
		int gr = MyUtils3.GetPS2(id,lb);
		int fs =0;
		//获取第一名的票数
		try {
			sql_data db =  new sql_data();
			String sql="select top 1 ps from yqfbwx_whlt where lb="+lb+" order by ps desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				fs = rs.getInt(1);

			}

			ps = fs-gr;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}


	//根据id 获取具体第一名的差距票数
	public static int GetJLFirstPS4(String id){
		int ps=0;
		//获取该人票数
		int gr = MyUtils3.GetPS4(id);
		int fs =0;
		//获取第一名的票数
		try {
			sql_data db =  new sql_data();
			String sql="select top 1 ps from yqcnwx_twb order by ps desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				fs = rs.getInt(1);

			}

			ps = fs-gr;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}


	//根据id 获取具体第一名的差距票数
	public static int GetJLFirstPS5(String id){
		int ps=0;
		//获取该人票数
		int gr = MyUtils3.GetPS5(id);
		int fs =0;
		//获取第一名的票数
		try {
			sql_data db =  new sql_data();
			String sql="select top 1 ps from yqcnwx_lcb order by ps desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				fs = rs.getInt(1);

			}

			ps = fs-gr;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}



	//根据id 获取具体第一名的差距票数
	public static int GetJLFirstPS6(String id,int lb){
		int ps=0;
		//获取该人票数
		int gr = MyUtils3.GetPS6(id,lb);
		int fs =0;
		//获取第一名的票数
		try {
			MysqlDB db =  new MysqlDB();
			String sql="select top 1 ps from yqcnwx_lcb where lb="+lb+" order by ps desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				fs = rs.getInt(1);

			}

			ps = fs-gr;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}

	//根据id 获取具体第一名的差距票数
	public static int GetJLFirstPS3(String id,String lb){
		int ps=0;
		//获取该人票数
		int gr = MyUtils3.GetPS3(id,lb);
		int fs =0;
		//获取第一名的票数
		try {
			sql_data db =  new sql_data();
			String sql="select top 1 ps from yqsjwx_bdsp where lb="+lb+" order by ps desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				fs = rs.getInt(1);

			}

			ps = fs-gr;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ps;
	}


	public static void main(String[] args) {
		//System.out.println(MyUtils3.GetNextBH());
		//System.out.println(MyUtils3.GetPM("30"));
		System.out.println(MyUtils3.GetJLFirstPS("30"));
	}
}