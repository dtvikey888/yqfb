package org.fjw.weixin.util;

import java.sql.ResultSet;

import org.liufeng.course.util.TimeString;

// 笑脸那个投票成功以后抽奖奖项
public class MyUtils5 {

	/**
	 * @prame  1 等奖 在数据库中中奖的数目
	 * @return
	 */

	public static int GetTotal(int zsm){

		int zs =0;

		try {

			sql_data db = new sql_data();
			String sql="";

			sql = "select count(*) as zs from yqfbwx_tp where zsm="+zsm+" ";

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

	//1等奖总剩余
	public static int sy1(){
		return (AllValus.facezj1 - MyUtils5.GetTotal(1));
	}


	/**
	 * 各个奖项中奖总剩余
	 * 也就是 比如 一等奖 在数据库里面 总共查到2个 ，一等奖的总数是2个， 那么 2-2=0 就得到这个数
	 */

	public static int GetTotalSY(int zsm){
		int sy=0;
		try {
			sql_data db = new sql_data();
			String sql="select count(*) as ct from yqfbwx_tp where zsm="+zsm+" ";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				switch (zsm) {
					case 1:
						sy = AllValus.facezj1-rs.getInt(1);
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
			String sql="select count(*) as ct from yqfbwx_tp where zsm="+zsm+" and DateDiff(dd,fbsj,getdate())=0";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				int zjs = rs.getInt(1);
				if (zsm==1) {  //一等奖 当天中奖的人数

					if (MyUtils5.GetTotalSY(zsm)<=0) {//比如 一等奖的奖项总数 - 所有中了一等奖的人 <= 0  那么就是说1等奖的所有名额没了,就把标志变为0
						sy=0;
					}else {
						//50个一等奖 3天分
						if(TimeString.nowTime().indexOf("2015-05-21")!=-1){
							sy = 17 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-05-22")!=-1){
							sy = 15 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-05-23")!=-1){
							sy = 18 -zjs;
						}else {
							sy = 0;
						}

						//sy = AllValus.zjxz1 -zjs;   //sy标识 = 当天中奖限制 - 当天中奖人数 。
					}

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sy;

	}

	//首页用 bz=1 表示还没抽过 bz=2 表示已经抽过
	public static int SyYd(String openid){
		int bz=0;
		try {
			sql_data db = new sql_data();
			String sql="select * from yqfbwx_tp where zsm=0 and openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				bz=1;

			}else {

				bz=2;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz;

	}

	//返回抽到的奖项
	public static String zsm(String openid)
	{
		int bz = 0;
		String bz2 = "";

		try {

			sql_data db = new sql_data();
			String sql ="select zsm from yqfbwx_tp where openid='"+openid+"' ";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bz=rs.getInt(1);
			}

			if(bz==1){
				bz2="恭喜您中了100元书卡。";
			}else if(bz==2){
				bz2="您没中奖";
			}


		}catch (Exception e) {
			e.printStackTrace();
		}

		return bz2;
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

		int iszj_bz=0;      //2 是没中奖
		if ("2".equals(zsm)) {
			iszj_bz=0;
		}else {
			iszj_bz=1;
		}

		//直接入库(更新操作哦)
		try {

			sql_data db = new sql_data();
			//判断
			String sql_pd = "select * from yqfbwx_tp where iscj=1 and openid = '"+openid+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			if (rs.next()) {
				//已经抽奖 不处理
				bz=1;

			}else{

				String sql ="update yqfbwx_tp set zsm="+zsm+",iscj=1,iszj="+iszj_bz+",fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"' ";
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


}