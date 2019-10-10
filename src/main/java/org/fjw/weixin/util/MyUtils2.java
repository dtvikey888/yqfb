package org.fjw.weixin.util;

import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.liufeng.course.util.TimeString;

/**
 * 该类用于 抽奖 所使用的方法
 */
public class MyUtils2 {

	/**
	 *
	 * @param openid
	 * @param xm
	 * @param tel
	 * @param dz
	 * @return 返回标志 1,以前已经抽过奖(不处理)， 2.填写用户信息成功
	 */
	//抽奖填写用户信息
	public static int StartCJBM(String openid,String xm,String tel)
	{
		int bz =0;
		//直接入库(更新操作哦)
		try {

			sql_data db = new sql_data();
			//判断 bh 是否已经存在
			String sql_pd = "select * from sxbook_cj where iscj_bz=1 and openid = '"+openid+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			if (rs.next()) {
				//已经抽奖 不处理
				bz=1;

			}else{

				String sql ="update sxbook_cj set xm='"+xm+"',tel='"+tel+"',fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"' ";
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

		int iszj_bz=0;      //5 是没中奖
		if ("5".equals(zsm)) {
			iszj_bz=0;
		}else {
			iszj_bz=1;
		}

		//直接入库(更新操作哦)
		try {

			sql_data db = new sql_data();
			//判断 bh 是否已经存在
			String sql_pd = "select * from sxbook_cj where iscj_bz=1 and openid = '"+openid+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			if (rs.next()) {
				//已经抽奖 不处理
				bz=1;

			}else{

				String sql ="update sxbook_cj set zsm="+zsm+",iscj_bz=1,iszj_bz="+iszj_bz+",fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"' ";
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

	//返回抽到的奖项
	public static String zsm(String openid)
	{
		int bz = 0;
		String bz2 = "";

		try {

			sql_data db = new sql_data();
			String sql ="select zsm from sxbook_cj where openid='"+openid+"' ";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bz=rs.getInt(1);
			}


			if(bz==1){
				bz2="您中了一等奖500元书券";
			}else if(bz==2){
				bz2="您中了二等奖300元书券";
			}else if(bz==3){
				bz2="您中了三等奖200元书券";
			}else if(bz==4){
				bz2="您中了参与奖100元书券";
			}else if(bz==5){
				bz2="您没中奖";
			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz2;
	}



	/**
	 * @prame  1. 2.  3. 4 等奖 在数据库中中奖的数目
	 * @return
	 */

	public static int GetTotal(int zsm){

		int zs =0;

		try {

			sql_data db = new sql_data();
			String sql="";

			sql = "select count(*) as zs from sxbook_cj where zsm="+zsm+" ";

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
		return (AllValus.zj1 - MyUtils2.GetTotal(1));
	}

	//2.二等奖 总剩余数
	public static int sy2(){
		return (AllValus.zj2 - MyUtils2.GetTotal(2));
	}

	//3.三等奖 总剩余数
	public static int sy3(){
		return (AllValus.zj3 - MyUtils2.GetTotal(3));
	}

	//3.四等奖 总剩余数
	public static int sy4(){
		return (AllValus.zj4 - MyUtils2.GetTotal(4));
	}




	//防止插入SQL2000数据库乱码
	public static String codetoString(String str) {
		String s = str;
		try {
			byte tempB[] = str.getBytes("ISO-8859-1");
			s = new String(tempB);
			return s;
		} catch (Exception e) {

			return s;
		}
	}

	//日期转字符串
	public static String CharString(Date dt){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  //小写的mm表示的是分钟
		Date date=dt;
		String str=sdf.format(date);
		return str;
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

	public static boolean iscj_pd(String openid){

		boolean cj =false;

		try {
			sql_data db = new sql_data();
			String sql = "select top 1 * from sxbook_cj where iscj_bz=1 and openid = '"+openid+"' ";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				cj=true;
			}else {
				cj=false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cj;

	}

	/**
	 * 各个奖项中奖总剩余
	 * 也就是 比如 一等奖 在数据库里面 总共查到2个 ，一等奖的总数是2个， 那么 2-2=0 就得到这个数
	 */

	public static int GetTotalSY(int zsm){
		int sy=0;
		try {
			sql_data db = new sql_data();
			String sql="select count(*) as ct from sxbook_cj where zsm="+zsm+" ";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				switch (zsm) {
					case 1:
						sy = AllValus.zj1-rs.getInt(1);
						break;

					case 2:
						sy = AllValus.zj2-rs.getInt(1);
						break;

					case 3:
						sy = AllValus.zj3-rs.getInt(1);
						break;

					case 4:
						sy = AllValus.zj4-rs.getInt(1);
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
			String sql="select count(*) as ct from sxbook_cj where zsm="+zsm+" and DateDiff(dd,fbsj,getdate())=0";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				int zjs = rs.getInt(1);
				if (zsm==1) {  //一等奖 当天中奖的人数

					if (MyUtils2.GetTotalSY(zsm)<=0) {//比如 一等奖的奖项总数 - 所有中了一等奖的人 <= 0  那么就是说1等奖的所有名额没了,就把标志变为0
						sy=0;
					}else {
						//一等奖 20日 一个 ，22日 1个
						if(TimeString.nowTime().indexOf("2015-04-20")!=-1){
							sy = 1 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-04-22")!=-1){
							sy = 1 -zjs;
						}else {
							sy = 0;
						}

						//sy = AllValus.zjxz1 -zjs;   //sy标识 = 当天中奖限制 - 当天中奖人数 。
					}


				}else if(zsm==2){

					if (MyUtils2.GetTotalSY(zsm)<=0) {//比如 二等奖的奖项总数 - 所有中了二等奖的人 <= 0  那么就是说2等奖的所有名额没了 ,就把标志变为0
						sy=0;
					}else {
						//二等奖 19日1个，20日2个，21日1个，22日1个
						if(TimeString.nowTime().indexOf("2015-04-20")!=-1){
							sy=1-zjs;
						}else if (TimeString.nowTime().indexOf("2015-04-21")!=-1) {
							sy=2-zjs;
						}else if (TimeString.nowTime().indexOf("2015-04-22")!=-1) {
							sy=1-zjs;
						}else if (TimeString.nowTime().indexOf("2015-04-23")!=-1) {
							sy=1-zjs;
						}else {
							sy=0;
						}

						//sy = AllValus.zjxz2 -zjs;   //sy标识 = 当天中奖限制 - 当天中奖人数 。
					}


				}else if (zsm==3) {

					if (MyUtils2.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//三等奖19日2个，20日3个，21日2个，22日2个，23日1个
						if (TimeString.nowTime().indexOf("2015-04-20")!=-1) {
							sy=2-zjs;
						}else if (TimeString.nowTime().indexOf("2015-04-21")!=-1) {
							sy=3-zjs;
						}else if (TimeString.nowTime().indexOf("2015-04-22")!=-1) {
							sy=2-zjs;
						}else if (TimeString.nowTime().indexOf("2015-04-23")!=-1) {
							sy=2-zjs;
						}else if (TimeString.nowTime().indexOf("2015-04-24")!=-1) {
							sy=1-zjs;
						}else {
							sy=0;
						}
						//sy = AllValus.zjxz3 -zjs;
					}


				}else if(zsm==4){

					if (MyUtils2.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//参与奖 55个名额 19(9) 20(9) 21(9) 22(9) 23(9) 24(10)
						if (TimeString.nowTime().indexOf("2015-04-20")!=-1) {
							sy=11-zjs;
						}else if (TimeString.nowTime().indexOf("2015-04-21")!=-1) {
							sy=11-zjs;
						}else if (TimeString.nowTime().indexOf("2015-04-22")!=-1) {
							sy=11-zjs;
						}else if (TimeString.nowTime().indexOf("2015-04-23")!=-1) {
							sy=11-zjs;
						}else if (TimeString.nowTime().indexOf("2015-04-24")!=-1) {
							sy=11-zjs;
						}else {
							sy=0;
						}

						//sy = AllValus.zjxz4 -zjs;
					}

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sy;

	}


	public static void main(String[] args) {
		System.out.println(MyUtils2.TodaySY(1)); //一等奖今天还可以中出几个
		System.out.println(MyUtils2.TodaySY(2)); //二等奖今天还可以中出几个
		System.out.println(MyUtils2.TodaySY(3)); //三等奖今天还可以中出几个
		System.out.println(MyUtils2.TodaySY(4)); //四等奖今天还可以中出几个

		System.out.print(MyUtils2.iscj_pd("oxdb1txbPaZwYV1yiNqvR3AOwzoo"));

	}



}