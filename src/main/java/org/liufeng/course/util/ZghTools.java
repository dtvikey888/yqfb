package org.liufeng.course.util;
import java.io.File;
import java.net.InetAddress;
import java.sql.ResultSet;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.codec.binary.Base64;
import org.fjw.weixin.util.*;

import com.aliyun.api.gateway.demo.SmsDemo;
import org.fjw.weixin.util.TimeString;


public class ZghTools {

	//广告系统录入需求
	public static void Rlxq(String fromUserName,String memo,String msgtel){
		int oid = ZghTools.Getoid(fromUserName);
		String oid2 = oid+"";
		String xm = ZghTools.GetNickname2(oid);
		String tel = ZghTools.GetTel(oid2);
		try {
			MysqlDB db = new MysqlDB();
			String sql = "insert into adv_ggrl(oid,memo,fbsj) values("+oid+",'"+memo+"','"+TimeString.nowTime()+"')";
			db.executeInsert(sql);
			//发短信功能
			if(ZghTools.isMobileNO(msgtel)){

				SmsDemo app = new SmsDemo();

				String content="";
				if (memo.length()>30) {
					content=memo.substring(0,30);
				}else {
					content=memo;
				}


				String time=TimeString.nowTime();


				app.sendMsg(""+msgtel+"","{\"name\":\""+xm+"\", \"tel\":\""+tel+"\", \"content\":\""+content+"\", \"time\":\""+time+"\"}");


			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	//java-正则表达式判断是否手机号
	public static boolean isMobileNO(String mobiles){

		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");

		Matcher m = p.matcher(mobiles);

		//System.out.println(m.matches());

		return m.matches();

	}

	//显示姓名 option
	public static String GetXmOption(){
		String str = "";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select id,xm from yqfb_openid3 where xm<>''";
			ResultSet rs = db.executeQuery(sql);
			while(rs.next()){

				str+="<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";


			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}


	//显示电话 option
	public static String GetTelOption(){
		String str = "";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select id,tel from yqfb_openid3 where tel<>'0' and tel<>''";
			ResultSet rs = db.executeQuery(sql);
			while(rs.next()){

				str+="<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";


			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	//显示打卡地 option
	public static String GetMemoOption(){
		String str = "";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select id,memo from jg where memo<>''";
			ResultSet rs = db.executeQuery(sql);
			while(rs.next()){

				str+="<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";


			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	//显示打卡理由 option
	public static String GetStoryOption(){
		String str = "";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select id,story from jg where story<>''";
			ResultSet rs = db.executeQuery(sql);
			while(rs.next()){

				str+="<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";


			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}


	public static int GetId3(int sxid2){

		int id =0;
		try {
			sql_data db = new sql_data();
			String sql = "Select id FROM jg where sxid="+sxid2;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				id = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return id;


	}


	//根据id 修改分类
	public static void XgFl(String id,String lb){
		try {
			MysqlDB db = new MysqlDB();
			String sql = "update jg set lb="+lb+" where id="+id;
			db.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//获取oid
	public static int GetOid(String id){

		int oid=0;

		try {
			MysqlDB db = new MysqlDB();
			String sql = "select oid from jg where id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				oid = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return oid;
	}

	//获取zloid
	public static int GetZlOid(String zlopenid){

		int zloid=0;

		try {
			MysqlDB db = new MysqlDB();
			String sql = "select id from yqfb_openid3 where openid='"+zlopenid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				zloid = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return zloid;
	}

    //获取zloid
    public static int GetZlOid2(String zlopenid){

        int zloid=0;

        try {
            MysqlDB db = new MysqlDB();
            String sql = "select id from yqfb_openid where openid='"+zlopenid+"'";
            ResultSet rs = db.executeQuery(sql);
            if (rs.next()) {
                zloid = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return zloid;
    }

	//根据分类获取排名文章的id 重置成 1,2,3,4,5,6,7,8,9
	public static String GetPmId(int lb){
		String sc="";
		String str="";
		try {
			MysqlDB db = new MysqlDB();
			//String sql = "SELECT oid,zloid,fbsj,jid, count(*) AS count FROM jg_dz where lb="+lb+" GROUP BY jid ORDER BY count desc , fbsj asc";
			String sql = "SELECT oid,zloid,fbsj,jid, count(*) AS count FROM jg_dz GROUP BY jid ORDER BY count desc , fbsj asc";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			while(rs.next()){
				sc+=rs.getInt("jid")+",";
			}
			if (!sc.equals("")){
				str=sc.substring(0,sc.length()-1);
			}else {
				str="0";
			}


		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}

//	public static void main(String[] args) {
//		System.out.println(ZghTools.GetPmId(1));
//	}

	//判断是否当天已经点赞过了
	public static boolean Isdz3(String id,String zlopenid){
		boolean isdz = false;
		try {
			int zloid = ZghTools.GetZlOid(zlopenid);
			String nowDayMYD = TimeString.GetnowTimeYMD();
			System.out.println("今天的服务器时间："+nowDayMYD);
			MysqlDB db=new MysqlDB();
			String sql = "select date_format(fbsj, '%Y-%m-%d') as fbsj from jg_dz where jid="+id+" and zloid="+zloid+" order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String fbsj = rs.getString("fbsj");
				System.out.println("今天的点赞时间："+fbsj);
				if (!fbsj.equals(nowDayMYD)) {

					isdz=false;

				}else {

					isdz=true;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isdz;

	}

	//获取点赞数
	public static int GetDzs(String id){
		int dzs=0;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select count(*) as dzs from jg_dz where jid="+id;
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				dzs = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dzs;
	}


	//提交操作 1. 从数据表 zgh_sjk 随机查询一个还未用过的bh,然后设置他的yz=1
	//2.把 openid+xm+tel+bh 写入表zgh_cj
	public static void Rkcz(String openid,String xm,String tel){

		try {

			int bh=0;
			sql_data db =  new sql_data();
			String sql = "select   top   1   *,newid()   as   Random   from   zgh_sjk  where   yz=0  order   by   Random ";
			ResultSet rs = db.executeQuery(sql);

			if (rs.next()) {

				bh = rs.getInt("bh");
				db.executeUpdate("update zgh_sjk set yz=1 where id="+rs.getInt("id"));

				//把已经抽出来的号码写入zgh_ychm
				db.executeInsert("insert into zgh_ychm(bh,op) values("+bh+",'"+openid+"')");

			}

			String sqlpd = "select * from zgh_cj where openid = '"+openid+"'";
			ResultSet rs2 = db.executeQuery(sqlpd);
			if (!rs2.next()) {

				if(xm.length()>0&&tel.length()>0){

					String sql2="insert into zgh_cj(openid,xm,tel,bh) values('"+openid+"','"+xm+"','"+tel+"','"+bh+"')";
					System.out.println(sql2);
					db.executeInsert(sql2);

				}

			}



		} catch (Exception e) {

			e.printStackTrace();

		}


	}


	public static int GetSfCount(){

		int ct = 0;

		try {
			MysqlDB db = new MysqlDB();
			String sql = "Select count(*) as ct FROM jg";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				ct = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ct;
	}


	//完善资料
	public static void wszl(String openid,String xm,String tel){
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select * from yqfb_openid3 where openid='"+openid+"' and tel<>'0' and tel<>'null' and tel<>''";
			ResultSet rs = db.executeQuery(sql);
			if (!rs.next()) {
				String sql2 = "update yqfb_openid3 set xm='"+xm+"', tel='"+tel+"' where openid='"+openid+"'";
				db.executeUpdate(sql2);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	// 如果当天跟以前的时间比，如果不同，update,否则 不动

	public static void upyt(String zlsession){
		String nowDayMYD = TimeString.GetnowTimeYMD();
		try {
			sql_data db = new sql_data();
			String sql ="SELECT CONVERT(varchar(100), fbsj, 23) as fbsj from yqfb_openid where openid='"+zlsession+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String notTodyMYD = rs.getString(1);
				System.out.println(notTodyMYD);
				if (!notTodyMYD.equals(nowDayMYD)) {
					String sql2 = "update yqfb_openid set fbsj='"+TimeString.nowTime()+"',yt=0 where openid='"+zlsession+"'";
					db.executeUpdate(sql2);
				}else{
					System.out.println("同一天");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

// 当天跟以前的时间比，如果不同，update,否则 不动

	public static void upyt2(String openid){
		String nowDayMYD = TimeString.GetnowTimeYMD();
		try {

			MysqlDB db = new MysqlDB();

			String sql ="SELECT date_format(fbsj, '%Y-%m-%d') as fbsj  from yqfb_openid2 where openid='"+openid+"'";
			System.out.println(sql);
			//String sql ="SELECT CONVERT(varchar(100), fbsj, 23) as fbsj from yqfb_openid2 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String notTodyMYD = rs.getString("fbsj");
				System.out.println(notTodyMYD);
				if (!notTodyMYD.equals(nowDayMYD)) {
					String sql2 = "update yqfb_openid2 set fbsj='"+TimeString.nowTime()+"',yt=0 where openid='"+openid+"'";
					db.executeUpdate(sql2);
				}else{
					System.out.println("同一天");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

// 如果当天跟以前的时间比，如果不同，update,否则 不动

	public static void upyt3(String openid){
		String nowDayMYD = TimeString.GetnowTimeYMD();
		try {
			sql_data db = new sql_data();
			String sql ="SELECT CONVERT(varchar(100), fbsj, 23) as fbsj from yqfb_openid3 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String notTodyMYD = rs.getString(1);
				System.out.println(notTodyMYD);
				if (!notTodyMYD.equals(nowDayMYD)) {
					String sql2 = "update yqfb_openid3 set fbsj='"+TimeString.nowTime()+"',yt=0 where openid='"+openid+"'";
					db.executeUpdate(sql2);
				}else{
					System.out.println("同一天");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

// 如果当天跟以前的时间比，如果不同，update,否则 不动

	public static void upyt4(String openid){
		String nowDayMYD = TimeString.GetnowTimeYMD();
		try {
			sql_data db = new sql_data();
			String sql ="SELECT CONVERT(varchar(100), fbsj, 23) as fbsj from yqfb_openid4 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String notTodyMYD = rs.getString(1);
				System.out.println(notTodyMYD);
				if (!notTodyMYD.equals(nowDayMYD)) {
					String sql2 = "update yqfb_openid4 set fbsj='"+TimeString.nowTime()+"',yt=0 where openid='"+openid+"'";
					db.executeUpdate(sql2);
				}else{
					System.out.println("同一天");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


// 如果当天跟以前的时间比，如果不同，update,否则 不动

	public static void upyt5(String openid){
		String nowDayMYD = TimeString.GetnowTimeYMD();
		try {

			MysqlDB db = new MysqlDB();
			String sql ="SELECT DATE_FORMAT(fbsj,\"%Y-%m-%d\") as fbsj from yqfb_openid where openid='"+openid+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);

			if (rs.next()) {

				String notTodyMYD = rs.getString(1);

				System.out.println(notTodyMYD);

				if (!notTodyMYD.equals(nowDayMYD)) {

					String sql2 = "update yqfb_openid set fbsj='"+TimeString.nowTime()+"',yt=0,lb1=0,lb2=0,lb3=0,lb4=0 where openid='"+openid+"'";
					db.executeUpdate(sql2);

				}else{

					System.out.println("同一天");

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


// 如果当天跟以前的时间比，如果不同，update,否则 不动

	public static void upyt6(String openid){
		String nowDayMYD = TimeString.GetnowTimeYMD();
		try {

			MysqlDB db = new MysqlDB();

			String sql ="SELECT date_format(fbsj, '%Y-%m-%d') as fbsj  from yqfb_openid where openid='"+openid+"'";
			System.out.println(sql);
			//String sql ="SELECT CONVERT(varchar(100), fbsj, 23) as fbsj from yqfb_openid2 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String notTodyMYD = rs.getString("fbsj");
				System.out.println(notTodyMYD);
				if (!notTodyMYD.equals(nowDayMYD)) {
					String sql2 = "update yqfb_openid set fbsj='"+TimeString.nowTime()+"',yt=0 where openid='"+openid+"'";
					db.executeUpdate(sql2);
				}else{
					System.out.println("同一天");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	public static void upyt8(String openid){
		String nowDayMYD = TimeString.GetnowTimeYMD();
		try {

			MysqlDB db = new MysqlDB();

			String sql ="SELECT date_format(fbsj, '%Y-%m-%d') as fbsj  from daf_cj4 where openid='"+openid+"'";
			System.out.println(sql);
			//String sql ="SELECT CONVERT(varchar(100), fbsj, 23) as fbsj from yqfb_openid2 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String notTodyMYD = rs.getString("fbsj");
				System.out.println(notTodyMYD);
				if (!notTodyMYD.equals(nowDayMYD)) {//不是同一天
					if(MyUtils25.jx(openid)){//没中奖
						String sql2 = "delete from daf_cj4 where openid='"+openid+"'";
						db.executeDelete(sql2);
//						String sql3 = "delete from daf_dt2 where openid='"+openid+"'";
//						db.executeDelete(sql3);
					}

				}else{
					System.out.println("同一天");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}




	//参加人数
	public static int GetRdDemoNum(){
		int num=0;
		try {
			sql_data db = new sql_data();
			String sql="select count(*) as ct from rd_demo";
			ResultSet rs=db.executeQuery(sql);
			if (rs.next()) {
				num=rs.getInt(1)+1028;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}

	//输入到数据库 入党时间项目
	public static void InsRdDemo(String openid,String fbsj){
		try {
			sql_data db = new sql_data();
			String sql = "select * from rd_demo where openid='"+openid+"'";
			ResultSet rs=db.executeQuery(sql);
			if (rs.next()) {
				String sql2 = "update rd_demo set fbsj='"+fbsj+"' where openid='"+openid+"'";
				db.executeUpdate(sql2);
			}else {
				String sql2 = "insert into rd_demo(openid,fbsj) values('"+openid+"','"+fbsj+"')";
				db.executeUpdate(sql2);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//获取 入党时间项目 fbsj
	public static String GetFbsjRd(String openid){
		String fbsj="";
		try {
			sql_data db = new sql_data();
			String sql="select fbsj from rd_demo where openid='"+openid+"'";
			ResultSet rs=db.executeQuery(sql);
			if (rs.next()) {
				fbsj = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return fbsj;
	}


	//当前第几个
	public static int GetNoMerObkect(String bzlopenid){

		int sc=0;

		try {

			sql_data db = new sql_data();
			String sql = "select merobkect from yqfbwx_qmjd_dtcj where openid='"+bzlopenid+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {


				String temp[] = PublicFun.split(rs.getString(1), "|");
				sc = temp.length;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sc;

	}

	//有几个人助力

	//当前第几个
	public static int GetNoXh(String bzlopenid){

		int sc=0;

		try {

			sql_data db = new sql_data();
			String sql = "select zlopenid from yqfbwx_qmjd_dtcj where openid='"+bzlopenid+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				String temp[] = PublicFun.split(rs.getString(1), ",");
				sc = temp.length;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sc;

	}


	//根据bzlopenid 查询 merobkect
	public static String GetMerObkect(String bzlopenid,String px){
		String merobkect="";
		String sc="";
		int j = new Integer(px);
		try {

			sql_data db = new sql_data();
			String sql = "select merobkect from yqfbwx_qmjd_dtcj where openid='"+bzlopenid+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				merobkect = rs.getString(1);
				String temp[] = PublicFun.split(merobkect, "|");
				//int j=temp.length;
				sc = temp[j];
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sc;
	}

	//根据bzlopenid 查询 memo
	public static String GetMemo(String bzlopenid,String px){
		String memo="";
		String sc="";
		String str="";
		int j = new Integer(px);
		try {

			sql_data db = new sql_data();
			String sql = "select memo from yqfbwx_qmjd_dtcj where openid='"+bzlopenid+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				memo = rs.getString(1);
				String temp[] = PublicFun.split(memo, "|");
				//int j=temp.length;
				sc = temp[j];

			}

			if (sc.length()<40) {
				str=sc;
			}else {
				str=sc.substring(0, 36)+"...";
			}


		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}


	//根据openid 查询 bh
	public static String GetBh(String openid){
		String bh="";
		try {

			sql_data db = new sql_data();
			String sql = "select bh from zgh_cj where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bh = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bh;
	}


	//根据openid 查询 img1 输出为图片显示html代码
	public static String GetImagSC(String openid){
		String sc = "";
		String img1="";
		int j=1;

		try {
			sql_data db = new sql_data();
			String sql = "select top 6 * from yqfbwx_gpxd_cj where openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);



			while (rs.next()) {

				img1 = AllValus.videopath+rs.getString("img1");

				if (j%3==0&&j<4){

					sc+="<img src="+img1+" width=80px height=80px/>&nbsp;<br/>";
					//sc+="<img src="+img1+" width=80px height=80px/>&nbsp;";

				}else{

					sc+="<img src="+img1+" width=80px height=80px/>&nbsp;";
				}

				j++;
			}



			System.out.println(sc);



		} catch (Exception e) {
			e.printStackTrace();
		}

		return sc;
	}

	//根据openid 查询 img1 输出为图片显示html代码
	public static String GetImagSC2(String bzlopenid){
		String tx = "";
		try {
			sql_data db = new sql_data();
			String sql = "select *  from  yqfbwx_lyzx_zl where openid='"+bzlopenid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = AllValus.videopath+rs.getString("img1");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;
	}




	//根据openid 查询 img1 输出为图片显示html代码
	public static String GetPhbToHtml(int tp){
		String sc = "";
		String img1="";
		String xm="";
		int i=1;

		try {
			sql_data db = new sql_data();
			String sql = "select top "+tp+" * from yqfbwx_lyzx_zl order by px desc";
			ResultSet rs = db.executeQuery(sql);



			while (rs.next()) {

				img1 = AllValus.videopath+rs.getString("img1");

				System.out.println("xm="+rs.getString("xm"));

				if (rs.getString("xm").length()>3) {
					xm=rs.getString("xm").substring(0,3);
				}else {
					xm=rs.getString("xm");
				}

				sc+="<table width=\"100%\"  border=\"0\" align=\"center\" style=\"border-bottom:1px solid #FFCC00; color: #993126; font-size: 18px;\"><tr><td width=\"11%\" align=\"left\"><span class=\"style18\">"+i+"</span></td><td width=\"22%\" align=\"left\"><table width=\"100%\"  border=\"0\"><tr><td><img src="+img1+" width=28px; height=25px;/></td></tr></table></td><td width=\"32%\" align=\"left\"><span class=\"style13\">"+xm+"</span></td><td width=\"24%\" align=\"right\"><span class=\"style13\">"+rs.getInt("px")+"</span></td><td width=\"11%\" align=\"right\"><table width=\"90%\"  border=\"0\"><tr><td><img src=\"img/06.png\" width=\"100%\"/></td></tr></table></td></tr></table>";



				i++;
			}



			System.out.println(sc);



		} catch (Exception e) {
			e.printStackTrace();
		}

		return sc;
	}




	//根据openid 查询 img1 输出为图片显示html代码（阿蒙点击用）
	public static String GetPhbToHtml2(int tp){
		String sc = "";
		String img1="";
		String xm="";
		int i=1;

		try {
			sql_data db = new sql_data();
			String sql = "select top "+tp+" * from yqfbwx_lyzx_zl order by px desc";
			ResultSet rs = db.executeQuery(sql);



			while (rs.next()) {

				img1 = AllValus.videopath+rs.getString("img1");

				System.out.println("xm="+rs.getString("xm"));

				if (rs.getString("xm").length()>3) {
					xm=rs.getString("xm").substring(0,3);
				}else {
					xm=rs.getString("xm");
				}

				sc+="<table width=\"100%\"  border=\"0\" align=\"center\" style=\"border-bottom:1px solid #FFCC00; color: #993126; font-size: 18px;\"><tr><td width=\"11%\" align=\"left\"><span class=\"style18\">"+i+"</span></td><td width=\"22%\" align=\"left\"><table width=\"100%\"  border=\"0\"><tr><td><img src="+img1+" width=28px; height=25px;/></td></tr></table></td><td width=\"32%\" align=\"left\"><span class=\"style13\">"+xm+"</span></td><td width=\"24%\" align=\"right\"><span class=\"style13\">"+rs.getInt("px")+"</span></td><td width=\"11%\" align=\"right\"><table width=\"90%\"  border=\"0\"><tr><td><div style=\"font-family:Arial; font-size:18px;\" onClick=\"javascript:window.open('zl2.jsp?bzlopenid="+rs.getString("openid")+"','_self')\"><img src=\"img/06.png\" width=\"100%\"/></div></td></tr></table></td></tr></table>";



				i++;
			}



			System.out.println(sc);



		} catch (Exception e) {
			e.printStackTrace();
		}

		return sc;
	}



	//有几个人助力

	//当前第几个
	public static int GetNoXh2(String bzlopenid){

		int sc=0;

		try {

			sql_data db = new sql_data();
			String sql = "select zlopenid from yqfbwx_lyzx_zl where openid='"+bzlopenid+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				String temp[] = PublicFun.split(rs.getString(1), ",");
				sc = temp.length;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sc;

	}



	//当前第几个
	public static int GetNoPx(String bzlopenid){

		int sc=0;

		try {

			sql_data db = new sql_data();
			String sql = "select px from yqfbwx_lyzx_zl where openid='"+bzlopenid+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				sc = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sc;

	}


	//有几个人助力

	//当前第几个
	public static String GetNoZlz(String bzlopenid){

		String sc="";

		try {

			sql_data db = new sql_data();
			String sql = "select zlopenid from yqfbwx_lyzx_zl where openid='"+bzlopenid+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				sc=rs.getString(1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sc;

	}


	//根据openid 查询 memo 输出为显示html代码
	public static String GetMemoSC(String openid){
		String sc = "";
		int js =0;
		String memo="";



		try {
			sql_data db = new sql_data();
			String sql = "select top 5 * from yqfbwx_gpxd_cj where openid='"+openid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			while (rs.next()) {

				js = rs.getInt("memo");

				if(js==1){
					memo = "吃光盘中餐 不做“剩男剩女”!";

				}else if(js==2){

					memo = "拒绝浪费,从我做起!";
				}else if(js==3){

					memo = "拒绝“剩”宴,倡导“光盘”!";
				}else if(js==4){

					memo = "我们要将吃不了“兜着走”贯彻到底!";
				}else if(js==5){
					memo = "拒绝舌尖上的浪费,光盘一族你我同行!";

				}


				sc+=""+memo+"<br/>";


			}



			System.out.println(sc);



		} catch (Exception e) {
			e.printStackTrace();
		}

		return sc;
	}




	//根据openid 查询 xm
	public static String GetXm(String openid){
		String xm="";
		try {

			sql_data db = new sql_data();
			String sql = "select xm from zgh_cj where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				xm = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return xm;
	}

	//该openid 是否参加过
	public static boolean IsCj(String openid){
		boolean cjg=false;
		try {
			sql_data db = new sql_data();
			String sql = "select * from yqfbwx_gpxd_dtcj where yz=1 and openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				cjg = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;
	}



	//该openid 是否完善过联系方式
	public static boolean IsWs(String openid){
		boolean ws=false;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select * from yqfb_openid3 where openid='"+openid+"' and tel<>'0' and tel<>'null' and tel<>''";
			//System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				ws = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		//System.out.println("ws:"+ws);

		return ws;
	}




	//该openid 是否存在于yqfb_openid中
	public static boolean IsCz2(String openid){

		boolean cjg=false;
		try {
			sql_data db = new sql_data();
			String sql = "select * from yqfb_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				cjg = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;

	}


	//该openid 是否存在于yqfb_openid中
	public static boolean IsCz12(String openid){

		boolean cjg=false;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select * from yqfb_openid3 where openid='"+openid+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				cjg = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;

	}


	public static void ClearNull(){
		try {

			sql_data db = new sql_data();
			String sql="delete from yqfb_openid where openid='null'";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void ClearNull2(){
		try {

			MysqlDB db = new MysqlDB();
			String sql="delete from yqfb_openid2 where openid='null'";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void ClearNull3(){
		try {

			MysqlDB db = new MysqlDB();
			String sql="delete from yqfb_openid3 where openid='null'";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	public static void ClearNull4(){
		try {

			MysqlDB db = new MysqlDB();
			String sql="delete from jg where memo='null'";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	public static int istel(int oid){
		int bz=0;
		try {

			MysqlDB db = new MysqlDB();
			String sql="select * from yqfb_openid3 where tel='0' and id="+oid;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				bz=1;
			}else{
				bz=2;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bz;

	}


	//该openid 是否存在于yqfbwx_lyzx_zl中
	public static boolean IsCz3(String openid){

		boolean cjg=false;
		try {
			sql_data db = new sql_data();
			String sql = "select * from yqfbwx_lyzx_zl where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				cjg = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;

	}


	//该openid 是否存在于yqfb_openid2中
	public static boolean IsCz4(String openid){

		boolean cjg=false;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select * from yqfb_openid2 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				cjg = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;

	}


	//该openid 是否存在于yqfb_openid2中
	public static boolean IsCz5(String openid){

		boolean cjg=false;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select * from yqfb_openid2 where openid='"+openid+"' and yt=1";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				cjg = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;

	}


	//该openid 是否存在于yqfb_openid3中
	public static boolean IsCz6(String openid){

		boolean cjg=false;
		try {
			sql_data db = new sql_data();
			String sql = "select * from yqfb_openid3 where openid='"+openid+"' and yt=1";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				cjg = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;

	}

	//该openid 是否存在于yqfb_openid3中
	public static boolean IsCz7(String openid){

		boolean cjg=false;
		try {
			sql_data db = new sql_data();
			String sql = "select * from yqfb_openid3 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				cjg = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;

	}

	//该openid 是否存在于yqfb_openid4中
	public static boolean IsCz8(String openid){

		boolean cjg=false;
		try {
			sql_data db = new sql_data();
			String sql = "select * from yqfb_openid4 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				cjg = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;

	}

	//该openid 是否存在于yqfb_openid4中
	public static boolean IsCz9(String openid){

		boolean cjg=false;
		try {
			sql_data db = new sql_data();
			String sql = "select * from yqfb_openid4 where openid='"+openid+"' and yt=1";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				cjg = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;

	}


	//该openid 是否存在于yqfb_openid中
	public static boolean IsCz10(String openid){

		boolean cjg=false;
		try {

			MysqlDB db = new MysqlDB();
			String sql = "select * from yqfb_openid where lb1=1 and lb2=1 and lb3=1 and lb4=1 and openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);

			if (rs.next()) {

				cjg = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;

	}

	//该openid 是否存在于yqfb_openid中
	public static boolean IsCz11(String openid){

		boolean cjg=false;
		try {

			MysqlDB db = new MysqlDB();
			String sql = "select * from yqfb_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);

			if (rs.next()) {

				cjg = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cjg;

	}

	//获取类别
	public static int GetLB(String openid,int bh){

		int lb=0;
		try {

			MysqlDB db = new MysqlDB();
			String sql = "select lb"+bh+" from yqfb_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);

			if (rs.next()) {

				lb = rs.getInt(1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return lb;

	}



	//给最美退伍兵表投票
	public static void TpForTwb(String openid,String[] values){
		try {
			String ip = InetAddress.getLocalHost().getHostAddress().toString();
			MysqlDB db = new MysqlDB();
			String sql="";
			//这里要控制刷票 ，只有正常投票的人才能更新这个语句。
			System.out.println("values.length: "+values.length);
			for(int i=0;i<values.length;i++){
				System.out.println("ids:"+values[i]);
				if (values[i].equals("157")||values[i].equals("169")||values[i].equals("159")||values[i].equals("160")||values[i].equals("166")||values[i].equals("153")||values[i].equals("164")||values[i].equals("149")) {



				}else {

					// sql="update yqfb_openid2 set yt=1,ip='"+ip+"',fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
					// db.executeUpdate(sql);
					// System.out.println(sql);

				}
			}



			String sql2="";
			String sql3="";
			for(int i=0;i<values.length;i++){

				//if (values[i].equals("149")||values[i].equals("161")||values[i].equals("163")||values[i].equals("166")) {
				if (values[i].equals("157")||values[i].equals("169")||values[i].equals("159")||values[i].equals("160")||values[i].equals("166")||values[i].equals("153")||values[i].equals("164")||values[i].equals("149")) {


				}else {
					//sql2="update yqcnwx_twb set ps=ps+1 where id="+values[i];
					//db.executeUpdate(sql2);
					//System.out.println(sql2);
					//sql3="insert into yqcnwx_twb2(openid,twbid,ip,fbsj) values('"+openid+"',"+values[i]+",'"+ip+"','"+TimeString.nowTime()+"')";
					//db.executeUpdate(sql3);
					//System.out.println(sql3);
				}


			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//给最美退伍兵表投票
	public static void TpForTwb2(String openid,String[] values){
		try {
			String ip = InetAddress.getLocalHost().getHostAddress().toString();
			MysqlDB db = new MysqlDB();
			String sql="update yqfb_openid2 set yt=1,ip='"+ip+"',fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
			db.executeUpdate(sql);
			System.out.println(sql);



			String sql2="";
			String sql3="";
			for(int i=0;i<values.length;i++){


				sql2="update yqcnwx_twb set ps=ps+1 where id="+values[i];
				db.executeUpdate(sql2);
				System.out.println(sql2);
				sql3="insert into yqcnwx_twb2(openid,twbid,ip,fbsj) values('"+openid+"',"+values[i]+",'"+ip+"','"+TimeString.nowTime()+"')";
				db.executeUpdate(sql3);
				System.out.println(sql3);



			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//给道德模范表投票
	public static void TpForDdmf(String openid,String[] values){
		try {
			String ip = InetAddress.getLocalHost().getHostAddress().toString();
			MysqlDB db = new MysqlDB();
			String sql="update yqfb_openid2 set yt=1,ip='"+ip+"',fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
			db.executeUpdate(sql);
			System.out.println(sql);



			String sql2="";
			String sql3="";
			for(int i=0;i<values.length;i++){


				sql2="update yqcnwx_ddmf set ps=ps+1 where id="+values[i];
				db.executeUpdate(sql2);
				System.out.println(sql2);
				sql3="insert into yqcnwx_ddmf2(openid,ddmfid,ip,fbsj) values('"+openid+"',"+values[i]+",'"+ip+"','"+TimeString.nowTime()+"')";
				db.executeUpdate(sql3);
				System.out.println(sql3);



			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//给最柳川杯表投票
	public static void TpForLcb(String openid,String[] values){
		try {
			String ip = InetAddress.getLocalHost().getHostAddress().toString();
			sql_data db = new sql_data();
			String sql="update yqfb_openid3 set yt=1,ip='"+ip+"',fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
			db.executeUpdate(sql);
			System.out.println(sql);

			String sql2="";
			String sql3="";
			for(int i=0;i<values.length;i++){
				sql2="update yqcnwx_lcb set ps=ps+1 where id="+values[i];
				System.out.println(sql2);
				db.executeUpdate(sql2);
				System.out.println(sql2);
				sql3="insert into yqcnwx_lcb2(openid,lcbid,ip,fbsj) values('"+openid+"',"+values[i]+",'"+ip+"','"+TimeString.nowTime()+"')";
				System.out.println(sql3);
				db.executeUpdate(sql3);
				System.out.println(sql3);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//给书法大赛表投票
	public static void TpForLcb2(String openid,String[] values,int lb){
		try {
			String ip = InetAddress.getLocalHost().getHostAddress().toString();
			MysqlDB db = new MysqlDB();
			String sql="select lb1,lb2,lb3,lb4 from yqfb_openid where openid='"+openid+"'";
			ResultSet rs=db.executeQuery(sql);
			if (rs.next()) {

				int lb1= rs.getInt(1);
				int lb2= rs.getInt(2);
				int lb3= rs.getInt(3);
				int lb4= rs.getInt(4);

				if (lb1==1&&lb2==1&&lb3==1&&lb4==1) {
					sql="update yqfb_openid set yt=1,fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
					db.executeUpdate(sql);
				}else{

					sql="update yqfb_openid set lb"+lb+"=1,fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
					db.executeUpdate(sql);


					String sql2="";
					String sql3="";
					for(int i=0;i<values.length;i++){
						sql2="update yqcnwx_lcb set ps=ps+1 where id="+values[i];
						System.out.println(sql2);
						db.executeUpdate(sql2);
						System.out.println(sql2);
						sql3="insert into yqcnwx_lcb2(openid,lcbid,ip,fbsj) values('"+openid+"',"+values[i]+",'"+ip+"','"+TimeString.nowTime()+"')";
						System.out.println(sql3);
						db.executeUpdate(sql3);
						System.out.println(sql3);
					}

				}
			}





		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//给最最美教师表投票
	public static void TpForTea(String openid,String[] values){
		try {
			String ip = InetAddress.getLocalHost().getHostAddress().toString();
			sql_data db = new sql_data();
			String sql="update yqfb_openid4 set yt=1,ip='"+ip+"',fbsj='"+TimeString.nowTime()+"' where openid='"+openid+"'";
			db.executeUpdate(sql);
			System.out.println(sql);

			String sql2="";
			String sql3="";
			for(int i=0;i<values.length;i++){
				sql2="update yqfbwx_tea set ps=ps+1 where id="+values[i];
				System.out.println(sql2);
				db.executeUpdate(sql2);
				System.out.println(sql2);
				sql3="insert into yqfbwx_tea2(openid,teaid,ip,fbsj) values('"+openid+"',"+values[i]+",'"+ip+"','"+TimeString.nowTime()+"')";
				System.out.println(sql3);
				db.executeUpdate(sql3);
				System.out.println(sql3);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//根据openid 查询 xm
	public static int GetPx(String bzlopenid){

		int px=0;

		try {

			sql_data db = new sql_data();
			String sql = "select px from yqfbwx_lyzx_zl where openid='"+bzlopenid+"'";
			ResultSet rs = db.executeQuery(sql);

			if (rs.next()) {
				px = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return px;

	}


	//助力类操作1.根据 参数 openid 查找yqfbwx_gpxd_dtcj 中的 zlopenid 字段，如果找到
	//说明已经助力过，跳过
	// 2. 没找到就改变标识yz=0

	public static void HelpCz(String bzlopenid,String zlopenid){

		String zls = "";


		System.out.println("bzlopenid(fjw) : "+bzlopenid);
		System.out.println("zlopenid(fjw) : "+zlopenid);

		try {

			sql_data db = new sql_data();
			String sql = "select top 1 * from yqfbwx_qmjd_dtcj where openid='"+bzlopenid+"' and openid<>'null' and openid<>'' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				zls = rs.getString("zlopenid");

			}

			System.out.println("zls: "+zls);



			if (zls.indexOf(zlopenid)!=-1) {


			}else{

				//db.executeUpdate("update yqfbwx_gpxd_dtcj set yz=0 where id="+rs.getInt("id"));


				if (zls.equals("0")) {
					zls=zlopenid+",";
				}else{
					zls+=zlopenid+",";
				}


				String sql2 = "update yqfbwx_qmjd_dtcj set zlopenid='"+zls+"' where id="+rs.getInt("id");
				db.executeUpdate(sql2);
				System.out.println(sql2);

			}





		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	public static int GetYt(String zlopenid){
		int yt=0;
		try {
			sql_data db = new sql_data();
			String sql="select top 1 yt from yqfb_openid where openid='"+zlopenid+"'";
			ResultSet rs=db.executeQuery(sql);
			if (rs.next()) {
				yt=rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return yt;
	}


	public static int GetYt2(String zlopenid){
		int yt=0;
		try {
			MysqlDB db = new MysqlDB();
			String sql="select * from yqfb_openid2 where openid='"+zlopenid+"'";
			System.out.println(sql);
			ResultSet rs=db.executeQuery(sql);
			if (rs.next()) {
				yt=rs.getInt("yt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return yt;
	}


	public static int GetYt3(String zlopenid){
		int yt=0;
		try {
			sql_data db = new sql_data();
			String sql="select top 1 yt from yqfb_openid3 where openid='"+zlopenid+"'";
			ResultSet rs=db.executeQuery(sql);
			if (rs.next()) {
				yt=rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return yt;
	}


	public static int GetYt4(String zlopenid){
		int yt=0;
		try {
			sql_data db = new sql_data();
			String sql="select top 1 yt from yqfb_openid4 where openid='"+zlopenid+"'";
			System.out.println(sql);
			ResultSet rs=db.executeQuery(sql);
			if (rs.next()) {
				yt=rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return yt;
	}

	//助力类操作1.根据 参数 openid 查找yqfbwx_lyzx_zl 中的 zlopenid 字段，如果找到
	//说明已经助力过，跳过
	// 2. 没找到就改变标识yz=0

	public static void HelpCz2(String bzlopenid,String zlopenid){

		String zls = "";


		System.out.println("bzlopenid(fjw) : "+bzlopenid);
		System.out.println("zlopenid(fjw) : "+zlopenid);

		try {

			sql_data db = new sql_data();
			String sql = "select top 1 * from yqfbwx_lyzx_zl where openid='"+bzlopenid+"' and openid<>'null' and openid<>'' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				zls = rs.getString("zlopenid");

			}

			System.out.println("zls: "+zls);



			if (zls.indexOf(zlopenid)!=-1&&ZghTools.GetYt(zlopenid)==0) {
				//已经助力过,并且重置可投
				String sql2="update yqfbwx_lyzx_zl set px=px+1 where id="+rs.getInt("id");
				db.executeUpdate(sql2);

				String sql4 = "update yqfb_openid set yt=1 where openid='"+zlopenid+"'";
				db.executeUpdate(sql4);
				System.out.println(sql4);

				String sql5 = "insert into yqfbwx_lyzx_bj(zlopenid,bzlopenid,fbsj) values('"+zlopenid+"','"+bzlopenid+"','"+TimeString.nowTime()+"')";
				db.executeInsert(sql5);
				System.out.println(sql5);


			}else if (zls.indexOf(zlopenid)!=-1&&ZghTools.GetYt(zlopenid)!=0) {
				//已经助力过,并且不可投


			}else{

				//db.executeUpdate("update yqfbwx_gpxd_dtcj set yz=0 where id="+rs.getInt("id"));


				if (zls.equals("0")) {
					zls=zlopenid+",";
				}else{
					zls+=zlopenid+",";
				}


				String sql2 = "update yqfbwx_lyzx_zl set zlopenid='"+zls+"' where id="+rs.getInt("id");
				db.executeUpdate(sql2);
				System.out.println(sql2);

				String sql3 = "update yqfbwx_lyzx_zl set px=px+1 where id="+rs.getInt("id");
				db.executeUpdate(sql3);
				System.out.println(sql3);

				String sql4 = "update yqfb_openid set yt=1 where openid='"+zlopenid+"'";
				db.executeUpdate(sql4);
				System.out.println(sql4);

				String sql5 = "insert into yqfbwx_lyzx_bj(zlopenid,bzlopenid,fbsj) values('"+zlopenid+"','"+bzlopenid+"','"+TimeString.nowTime()+"')";
				db.executeInsert(sql5);
				System.out.println(sql5);


			}





		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	//刷票
	public static void zjPs(int id){
		try {
			sql_data db = new sql_data();
			String sql="update yqfbwx_lyzx_zl set px=px+1 where id="+id;
			db.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}



	//助力类操作1.根据 参数 openid 查找yqfbwx_lyzx_zl 中的 zlopenid 字段，如果找到
	//说明已经助力过，跳过
	// 2. 没找到就改变标识yz=0

	public static void HelpCz3(String bzlopenid){



		try {

			sql_data db = new sql_data();

			String sql="update yqfbwx_lyzx_zl set px=px+1 where openid='"+bzlopenid+"'";
			db.executeUpdate(sql);


		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//是否助力过
	public static boolean IsHelp(String bzlopenid,String zlopenid){

		boolean jgz = false;
		String zls = "";

		try {

			sql_data db = new sql_data();
			String sql = "select top 1 * from yqfbwx_qmjd_dtcj where openid='"+bzlopenid+"' and openid<>'null'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				zls = rs.getString("zlopenid");

			}

			System.out.println("zls: "+zls);

			if (zls.indexOf(zlopenid)!=-1) {

				jgz=true;

			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return jgz;
	}


	//是否助力过
	public static boolean IsHelp2(String bzlopenid,String zlopenid){

		boolean jgz = false;
		String zls = "";

		try {

			sql_data db = new sql_data();
			String sql = "select top 1 * from yqfbwx_lyzx_zl where openid='"+bzlopenid+"' and openid<>'null'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				zls = rs.getString("zlopenid");

			}

			System.out.println("zls: "+zls);

			if (zls.indexOf(zlopenid)!=-1) {

				jgz=true;

			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return jgz;
	}

	//获取头像
	public static String GetImg(String bzlopenid){
		String tx = "";
		try {
			sql_data db = new sql_data();
			String sql = "select *  from  yqfb_openid3 where openid='"+bzlopenid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString("himg");
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return tx;
	}

	//获取昵称
	public static String GetNick(String bzlopenid){

		String tx = "";

		try {

			sql_data db = new sql_data();
			String sql = "select * from  yqfb_openid3 where openid='"+bzlopenid+"'";
			ResultSet rs = db.executeQuery(sql);

			if (rs.next()) {
				tx = rs.getString("nickname");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;
	}


	//获取昵称
	public static String GetNick2(String bzlopenid){

		String tx = "";

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select xm from  yqfb_openid3 where openid='"+bzlopenid+"'";
			ResultSet rs = db.executeQuery(sql);

			if (rs.next()) {
				tx = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;
	}

	//获取昵称
	public static String GetNick3(String bzlopenid){

		String tx = "";

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select * from  yqfb_openid3 where openid='"+bzlopenid+"'";
			ResultSet rs = db.executeQuery(sql);

			if (rs.next()) {
				tx = rs.getString("nickname");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;
	}

	//获取昵称
	public static String GetXm2(String bzlopenid){

		String tx = "";

		try {
			sql_data db = new sql_data();
			String sql = "select *  from  yqfbwx_lyzx_zl where openid='"+bzlopenid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString("xm");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;
	}

	//根据jg表中的oid 查询出 yqfb_openid3的openid
	public static String GetOpenidFromOid(int oid){
		String openid="";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select openid from yqfb_openid3 where id="+oid;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				openid=rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return openid;
	}

	//获取昵称
	public static String GetMemo(String bzlopenid){
		String tx = "";
		try {
			sql_data db = new sql_data();
			String sql = "select * from  yqfbwx_lyzx_zl where openid='"+bzlopenid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString("memo");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;
	}


	//获取昵称
	public static String GetMemo2(String id){
		String tx = "";
		try {
			sql_data db = new sql_data();
			String sql = "select memo from  jg where id='"+id+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString("memo");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return tx;
	}



	//获取zlopenid
	public static String GetZlopenid(String bzlopenid){
		String sc = "";
		try {
			sql_data db = new sql_data();
			String sql = "select zlopenid  from  yqfbwx_qmjd_dtcj where openid='"+bzlopenid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				sc = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sc;
	}


	//获取您为好友获得的新编号
	public static String GetOpNo(String bzlopenid,String zlsession){
		String bh="";
		String bh2="";
		try {
			String op = bzlopenid+","+zlsession;
			sql_data db = new sql_data();
			String sql = "select top 1 * from zgh_ychm where op='"+op+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				bh = rs.getString("bh");
				bh2="您为好友获得了新编号："+bh;
			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		return bh2;
	}

	//清除null
	public static void ClearNull(String openid){
		try {
			sql_data db = new sql_data();
			String sql = "delete from yqfb_openid where subscribe='0' and openid='"+openid+"'";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	//清除null
	public static void ClearNull2(String openid){
		try {
			MysqlDB db = new MysqlDB();
			String sql = "delete from yqfb_openid2 where subscribe='0' and openid='"+openid+"'";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//清除null
	public static void ClearNull3(String openid){
		try {
			sql_data db = new sql_data();
			String sql = "delete from yqfb_openid3 where subscribe='0' and openid='"+openid+"'";
			db.executeDelete(sql);

			String sql2 = "delete from doc1 where openid='null'";
			db.executeDelete(sql2);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	//清除null
	public static void ClearNull4(String openid){
		try {
			sql_data db = new sql_data();
			String sql = "delete from yqfb_openid4 where subscribe='0' and openid='"+openid+"'";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	//清除null
	public static void ClearNull5(String openid){
		try {
			MysqlDB db = new MysqlDB();
			String sql = "delete from yqfb_openid where openid='null' or openid=''";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//清除null
	public static void ClearNull6(String openid){
		try {
			MysqlDB db = new MysqlDB();
			String sql = "delete from yqfb_openid2 where openid='null' or openid=''";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//清除null
	public static void ClearNull7(String openid){
		try {
			MysqlDB db = new MysqlDB();
			String sql = "delete from yqfb_openid3 where openid='null' or openid=''";
			db.executeDelete(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//录入
	public static void Rlk(String openid,String nickname,int sex,String country,String province,String city,String himg){
		try {

			ZghTools.ClearNull(openid);

			sql_data db = new sql_data();
			String sqlpd = "select * from yqfb_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sqlpd);
			if (!rs.next()) {

				String sql="INSERT INTO yqfb_openid (openid,subscribe,subscribetime,nickname,sex,country,province,city,lg,himg) Values ('"+openid+"','1','0','"+nickname+"','"+sex+"','"+country+"','"+province+"','"+city+"','zh_CN','"+himg+"')";
				db.executeInsert(sql);
				System.out.println(sql);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//录入
	public static void Rlk2(String openid){
		try {

			//ZghTools.ClearNull(openid);

			sql_data db = new sql_data();
			String sqlpd = "select * from yqhbj_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sqlpd);

			if (!rs.next()) {

				String sql="INSERT INTO yqhbj_openid (openid) values ('"+openid+"')";
				db.executeInsert(sql);
				System.out.println(sql);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}



	//录入
	public static void Rlk3(String openid){
		try {

			ZghTools.ClearNull(openid);

			sql_data db = new sql_data();
			String sqlpd = "select * from yqfb_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sqlpd);

			if (!rs.next()) {

				String sql="INSERT INTO yqfb_openid(openid,fbsj) values ('"+openid+"','"+TimeString.nowTime()+"')";
				db.executeInsert(sql);
				System.out.println(sql);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	//录入
	public static void Rlk4(String openid){
		try {

			ZghTools.ClearNull6(openid);

			MysqlDB db = new MysqlDB();
			String sqlpd = "select * from yqfb_openid2 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sqlpd);

			if (!rs.next()) {

				String sql="INSERT INTO yqfb_openid2 (openid,fbsj) values ('"+openid+"','"+TimeString.nowTime()+"')";
				db.executeInsert(sql);
				System.out.println(sql);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//录入
	public static void Rlk5(String openid){
		try {

			ZghTools.ClearNull3(openid);

			sql_data db = new sql_data();
			String sqlpd = "select * from yqfb_openid3 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sqlpd);

			if (!rs.next()) {

				String sql="INSERT INTO yqfb_openid3 (openid,fbsj) values ('"+openid+"','"+TimeString.nowTime()+"')";
				db.executeInsert(sql);
				System.out.println(sql);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	//录入
	public static void Rlk6(String openid){
		try {

			ZghTools.ClearNull4(openid);

			sql_data db = new sql_data();
			String sqlpd = "select * from yqfb_openid4 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sqlpd);

			if (!rs.next()) {

				String sql="INSERT INTO yqfb_openid4 (openid,fbsj) values ('"+openid+"','"+TimeString.nowTime()+"')";
				db.executeInsert(sql);
				System.out.println(sql);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}



	//录入
	public static void Rlk7(String openid){
		try {

			ZghTools.ClearNull5(openid);

			MysqlDB db = new MysqlDB();
			String sqlpd = "select * from yqfb_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sqlpd);

			if (!rs.next()) {

				String sql="INSERT INTO yqfb_openid(openid,fbsj) values('"+openid+"','"+TimeString.nowTime()+"')";
				db.executeInsert(sql);
				System.out.println(sql);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//录入
	public static void Rlk8(String openid,String nickname,String himg){
		try {

			ZghTools.ClearNull7(openid);
			//进行编码
			nickname =Base64.encodeBase64String(nickname.getBytes("UTF-8"));

			MysqlDB db = new MysqlDB();
			String sqlpd = "select * from yqfb_openid3 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sqlpd);

			if (!rs.next()) {

				String sql="INSERT INTO yqfb_openid3 (openid,fbsj,nickname,himg) values ('"+openid+"','"+TimeString.nowTime()+"','"+nickname+"','"+himg+"')";
				db.executeInsert(sql);
				System.out.println(sql);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	//录入
	public static void Rlk9(String openid){
		try {

			ZghTools.ClearNull(openid);

			sql_data db = new sql_data();
			String sqlpd = "select * from yqfb_openid where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sqlpd);

			if (!rs.next()) {

				String sql="INSERT INTO yqfb_openid(openid,fbsj) values ('"+openid+"','"+TimeString.nowTime()+"')";
				db.executeInsert(sql);
				System.out.println(sql);

//				String sql2="INSERT INTO daf_dt(openid,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,fbsj) VALUES('oSX6kjlwIvpFGl2Ws8TN5Ggxd7Ak',1,1,1,1,1,1,1,1,1,1,'2019-08-30 16:21:21')";
//				db.executeInsert(sql2);
//				System.out.println(sql2);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	//录入
	public static void Rlk10(String openid){
		try {

			ZghTools.ClearNull(openid);

			sql_data db = new sql_data();
			String sqlpd = "select * from yqfb_openid3 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sqlpd);

			if (!rs.next()) {

				String sql="INSERT INTO yqfb_openid3(openid,fbsj) values ('"+openid+"','"+TimeString.nowTime()+"')";
				db.executeInsert(sql);
				System.out.println(sql);

//				String sql2="INSERT INTO daf_dt(openid,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,fbsj) VALUES('oSX6kjlwIvpFGl2Ws8TN5Ggxd7Ak',1,1,1,1,1,1,1,1,1,1,'2019-08-30 16:21:21')";
//				db.executeInsert(sql2);
//				System.out.println(sql2);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}




	//获取头像
	public static String GetImg2(int id){
		String tx = "";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select himg from yqfb_openid3 where id="+id;
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString(1);
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return tx;
	}


	//判断哪些是使用base64编码的 一、正则判断
	private static boolean isBase64_1(String str) {
		String base64Pattern = "^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{4}|[A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)$";
		return Pattern.matches(base64Pattern, str);
	}

	//判断哪些是使用base64编码的 二、循环字符串
	private static boolean isBase64_2(String str) {
		if (str == null || str.trim().length() == 0) {
			return false;
		} else {
			if (str.length() % 4 != 0) {
				return false;
			}

			char[] strChars = str.toCharArray();
			for (char c:strChars) {
				if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9')
						|| c == '+' || c == '/' || c == '=') {
					continue;
				} else {
					return false;
				}
			}
			return true;
		}
	}




	//获取昵称
	public static String GetNickname(int id){
		String tx = "";
		String tx2="";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select nickname  from  yqfb_openid3 where id="+id;
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tx = rs.getString(1).replaceAll("[\ue000-\uefff]","");
				//tx = rs.getString(1);
				//进行解码
				//tx2 = new String(Base64.decodeBase64(tx),"UTF-8");

			}

			if (ZghTools.isBase64_2(tx)) {

				tx2 = new String(Base64.decodeBase64(tx),"UTF-8");

			}else {

				tx2 = tx.replaceAll("[\ue000-\uefff]","");

			}


		} catch (Exception e) {

			e.printStackTrace();

		}

		return tx2;
	}



	//获取昵称
	public static String GetNickname2(int id){
		String tx = "";
		//String tx2="";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select xm  from  yqfb_openid3 where id="+id;
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				//tx = rs.getString(1).replaceAll("[\ue000-\uefff]","");
				tx = rs.getString(1);
				//进行解码
				//tx2 = new String(Base64.decodeBase64(tx),"UTF-8");

			}



		} catch (Exception e) {

			e.printStackTrace();

		}

		return tx;
	}



	//根据openid获取表 yqfb_openid3中的ID
	public static int Getoid(String openid){
		int oid =0;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select id from yqfb_openid3 where openid='"+openid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				oid = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return oid;
	}


	public static int GetOidById(int id){
		int oid =0;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select oid from jg where id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				oid = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return oid;
	}


	public static String GetFbsjById(int id){
		String fbsj ="";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select DATE_FORMAT(fbsj, '%m月%d日 %H:%i') as fbsj from jg where id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				fbsj = rs.getString(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return fbsj;
	}

	public static String GetFbsjById2(String id){
		String fbsj ="";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select fbsj from jg where id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				fbsj = rs.getString(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return fbsj;
	}

	public static int GetLbById(int id){
		int lb =0;
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select lb from jg where id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				lb = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return lb;
	}

	//根据openid获取表 yqfb_openid3中的Tel
	public static String GetTel(String oid){
		String tel ="";
		try {

			MysqlDB db = new MysqlDB();
			String sql = "select tel from yqfb_openid3 where id="+oid+"";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				tel = rs.getString(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return tel;
	}


	//根据openid获取表 yqfb_openid3中的ID
	public static String GetXm3(String openid){
		String xm ="";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select xm from yqfb_openid3 where openid='"+openid+"'";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				xm = rs.getString(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return xm;
	}


	//根据openid获取表 yqfb_openid3中的ID
	public static String GetXm4(String oid){
		String xm ="";
		try {
			MysqlDB db = new MysqlDB();
			String sql = "select xm from yqfb_openid3 where id="+oid+"";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				xm = rs.getString(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return xm;
	}


	//上一页ID
	public static int fy1(int oid,int id){
		String id2 = "";
		int id3 = 0;
		String sql ="";
		try {

			MysqlDB db = new MysqlDB();
			if(oid!=0){

				//sql = "select max(id) as id2 from jg where yz<>0 and oid="+oid+" and video1='0' and id<"+id+"";
				sql = "select max(id) as id2 from jg where yz<>0 and video1='0' and id<"+id+"";

			}else{

				sql = "select max(id) as id2 from jg where yz<>0 and video1='0' and id<"+id+"";
			}
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				id2=rs.getString(1);
				if (id2=="") {
					id3=id;
				}else {
					id3=rs.getInt(1);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return id3;
	}




	//下一页ID
	public static int fy2(int oid,int id){
		String id2 = "";
		int id3 = 0;
		String sql ="";
		try {

			MysqlDB db = new MysqlDB();
			if(oid!=0){
				//sql = "select min(id) as id2 from jg where yz<>0 and oid="+oid+" and video1='0' and id>"+id+"";
				sql = "select min(id) as id2 from jg where yz<>0 and video1='0' and id>"+id+"";
			}else{
				sql = "select min(id) as id2 from jg where yz<>0 and video1='0' and id>"+id+"";
			}
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				id2=rs.getString(1);
				if (id2=="") {
					id3=id;
				}else {
					id3=rs.getInt(1);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return id3;
	}


	//获取img1
	public static String getImg(int id){
		String img1 = "";
		String img2="";

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select img1 from jg where id="+id+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				img1=rs.getString(1);

				if(img1.length()>0 && !img1.equals("0") ){
					img2 = AllValus.videopath+img1;
				}else{
					img2 = AllValus.nopicpath;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return img2;
	}

	//获取img1
	public static String getImg2(String id){
		String img1 = "";
		String img2="";

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select img1 from jg where id="+id+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				img1=rs.getString(1);

				if(img1.length()>0 && !img1.equals("0") ){
					img2 = AllValus.downloadpath5+img1;
				}else{
					img2 = AllValus.downloadpath5;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return img2;
	}

	//获取img1
	public static String getImg3(String id){
		String img1 = "";
		String img2="";

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select img1 from jg where id="+id+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				img1=rs.getString(1);

				if(img1.length()>0 && !img1.equals("0") ){
					img2 = img1;
				}else{
					img2 = AllValus.downloadpath5;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return img2;
	}

	//取得文件后缀
	public static String getHz(String filename){

		File file = new File(filename);
		String fileName = file.getName();
		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
		System.out.println(suffix);
		return suffix;
	}

	//切除后缀的文件
	public static String GetFileNoHz(String filename){
		return filename.replace("."+ZghTools.getHz(filename), "");
	}

	/**
	 *author: itmyhome
	 */
	public static void main(String[] args) {
		File file = new File("HelloWorld.jpg");
		String fileName = file.getName();
		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
		System.out.println(suffix);
	}

	//获取memo
	public static String getMemo(int id){
		String memo = "";

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select memo from jg where id="+id+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				memo=rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return memo;
	}

	//获取story
	public static String getStory(int id){
		String story = "";

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select story from jg where id="+id+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				story=rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return story;
	}


	//该网友是否已经为你点赞
	public static boolean Isdz(String bzlopenid,String zlopenid){

		boolean zl = false;

		try {

			sql_data db = new sql_data();
			String sql = "select top 1 * from yqfbwx_qmjd_dtcj where openid = '"+bzlopenid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String zlops = rs.getString("zlopenid");
				if(zlops.indexOf(zlopenid)!=-1){

					zl=true;
				}
			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		return zl;

	}


	//该网友是否已经为你点赞
	public static boolean Isdz2(String bzlopenid,String zlopenid){

		boolean zl = false;

		try {

			sql_data db = new sql_data();
			String sql = "select top 1 * from yqfbwx_lyzx_zl where openid = '"+bzlopenid+"' order by id desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String zlops = rs.getString("zlopenid");
				if(zlops.indexOf(zlopenid)!=-1){

					zl=true;
				}
			}



		} catch (Exception e) {
			e.printStackTrace();
		}

		return zl;

	}



	public static String GetNickNameForHtml(String bzlopenid){

		String sc="";
		String str="";

		try {

			sql_data db = new sql_data();
			String sql = "select zlopenid from yqfbwx_qmjd_dtcj where openid = '"+bzlopenid+"'";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				String temp[] = PublicFun.split(rs.getString(1), ",");
				if (temp.length<20) {

					for (int i = 0; i < temp.length; i++) {

						String sql2 = "select nickname from yqfb_openid where openid='"+temp[i]+"'";
						ResultSet rs2 = db.executeQuery(sql2);
						if (rs2.next()) {

							sc+=rs2.getString(1)+",";

						}
					}

				}else {

					for (int i = 0; i < 20; i++) {

						String sql2 = "select nickname from yqfb_openid where openid='"+temp[i]+"'";
						ResultSet rs2 = db.executeQuery(sql2);
						if (rs2.next()) {

							sc+=rs2.getString(1)+",";

						}
					}
				}

			}

			str=sc.substring(0,sc.length()-1);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;

	}

	public static String getDatePoor(Date endDate, Date nowDate) {

		long nd = 1000 * 24 * 60 * 60;
		long nh = 1000 * 60 * 60;
		long nm = 1000 * 60;
		// long ns = 1000;
		// 获得两个时间的毫秒时间差异
		long diff = endDate.getTime() - nowDate.getTime();
		// 计算差多少天
		long day = diff / nd;
		// 计算差多少小时
		long hour = diff % nd / nh;
		// 计算差多少分钟
		long min = diff % nd % nh / nm;
		// 计算差多少秒//输出结果
		// long sec = diff % nd % nh % nm / ns;
		return day + "天" + hour + "小时" + min + "分钟";
	}
	/**
	 public static void main(String[] args) {
	 //		String aa = "";
	 //		if (aa.indexOf("ol")!=-1) {
	 //			System.out.println("lo");
	 //
	 //		}else {
	 //			System.out.print("nu");
	 //		}

	 String nowDayMYD = TimeString.GetnowTimeYMD();
	 System.out.println(nowDayMYD);
	 String s1="2000-01-01 00:00:00";
	 Date d1= VeDate.strToDateLong(s1);

	 System.out.println(ZghTools.getDatePoor(new Date(), d1));

	 System.out.println(ZghTools.fy1(12,10));

	 }

	 **/
	//获取第一条id
	public static int getFirstId(int oid){

		int id=0;
		String sql="";
		try {
			MysqlDB db = new MysqlDB();
			if(oid!=0){
				// sql="select id from jg where oid="+oid+" and video1='0' and yz<>0 order by id limit 1";
				sql="select id from jg where yz<>0 and video1='0' order by id limit 1";
			}else{
				sql="select id from jg where yz<>0 and video1='0' order by id limit 1";
			}

			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return id;

	}


	//获取最后一条id
	public static int getEndId(int oid){

		int id=0;
		String sql="";
		try {
			MysqlDB db = new MysqlDB();
			if(oid!=0){
				// sql="select id from jg where oid="+oid+" and yz<>0 and video1='0' order by id limit 1";
				sql="select id from jg where yz<>0 and video1='0' order by id limit 1";
			}else{
				sql="select id from jg where yz<>0 and video1='0' order by id limit 1";
			}
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return id;

	}


	//是否验证通过
	public static boolean IsYz(int oid){
		boolean yz=false;
		try {
			MysqlDB db = new MysqlDB();

			String sql="select * from jg where oid="+oid+" and yz<>0";

			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {

				yz=true;

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return yz;
	}


	public static String GetVideo(String id){

		String video="";

		try {
			MysqlDB db = new MysqlDB();
			String sql = "select video1 from jg where id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				video = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return video;
	}

	public static String GetStory2(String id){

		String story="";

		try {
			MysqlDB db = new MysqlDB();
			String sql = "select story from jg where id="+id;
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				story = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return story;
	}


	//获取memo
	public static String getMemo2(String id){
		String memo = "";

		try {

			MysqlDB db = new MysqlDB();
			String sql = "select memo from jg where id="+id+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				memo=rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return memo;
	}

    //市长直播 获取助力值
    public static int getPs(String zlopenid){
        int ps=0;
        try {
            int zloid = ZghTools.GetZlOid2(zlopenid);
            MysqlDB db = new MysqlDB();
            String sql = "select count(*) as ct from yqcnwx_szzl2 where zloid="+zloid+"";
            ResultSet rs = db.executeQuery(sql);
            if (rs.next()) {
                ps=rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ps;
    }

	//市长直播 是否助力
	public static boolean isZl(String pid,String zlopenid){
		boolean iszl=false;
		try {
            int zloid = ZghTools.GetZlOid2(zlopenid);
			MysqlDB db = new MysqlDB();
			String sql = "select * from yqcnwx_szzl2 where pid="+pid+" and zloid="+zloid+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				iszl=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return iszl;
	}

	//市长直播 判断票数
	public static String getPsForHtml(String pid,String zlopenid){
		String memo = "";

		try {
			int ps =0;
			MysqlDB db = new MysqlDB();
			String sql = "select ps from yqcnwx_szzl where id="+pid+"";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				ps=rs.getInt(1);
				if(ps==0){
					memo="0";
				}else{
					if(ZghTools.isZl(pid,zlopenid)){
						memo=(ps-1)+"+1";
					}else{
						memo=ps+"";
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return memo;
	}

    //市长直播 是否点赞
    public static boolean Isdz4(String pid,String zlopenid){
        boolean isdz = false;
        try {
            int zloid = ZghTools.GetZlOid2(zlopenid);
            MysqlDB db=new MysqlDB();
            String sql = "select * from yqcnwx_szzl2 where pid="+pid+" and zloid="+zloid+"";
            ResultSet rs = db.executeQuery(sql);
            if (rs.next()) {

                isdz=true;

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isdz;

    }

}
