package org.fjw.weixin.util;

import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.NumberFormat;

import org.liufeng.course.util.TimeString;



//林佩抽奖 类
public class MyUtils28 {

	//是否已经抽奖
	public static boolean iscj_pd(String openid){

		boolean cj =false;

		try {
			MysqlDB db = new MysqlDB();
			String sql = "select  * from daf_cj7 where iscj_bz=1 and openid = '"+openid+"' ";
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



	//是否已经抽奖
	public static boolean iscj_pd2(String openid){

		boolean cj =false;

		try {
			MysqlDB db = new MysqlDB();
			String sql = "select count(*) as ct from daf_cj7 where zsm<>0 and openid = '"+openid+"' ";
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
			MysqlDB db = new MysqlDB();
			String sql = "select count(*) as ct from daf_cj7 where zsm<>0 and tel = '"+tel+"' ";
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
	public static boolean iscj_pd4(String openid){

		boolean cj =false;

		try {
			MysqlDB db = new MysqlDB();
			String sql = "select  * from daf_cj7 where iscj_bz=1 and openid = '"+openid+"' ";
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


	//返回抽到的奖项
	public static String zsm(String openid)
	{
		int bz = 0;
		String bz2 = "";

		try {

			MysqlDB db = new MysqlDB();
			String sql ="select zsm from daf_cj7 where openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bz=rs.getInt(1);
			}

			if(bz==1){
				bz2="恭喜您获得一等奖";
			}else if(bz==2){
				bz2="恭喜您获得参与奖";
			}else{
				bz2="本次活动已结束，感谢关注";
			}

			/**
			 if(bz==1){
			 bz2="恭喜您获得10元话费,话费将于活动结束后，进行统一充值，敬请留意。";
			 }else{
			 bz2="谢谢参与";
			 }**/

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
			MysqlDB db = new MysqlDB();
			String sql="select count(*) as ct from daf_cj7 where zsm="+zsm+" ";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				switch (zsm) {

					case 1:
						sy = AllValus.lpgg1-rs.getInt(1);
						break;

					case 2:
						sy = AllValus.lpgg2-rs.getInt(1);
						break;

//					case 3:
//						sy = AllValus.lpgg3-rs.getInt(1);
//						break;
//
//					case 4:
//						sy = AllValus.lpgg4-rs.getInt(1);
//						break;
//
//					case 5:
//						sy = AllValus.lpgg5-rs.getInt(1);
//					break;


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

			MysqlDB db = new MysqlDB();
			String sql = "select count(*) as zs from daf_cj7 where zsm="+zsm+" ";

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

	/**
	 * @prame  1. 2.  3. 4 等奖 在数据库中 中奖的数目
	 * @return
	 */

	public static int GetTotal(){

		int zs =0;

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select count(*) as zs from daf_cj7";

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
//	public static int sy1(){
//		return (AllValus.lpgg1 - org.fjw.weixin.util.MyUtils28.GetTotal(1));
//	}

//	//总剩余数
//	public static int sy1(){
//		return (AllValus.cg_sl - org.fjw.weixin.util.MyUtils28.GetTotal());
//	}
//
//	//2.二等奖 总剩余数
//	public static int sy2(){
//		return (AllValus.lpgg2 - org.fjw.weixin.util.MyUtils28.GetTotal(2));
//	}



	//	//3.三等奖 总剩余数
//	public static int sy3(){
//		return (AllValus.lpgg3 - MyUtils28.GetTotal(3));
//	}
//
//	//4等奖 总剩余数
//	public static int sy4(){
//		return (AllValus.lpgg4 - MyUtils28.GetTotal(4));
//	}
//
//		//5等奖 总剩余数
//		 public static int sy5(){
//			 return (AllValus.lpgg5 - MyUtils28.GetTotal(5));
//		 }
//
	//是否填写过电话
	public static boolean isTxTel(String openid){
		boolean bz = false;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select * from daf_cj7 where openid='"+openid+"' and tel is null";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bz=true;
			}else{
				bz=false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bz;
	}

	/**
	 *
	 * @param openid
	 * @param xm
	 * @param tel
	 * @param dz
	 * @return 返回标志 1,以前已经抽过奖(不处理)， 2.填写用户信息成功
	 */
//	//抽奖填写用户信息
//	public static int StartCJBM(String openid,String xm,String tel,String bh)
//	{
//		int bz =0;
//		//直接入库(更新操作哦)
//		try {
//
//			MysqlDB db = new MysqlDB();
//			//判断 bh 是否已经存在
//			//String sql_pd = "select * from daf_cj7 where iscj_bz=1 and openid = '"+openid+"' ";
//			String sql_pd = "select * from daf_cj7 where openid = '"+openid+"' ";
//			System.out.print(sql_pd);
//			ResultSet rs = db.executeQuery(sql_pd);
//			if (rs.next()) {
//
//				//已经存在 更新处理
//				String sql ="update daf_cj7 set xm='"+xm+"',tel='"+tel+"',bh='"+bh+"',fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"' ";
//				db.executeUpdate(sql);
//
//				//String sql_pd2="select * from daf_cj7 where openid='"+openid+"'";
////				ResultSet rs2 = db.executeQuery(sql_pd2);
////				if(!rs2.next()){
////					String sql ="insert into daf_cj7(openid,xm,tel,fbsj,iscj_bz,bh) VALUES('"+openid+"','"+xm+"','"+tel+"','"+TimeString.nowTime()+"',1,'"+bh+"') ";
////					db.executeInsert(sql);
////					System.out.println(sql);
////				}
//
//				bz=1;
//
//			}else{
//
//				//不存在 不处理
//
//				bz=2;
//
//			}
//
//
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		System.out.println("bz ="+bz);
//
//		return bz;
//
//	}

	/**
	 *
	 * @param openid
	 * @param xm
	 * @param tel
	 * @return 返回标志 1,以前已经抽过奖(不处理)， 2.填写用户信息成功
	 */
	//抽奖填写用户信息
	public static int StartCJBM(String openid,String xm,String tel,String bh,String xb,String dw,String sno)
	{
		int bz =0;
		//直接入库(更新操作哦)
		try {

			MysqlDB db = new MysqlDB();
			//判断 bh 是否已经存在
			//String sql_pd = "select * from daf_cj7 where iscj_bz=1 and openid = '"+openid+"' ";
			String sql_pd = "select * from daf_cj7 where openid = '"+openid+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);

			if (rs.next()) {

				//已经存在 不处理
//				String sql ="update daf_cj7 set xm='"+xm+"',tel='"+tel+"',bh='"+bh+"',fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"' ";
//				db.executeUpdate(sql);
//
//				//String sql_pd2="select * from daf_cj7 where openid='"+openid+"'";
////				ResultSet rs2 = db.executeQuery(sql_pd2);
////				if(!rs2.next()){
////					String sql ="insert into daf_cj7(openid,xm,tel,fbsj,iscj_bz,bh) VALUES('"+openid+"','"+xm+"','"+tel+"','"+TimeString.nowTime()+"',1,'"+bh+"') ";
////					db.executeInsert(sql);
////					System.out.println(sql);
////				}

				bz=1;

			}else{


                if(openid!=null) {
                    //不存在 处理
                    String sql = "insert into daf_cj7(openid,xm,tel,fbsj,iscj_bz,bh,xb,dw,sno) VALUES('" + openid + "','" + xm + "','" + tel + "','" + TimeString.nowTime() + "',1,'" + bh + "','" + xb + "','" + dw + "','" + sno + "') ";
                    db.executeInsert(sql);


                    bz = 2;

                }

			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("bz ="+bz);

		return bz;

	}



//	//获取下一个编号
//	public static String GetNextBH(){
//
//		String bh ="";
//
//		try {
//
//			MysqlDB db = new MysqlDB();
//			String sql= "select bh from daf_cj7 where bh<>'' order by bh desc limit 1";
//			ResultSet rs = db.executeQuery(sql);
//
//			if (rs.next()) {
//
//				String ss = rs.getString(1);
//				int ss2 = (new Integer(ss))+1;
//
//				NumberFormat f=new DecimalFormat("00000");
//
//				for(int i=ss2;i<=ss2;i++){
//
//					bh= f.format(i);
//				}
//
//			}else{
//
//				bh="00001";
//
//			}
//
//		} catch (Exception e) {
//
//			e.printStackTrace();
//
//		}
//
//
//		return bh;
//	}

	//获取下一个编号
	public static String GetNextBH(){

		String bh ="";

		try {

			MysqlDB db = new MysqlDB();
			String sql= "select bh from daf_cj7 where bh<>'' order by bh desc limit 1";
			ResultSet rs = db.executeQuery(sql);

			if (rs.next()) {

				String ss = rs.getString(1);
				int ss2 = (new Integer(ss))+1;

				NumberFormat f=new DecimalFormat("00000");

				for(int i=ss2;i<=ss2;i++){

					bh= f.format(i);
				}

			}else{

				bh="00001";

			}

		} catch (Exception e) {

			e.printStackTrace();

		}


		return bh;
	}



	//第几位参加者
//	public static int GetWs(String openid){
//		int ws = 0;
//		try {
//			MysqlDB db = new MysqlDB();
//			String sql ="select bh from daf_cj7 where openid='"+openid+"'";
//			ResultSet rs = db.executeQuery(sql);
//			if (rs.next()) {
//
//				ws = new Integer(rs.getString(1));
//
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return ws;
//	}
//	

	//第几位参加者
	public static int GetWs(String openid){
		int ws = 0;
		try {
			MysqlDB db = new MysqlDB();
			String sql ="select bh from daf_cj7 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				ws = new Integer(rs.getString(1));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ws;
	}

	//显示的字
//	public static String xsdz(String openid){
//		String xs ="";
//		if (MyUtils28.GetWs(openid)>600) {
//			xs=AllValus.cg_jx;
//		}else{
//			xs=AllValus.cg_cx;
//		}
//
//		return xs;
//	}

//	//显示的字
//	public static String xsdz(String openid){
//		String xs ="";
//		if (MyUtils28.GetWs(openid)>AllValus.cg_sl) {
//			xs=AllValus.cg_jx;
//		}else{
//			xs=AllValus.cg_cx;
//		}
//
//		return xs;
//	}



	/**
	 * 修改中奖概率
	 * @param ，1，2，3） ,处理一下，变成num+1,然后(1,2,3,4) 5是没中奖不处理的,页面不会传进来的,
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

			MysqlDB db = new MysqlDB();
			String sql="select count(*) as ct from daf_cj7 where zsm="+zsm+" and DATEDIFF(date_format(fbsj,'%Y-%m-%d'),curdate())=0";
			//String sql="select count(*) as ct from daf_cj7 where zsm="+zsm+" and DateDiff(dd,fbsj,getdate())=0";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				int zjs = rs.getInt(1);
				if (zsm==1) {  //一等奖 当天中奖的人数

					if (org.fjw.weixin.util.MyUtils28.GetTotalSY(zsm)<=0) {//比如 一等奖的奖项总数 - 所有中了一等奖的人 <= 0  那么就是说1等奖的所有名额没了,就把标志变为0
						sy=0;
					}else {

						//1 7   10  9

						//2 12  20  18

						//3 30   50  48

						//4 216  220  218
						//一等奖10 8
						if(TimeString.nowTime().indexOf("2019-11-05")!=-1){
							sy = 1 -zjs;
						}else {
							sy = 0;
						}

						//sy = AllValus.zjxz1 -zjs;   //sy标识 = 当天中奖限制 - 当天中奖人数 。
					}

				}else if(zsm==2){

					if (org.fjw.weixin.util.MyUtils28.GetTotalSY(zsm)<=0) {//比如 二等奖的奖项总数 - 所有中了二等奖的人 <= 0  那么就是说2等奖的所有名额没了 ,就把标志变为0
						sy=0;
					}else {
						//二等奖90 18
						if(TimeString.nowTime().indexOf("2019-11-05")!=-1){
							sy=82-zjs;
						}else {
							sy=0;
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
	 * 修改中奖概率
	 * @param1，2，3） ,处理一下，变成num+1,然后(1,2,3,4) 5是没中奖不处理的,页面不会传进来的,
	 * 查找数据库中当天zsm字段数量，从allvalue 里面提取 每天限制的奖项，减一下，如果<=0 那就返回标志 0，否则返回1
	 * 判断当天某个奖项的中奖数 ,用来控制每天的中奖概率 (提供给 抽奖页面 随机中的图片用)
	 * @return 返回一个标志 表示 当天这个奖项还有没有名额 ，从allvalue 里面提取，然后查找数据库中的当天该奖项的中奖数据 ，减一下 就可以判断
	 * 每个奖项当天剩余数 1,2,3,4
	 */

	public static int TodaySY2(int zsm)
	{
		int sy =0;

		//查询当天各个奖项的中奖人数语句 select count(*) as ct from sxbook_cj where zsm=1 and DateDiff(dd,fbsj,getdate())=0
		try {

			MysqlDB db = new MysqlDB();
			String sql="select count(*) as ct from daf_cj7 where zsm="+zsm+" and DATEDIFF(date_format(fbsj,'%Y-%m-%d'),curdate())=0";
			//String sql="select count(*) as ct from daf_cj7 where zsm="+zsm+" and DateDiff(dd,fbsj,getdate())=0";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				int zjs = rs.getInt(1);
				if (zsm==1) {  //一等奖 当天中奖的人数

					if (org.fjw.weixin.util.MyUtils28.GetTotalSY(zsm)<=0) {//比如 一等奖的奖项总数 - 所有中了一等奖的人 <= 0  那么就是说1等奖的所有名额没了,就把标志变为0
						sy=0;
					}else {
						//一等奖200元 3名
						if(TimeString.nowTime().indexOf("2019-09-05")!=-1){
							sy = 1 -zjs;
						}else if (TimeString.nowTime().indexOf("2019-09-06")!=-1) {
							sy=1-zjs;
						}else if (TimeString.nowTime().indexOf("2019-09-07")!=-1) {
							sy=1-zjs;
						}else {
							sy = 0;
						}

						//sy = AllValus.zjxz1 -zjs;   //sy标识 = 当天中奖限制 - 当天中奖人数 。
					}


				}else if(zsm==2){

					if (org.fjw.weixin.util.MyUtils28.GetTotalSY(zsm)<=0) {//比如 二等奖的奖项总数 - 所有中了二等奖的人 <= 0  那么就是说2等奖的所有名额没了 ,就把标志变为0
						sy=0;
					}else {
						//二等奖50元 5名
						if(TimeString.nowTime().indexOf("2019-08-30")!=-1){
							sy=1-zjs;
						}else if (TimeString.nowTime().indexOf("2019-09-01")!=-1) {
							sy=1-zjs;
						}else {
							sy=0;
						}

						//sy = AllValus.zjxz2 -zjs;   //sy标识 = 当天中奖限制 - 当天中奖人数 。
					}


				}else if (zsm==3) {

					if (org.fjw.weixin.util.MyUtils28.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//三等奖20元 10名
						if (TimeString.nowTime().indexOf("2019-08-30")!=-1) {
							sy=3-zjs;
						}else if (TimeString.nowTime().indexOf("2019-09-02")!=-1) {
							sy=5-zjs;
						}else {
							sy=0;
						}
						//sy = AllValus.zjxz3 -zjs;
					}


				}else if (zsm==4) {

					if (org.fjw.weixin.util.MyUtils28.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//四等奖10元 20名
						if (TimeString.nowTime().indexOf("2019-08-30")!=-1) {
							sy=8-zjs;
						}else if (TimeString.nowTime().indexOf("2019-09-05")!=-1) {
							sy=10-zjs;
						}else {
							sy=0;
						}
						//sy = AllValus.zjxz3 -zjs;
					}


				}else if (zsm==5) {

					if (org.fjw.weixin.util.MyUtils28.GetTotalSY(zsm)<=0) {
						sy=0;
					}else {
						//五等奖5元 750名
						if (TimeString.nowTime().indexOf("2019-09-05")!=-1) {

							sy=250-zjs;

						}else if (TimeString.nowTime().indexOf("2019-09-08")!=-1) {

							sy=350-zjs;

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
			MysqlDB db = new MysqlDB();
			String sql = "select * from daf_cj7 where openid='"+openid+"' order by id desc";
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
			MysqlDB db = new MysqlDB();
			String sql = "select * from daf_cj7 where openid='"+openid+"' order by id desc";
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
			MysqlDB db = new MysqlDB();
			String sql = "select  * from daf_cj7 where openid='"+openid+"' order by id desc";
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
	 * @param tel
	 * @return 返回标志 1,以前已经抽过奖(不处理)， 2.记录抽奖成功
	 */

	public static int StartCJLR2(String tel,String openid,String zsm)
	{
		int bz =0;

		int iszj_bz=0;      //5 是没中奖
		if ("5".equals(zsm)) {
			iszj_bz=0;
		}else {
			iszj_bz=1;
		}

		String xm = GetXm(openid);
		//String tel = GetTel(openid);
		//String lx = GetLx(openid);



		//直接入库(更新操作哦)
		try {

			MysqlDB db = new MysqlDB();
			// String sql_pd = "select count(*) as ct from daf_cj7 where zsm<>0 and openid = '"+openid+"' ";
			String sql_pd = "select count(*) as ct from daf_cj7 where zsm<>0 and tel = '"+tel+"' ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			int ct = 0;



			if (rs.next()) {
				//已经抽奖超过1次不处理
				ct = rs.getInt(1);
				if (ct>0) {

					bz=1;

				}else{

					//String sql ="insert into daf_cj7(xm,tel,openid,zsm,fbsj) VALUES('"+xm+"','"+tel+"','"+openid+"',"+zsm+",'"+TimeString.nowTime()+"') ";

					String sql ="update daf_cj7 set xm='"+xm+"',tel='"+tel+"',openid='"+openid+"',zsm="+zsm+",fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";

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

	/**
	 * //刮刮卡抽奖完写进数据库
	 * @param openid
	 * @return 返回标志 1,以前已经抽过奖(不处理)， 2.记录抽奖成功
	 */

	public static int StartCJLR3(String openid,String zsm)
	{
		int bz =0;

		int iszj_bz=0;      //3 是没中奖
		if ("3".equals(zsm)) {
			iszj_bz=0;
		}else {
			iszj_bz=1;
		}

		//String xm = GetXm(openid);
		//String tel = GetTel(openid);
		//String lx = GetLx(openid);



		//直接入库(更新操作哦)
		try {

			MysqlDB db = new MysqlDB();
			String sql_pd = "select count(*) as ct from daf_cj7 where zsm<>0 and openid = '"+openid+"' ";
			//String sql_pd = "select count(*) as ct from daf_cj7 where zsm<>0 and tel = '"+tel+"' ";

			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			int ct = 0;

			if (rs.next()) {
				//已经抽奖超过1次不处理
				ct = rs.getInt(1);
				if (ct>0) {

					bz=1;

				}else{

					String sql ="insert into daf_cj7(openid,zsm,fbsj) VALUES('"+openid+"',"+zsm+",'"+TimeString.nowTime()+"') ";

					//String sql ="update daf_cj7 set xm='"+xm+"',tel='"+tel+"',openid='"+openid+"',zsm="+zsm+",fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
					//String sql ="update daf_cj7 set openid='"+openid+"',zsm="+zsm+",fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";

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
			MysqlDB db = new MysqlDB();
			String sql = "select  * from daf_cj7 where zsm<>0 and tel = '"+tel+"' order by id desc";
			// String sql = "select  * from daf_cj7 where tel = '"+tel+"' order by id desc";
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

	//答题次数
//	public static int GetCsForDt(String openid){
//		int cs=0;
//		try {
//			MysqlDB db = new MysqlDB();
//			String sql = "select cs from yqfb_openid where openid='"+openid+"'";
//			ResultSet rs = db.executeQuery(sql);
//			if (rs.next()) {
//				cs = rs.getInt(1);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return cs;
//	}

	//答题次数
	public static int GetCsForDt(String openid){
		int cs=0;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select cs from yqfb_openid2 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				cs = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cs;
	}

	//答题次数
	public static int GetCsForDt2(String openid){
		int cs=0;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select cs from yqfb_openid2 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				cs = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cs;
	}

	//答题正确与否 10个正确就行
	//答案：1A  2B 3A  4A  5A  6A  7B  8A  9C  10C  11A 12A    13B    14C    15A

//	public static boolean DtIsZq(int... a){
//		boolean zqm=false;
//
//		int ct=1;
//		int tt=0;
//		int[] arr1 = {a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14]};
//		for (int i : arr1) {
//			System.out.println(arr1[i]);
//		}
//		int[] arr2 = {1,2,1,1,1,1,2,1,3,3,1,1,2,3,1};
//		for(int i = 0; i < 15; ++i) {
//			if(arr1[i] == arr2[i]){
//				System.out.println("same!");
//				tt++;
//			}
//		}
//
//		ct=tt;
//
//		System.out.println("ct:"+ct);
//		if (ct>=10) {
//			zqm=true;
//		}
//
//
////			//答题正确
////			 if(a[0]==1&&a[1]==1&&a[2]==3&&a[3]==1&&a[4]==2&&a[5]==2&&a[6]==3&&a[7]==3&&a[8]==1&&a[9]==2){
////				 zqm=true;
////			 }
//		return zqm;
//	}

	//答题正确与否 10个正确就行
	//答案：1A  2B 3A  4A  5A  6A  7B  8A  9C  10C  11A 12A    13B    14C    15A
	// 答案：1-5 BCBDD    6-10 CACCA    11-15 CADCA    16-20 ACDDB
	public static boolean DtIsZq(int... a){
		boolean zqm=false;

		int ct=1;
		int tt=0;
		int[] arr1 = {a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9]};
		for (int i : arr1) {
			System.out.println(arr1[i]);
		}
		int[] arr2 = {4,2,2,2,1,4,4,4,1,1};
		for(int i = 0; i < 10; ++i) {
			if(arr1[i] == arr2[i]){
				System.out.println("same!");
				tt++;
			}
		}

		ct=tt;

		System.out.println("ct:"+ct);
		if (ct>=8) {
			zqm=true;
		}


		//答题正确
//		    if(a[0]==1&&a[1]==1&&a[2]==1&&a[3]==1&&a[4]==1&&a[5]==1&&a[6]==1&&a[7]==1&&a[8]==1&&a[9]==1){
//			  zqm=true;
//		    }
		return zqm;
	}



	//答题录入操作
	//bz: 1 成功 2 答题超过100000次 3 答题错误
//	public static int DtRl(String openid,int... a){
//		int bz=0;
//		int cs = org.fjw.weixin.util.MyUtils28.GetCsForDt(openid);
//		if(cs>100000){
//			bz=2;
//		}else{
//
//			//答题错误
//			if(!org.fjw.weixin.util.MyUtils28.DtIsZq(a)){
//
//				MysqlDB db2 = new MysqlDB();
//				String sqlcs = "update yqfb_openid set cs=cs+1,fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
//				db2.executeUpdate(sqlcs);
//				System.out.println(sqlcs);
//				bz=3;
//			}else {
//				//答题正确
//				try {
//
//					MysqlDB db = new MysqlDB();
//					String sql = "update yqfb_openid set yt=1,cs=cs+1,fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
//					db.executeUpdate(sql);
//					System.out.println(sql);
//
//					String sql2 = "INSERT INTO daf_dt7(openid,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,fbsj) VALUES('"+openid+"',"+a[0]+","+a[1]+","+a[2]+","+a[3]+","+a[4]+","+a[5]+","+a[6]+","+a[7]+","+a[8]+","+a[9]+","+a[10]+","+a[11]+","+a[12]+","+a[13]+","+a[14]+",'"+TimeString.nowTime()+"')";
//					System.out.println(sql2);
//					db.executeInsert(sql2);
//
//					bz=1;
//
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//
//			}
//
//		}
//
//		return bz;
//	}

	//答题录入操作
	//bz: 1 成功 2 答题超过100000次 3 答题错误
	public static int DtRl(String openid,int... a){
		int bz=0;
		int cs = MyUtils28.GetCsForDt(openid);
		if(cs>100000){
			bz=2;
		}else{

			//答题错误
			if(!MyUtils28.DtIsZq(a)){

				MysqlDB db2 = new MysqlDB();
				String sqlcs = "update yqfb_openid2 set cs=cs+1,fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
				db2.executeUpdate(sqlcs);
				System.out.println(sqlcs);
				bz=3;
			}else {
				//答题正确
				try {

					MysqlDB db = new MysqlDB();
					String sql = "update yqfb_openid2 set yt=1,cs=cs+1,fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
					db.executeUpdate(sql);
					System.out.println(sql);

					String sql2 = "INSERT INTO daf_dt(openid,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,fbsj) VALUES('"+openid+"',"+a[0]+","+a[1]+","+a[2]+","+a[3]+","+a[4]+","+a[5]+","+a[6]+","+a[7]+","+a[8]+","+a[9]+",'"+TimeString.nowTime()+"')";
					System.out.println(sql2);
					db.executeInsert(sql2);


					bz=1;

				} catch (Exception e) {
					e.printStackTrace();
				}

			}

		}

		return bz;
	}


	public static void main(String[] args) {

		//System.out.println(MyUtils28.TodayCj("13588963940"));
		boolean zqm=false;
		int tt=0;
		int ct=1;
		int[] arr1 = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
		for (int i : arr1) {
			System.out.println(arr1[i]);
		}
		int[] arr2 = {1,2,1,1,1,1,2,1,3,3,1,1,2,3,1};
		for(int i = 0; i < 15; ++i) {
			if(arr1[i] == arr2[i]){
				System.out.println("same!");

				tt++;
			}
		}

		ct =tt;

		System.out.println("ct:"+ct);
		if (ct>=10) {
			zqm=true;
		}


//			//答题正确
//			 if(a[0]==1&&a[1]==1&&a[2]==3&&a[3]==1&&a[4]==2&&a[5]==2&&a[6]==3&&a[7]==3&&a[8]==1&&a[9]==2){
//				 zqm=true;
//			 }


		System.out.println(ct);

	}

}