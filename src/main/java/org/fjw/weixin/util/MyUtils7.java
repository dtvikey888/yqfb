package org.fjw.weixin.util;

import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.liufeng.course.util.TimeString;

//(林一笑)高考志愿抽奖类
public class MyUtils7 {
	//判断openid是否已经存在
	public static boolean iscz(String openid){
		boolean cz=false;
		try {
			sql_data db = new sql_data();
			String sql ="select * from yqfbwx_gk_cj where openid='"+openid+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				cz=true;
			}else {
				cz=false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cz;
	}

	//判断openid是否已经存在
	public static boolean iscz2(String openid){
		boolean cz=false;
		try {
			sql_data db = new sql_data();
			String sql ="select * from doc1 where openid='"+openid+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				cz=true;
			}else {
				cz=false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cz;
	}

	public static int GetIdFromDoc1(String openid){
		int id =0;
		try {
			sql_data db = new sql_data();
			String sql = "select id from doc1 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return id;
	}

	public static int GetTwbZps(){
		int bz = 0;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select sum(ps) as ct from yqcnwx_twb";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bz =rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bz;
	}


	public static int GetTeacherZps(){
		int bz = 0;
		try {
			sql_data db = new sql_data();
			String sql = "select sum(ps) as ps from yqfbwx_tea";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bz =rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bz;
	}

	//字符串转日期
	public static Date CharDate(String sj){

		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//小写的mm表示的是分钟
		String dstr=sj;
		Date date = null;
		try {
			date=sdf.parse(dstr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return date;
	}


	public static void main(String[] args) {

		int kz =0;
		String tt1=AllValus.gp1;
		String tt2=AllValus.gp2;
		Date c1=MyUtils7.CharDate(tt1);
		Date c2=MyUtils7.CharDate(tt2);
		kz= MyUtils7.TimeKZ(c1,c2);
		//1: //开始抽奖
		//2: //抽奖已经结束,感谢关注！
		//3: //抽奖还没开始呢！

		System.out.println(kz);

	}


	//时间控制类
	public static int TimeKZ(Date s1,Date s2){

		int kz = 0;


		Date my_shuoming=s1;
		Date my_endming=s2;
		Date nowtime = MyUtils.CharDate(TimeString.nowTime());

		long C = MyUtils.dateDiff("second",nowtime,my_endming);
		long D = MyUtils.dateDiff("second",nowtime,my_shuoming);

		System.out.println("D Mod 60 秒"+D);
		System.out.println("C Mod 60 秒"+C);

		if  (D>=0 && C<0){

			System.out.println("开始抽奖");
			kz=1;

		}else if (C>0) {

			System.out.println("抽奖已经结束,感谢关注！");
			kz=2;

		}else {

			System.out.println("抽奖还没开始呢,"+MyUtils.CharString(my_shuoming)+"到"+MyUtils.CharString(my_endming)+"！\n欢迎到时参与！");
			kz=3;
		}

		return kz;

	}


	//返回抽到的奖项
	public static String zsm(String openid)
	{
		int bz = 0;
		String bz2 = "";

		try {

			sql_data db = new sql_data();
			String sql ="select zsm from yqfbwx_gk_cj where openid='"+openid+"' ";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bz=rs.getInt(1);
			}


			if(bz==1){
				bz2="恭喜您获邀参加讲座，并获专家一对一服务";
			}else if(bz==2){
				bz2="恭喜您获邀参加讲座";
			}else if (bz==3) {
				bz2="谢谢参与";
			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz2;
	}


	/**
	 *
	 * @param openid
	 * @param xm
	 * @param tel
	 * @param dz
	 * @return 返回标志 1,以前已经抽过奖(不处理)， 2.不处理 留在抽奖页面
	 */
	//抽奖填写用户信息
	public static int StartCJBM(String openid,String xm,String tel,String memo)
	{
		int bz =0;
		//直接入库(更新操作哦)
		try {

			sql_data db = new sql_data();
			//判断 openid 是否已经存在
			// String sql_pd = "select * from yqfbwx_gk_cj where iscj_bz=1 and openid = '"+openid+"' ";
			String sql_pd = "select * from yqfbwx_gk_cj where openid = '"+openid+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			if (rs.next()) {

				String sql_pd2 = "select * from yqfbwx_gk_cj where iscj_bz=1 and openid = '"+openid+"' ";
				ResultSet rs2 = db.executeQuery(sql_pd2);
				if (rs2.next()) {

					//已经抽奖 不处理 关闭页面
					bz=1;

				}else {

					//还没抽奖 不处理 留在抽奖页面
					bz=2;
				}


			}else{
				//不存在记录 写入

				String sql ="insert into yqfbwx_gk_cj(openid,xm,tel,memo,fbsj) values('"+openid+"','"+xm+"','"+tel+"','"+memo+"','"+TimeString.nowTime()+"') ";
				System.out.println(sql);
				db.executeInsert(sql);
				//还没抽奖 留在抽奖页面
				bz=2;

			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("bz ="+bz);

		return bz;

	}


	public static int  getCount(){
		int ct =0;

		try {
			sql_data db = new sql_data();
			String sql2="select count(*) as ct from doc1";
			ResultSet rs = db.executeQuery(sql2);
			if (rs.next()) {
				ct = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return ct;
	}


	/**
	 *
	 * @param openid
	 * @param xm
	 * @param tel
	 * @param dz
	 * @return 返回标志 1,以前已经抽过奖(不处理)， 2.不处理 留在抽奖页面
	 */
	//抽奖填写用户信息
	public static int StartCJBM2(String openid,String xm,String tel)
	{
		int bz =0;
		//直接入库(更新操作哦)
		try {

			sql_data db = new sql_data();
			//判断 openid 是否已经存在
			String sql_pd = "select * from doc1 where openid = '"+openid+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			if (rs.next()) {

				bz=1;


			}else{
				//不存在记录 判断 是否已经 80个
				int ct = MyUtils7.getCount();

				if (ct<78) {
					String sql ="insert into doc1(openid,xm,tel,fbsj) values('"+openid+"','"+xm+"','"+tel+"','"+TimeString.nowTime()+"') ";
					System.out.println(sql);
					db.executeInsert(sql);
					bz=3;

				}else{

					bz=2;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("bz ="+bz);

		return bz;

	}

	/**
	 * @prame  1. 2.  3. 4 等奖 在数据库中 中奖的数目
	 * @return
	 */

	public static int GetTotal(int zsm){

		int zs =0;

		try {

			sql_data db = new sql_data();
			String sql="";

			sql = "select count(*) as zs from yqfbwx_gk_cj where zsm="+zsm+" ";

			// System.out.println("MyUtils.GetTotal()"+sql);

			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				zs = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return zs;

	}



	//1.一等奖 总剩余数
	public static int sy1(){
		return (AllValus.zyjx1 - MyUtils7.GetTotal(1));
	}

	//1.二等奖 总剩余数
	public static int sy2(){
		return (AllValus.zyjx2 - MyUtils7.GetTotal(2));
	}

	/**
	 * 各个奖项中奖总剩余
	 * 也就是 比如 一等奖 在数据库里面 总共查到2个 ，一等奖的总数是2个， 那么 2-2=0 就得到这个数
	 */

	public static int GetTotalSY(int zsm){
		int sy=0;
		try {
			sql_data db = new sql_data();
			String sql="select count(*) as ct from yqfbwx_gk_cj where zsm="+zsm+" ";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				switch (zsm) {

					case 1:
						sy = AllValus.zyjx1-rs.getInt(1);
						break;

					case 2:
						sy = AllValus.zyjx2-rs.getInt(1);
						break;

					default:
						break;
				}

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return sy;
	}


	/**
	 * 修改中奖概率
	 * @param 抽奖页面的随机数num（0，1，2，3） ,处理一下，变成num+1,然后(1,2,3,4) 5是没中奖不处理的,页面不会传进来的,
	 * 查找数据库中当天zsm字段数量，从allvalue 里面提取 每天限制的奖项，减一下，如果<=0 那就返回标志 0，否则返回1
	 * 判断当天某个奖项的中奖数 ,用来控制每天的中奖概率 (提供给 抽奖页面 随机中的图片用)
	 * @return 返回一个标志 表示 当天这个奖项还有没有名额 ，从allvalue 里面提取，然后查找数据库中的当天该奖项的中奖数据 ，减一下 就可以判断
	 * 每个奖项当天剩余数 1,2,3,4
	 */

	public static int TodaySY(int zsm)
	{
		int sy =0;

		//查询当天各个奖项的中奖人数语句 select count(*) as ct from sxbook_cj where zsm=1 and DateDiff(dd,fbsj,getdate())=0
		try {

			sql_data db = new sql_data();
			String sql="select count(*) as ct from yqfbwx_gk_cj where zsm="+zsm+" and DateDiff(dd,fbsj,getdate())=0";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				int zjs = rs.getInt(1);

				if (zsm==1) {  //一等奖 当天中奖的人数

					if (MyUtils7.GetTotalSY(zsm)<=0) {//比如 一等奖的奖项总数 - 所有中了一等奖的人 <= 0  那么就是说1等奖的所有名额没了,就把标志变为0
						sy=0;
					}else {
						//一等奖 10
						if(TimeString.nowTime().indexOf("2015-06-10")!=-1){
							sy = 1 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-11")!=-1){
							sy = 2 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-12")!=-1){
							sy = 3 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-13")!=-1){
							sy = 3 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-14")!=-1){
							sy = 1 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-15")!=-1){
							sy = 0 -zjs;
						}else {
							sy = 0;
						}

						//sy = AllValus.zjxz1 -zjs;   //sy标识 = 当天中奖限制 - 当天中奖人数 。
					}


				}else if(zsm==2){

					if (MyUtils7.GetTotalSY(zsm)<=0) {//比如 二等奖的奖项总数 - 所有中了二等奖的人 <= 0  那么就是说2等奖的所有名额没了 ,就把标志变为0
						sy=0;
					}else {
						//二等奖70个
						if(TimeString.nowTime().indexOf("2015-06-10")!=-1){
							sy = 15 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-11")!=-1){
							sy = 15 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-12")!=-1){
							sy = 7 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-13")!=-1){
							sy = 7 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-14")!=-1){
							sy = 1 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-15")!=-1){
							sy = 25 -zjs;
						}else {
							sy = 0;
						}

						//sy = AllValus.zjxz2 -zjs;   //sy标识 = 当天中奖限制 - 当天中奖人数 。
					}


				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sy;

	}



	/**
	 * //刮刮卡抽奖完写进数据库
	 * @param openid
	 * @param xm
	 * @param tel
	 * @param dz
	 * @return 返回标志 1,以前已经抽过奖(不处理)， 2.记录抽奖成功
	 */

	public static int StartCJLR(String openid,String zsm)
	{
		int bz =0;

		int iszj_bz=0;      //3 是没中奖
		if ("3".equals(zsm)) {
			iszj_bz=0;
		}else {
			iszj_bz=1;
		}

		//直接入库(更新操作哦)
		try {

			sql_data db = new sql_data();
			//判断 bh 是否已经存在
			String sql_pd = "select * from yqfbwx_gk_cj where iscj_bz=1 and openid = '"+openid+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			if (rs.next()) {
				//已经抽奖 不处理
				bz=1;

			}else{

				String sql ="update yqfbwx_gk_cj set zsm="+zsm+",iscj_bz=1,iszj_bz="+iszj_bz+",fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"' ";
				System.out.println(sql);
				db.executeUpdate(sql);

				bz=2;

			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("bz ="+bz);

		return bz;

	}

	//手机号码是否存在了
	public static boolean isczTel(String tel){
		boolean iscz = false;
		try {
			sql_data db = new sql_data();
			String sql="select * from yqfbwx_gk_cj where tel='"+tel+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				iscz=true;
			}else {
				iscz=false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return iscz;

	}

	//删除openid = 'null' or openid is null 的记录
	public static void delnul(){
		try {
			sql_data db = new sql_data();
			db.executeDelete("delete yqfbwx_gk_cj where openid = 'null' or openid is null");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}