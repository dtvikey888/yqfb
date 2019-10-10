package org.fjw.weixin.util;
/**
 * 该类用于 预约报名 所使用的方法
 */
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.liufeng.course.util.TimeString;


public class MyUtils {


	//是否报过名了
	//0.没有报名 1.已经报名而且没超过限制数量 2.已经报名但是超过限制数量
	public static int isbm(String openid)
	{
		int bz = 0;

		try {

			sql_data db = new sql_data();
			String sql ="select top 1 * from sxbook_bm where openid='"+openid+"' and isbm=1 ";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				int zj = AllValus.sq+AllValus.ls+AllValus.hq;
				if(new Integer(MyUtils.GetBENBH())>zj){
					bz=2;
				}else {
					bz=1;
				}

			}else {
				bz=0;
			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz;
	}

	//返回报名编号
	public static String bmid(String openid)
	{
		String bz = "";

		try {

			sql_data db = new sql_data();
			String sql ="select bh from sxbook_bm where openid='"+openid+"' ";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bz=rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz;
	}

	//判断是否该 openid存在
	public static boolean isczopenid(String openid)
	{
		boolean bz = true;

		try {

			sql_data db = new sql_data();
			String sql ="select * from sxbook_openid where openid='"+openid+"' ";
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


	//java 版的 dateDiff
	/**
	 * MSSQL中提供了个datediff函数用来对两个时间进行减法操作，
	 * 但在Java中却没有，如果我们想知道两个日期间相隔了多少天，
	 * 或是相隔了多少个小时则要手工计算。
	 * 下面代码模仿MSSQL的datediff函数提供了使用不同时间间隔来计算两个时间相差的时间间隔的数目，
	 * 比如timeInterval为day则返回相差的天数，
	 * 为month则返回相差的月数。
	 * 总共支持year,quarter,month,week,day,hour,minute,second这几种时间间隔，
	 * date1和date2为要计算的两个时间，结果为date1减去date2后的值。
	 */

	/**
	 * 按指定日期单位计算两个日期间的间隔
	 *
	 * @param timeInterval
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static long dateDiff(String timeInterval, Date date1, Date date2) {
		if (timeInterval.equals("year")) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date1);
			int time = calendar.get(Calendar.YEAR);
			calendar.setTime(date2);
			return time - calendar.get(Calendar.YEAR);
		}

		if (timeInterval.equals("quarter")) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date1);
			int time = calendar.get(Calendar.YEAR) * 4;
			calendar.setTime(date2);
			time -= calendar.get(Calendar.YEAR) * 4;
			calendar.setTime(date1);
			time += calendar.get(Calendar.MONTH) / 4;
			calendar.setTime(date2);
			return time - calendar.get(Calendar.MONTH) / 4;
		}

		if (timeInterval.equals("month")) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date1);
			int time = calendar.get(Calendar.YEAR) * 12;
			calendar.setTime(date2);
			time -= calendar.get(Calendar.YEAR) * 12;
			calendar.setTime(date1);
			time += calendar.get(Calendar.MONTH);
			calendar.setTime(date2);
			return time - calendar.get(Calendar.MONTH);
		}

		if (timeInterval.equals("week")) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date1);
			int time = calendar.get(Calendar.YEAR) * 52;
			calendar.setTime(date2);
			time -= calendar.get(Calendar.YEAR) * 52;
			calendar.setTime(date1);
			time += calendar.get(Calendar.WEEK_OF_YEAR);
			calendar.setTime(date2);
			return time - calendar.get(Calendar.WEEK_OF_YEAR);
		}

		if (timeInterval.equals("day")) {
			long time = date1.getTime() / 1000 / 60 / 60 / 24;
			return time - date2.getTime() / 1000 / 60 / 60 / 24;
		}

		if (timeInterval.equals("hour")) {
			long time = date1.getTime() / 1000 / 60 / 60;
			return time - date2.getTime() / 1000 / 60 / 60;
		}

		if (timeInterval.equals("minute")) {
			long time = date1.getTime() / 1000 / 60;
			return time - date2.getTime() / 1000 / 60;
		}

		if (timeInterval.equals("second")) {
			long time = date1.getTime() / 1000;
			return time - date2.getTime() / 1000;
		}

		return date1.getTime() - date2.getTime();

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

			System.out.println("开始报名");
			kz=1;

		}else if (C>0) {

			System.out.println("报名已经结束,感谢关注！");
			kz=2;

		}else {

			System.out.println("报名还没开始呢,"+MyUtils.CharString(my_shuoming)+"到"+MyUtils.CharString(my_endming)+"！\n欢迎到时参与！");
			kz=3;
		}

		return kz;

	}

	//获取下一个编号
	public static String GetBH(){

		String bh ="";

		try {
			sql_data db = new sql_data();
			String sql= "select top 1 bh from sxbook_bm where bh<>'' order by bh desc";
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


	//获取最后一个编号
	public static String GetBENBH(){

		String bh ="";

		try {
			sql_data db = new sql_data();
			String sql= "select top 1 bh from sxbook_bm where bh<>'' order by bh desc";
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

	/**
	 * @prame  1.市区 2. 柳市 3.全部
	 * @return
	 */

	public static int GetTotal(int dz){

		int zs =0;

		try {

			sql_data db = new sql_data();
			String sql="";

			sql = "select count(*) as zs from sxbook_bm where dz="+dz+" ";

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



	//1.市区剩余票
	public static int SQSYP(){
		return (AllValus.sq - MyUtils.GetTotal(1));
	}

	//2.柳市剩余票
	public static int SQLSP(){
		return (AllValus.ls - MyUtils.GetTotal(2));
	}

	//3.虹桥剩余票
	public static int SQHQP(){
		return (AllValus.hq - MyUtils.GetTotal(3));
	}

	//4.用户提交过来的地址作为参数查询到的票
	public static int SYUSERTJ(int dz){
		int zf = 0;
		if (dz==1) {
			zf= AllValus.sq;
		}else if(dz==2){
			zf=AllValus.ls;
		}else {
			zf=AllValus.hq;
		}
		return zf - MyUtils.GetTotal(dz);
	}

	//根据 dz 显示 名称
	public static String GetDZRealName(String dz){

		String dzmc = "";
		switch(new Integer(dz)){

			case 1:
				dzmc = "市区";
				break;
			case 2:
				dzmc = "柳市";
				break;
			case 3:
				dzmc="虹桥";
				break;

			default:
				break;

		}

		return dzmc;

	}

	/**
	 *
	 * @param openid
	 * @param xm
	 * @param tel
	 * @param dz
	 * @return 返回标志 1,以前已经报过名(不处理)， 2.报名成功没超过名额 3.报名成功，已经超过名额 4表示这一地区的名额已经满了，不能写入库哦
	 */
	//预约报名
	public static int StartBM(String openid,String xm,String tel,String dz)
	{
		int bz =0;
		//直接入库(更新操作哦)
		try {

			sql_data db = new sql_data();
			//判断 bh 是否已经存在
			String sql_pd = "select * from sxbook_bm where bh<>'' and openid = '"+openid+"' ";
			ResultSet rs = db.executeQuery(sql_pd);
			if (rs.next()) {
				//已经有编号 说明已经报过名 不处理
				bz=1;

			}else{
				String sql ="";
				int zj = AllValus.sq+AllValus.ls+AllValus.hq; //总名额

				int tt = MyUtils.SYUSERTJ(new Integer(dz)); //用户提交过来的地址作为参数查询到的票
				System.out.println("tt="+tt);
				if(new Integer(MyUtils.GetBENBH())>=zj){  //全部名额已经满 也入库 dz=100 表示 超过总数，地址就用100

					sql ="update sxbook_bm set xm='"+xm+"',tel='"+tel+"',dz=100,isbm=1,fbsj='"+TimeString.nowTime()+"',bh='"+MyUtils.GetBH()+"' where openid='"+openid+"' ";

				}else if(tt<=0){//表示这一地区的名额已经满了，不能写入库哦
					System.out.println("表示这一地区的名额已经满了，不能写入库哦");

				}else{

					sql ="update sxbook_bm set xm='"+xm+"',tel='"+tel+"',dz='"+dz+"',isbm=1,fbsj='"+TimeString.nowTime()+"',bh='"+MyUtils.GetBH()+"' where openid='"+openid+"' ";
				}

				System.out.println(sql);
				db.executeUpdate(sql);



				System.out.println("new Integer(MyUtils.GetBH())="+new Integer(MyUtils.GetBENBH()));
				System.out.println("zj="+zj);

				if(new Integer(MyUtils.GetBENBH())>zj){  //全部名额已经满
					bz=3;
				}else {

					if(tt<=0){
						bz=4;
					}else {
						bz=2;
					}

				}


			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("bz ="+bz);

		return bz;

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

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		//System.out.println(MyUtils.GetBH());
		//System.out.println(MyUtils.GetBMJG(2));
		//System.out.println(MyUtils.isbm("oxdb1txbPaZwYV1yiNqvR3AOwzoo"));
		System.out.println(MyUtils.SQSYP());
		System.out.println(MyUtils.SQLSP());
		System.out.println(MyUtils.SQHQP());


		System.out.println(MyUtils.GetBH());
		System.out.println(MyUtils.GetDZRealName("3"));
	}

}