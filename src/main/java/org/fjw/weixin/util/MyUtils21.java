package org.fjw.weixin.util;

import java.sql.ResultSet;

import org.liufeng.course.util.TimeString;

//阿蒙抽奖 类
public class MyUtils21 {

	//是否已经抽奖
	public static boolean iscj_pd(String openid){

		boolean cj =false;

		try {
			sql_data db = new sql_data();
			String sql = "select top 1 * from sthb_cj where iscj_bz=1 and openid = '"+openid+"' ";
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


	//是否已经抽奖
	public static boolean iscj_pd2(String openid){

		boolean cj =false;

		try {
			sql_data db = new sql_data();
			String sql = "select count(*) as ct from sthb_cj where zsm<>0 and openid = '"+openid+"' ";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			int ct=0;
			if (rs.next()) {

				ct=rs.getInt(1);
				if (ct>2) {
					cj=true;
				}else {
					cj=false;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cj;

	}


	//是否已经抽奖
	public static boolean iscj_pd3(String tel){

		boolean cj =false;

		try {
			sql_data db = new sql_data();
			String sql = "select count(*) as ct from sthb_cj where zsm<>0 and tel = '"+tel+"' ";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			int ct=0;
			if (rs.next()) {

				ct=rs.getInt(1);
				if (ct>2) {
					cj=true;
				}else {
					cj=false;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cj;

	}


	//返回抽到的奖项
	public static String zsm(String openid)
	{
		int bz = 0;
		String bz2 = "";

		try {

			sql_data db = new sql_data();
			String sql ="select zsm from sthb_cj where openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bz=rs.getInt(1);
			}


			if(bz==1){
				bz2="恭喜您获得2000元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==2){
				bz2="恭喜您获得1000元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==3){
				bz2="恭喜您获得500元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==4){
				bz2="恭喜您获得200元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==5){
				bz2="恭喜您获得100元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==6){
				bz2="恭喜您获得50元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==7){
				bz2="恭喜您获得20元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==8){
				bz2="恭喜您获得10元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==9){
				bz2="恭喜您获得5元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==10){
				bz2="恭喜您获得2元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==11){
				bz2="恭喜您获得1元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==12){
				bz2="谢谢参与";
			}else{
				bz2="谢谢参与";
			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz2;
	}

	/**
	 * 各个奖项中奖总剩余
	 * 也就是 比如 一等奖 在数据库里面 总共查到2个 ，一等奖的总数是12个， 那么 12-2=10 就得到这个数
	 */

	public static int GetTotalSY(int zsm){
		int sy=0;
		try {
			sql_data db = new sql_data();
			String sql="select count(*) as ct from sthb_cj where zsm="+zsm+" ";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				switch (zsm) {

					case 1:
						sy = AllValus.amgg1-rs.getInt(1);
						break;

					case 2:
						sy = AllValus.amgg2-rs.getInt(1);
						break;

					case 3:
						sy = AllValus.amgg3-rs.getInt(1);
						break;

					case 4:
						sy = AllValus.amgg4-rs.getInt(1);
						break;

					case 5:
						sy = AllValus.amgg5-rs.getInt(1);
						break;

					case 6:
						sy = AllValus.amgg6-rs.getInt(1);
						break;

					case 7:
						sy = AllValus.amgg7-rs.getInt(1);
						break;

					case 8:
						sy = AllValus.amgg8-rs.getInt(1);
						break;

					case 9:
						sy = AllValus.amgg9-rs.getInt(1);
						break;

					case 10:
						sy = AllValus.amgg10-rs.getInt(1);
						break;

					case 11:
						sy = AllValus.amgg11-rs.getInt(1);
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
	 * @prame  1. 2.  3. 4 等奖 在数据库中 中奖的数目
	 * @return
	 */

	public static int GetTotal(int zsm){

		int zs =0;

		try {

			sql_data db = new sql_data();
			String sql = "select count(*) as zs from sthb_cj where zsm="+zsm+" ";

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
		return (AllValus.amgg1 - MyUtils21.GetTotal(1));
	}

	//2.二等奖 总剩余数
	public static int sy2(){
		return (AllValus.amgg2 - MyUtils21.GetTotal(2));
	}

	//3.三等奖 总剩余数
	public static int sy3(){
		return (AllValus.amgg3 - MyUtils21.GetTotal(3));
	}

	//4等奖 总剩余数
	public static int sy4(){
		return (AllValus.amgg4 - MyUtils21.GetTotal(4));
	}

	//5等奖 总剩余数
	public static int sy5(){
		return (AllValus.amgg5 - MyUtils21.GetTotal(5));
	}

	//6等奖 总剩余数
	public static int sy6(){
		return (AllValus.amgg6 - MyUtils21.GetTotal(6));
	}

	//7等奖 总剩余数
	public static int sy7(){
		return (AllValus.amgg7 - MyUtils21.GetTotal(7));
	}

	//8等奖 总剩余数
	public static int sy8(){
		return (AllValus.amgg8 - MyUtils21.GetTotal(8));
	}

	//9等奖 总剩余数
	public static int sy9(){
		return (AllValus.amgg9 - MyUtils21.GetTotal(9));
	}

	//10等奖 总剩余数
	public static int sy10(){
		return (AllValus.amgg10 - MyUtils21.GetTotal(10));
	}


	//11等奖 总剩余数
	public static int sy11(){
		return (AllValus.amgg11 - MyUtils21.GetTotal(11));
	}


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
			//String sql_pd = "select * from sthb_cj where iscj_bz=1 and openid = '"+openid+"' ";
			String sql_pd = "select * from sthb_cj where openid = '"+openid+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			if (rs.next()) {
				//已经存在 照样写入


				bz=1;

			}else{

				//String sql ="update sthb_cj set xm='"+xm+"',tel='"+tel+"',fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"' ";

				String sql ="insert into sthb_cj(openid,xm,tel,fbsj) VALUES('"+openid+"','"+xm+"','"+tel+"','"+TimeString.nowTime()+"') ";
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
			String sql="select count(*) as ct from sthb_cj where zsm="+zsm+" and DateDiff(dd,fbsj,getdate())=0";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				int zjs = rs.getInt(1);
				if (zsm==1) {  //一等奖 当天中奖的人数

					if (MyUtils21.GetTotalSY(zsm)<=0) {//比如 一等奖的奖项总数 - 所有中了一等奖的人 <= 0  那么就是说1等奖的所有名额没了,就把标志变为0
						sy=0;
					}else {
						//一等奖2000元 1名
						if(TimeString.nowTime().indexOf("2017-08-19")!=-1){
							sy = 1 -zjs;
						}else {
							sy = 0;
						}

						//sy = AllValus.zjxz1 -zjs;   //sy标识 = 当天中奖限制 - 当天中奖人数 。
					}


				}else if(zsm==2){

					if (MyUtils21.GetTotalSY(zsm)<=0) {//比如 二等奖的奖项总数 - 所有中了二等奖的人 <= 0  那么就是说2等奖的所有名额没了 ,就把标志变为0
						sy=0;
					}else {
						//二等奖1000元 2名
						if(TimeString.nowTime().indexOf("2017-08-18")!=-1){
							sy=1-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-20")!=-1) {
							sy=1-zjs;
						}else {
							sy=0;
						}

						//sy = AllValus.zjxz2 -zjs;   //sy标识 = 当天中奖限制 - 当天中奖人数 。
					}


				}else if (zsm==3) {

					if (MyUtils21.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//三等奖500元 3名
						if (TimeString.nowTime().indexOf("2017-08-18")!=-1) {
							sy=1-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-19")!=-1) {
							sy=1-zjs;
						}else {
							sy=0;
						}
						//sy = AllValus.zjxz3 -zjs;
					}


				}else if (zsm==4) {

					if (MyUtils21.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//四等奖200元 4名
						if (TimeString.nowTime().indexOf("2017-08-18")!=-1) {
							sy=2-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-19")!=-1) {
							sy=1-zjs;
						}else {
							sy=0;
						}
						//sy = AllValus.zjxz3 -zjs;
					}


				}else if (zsm==5) {

					if (MyUtils21.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//五等奖100元 7名
						if (TimeString.nowTime().indexOf("2017-08-18")!=-1) {
							sy=2-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-19")!=-1) {
							sy=3-zjs;
						}else {
							sy=0;
						}
						//sy = AllValus.zjxz3 -zjs;
					}


				}else if (zsm==6) {

					if (MyUtils21.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//六等奖50元 10名
						if (TimeString.nowTime().indexOf("2017-08-18")!=-1) {
							sy=2-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-19")!=-1) {
							sy=2-zjs;
						}else {
							sy=0;
						}
						//sy = AllValus.zjxz3 -zjs;
					}


				}else if (zsm==7) {

					if (MyUtils21.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//七等奖20元 20名
						if (TimeString.nowTime().indexOf("2017-08-18")!=-1) {
							sy=5-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-19")!=-1) {
							sy=5-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-20")!=-1) {
							sy=5-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-21")!=-1) {
							sy=5-zjs;
						}else {
							sy=0;
						}
						//sy = AllValus.zjxz3 -zjs;
					}


				}else if (zsm==8) {

					if (MyUtils21.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//八等奖10元 30名
						if (TimeString.nowTime().indexOf("2017-08-18")!=-1) {
							sy=10-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-19")!=-1) {
							sy=15-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-20")!=-1) {
							sy=5-zjs;
						}else {
							sy=0;
						}
						//sy = AllValus.zjxz3 -zjs;
					}


				}else if (zsm==9) {

					if (MyUtils21.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//九等奖5元 400名
						if (TimeString.nowTime().indexOf("2017-08-18")!=-1) {
							sy=1-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-19")!=-1) {
							sy=1-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-20")!=-1) {
							sy=1-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-21")!=-1) {
							sy=1-zjs;
						}else {
							sy=0;
						}
						//sy = AllValus.zjxz3 -zjs;
					}


				}else if (zsm==10) {

					if (MyUtils21.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//十等奖2元 1200名
						if (TimeString.nowTime().indexOf("2017-08-18")!=-1) {
							sy=1-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-19")!=-1) {
							sy=1-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-20")!=-1) {
							sy=1-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-28")!=-1) {
							sy=20-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-29")!=-1) {
							sy=20-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-30")!=-1) {
							sy=20-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-31")!=-1) {
							sy=20-zjs;
						}else if (TimeString.nowTime().indexOf("2017-09-01")!=-1) {
							sy=20-zjs;
						}else {
							sy=0;
						}
						//sy = AllValus.zjxz3 -zjs;
					}


				}else if (zsm==11) {

					if (MyUtils21.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//十一等奖1元 2400名
						if (TimeString.nowTime().indexOf("2017-08-18")!=-1) {
							sy=200-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-19")!=-1) {
							sy=200-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-20")!=-1) {
							sy=200-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-21")!=-1) {
							sy=200-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-22")!=-1) {
							sy=20-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-28")!=-1) {
							sy=20-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-29")!=-1) {
							sy=20-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-30")!=-1) {
							sy=20-zjs;
						}else if (TimeString.nowTime().indexOf("2017-08-31")!=-1) {
							sy=20-zjs;
						}else if (TimeString.nowTime().indexOf("2017-09-01")!=-1) {
							sy=20-zjs;
						}else {
							sy=0;
						}
						//sy = AllValus.zjxz3 -zjs;
					}


				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sy;

	}


	public static String GetXm(String openid){

		String xm="";
		try {
			sql_data db = new sql_data();
			String sql = "select top 1 * from sthb_cj where openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				xm = rs.getString("xm");
			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		return xm;

	}


	public static String GetTel(String openid){

		String tel="";
		try {
			sql_data db = new sql_data();
			String sql = "select top 1 * from sthb_cj where openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tel = rs.getString("tel");
			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		return tel;

	}


	public static String GetLx(String openid){

		String lx="";
		try {
			sql_data db = new sql_data();
			String sql = "select top 1 * from sthb_cj where openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				lx = rs.getString("lx");
			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		return lx;

	}


	/**
	 * //刮刮卡抽奖完写进数据库
	 * @param openid
	 * @param xm
	 * @param tel
	 * @param dz
	 * @return 返回标志 1,以前已经抽过奖(不处理)， 2.记录抽奖成功
	 */

	public static int StartCJLR2(String tel,String openid,String zsm)
	{
		int bz =0;

		int iszj_bz=0;      //12 是没中奖
		if ("12".equals(zsm)) {
			iszj_bz=0;
		}else {
			iszj_bz=1;
		}

		String xm = GetXm(openid);
		//String tel = GetTel(openid);
		String lx = GetLx(openid);



		//直接入库(更新操作哦)
		try {

			sql_data db = new sql_data();
			// String sql_pd = "select count(*) as ct from sthb_cj where zsm<>0 and openid = '"+openid+"' ";
			String sql_pd = "select count(*) as ct from sthb_cj where zsm<>0 and tel = '"+tel+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			int ct = 0;



			if (rs.next()) {
				//已经抽奖超过3次不处理
				ct = rs.getInt(1);
				if (ct>2) {

					bz=1;

				}else{

					//String sql ="update sthb_cj set zsm="+zsm+",iscj_bz=1,iszj_bz="+iszj_bz+",fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"' ";
					String sql ="insert into sthb_cj(xm,tel,lx,openid,zsm,fbsj) VALUES('"+xm+"','"+tel+"','"+lx+"','"+openid+"',"+zsm+",'"+TimeString.nowTime()+"') ";
					//String sql ="insert into sthb_cj(xm,tel,lx,openid,zsm,fbsj) VALUES('"+xm+"','"+tel+"','"+lx+"','"+openid+"',12,'"+TimeString.nowTime()+"') ";

					System.out.println(sql);
					db.executeUpdate(sql);

					bz=2;
				}

			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("bz ="+bz);

		return bz;

	}


	//是否是当天抽过奖了
	public static int TodayCj(String tel){

		int kycj = 0;
		String nowDayMYD = TimeString.GetnowTimeYMD();

		try {
			sql_data db = new sql_data();
			String sql = "select top 1 * from sthb_cj where zsm<>0 and tel = '"+tel+"' order by id desc";
			// String sql = "select top 1 * from sthb_cj where tel = '"+tel+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				String notTodyMYD = rs.getString("fbsj").substring(0,10);
				System.out.println(notTodyMYD);

				if (!notTodyMYD.equals(nowDayMYD)) {

					kycj=1;

				}else {

					kycj=0;

				}

			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return kycj;
	}


	public static void main(String[] args) {

		System.out.println(MyUtils21.TodayCj("13588963940"));

	}

}