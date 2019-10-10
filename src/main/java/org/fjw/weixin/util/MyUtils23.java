package org.fjw.weixin.util;

import java.sql.ResultSet;

import org.liufeng.course.util.TimeString;

//阿蒙光盘行动抽奖 类
public class MyUtils23 {

	//是否已经抽奖
	public static boolean iscj_pd(String openid){

		boolean cj =false;

		try {
			sql_data db = new sql_data();
			String sql = "select top 1 * from yqfbwx_gpxd_cj where iscj_bz=1 and openid = '"+openid+"' ";
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
			String sql = "select count(*) as ct from yqfbwx_gpxd_cj where zsm<>0 and openid = '"+openid+"' ";
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
			String sql = "select count(*) as ct from yqfbwx_gpxd_cj where zsm<>0 and tel = '"+tel+"' ";
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
			String sql ="select top 1 * from yqfbwx_gpxd_cj where openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				bz=rs.getInt("zsm");

			}


			if(bz==1){
				bz2="恭喜您获得20元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==2){
				bz2="恭喜您获得10元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==3){
				bz2="恭喜您获得5元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			}else if(bz==4){
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
			String sql="select count(*) as ct from yqfbwx_gpxd_cj where zsm="+zsm+" ";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				switch (zsm) {

					case 1:
						sy = AllValus.amgpxd1-rs.getInt(1);
						break;

					case 2:
						sy = AllValus.amgpxd2-rs.getInt(1);
						break;

					case 3:
						sy = AllValus.amgpxd3-rs.getInt(1);
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
			String sql = "select count(*) as zs from yqfbwx_gpxd_cj where zsm="+zsm+" ";

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
		return (AllValus.amgpxd1 - MyUtils23.GetTotal(1));
	}

	//2.二等奖 总剩余数
	public static int sy2(){
		return (AllValus.amgpxd2 - MyUtils23.GetTotal(2));
	}

	//3.三等奖 总剩余数
	public static int sy3(){
		return (AllValus.amgpxd3 - MyUtils23.GetTotal(3));
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
	public static int StartCJBM(String openid,String tel,String img1,String memo)
	{
		int bz =0;
		//直接入库(更新操作哦)
		try {

			sql_data db = new sql_data();
			//判断 bh 是否已经存在
			//String sql_pd = "select * from yqfbwx_gpxd_cj where iscj_bz=1 and openid = '"+openid+"' ";
			String sql_pd = "select * from yqfbwx_gpxd_cj where openid = '"+openid+"' and img1='"+img1+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			if (rs.next()) {
				//已经存在 不重复写入

				//String sql ="insert into yqfbwx_gpxd_cj(openid,img1,tel,fbsj) VALUES('"+openid+"','"+img1+"','"+tel+"','"+TimeString.nowTime()+"') ";
				//System.out.println(sql);
				//db.executeUpdate(sql);

				bz=1;

			}else{

				//String sql ="update yqfbwx_gpxd_cj set xm='"+xm+"',tel='"+tel+"',fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"' ";

				String sql ="insert into yqfbwx_gpxd_cj(openid,img1,tel,memo,fbsj) VALUES('"+openid+"','"+img1+"','"+tel+"',"+memo+",'"+TimeString.nowTime()+"') ";
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
			String sql="select count(*) as ct from yqfbwx_gpxd_cj where zsm="+zsm+" and DateDiff(dd,fbsj,getdate())=0";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				int zjs = rs.getInt(1);
				if (zsm==1) {  //一等奖 当天中奖的人数

					if (MyUtils23.GetTotalSY(zsm)<=0) {//比如 一等奖的奖项总数 - 所有中了一等奖的人 <= 0  那么就是说1等奖的所有名额没了,就把标志变为0
						sy=0;
					}else {
						//1等奖 20元话费 50名 (35)
						if(TimeString.nowTime().indexOf("2017-10-16")!=-1){
							sy = 5 -zjs;
						}else if(TimeString.nowTime().indexOf("2017-10-17")!=-1){
							sy = 5 -zjs;
						}else if(TimeString.nowTime().indexOf("2017-10-18")!=-1){
							sy = 5 -zjs;
						}else if(TimeString.nowTime().indexOf("2017-10-19")!=-1){
							sy = 5 -zjs;
						}else if(TimeString.nowTime().indexOf("2017-10-20")!=-1){
							sy = 5 -zjs;
						}else if(TimeString.nowTime().indexOf("2017-10-21")!=-1){
							sy = 5 -zjs;
						}else {
							sy = 0;
						}

						//sy = AllValus.zjxz1 -zjs;   //sy标识 = 当天中奖限制 - 当天中奖人数 。
					}


				}else if(zsm==2){

					if (MyUtils23.GetTotalSY(zsm)<=0) {//比如 二等奖的奖项总数 - 所有中了二等奖的人 <= 0  那么就是说2等奖的所有名额没了 ,就把标志变为0
						sy=0;
					}else {
						//2等奖 10元话费 100名(90)
						if(TimeString.nowTime().indexOf("2017-10-16")!=-1){
							sy=20-zjs;
						}else if (TimeString.nowTime().indexOf("2017-10-17")!=-1) {
							sy=10-zjs;
						}else if (TimeString.nowTime().indexOf("2017-10-18")!=-1) {
							sy=10-zjs;
						}else if (TimeString.nowTime().indexOf("2017-10-19")!=-1) {
							sy=30-zjs;
						}else if (TimeString.nowTime().indexOf("2017-10-20")!=-1) {
							sy=11-zjs;
						}else if (TimeString.nowTime().indexOf("2017-10-21")!=-1) {
							sy=10-zjs;
						}else {
							sy=0;
						}

						//sy = AllValus.zjxz2 -zjs;   //sy标识 = 当天中奖限制 - 当天中奖人数 。
					}


				}else if (zsm==3) {

					if (MyUtils23.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//3等奖 5元话费 300名(200)
						if (TimeString.nowTime().indexOf("2017-10-16")!=-1) {
							sy=40-zjs;
						}else if (TimeString.nowTime().indexOf("2017-10-17")!=-1) {
							sy=40-zjs;
						}else if (TimeString.nowTime().indexOf("2017-10-18")!=-1) {
							sy=40-zjs;
						}else if (TimeString.nowTime().indexOf("2017-10-19")!=-1) {
							sy=50-zjs;
						}else if (TimeString.nowTime().indexOf("2017-10-20")!=-1) {
							sy=50-zjs;
						}else if (TimeString.nowTime().indexOf("2017-10-21")!=-1) {
							sy=50-zjs;
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
			String sql = "select top 1 * from yqfbwx_gpxd_cj where openid='"+openid+"' order by id desc";
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
			String sql = "select top 1 * from yqfbwx_gpxd_cj where openid='"+openid+"' order by id desc";
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
			String sql = "select top 1 * from yqfbwx_gpxd_cj where openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				lx = rs.getString("lx");
			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		return lx;

	}


	public static int GetCs(String openid){

		int cs=0;

		try {
			sql_data db = new sql_data();
			String sql = "select top 1 * from yqfbwx_gpxd_dtcj where openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				cs = rs.getInt("cs");
			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		return cs;

	}

	public static int GetYz(String openid){

		int yz=0;

		try {
			sql_data db = new sql_data();
			String sql = "select top 1 * from yqfbwx_gpxd_dtcj where openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				yz = rs.getInt("yz");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return yz;

	}

	// cs<5 && yz=1 表示当天没用完5次机会，但是还没点赞,要求去点赞
	public static boolean IsDtMdz(String openid){
		boolean yz=false;

		try {
			sql_data db = new sql_data();
			String sql = "select top 1 * from yqfbwx_gpxd_dtcj where cs<5 and yz=1 and openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				yz = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return yz;

	}

	// cs>=5 表示当天用完5次机会，不让上传和抽奖了
	public static boolean IsYw(String openid){
		boolean yz=false;

		try {
			sql_data db = new sql_data();
			String sql = "select top 1 * from yqfbwx_gpxd_dtcj where cs>=5 and openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				yz = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return yz;

	}


	/**
	 * //刮刮卡抽奖完写进数据库
	 * @param openid
	 * @param xm
	 * @param tel
	 * @param dz
	 * @return 返回标志 1,以前已经抽过奖(不处理)， 2.记录抽奖成功
	 */

	public static int StartCJLR2(String openid,String zsm)
	{
		int bz =0;

		// int iszj_bz=0;      //4 是没中奖
//			 if ("4".equals(zsm)) {
//				iszj_bz=0;
//			}else {
//				iszj_bz=1;
//			}

		// String xm = GetXm(openid);
		//String tel = GetTel(openid);
		// String lx = GetLx(openid);



		//直接入库(更新操作哦)
		try {

			sql_data db = new sql_data();
			String sql_pd = "select top 1 * from yqfbwx_gpxd_cj where zsm=0 and openid = '"+openid+"' order by id desc";
			// String sql_pd = "select count(*) as ct from yqfbwx_gpxd_cj where zsm<>0 and tel = '"+tel+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);


			if (rs.next()) {


				String sql ="update yqfbwx_gpxd_cj set zsm="+zsm+",fbsj='"+TimeString.nowTime()+"' where id="+rs.getInt("id")+" ";
				// String sql ="insert into yqfbwx_gpxd_cj(xm,tel,lx,openid,zsm,fbsj) VALUES('"+xm+"','"+tel+"','"+lx+"','"+openid+"',"+zsm+",'"+TimeString.nowTime()+"') ";
				//String sql ="insert into yqfbwx_gpxd_cj(xm,tel,lx,openid,zsm,fbsj) VALUES('"+xm+"','"+tel+"','"+lx+"','"+openid+"',12,'"+TimeString.nowTime()+"') ";

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


	//是否是当天抽过奖了
	public static int TodayCj(String tel){

		int kycj = 0;
		String nowDayMYD = TimeString.GetnowTimeYMD();

		try {
			sql_data db = new sql_data();
			String sql = "select top 1 * from yqfbwx_gpxd_cj where zsm<>0 and tel = '"+tel+"' order by id desc";
			// String sql = "select top 1 * from yqfbwx_gpxd_cj where tel = '"+tel+"' order by id desc";
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


	// 如果当天跟以前的时间比，如果不同，update,否则 不动

	public static void clym(String openid){
		String nowDayMYD = TimeString.GetnowTimeYMD();
		try {
			sql_data db = new sql_data();
			String sql ="SELECT CONVERT(varchar(100), fbsj, 23) as fbsj from yqfbwx_gpxd_dtcj where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String notTodyMYD = rs.getString(1);
				System.out.println(notTodyMYD);
				if (!notTodyMYD.equals(nowDayMYD)) {

					//String sql2 = "delete from yqcnwx_fzjz_dtcj where openid='"+openid+"'";
					//db.executeUpdate(sql2);
					String sql2 = "update yqfbwx_gpxd_dtcj set fbsj='"+TimeString.nowTime()+"',yz=0,cs=0 where openid='"+openid+"'";
					db.executeUpdate(sql2);
				}else{
					System.out.println("同一天");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public static void main(String[] args) {

		System.out.println(MyUtils23.TodayCj("13588963940"));

	}

}