package org.fjw.weixin.util;

import java.sql.ResultSet;
import java.util.Date;
import org.liufeng.course.util.TimeString;

//林佩的问效送U盘活动

public class MyUtils6 {

	//姓名/手机号
	//对话框输入姓名/手机号 返回 1 不存在该编号(提示先发送截图), 2.已经抽过奖(弹出文字) 3.输入(更新)成功（弹出窗口入口） 4.输入格式不正确 5.活动已经结束,感谢关注！ 6.活动还没开始呢 7.电话号码已经存在，同一个号码不能参加
	public static int Tp(String openid,String content){
		int cz =0;
		try {

			//控制时间
			int kz =0;
			String tt1=AllValus.pp1;
			String tt2=AllValus.pp2;
			Date c1=MyUtils2.CharDate(tt1);
			Date c2=MyUtils2.CharDate(tt2);
			kz= MyUtils2.TimeKZ(c1,c2);
			//1: //开始投票
			//2: //投票已经结束,感谢关注！
			//3: //投票还没开始呢
			if (kz==1) {




				//先判断格式是否正确
				String dd[] = PublicFun.split(content, "/");
				if (dd.length==2) {


					sql_data db = new sql_data();

					ResultSet rs3= db.executeQuery("select * from yqcnwx_lp_up where tel='"+dd[1]+"'");
					//电话号码是否已经存在
					if (rs3.next()) {

						cz=7;

					}else{

						ResultSet rs = db.executeQuery("select * from yqcnwx_lp_up where openid='"+openid+"'");
						if (rs.next()) {

							ResultSet rs2 = db.executeQuery("select * from yqcnwx_lp_up where iscj_bz=1 and openid='"+openid+"'");
							//该微信已经抽奖
							if (rs2.next()) {

								cz=2;

							}else {

								//说明是图片发了已经插入数据，但是抽奖表示iscj_bz=0 ，那就更新数据
								String sql = "update yqcnwx_lp_up set openid='"+openid+"',xm='"+dd[0]+"',tel='"+dd[1]+"',fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
								db.executeInsert(sql);
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


	/**
	 *
	 * @param openid
	 * @param xm
	 * @param tel
	 * @param dz
	 * @return 返回标志 1,以前已经抽过奖(不处理)， 2.不处理 留在抽奖页面
	 */
	//抽奖填写用户信息
	public static int StartCJBM(String openid)
	{
		int bz =0;
		//直接入库(更新操作哦)
		try {

			sql_data db = new sql_data();
			//判断 openid 是否已经存在
			String sql_pd = "select * from yqcnwx_lp_up where iscj_bz=1 and openid = '"+openid+"' ";
			// String sql_pd = "select * from yqcnwx_lp_up where openid = '"+openid+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			if (rs.next()) {
				//已经抽奖 不处理
				bz=1;

			}else{

				//还没抽奖留在抽奖页面


				bz=2;

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

			sql = "select count(*) as zs from yqcnwx_lp_up where zsm="+zsm+" ";

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
		return (AllValus.pj1 - MyUtils6.GetTotal(1));
	}



	/**
	 * 各个奖项中奖总剩余
	 * 也就是 比如 一等奖 在数据库里面 总共查到2个 ，一等奖的总数是2个， 那么 2-2=0 就得到这个数
	 */

	public static int GetTotalSY(int zsm){
		int sy=0;
		try {
			sql_data db = new sql_data();
			String sql="select count(*) as ct from yqcnwx_lp_up where zsm="+zsm+" ";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				switch (zsm) {

					case 1:
						sy = AllValus.pj1-rs.getInt(1);
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
			String sql="select count(*) as ct from yqcnwx_lp_up where zsm="+zsm+" and DateDiff(dd,fbsj,getdate())=0";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				int zjs = rs.getInt(1);
				if (zsm==1) {  //一等奖 当天中奖的人数

					if (MyUtils6.GetTotalSY(zsm)<=0) {//比如 一等奖的奖项总数 - 所有中了一等奖的人 <= 0  那么就是说1等奖的所有名额没了,就把标志变为0
						sy=0;
					}else {
						//一等奖 200
						if(TimeString.nowTime().indexOf("2015-06-05")!=-1){
							sy = 30 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-06")!=-1){
							sy = 30 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-07")!=-1){
							sy = 30 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-08")!=-1){
							sy = 30 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-09")!=-1){
							sy = 30 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-10")!=-1){
							sy = 30 -zjs;
						}else if(TimeString.nowTime().indexOf("2015-06-11")!=-1){
							sy = 20 -zjs;
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

	//返回抽到的奖项
	public static String zsm(String openid)
	{
		int bz = 0;
		String bz2 = "";

		try {

			sql_data db = new sql_data();
			String sql ="select zsm from yqcnwx_lp_up where openid='"+openid+"' ";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bz=rs.getInt(1);
			}


			if(bz==1){
				bz2="恭喜您抽中U盘";
			}else if(bz==2){
				bz2="谢谢参与";
			}


		} catch (Exception e) {
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
			//判断 bh 是否已经存在
			String sql_pd = "select * from yqcnwx_lp_up where iscj_bz=1 and openid = '"+openid+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			if (rs.next()) {
				//已经抽奖 不处理
				bz=1;

			}else{

				String sql ="update yqcnwx_lp_up set zsm="+zsm+",iscj_bz=1,iszj_bz="+iszj_bz+",fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"' ";
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