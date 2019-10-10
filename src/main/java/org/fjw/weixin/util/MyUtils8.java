package org.fjw.weixin.util;

import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.NumberFormat;

public class MyUtils8 {

	//获取下一个编号
	public static String GetNextBH(){

		String bh ="";

		try {
			sql_data db = new sql_data();
			String sql= "select top 1 bh from yqfbwx_ssp where bh<>'' order by bh desc";
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				String ss = rs.getString(1);
				int ss2 = (new Integer(ss))+1;

				NumberFormat f=new DecimalFormat("0000");
				for(int i=ss2;i<=ss2;i++){

					bh= f.format(i);
				}

			}else {
				bh="0001";
			}

		} catch (Exception e) {

			e.printStackTrace();

		}


		return bh;
	}

}