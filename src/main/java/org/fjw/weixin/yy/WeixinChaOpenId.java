package org.fjw.weixin.yy;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import mail.MailSenderInfo;
import mail.SimpleMailSender;

import org.apache.http.client.UserTokenHandler;
import org.fjw.weixin.thread.TokenThread;
import org.fjw.weixin.util.AllValus;
import org.fjw.weixin.util.DeleteFileUtil;
import org.fjw.weixin.util.MyUtils3;
import org.fjw.weixin.util.MysqlDB;
import org.fjw.weixin.util.sql_data;
import org.liufeng.course.pojo.WeixinUserInfo;
import org.liufeng.course.util.AdvancedUtil;
import org.liufeng.course.util.CommonUtil;
import org.liufeng.course.util.FileIsExit;
import org.liufeng.course.util.ThumbTest;
import org.liufeng.course.util.TimeString;
import org.liufeng.course.util.ZghTools;

public class WeixinChaOpenId {
	
	/**
	 * 获取保存在数据库中冷冻的accessToken
	 */
	public static String GetDBAccessToken(String ss){
		
		String ac ="";
		
		try {
			
			MysqlDB db = new MysqlDB();
			String sql = "select accessToken from wx_bc where memo='"+ss+"'";
			ResultSet rs = db.executeQuery(sql);
		
			if (rs.next()) {
				
				ac = rs.getString(1);
				
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return ac;
		
	}
	
	/**
	 * 获取保存在数据库中冷冻的jsapiTicket
	 */
	public static String GetDBJsapiTicket(String ss){
		
		String ac ="";
		
		try {
			
			MysqlDB db = new MysqlDB();
			String sql = "select jsapiTicket from wx_bc where memo='"+ss+"'";
			ResultSet rs = db.executeQuery(sql);
		
			if (rs.next()) {
				
				ac = rs.getString(1);
				
			}

		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return ac;
		
	}
	
	
	
	
	
	/**
	 * 只保存他们发的第一张，否则几万张图片 服务器吃不消
	 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 sxbook_bm  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 img1 ）
	 *prame MediaId
	 *prame fromUserName
	 *
	 */
	
	public  static void ReImgesToDB(String MediaId, String fromUserName)
	{
		//根据 MediaId 获取 下载的 文件名
	   String img1 = AdvancedUtil.GetShareFileName(MediaId,fromUserName);

		   
		 //2 判断一下 数据库中是否已经存在该 fromUserName (openid)
			try {
				MysqlDB db = new MysqlDB();
				String sql_bm ="select * from sxbook_bm where openid='"+fromUserName+"' ";
				String sql_cj ="select * from sxbook_cj where openid='"+fromUserName+"' ";
				String sql2="";
				String sql3="";
				ResultSet rs = db.executeQuery(sql_bm);
				if (rs.next()) {  //已存在更新 
					
					sql2 ="update sxbook_bm set img1='"+img1+"',fbsj='"+TimeString.nowTime()+"' where openid ='"+fromUserName+"' ";
					
					
				}else{ //不存在写入 
					
				    sql2 ="insert sxbook_bm(openid,img1,fbsj) values ('"+fromUserName+"','"+img1+"','"+TimeString.nowTime()+"')  ";
				
				    
				}
				
				
				ResultSet rs2 = db.executeQuery(sql_cj);
				if (rs2.next()) {  //已存在更新 
					
					
					sql3 ="update sxbook_cj set img1='"+img1+"',fbsj='"+TimeString.nowTime()+"' where openid ='"+fromUserName+"' ";
					
				}else{ //不存在写入 
					
				   
				    sql3 ="insert sxbook_cj(openid,img1,fbsj) values ('"+fromUserName+"','"+img1+"','"+TimeString.nowTime()+"')  ";
				    
				}
				
				System.out.println(sql2);
				System.out.println(sql3);
				
				db.executeUpdate(sql2);
				db.executeUpdate(sql3);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}
	
	
	
	
	/**
	 * 林佩的送U盘活动
	 * 
	 * 只保存他们发的第一张，否则几万张图片 服务器吃不消
	 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 sxbook_bm  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 img1 ）
	 *prame MediaId
	 *prame fromUserName
	 *
	 */
	
	public  static void ReImgesToDB2(String MediaId, String fromUserName)
	{
		//根据 MediaId 获取 下载的 文件名
	   String img1 = AdvancedUtil.GetShareFileName3(MediaId,fromUserName);

		   
		 //2 判断一下 数据库中是否已经存在该 fromUserName (openid)
			try {
				MysqlDB db = new MysqlDB();
				String sql_cj ="select * from yqcnwx_lp_up where openid='"+fromUserName+"' ";
				String sql2="";
				ResultSet rs = db.executeQuery(sql_cj);
				if (rs.next()) {  //已存在更新 
					
					sql2 ="update yqcnwx_lp_up set img1='"+img1+"',fbsj='"+TimeString.nowTime()+"' where openid ='"+fromUserName+"' ";
					
					
				}else{ //不存在写入 
					
				    sql2 ="insert yqcnwx_lp_up(openid,img1,fbsj) values ('"+fromUserName+"','"+img1+"','"+TimeString.nowTime()+"')  ";
				
				    
				}
				

				System.out.println(sql2);

				db.executeUpdate(sql2);
		
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}
	
	
	/**
	 * 手机端(笑脸)
	 * 只保存他们发的第一张，否则几万张图片 服务器吃不消
	 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 yqcnwx_mqj  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 img1 ）
	 *prame MediaId
	 *prame fromUserName
	 *
	 */
	
	public  static int ReImgesToDB(String MediaId, String fromUserName,String xm,String tel,String td,String memo,String bh)
	{
		int bz=0; //标志为 1 表示提交成功， 标志2 表示已经提交过
		
		//根据 MediaId 获取 下载的 文件名
	   String img1 = AdvancedUtil.GetShareFileName2(MediaId,fromUserName);

		   
		 //2 判断一下 数据库中是否已经存在该 fromUserName (openid)
			try {
				
				
				MysqlDB db = new MysqlDB();
				//String sql_bm ="select * from yqfbwx_face where openid='"+fromUserName+"' ";
				String sql_bm ="select * from yqfbwx_face where tel='"+tel+"' ";
				System.out.println(sql_bm);
				String sql2="";
			
				ResultSet rs = db.executeQuery(sql_bm);
				if (rs.next()) {  //已存在
					
					//sql2 ="update yqfbwx_face set bh='"+bh+"',td='"+td+"',memo='"+memo+"',img1='"+img1+"',fbsj='"+TimeString.nowTime()+"',xm='"+xm+"',tel='"+tel+"' where openid ='"+fromUserName+"' ";
					bz=2;
					
				}else{ //不存在写入 
					
				    sql2 ="insert yqfbwx_face(openid,img1,fbsj,xm,tel,td,memo,bh) values ('"+fromUserName+"','"+img1+"','"+TimeString.nowTime()+"','"+xm+"','"+tel+"','"+td+"','"+memo+"','"+bh+"')  ";
				    bz=1;
				    
				}

				System.out.println(sql2);

				db.executeUpdate(sql2);
	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(bz);
			return bz;
		
	}
	
	
	/**
	 * PC端(笑脸)
	 * 只保存他们发的第一张，否则几万张图片 服务器吃不消
	 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 yqcnwx_mqj  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 img1 ）
	 *prame MediaId
	 *prame fromUserName
	 *
	 */
	
	public  static int ReImgesToDB2(String img1, String fromUserName,String xm,String tel,String td,String memo,String bh)
	{
		int bz=0; //标志为 1 表示提交成功， 标志2 表示已经提交过

		   
		 //2 判断一下 数据库中是否已经存在该 fromUserName (openid)
			try {
				
				
				MysqlDB db = new MysqlDB();
				//String sql_bm ="select * from yqfbwx_face where openid='"+fromUserName+"' ";
				String sql_bm ="select * from yqfbwx_face where tel='"+tel+"' ";
				System.out.println(sql_bm);
				String sql2="";
			
				ResultSet rs = db.executeQuery(sql_bm);
				if (rs.next()) {  //已存在
					
					//sql2 ="update yqfbwx_face set bh='"+bh+"',td='"+td+"',memo='"+memo+"',img1='"+img1+"',fbsj='"+TimeString.nowTime()+"',xm='"+xm+"',tel='"+tel+"' where openid ='"+fromUserName+"' ";
					bz=2;
					
				}else{ //不存在写入 
					
				    sql2 ="insert yqfbwx_face(openid,img1,fbsj,xm,tel,td,memo,bh) values ('"+fromUserName+"','"+img1+"','"+TimeString.nowTime()+"','"+xm+"','"+tel+"','"+td+"','"+memo+"','"+bh+"')  ";
				    bz=1;
				    
				}

				System.out.println(sql2);

				db.executeUpdate(sql2);
	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(bz);
			return bz;
		
	}
	
	
	/**
	 * 手机端(随手拍)
	 * 只保存他们发的第一张，否则几万张图片 服务器吃不消
	 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 yqcnwx_mqj  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 img1 ）
	 *prame MediaId
	 *prame fromUserName
	 *
	 */
	
	public  static int ReImgesToDB3(String img1,String xm,String tel,String pssj,String psdd,String memo,String bh)
	{
		int bz=0; //标志为 1 表示提交成功， 标志2 表示已经提交过

		   
		 //2 判断一下 数据库中是否已经存在该 fromUserName (openid)
			try {
				
				
				MysqlDB db = new MysqlDB();
				//String sql_bm ="select * from yqfbwx_face where openid='"+fromUserName+"' ";
				String sql_bm ="select * from yqfbwx_ssp where tel='"+tel+"' ";
				System.out.println(sql_bm);
				String sql2="";
			
				ResultSet rs = db.executeQuery(sql_bm);
				if (rs.next()) {  //已存在
					
					//sql2 ="update yqfbwx_face set bh='"+bh+"',td='"+td+"',memo='"+memo+"',img1='"+img1+"',fbsj='"+TimeString.nowTime()+"',xm='"+xm+"',tel='"+tel+"' where openid ='"+fromUserName+"' ";
					sql2 ="insert yqfbwx_ssp(img1,fbsj,xm,tel,pssj,psdd,memo,bh) values ('"+img1+"','"+TimeString.nowTime()+"','"+xm+"','"+tel+"','"+pssj+"','"+psdd+"','"+memo+"','"+bh+"')  ";
					   
					bz=2;
					
				}else{ //不存在写入 
					
				    sql2 ="insert yqfbwx_ssp(img1,fbsj,xm,tel,pssj,psdd,memo,bh) values ('"+img1+"','"+TimeString.nowTime()+"','"+xm+"','"+tel+"','"+pssj+"','"+psdd+"','"+memo+"','"+bh+"')  ";
				    bz=1;
				    
				}

				System.out.println(sql2);
				
				db.executeUpdate(sql2);
	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			System.out.println(bz);
			return bz;
		
	}
	
	
	/**
	 * PC端
	 * 只保存他们发的第一张，否则几万张图片 服务器吃不消
	 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 yqcnwx_mqj  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 img1 ）
	 *prame MediaId
	 *prame fromUserName
	 *
	 */
	
	public  static int ReImgesToDB4(String fromUserName,String img1,String xm,String tel,String pssj,String psdd,String memo,String bh)
	{
		int bz=0; //标志为 1 表示提交成功， 标志2 表示已经提交过

		   
		 //2 判断一下 数据库中是否已经存在该 fromUserName (openid)
			try {
				
				
				MysqlDB db = new MysqlDB();
				//String sql_bm ="select * from yqfbwx_face where openid='"+fromUserName+"' ";
				String sql_bm ="select * from yqfbwx_ssp where tel='"+tel+"' ";
				System.out.println(sql_bm);
				String sql2="";
			
				ResultSet rs = db.executeQuery(sql_bm);
				if (rs.next()) {  //已存在
					
					sql2 ="insert yqfbwx_ssp(openid,img1,fbsj,xm,tel,pssj,psdd,memo,bh) values ('"+fromUserName+"','"+img1+"','"+TimeString.nowTime()+"','"+xm+"','"+tel+"','"+pssj+"','"+psdd+"','"+memo+"','"+bh+"')  ";
					bz=2;
					
				}else{ //不存在写入 
					
					sql2 ="insert yqfbwx_ssp(openid,img1,fbsj,xm,tel,pssj,psdd,memo,bh) values ('"+fromUserName+"','"+img1+"','"+TimeString.nowTime()+"','"+xm+"','"+tel+"','"+pssj+"','"+psdd+"','"+memo+"','"+bh+"')  ";
					bz=1;
				    
				}

				System.out.println(sql2);

				db.executeUpdate(sql2);
	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(bz);
			return bz;
		
	}
	
	
	

	/**
	 * mobile端(阿蒙光盘行动)
	 * 只保存他们发的第一张，否则几万张图片 服务器吃不消
	 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 yqcnwx_mqj  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 img1 ）
	 *prame MediaId
	 *prame fromUserName
	 *
	 */
	
	public  static int ReImgesToDB4(String img1, String fromUserName,String tel)
	{
		int bz=0; //标志为 1 表示提交成功， 标志2 表示已经提交过

		String img_ljg = "";
		String tel_ljq = "";
		
		   
		 //2 判断一下 数据库中是否已经存在该 fromUserName (openid)
			try {
				
				MysqlDB db = new MysqlDB();
				//String sql_bm ="select * from yqfbwx_gpxd_dtcj where yz=0 and openid='"+fromUserName+"' ";
				String sql_bm ="select * from yqfbwx_gpxd_dtcj where openid='"+fromUserName+"' ";
				//String sql_bm ="select * from yqfbwx_gpxd_dtcj where tel='"+tel+"' ";
				System.out.println(sql_bm);
				//String sql2="";
			
				ResultSet rs = db.executeQuery(sql_bm);
				if (rs.next()) {  
					
					//sql2 ="update yqfbwx_face set bh='"+bh+"',td='"+td+"',memo='"+memo+"',img1='"+img1+"',fbsj='"+TimeString.nowTime()+"',xm='"+xm+"',tel='"+tel+"' where openid ='"+fromUserName+"' ";
					
					String tel2 = rs.getString("tel");
				    tel_ljq+=tel2+",";
				     
				    String img2 = rs.getString("img1");
				    img_ljg+=img2+",";
					
					String sql3= "update yqfbwx_gpxd_dtcj set yz=1,img1='"+img_ljg+"',tel='"+tel_ljq+"',fbsj='"+TimeString.nowTime()+"',cs=cs+1 where openid='"+fromUserName+"'";
					
					System.out.println(sql3);

					db.executeUpdate(sql3);
					
					
					bz=1;
					
				}else{ 
					
					//第一次写入
					
					String sql2 ="insert yqfbwx_gpxd_dtcj(openid,img1,tel,fbsj,yz,cs) values ('"+fromUserName+"','"+img_ljg+"','"+tel_ljq+"','"+TimeString.nowTime()+"',1,1)  ";
					
					System.out.println(sql2);

					db.executeUpdate(sql2);
					
				    bz=2;
				    
				}

				
	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(bz);
			return bz;
		
	}
	
	
	public  static int ReImgesToDB5(String fromUserName,String merobkect,String memo)
	{
		int bz=0; //标志为 1 表示提交成功， 标志2 表示已经提交过

		String merobkect2 = "";
		String memo2 = "";
		
		   
		 //2 判断一下 数据库中是否已经存在该 fromUserName (openid)
			try {
				
				MysqlDB db = new MysqlDB();
				
				String sql_bm ="select * from yqfbwx_qmjd_dtcj where openid='"+fromUserName+"' ";

				ResultSet rs = db.executeQuery(sql_bm);
				
				if (rs.next()) {  
				
					merobkect2+=rs.getString("merobkect")+"|"+merobkect;
				  
				    memo2+=rs.getString("memo")+"|"+memo;
					
					String sql2= "update yqfbwx_qmjd_dtcj set merobkect='"+merobkect2+"',memo='"+memo2+"',fbsj='"+TimeString.nowTime()+"' where openid='"+fromUserName+"'";
					
					System.out.println(sql2);
					
					db.executeUpdate(sql2);
					
					bz=1;
					
				}else{ 
					
					//第一次写入
					
					String sql3 ="insert into yqfbwx_qmjd_dtcj(openid,merobkect,memo,fbsj) values ('"+fromUserName+"','"+merobkect+"','"+memo+"','"+TimeString.nowTime()+"')";
					
					System.out.println(sql3);
					
					db.executeInsert(sql3);
					
				    bz=2;
				    
				}

				
	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(bz);
			return bz;
		
	}
	
	
	
	
	

	/**
	 * mobile端(阿蒙丽园装修助力行动)
	 * 只保存他们发的第一张，否则几万张图片 服务器吃不消
	 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 yqcnwx_mqj  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 img1 ）
	 *prame MediaId
	 *prame fromUserName
	 *
	 */
	
	public  static int ReImgesToDB6(String img1, String fromUserName,String xm,String tel,String dz,String memo)
	{
		int bz=0; //标志为 1 表示提交成功， 标志2 表示已经提交过


		
		   
		 //2 判断一下 数据库中是否已经存在该 fromUserName (openid)
			try {
				
				MysqlDB db = new MysqlDB();
		
				String sql_bm ="select * from yqfbwx_lyzx_zl where openid='"+fromUserName+"' ";
			
				System.out.println(sql_bm);
	
			
				ResultSet rs = db.executeQuery(sql_bm);
				if (rs.next()) {  
					
		
					String sql3= "update yqfbwx_lyzx_zl set yz=1,img1='"+img1+"',xm='"+xm+"',tel='"+tel+"',dz='"+dz+"',memo='"+memo+"',fbsj='"+TimeString.nowTime()+"' where openid='"+fromUserName+"'";
					
					System.out.println(sql3);

					db.executeUpdate(sql3);
					
					
					bz=1;
					
				}else{ 
					
					//第一次写入
					
					String sql2 ="insert yqfbwx_lyzx_zl(openid,img1,xm,tel,dz,memo,fbsj,yz) values ('"+fromUserName+"','"+img1+"','"+xm+"','"+tel+"','"+dz+"','"+memo+"','"+TimeString.nowTime()+"',1)  ";
					
					System.out.println(sql2);

					db.executeUpdate(sql2);
					
				    bz=2;
				    
				}

				
	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(bz);
			return bz;
		
	}
	
	
	

	/**
	 * mobile端(庆祝建国70周年系列活动)
	 * 只保存他们发的第一张，否则几万张图片 服务器吃不消
	 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 yqcnwx_mqj  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 img1 ）
	 *prame MediaId
	 *prame fromUserName
	 *
	 */
	
	public  static void ReImgesToDB7(String img1,int oid,String lb)
	{

			try {
				
				MysqlDB db = new MysqlDB();
			    String sql ="insert jg(oid,img1,fbsj,lb) values ("+oid+",'"+img1+"','"+TimeString.nowTime()+"',"+lb+")";
				System.out.println(sql);
				db.executeInsert(sql);
				
				//发送邮件给管理员 冯小明
				//这个类主要是设置邮件  
				MailSenderInfo mailInfo = new MailSenderInfo();
				mailInfo.setMailServerHost("smtp.163.com");
				mailInfo.setMailServerPort("25");
				mailInfo.setValidate(true);
				mailInfo.setUserName("yqcnkaohe@163.com");
				mailInfo.setPassword("yqcnkaohe123");// 您的邮箱密码
				mailInfo.setFromAddress("yqcnkaohe@163.com");
				//mailInfo.setToAddress("54300679@qq.com");
				mailInfo.setToAddress("240900449@qq.com");
				mailInfo.setSubject("建国70周年图片活动有新的作品提交");
				mailInfo.setContent("建国70周年图片活动有新的作品提交");
			    //这个类主要来发送邮件 
		        SimpleMailSender.sendHtmlMail(mailInfo);//发送html格式

				
			} catch (Exception e) {
				e.printStackTrace();
			}

	}
	
	
	/**
	 * 只保存他们发的第一张，否则几万张图片 服务器吃不消
	 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 sxbook_bm  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 img1 ）
	 *prame MediaId
	 *prame fromUserName
	 *
	 */
	
	public  static boolean ReImgesToDB8(String MediaId, String fromUserName,String lb,String memo,String story)
	{
	     boolean iscg=false;
		   //根据 MediaId 获取 下载的 文件名
	      String img1 = AdvancedUtil.GetShareFileName4(MediaId,fromUserName);
	      System.out.println("微信服务器端的图片名："+img1);
	      
	      //判断文件存不存在
	      File file = new File(AllValus.downloadpath4+img1);
	      if(!FileIsExit.judeFileExists(file)){
	    	  
	    	  iscg=false;
	    	  
	      }else{
	    	  
	    	//2 判断一下 数据库中是否已经存在该 fromUserName (openid)
				try {
				
					MysqlDB db = new MysqlDB();
					int oid = ZghTools.Getoid(fromUserName);
					String sql_pd = "select * from jg where img1='"+img1+"'";
					ResultSet rs = db.executeQuery(sql_pd);
					if (!rs.next()) {
						
							String sql ="insert jg(oid,img1,fbsj,lb,memo,story) values ("+oid+",'"+img1+"','"+TimeString.nowTime()+"',"+lb+",'"+memo+"','"+story+"')";
							System.out.println(sql);
							db.executeInsert(sql);
						
						
					}
					//发送邮件给管理员 冯小明
					//这个类主要是设置邮件  
					MailSenderInfo mailInfo = new MailSenderInfo();
					mailInfo.setMailServerHost("smtp.163.com");
					mailInfo.setMailServerPort("25");
					mailInfo.setValidate(true);
					mailInfo.setUserName("yqcnkaohe@163.com");
					mailInfo.setPassword("yqcnkaohe123");// 您的邮箱密码
					mailInfo.setFromAddress("yqcnkaohe@163.com");
					//mailInfo.setToAddress("54300679@qq.com");
					mailInfo.setToAddress("240900449@qq.com");
					mailInfo.setSubject("建国70周年图片活动有新的作品提交");
					mailInfo.setContent("建国70周年图片活动有新的作品提交");
				    //这个类主要来发送邮件 
			        SimpleMailSender.sendHtmlMail(mailInfo);//发送html格式
			        
			    	ZghTools.ClearNull4();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				iscg=true;
	    	  
	      }
	      
		   
		 return iscg;
		
	}
	

	/**
	 * 只保存他们发的第一张，否则几万张图片 服务器吃不消
	 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 sxbook_bm  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 img1 ）
	 *prame MediaId
	 *prame fromUserName
	 *
	 */
	
	public  static void ReImgesToDB9(String fromUserName,String lb,String memo,String story)
	{
	     
	    	  
	    	//2 判断一下 数据库中是否已经存在该 fromUserName (openid)
				try {
					
					MysqlDB db = new MysqlDB();
					int oid = ZghTools.Getoid(fromUserName);
					
				    String sql ="insert jg(oid,img1,fbsj,lb,memo,story) values ("+oid+",'0','"+TimeString.nowTime()+"',"+lb+",'"+memo+"','"+story+"')";
					System.out.println(sql);
					db.executeInsert(sql);
					
					//发送邮件给管理员 冯小明
					//这个类主要是设置邮件  
					MailSenderInfo mailInfo = new MailSenderInfo();
					mailInfo.setMailServerHost("smtp.163.com");
					mailInfo.setMailServerPort("25");
					mailInfo.setValidate(true);
					mailInfo.setUserName("yqcnkaohe@163.com");
					mailInfo.setPassword("yqcnkaohe123");// 您的邮箱密码
					mailInfo.setFromAddress("yqcnkaohe@163.com");
					//mailInfo.setToAddress("54300679@qq.com");
					mailInfo.setToAddress("240900449@qq.com");
					mailInfo.setSubject("建国70周年图片活动有新的作品提交");
					mailInfo.setContent("建国70周年图片活动有新的作品提交");
				    //这个类主要来发送邮件 
			        SimpleMailSender.sendHtmlMail(mailInfo);//发送html格式
			        ZghTools.ClearNull4();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
		
		
	}
	
	
	/**
	 * 上传视频或音频
	 * 只保存他们发的第一张，否则几万张图片 服务器吃不消
	 * 收到回复图片消息时（MediaId） 下载到本地服务器 ，然后把文件名写入数据库 sxbook_bm  （写入有 fromUserName就是 openid , 还有把分享图片保存到本地 的 文件名 img1 ）
	 *prame MediaId
	 *prame fromUserName
	 *
	 */
	
	public  static boolean ReImgesToDB10(String MediaId, String fromUserName,String lb,String memo,String story)
	{
	     boolean iscg=false;
		 
	     
	      //判断文件存不存在
	      File file = new File(AllValus.downloadpath4+MediaId);
	      
	      if(!FileIsExit.judeFileExists(file)){
	    	  
	    	  iscg=false;
	    	  
	      }else{
	    	  
	    	//2 判断一下 数据库中是否已经存在该 fromUserName (openid)
				try {
					String sql ="";
					MysqlDB db = new MysqlDB();
					int oid = ZghTools.Getoid(fromUserName);
					System.out.println("ReImgesToDB10 oid="+oid);
					String sql_pd = "select * from jg where video1='"+MediaId+"'";
					ResultSet rs = db.executeQuery(sql_pd);
					if (!rs.next()) {
						if(MediaId.indexOf(".jpg")!=-1||MediaId.indexOf(".jpeg")!=-1||MediaId.indexOf(".png")!=-1||MediaId.indexOf(".gif")!=-1||MediaId.indexOf(".JPG")!=-1||MediaId.indexOf(".JPEG")!=-1||MediaId.indexOf(".PNG")!=-1||MediaId.indexOf(".GIF")!=-1)
						{
							String fromPicName = AllValus.downloadpath3+MediaId;  //压缩路径文件名
							String img2 = "ys_"+MediaId;  
							String toPicName =  AllValus.downloadpath3+img2;//压缩后路径文件名
							ThumbTest Ys = new ThumbTest();
							Ys.testHandlePicture3(fromPicName,toPicName);//压缩图片处理
							DeleteFileUtil.deleteFile(fromPicName);//删除原图
							if(lb.equals("1")){
								
								iscg=false;
								
							}else{
								
								if((!memo.equals("")||memo!=null)&&(!story.equals("")||story!=null)){
									
									sql ="insert jg(oid,img1,fbsj,lb,memo,story) values ("+oid+",'"+img2+"','"+TimeString.nowTime()+"',"+lb+",'"+memo+"','"+story+"')";
									
								}else{
									
									sql ="insert jg(oid,img1,fbsj,lb,memo) values ("+oid+",'"+img2+"','"+TimeString.nowTime()+"',"+lb+",'"+memo+"')";
									
								}
								
								
								System.out.println(sql);
								db.executeInsert(sql);
								iscg=true;
								/**
								//发送邮件给管理员 冯小明
								//这个类主要是设置邮件  
								MailSenderInfo mailInfo = new MailSenderInfo();
								mailInfo.setMailServerHost("smtp.163.com");
								mailInfo.setMailServerPort("25");
								mailInfo.setValidate(true);
								mailInfo.setUserName("yqcnkaohe@163.com");
								mailInfo.setPassword("yqcnkaohe123");// 您的邮箱密码
								mailInfo.setFromAddress("yqcnkaohe@163.com");
								//mailInfo.setToAddress("54300679@qq.com");
								mailInfo.setToAddress("240900449@qq.com");
								mailInfo.setSubject("建国70周年图片活动有新的作品提交");
								mailInfo.setContent("建国70周年图片活动有新的作品提交");
							    //这个类主要来发送邮件 
						        SimpleMailSender.sendHtmlMail(mailInfo);//发送html格式
						        **/
						    	ZghTools.ClearNull4();
							}
							
						
						}else{
							
							sql ="insert jg(oid,video1,fbsj,lb,memo,story) values ("+oid+",'"+MediaId+"','"+TimeString.nowTime()+"',1,'"+memo+"','"+story+"')";
							System.out.println(sql);
							db.executeInsert(sql);
							
							iscg=true;
							
							/**
							//发送邮件给管理员 冯小明
							//这个类主要是设置邮件  
							MailSenderInfo mailInfo = new MailSenderInfo();
							mailInfo.setMailServerHost("smtp.163.com");
							mailInfo.setMailServerPort("25");
							mailInfo.setValidate(true);
							mailInfo.setUserName("yqcnkaohe@163.com");
							mailInfo.setPassword("yqcnkaohe123");// 您的邮箱密码
							mailInfo.setFromAddress("yqcnkaohe@163.com");
							//mailInfo.setToAddress("54300679@qq.com");
							mailInfo.setToAddress("240900449@qq.com");
							mailInfo.setSubject("建国70周年图片活动有新的作品提交");
							mailInfo.setContent("建国70周年图片活动有新的作品提交");
						    //这个类主要来发送邮件 
					        SimpleMailSender.sendHtmlMail(mailInfo);//发送html格式
					        **/
					    	ZghTools.ClearNull4();
						}
							
							
						
						
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
	    	  
	      }
	      
		   
		 return iscg;
		
	}
	
	
	
	

	/**
	 * 将乐清发布微信的接口用户数据插入数据库 (全部)
	 */
	public static void ChaOpenId(List<String> ListOpenId){
		
		
		try {

			MysqlDB sqlbean = new MysqlDB();
	
			String accessToken = WeixinChaOpenId.GetDBAccessToken("乐清发布");
//			String accessToken = CommonUtil.getToken(AllValus.appid, AllValus.appsecret).getAccessToken();
			
			
			
			//用服务器缓存以防调用限制200次天
		//	String accessToken = TokenThread.accessToken.getToken();
			
			for (int i = 0; i < ListOpenId.size(); i++) {
				
				    String sql="select * from yqfb_openid where openid='"+ListOpenId.get(i)+"'";
			
			   ResultSet rs = sqlbean.executeQuery(sql);
				
				if (rs.next()) {
					
				//	System.out.println("已经存在OpenId");
				
				}else {
					
					WeixinUserInfo user = AdvancedUtil.getUserInfo(accessToken, ListOpenId.get(i));
					System.out.println("OpenID：" + user.getOpenId());
					System.out.println("关注状态：" + user.getSubscribe());
					System.out.println("关注时间：" + user.getSubscribeTime());
					System.out.println("昵称：" + user.getNickname().replaceAll("'", ""));
					System.out.println("性别：" + user.getSex());
					System.out.println("国家：" + user.getCountry());
					System.out.println("省份：" + user.getProvince());
					System.out.println("城市：" + user.getCity());
					System.out.println("语言：" + user.getLanguage());
					System.out.println("头像：" + user.getHeadImgUrl());
					
					String sql2="INSERT INTO yqfb_openid (openid,subscribe,subscribetime,nickname,sex,country,province,city,lg,himg) Values ('"+ListOpenId.get(i)+"','"+user.getSubscribe()+"','"+user.getSubscribeTime()+"','"+user.getNickname().replaceAll("'", "")+"','"+user.getSex()+"','"+user.getCountry()+"','"+user.getProvince()+"','"+user.getCity()+"','"+user.getLanguage()+"','"+user.getHeadImgUrl()+"')";

					sqlbean.executeUpdate(sql2);
				}
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	
	
	/**
	 * 将乐清公安微信的接口用户数据插入数据库 (关注者)
	 */
	public static void chaOpenId2(String fromUserName){
		
		try {
			
			MysqlDB sqlbean = new MysqlDB();
			
			
		//	String accessToken = CommonUtil.getToken("wx2d92982d06c4cd63", "625a009c1c756591eccf5b88c97ff5b9").getAccessToken();
			//未认证微信号 获取不了的
			//用服务器缓存以防调用限制200次天
			//	String accessToken = TokenThread.accessToken.getToken();
			String accessToken = WeixinChaOpenId.GetDBAccessToken("乐清发布");
			
			String sql="select * from yqfb_openid where openid='"+fromUserName+"'";
			ResultSet rs = sqlbean.executeQuery(sql);
			
			if (rs.next()) {
				//	System.out.println("已经存在OpenId");
			}else {
				
				WeixinUserInfo user = AdvancedUtil.getUserInfo(accessToken, fromUserName);
				System.out.println("OpenID：" + user.getOpenId());
				System.out.println("关注状态：" + user.getSubscribe());
				System.out.println("关注时间：" + user.getSubscribeTime());
				System.out.println("昵称：" + user.getNickname().replaceAll("'", ""));
				System.out.println("性别：" + user.getSex());
				System.out.println("国家：" + user.getCountry());
				System.out.println("省份：" + user.getProvince());
				System.out.println("城市：" + user.getCity());
				System.out.println("语言：" + user.getLanguage());
				System.out.println("头像：" + user.getHeadImgUrl());
				
				String sql2="INSERT INTO yqfb_openid (openid,subscribe,subscribetime,nickname,sex,country,province,city,lg,himg) Values ('"+fromUserName+"','"+user.getSubscribe()+"','"+user.getSubscribeTime()+"','"+user.getNickname().replaceAll("'", "")+"','"+user.getSex()+"','"+user.getCountry()+"','"+user.getProvince()+"','"+user.getCity()+"','"+user.getLanguage()+"','"+user.getHeadImgUrl()+"')";

				//String sql2="INSERT INTO yqfb_openid (openid) Values ('"+fromUserName+"')";
				System.out.println(sql2);
				sqlbean.executeUpdate(sql2);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
/**
		 try {  
	            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");   
	            String url = "jdbc:odbc:Driver={MicroSoft Access Driver (*.mdb)};DBQ=D:\\website\\yqrb\\Yqvod\\bmwj\\asp\\police\\db.mdb";  
	            Connection conn = DriverManager.getConnection(url, "", "");  
	            Statement stmt = conn.createStatement();  
	            PreparedStatement ps = conn.prepareStatement("update police_ry set zan=0");  
	            ps.executeUpdate();   
	            ps.close();  
	  
	            stmt.close();  
	            conn.close();  
	        } catch (Exception ex) {  
	            ex.printStackTrace();  
	        }  
**/
		
	}

}
