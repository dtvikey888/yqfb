package org.fjw.weixin.util;

import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.liufeng.course.util.TimeString;

//冯小明的微信抽奖类
public class MyUtils4 {


	//判断openid是否已经存在
	public static boolean iscz(String openid,int fid){
		boolean cz=false;
		try {
			sql_data db = new sql_data();
			String sql ="select * from yqfbwx_xm_zj where openid='"+openid+"' and fid="+fid+" ";
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

	//获取 yqfbwx_xm_wt 里面的最后一条记录的开始时间
	public static String GetStime(){
		String stime ="";
		try {
			sql_data db = new sql_data();
			String sql = "select top 1 stime from yqfbwx_xm_wt order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				stime = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return stime;
	}

	//获取 yqfbwx_xm_wt 里面的最后一条记录的结束时间
	public static String GetEtime(){
		String etime ="";
		try {
			sql_data db = new sql_data();
			String sql = "select top 1 etime from yqfbwx_xm_wt order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				etime = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return etime;
	}

	//首页用
	public static int SyYd(String openid,int fid){
		int bz=0;
		try {
			sql_data db = new sql_data();
			String sql="select * from yqfbwx_xm_zj where zsm<>'' and openid='"+openid+"' and fid="+fid+" ";
			ResultSet rs = db.executeQuery(sql);
			if (!rs.next()) {
				bz=1;
			}else {
				if(rs.getInt("zsm")==0){
					bz=2;
				}else {
					bz=3;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz;

	}

	//返回抽到的奖项
	public static String zsm(String openid,int fid)
	{
		int bz = 0;
		String bz2 = "";

		try {

			sql_data db = new sql_data();
			String sql ="select zsm from yqfbwx_xm_zj where openid='"+openid+"' and fid="+fid+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bz=rs.getInt(1);
			}

			if(bz==1){
				bz2="恭喜您中了50元书券";
			}else if(bz==2){
				bz2="谢谢参与";
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

	public static int GetTotal(int zsm,int fid){

		int zs =0;

		try {

			sql_data db = new sql_data();
			String sql="";

			sql = "select count(*) as zs from yqfbwx_xm_zj where zsm="+zsm+" and fid="+fid+" ";

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
	public static int sy1(int fid){
		return (AllValus.xmzj1 - MyUtils4.GetTotal(1,fid));
	}


	/**
	 * 各个奖项中奖总剩余
	 * 也就是 比如 一等奖 在数据库里面 总共查到2个 ，一等奖的总数是2个， 那么 2-2=0 就得到这个数
	 */

	public static int GetTotalSY(int zsm,int fid){
		int sy=0;
		try {
			sql_data db = new sql_data();
			String sql="select count(*) as ct from yqfbwx_xm_zj where zsm="+zsm+" and fid="+fid+" ";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				switch (zsm) {
					case 1:
						sy = AllValus.xmzj1-rs.getInt(1);
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

	public static int TodaySY(int zsm,int fid)
	{
		int sy =0;

		//查询当天各个奖项的中奖人数语句 select count(*) as ct from sxbook_cj where zsm=1 and DateDiff(dd,fbsj,getdate())=0
		try {

			sql_data db = new sql_data();
			String sql="select count(*) as ct from yqfbwx_xm_zj where zsm="+zsm+" and DateDiff(dd,fbsj,getdate())=0 and fid="+fid+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				int zjs = rs.getInt(1);
				if (zsm==1) {  //一等奖 当天中奖的人数

					if (MyUtils4.GetTotalSY(zsm,fid)<=0) {//比如 一等奖的奖项总数 - 所有中了一等奖的人 <= 0  那么就是说1等奖的所有名额没了,就把标志变为0
						sy=0;
					}else {
						//一等奖 周五 周六两天 一天 5个 //时间由后台指定
						if(TimeString.nowTime().indexOf(MyUtils4.GetStime().substring(0, 10))!=-1){
							sy = 5 -zjs;
						}else if(TimeString.nowTime().indexOf(MyUtils4.GetEtime().substring(0, 10))!=-1){
							sy = 5 -zjs;
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



	//获取本期题目标题
	public static String GetTitle(){

		String title ="";
		try {
			sql_data db = new sql_data();
			String sql="select top 1 title from yqfbwx_xm_wt order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				title=rs.getString(1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return title;

	}

	//获取fid
	public static int GetFid(){
		int fid =0;
		try {
			sql_data db = new sql_data();
			String sql="select top 1 id from yqfbwx_xm_wt order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				fid=rs.getInt(1);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return fid;

	}





	//输出问题(未完待续...)
	public static String GetXz(){
		String sc="";
		String temp="";
		try {
			sql_data db = new sql_data();
			String sql="select xz from yqfbwx_xm_wt order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				temp = rs.getString(1);
			}

			String[] ss= PublicFun.split(temp, "|");
			for (int i = 0; i < ss.length; i++) {
				int tt = i+1;
				sc+=""+"<p><input type=\"radio\" name=\"c1\" value="+tt+">"+ss[i]+"</p>";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sc;
	}





	//获取答案
	public static int GetAns(){
		int ans =0;
		try {
			sql_data db = new sql_data();
			String sql="select ans from yqfbwx_xm_wt order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				ans = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ans;
	}

	/**
	 * b b b d c c c d
	 * 这个 判断是否完全答对
	 *
	 */
	public static boolean iszq(int c1)
	{
		boolean sc=false;

		//获取答案
		int ans = MyUtils4.GetAns();

		if (c1==ans) {

			sc=true;

		}else {
			sc=false;
		}
		return sc;
	}



	//答题错误
	public static void qoc(String openid,int fid,int c1,String xm,String tel){

		try {
			sql_data db = new sql_data();
			String sql ="select * from yqfbwx_xm_zj where openid='"+openid+"' and fid="+fid+" ";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String sql2="update yqfbwx_xm_zj set iszq=2 where openid='"+openid+"' and fid="+fid+"  ";
				db.executeUpdate(sql2);
			}else {
				String sql3 ="insert into yqfbwx_xm_zj(openid,fid,c1,xm,tel,fbsj,iszq) values('"+openid+"',"+fid+","+c1+",'"+xm+"','"+tel+"','"+TimeString.nowTime()+"',2)";
				db.executeInsert(sql3);
			}


		} catch (Exception e) {
			e.printStackTrace();
		}

	}



	/**
	 *
	 * @param openid
	 * @param xm
	 * @param tel
	 * @return 返回标志 //1 没有完全答对 用标志 bz=1    2.完全答对  用标志 bz=2
	 */
	//抽奖填写用户信息
	public static int StartCJBM(String openid,int fid,int c1,String xm,String tel)
	{
		int bz =0;
		//直接入库(更新操作哦)
		try {

			sql_data db = new sql_data();
			//判断 bh 是否已经存在
			String sql_pd = "select * from yqfbwx_xm_zj where openid = '"+openid+"' and fid="+fid+" ";
			System.out.print(sql_pd);

			ResultSet rs = db.executeQuery(sql_pd);
			if (!rs.next()){

				String sql ="insert into yqfbwx_xm_zj(openid,fid,c1,fbsj,xm,tel,iszq) values('"+openid+"',"+fid+","+c1+",'"+TimeString.nowTime()+"','"+xm+"','"+tel+"',1) ";
				System.out.println(sql);
				db.executeInsert(sql);

				boolean iszy = MyUtils4.iszq(c1);

				if (iszy) {  //完全正确
					bz=2;
				}else {  //否则
					bz=1;
				}
			}else {
				String sql ="update yqfbwx_xm_zj set c1="+c1+",fbsj='"+TimeString.nowTime()+"',iszq=1 where openid='"+openid+"' and fid="+fid+" ";
				System.out.println(sql);
				db.executeInsert(sql);

				boolean iszy = MyUtils4.iszq(c1);

				if (iszy) {  //完全正确
					bz=2;
				}else {  //否则
					bz=1;
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
	 * @param xm
	 * @param tel
	 * @param dz
	 * @return 返回标志 1,以前已经抽过奖(不处理)， 2.记录抽奖成功
	 */

	public static int StartCJLR(String openid,String zsm,int fid)
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
			String sql_pd = "select * from yqfbwx_xm_zj where iscj=1 and openid = '"+openid+"' and fid="+fid+" ";
			System.out.print(sql_pd);
			ResultSet rs = db.executeQuery(sql_pd);
			if (rs.next()) {
				//已经抽奖 不处理
				bz=1;

			}else{

				String sql ="update yqfbwx_xm_zj set zsm="+zsm+",iscj=1,iszj="+iszj_bz+",fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"' and fid="+fid+" ";
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


	//根据 openid,fid 查询xm
	public static String GetXmFromOpenId(String openid,int fid){
		String xm="";
		try {
			sql_data db = new sql_data();
			String sql ="select xm from yqfbwx_xm_zj where openid='"+openid+"' and fid="+fid+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				xm = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return xm;
	}

	//根据 openid, fid 查询tel
	public static String GetTelFromOpenId(String openid,int fid){
		String tel="";
		try {
			sql_data db = new sql_data();
			String sql ="select tel from yqfbwx_xm_zj where openid='"+openid+"' and fid="+fid+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tel = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tel;
	}



	//根据 openid, fid 查询iszq
	public static int GetIsZqFromOpenId(String openid,int fid){
		int iszq=0;
		try {
			sql_data db = new sql_data();
			String sql ="select iszq from yqfbwx_xm_zj where openid='"+openid+"' and fid="+fid+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				iszq = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return iszq;
	}


	public static void main(String[] args) {
		//System.out.println(MyUtils4.GetXz());

		System.out.println(MyUtils4.GetEtime());

	}



}