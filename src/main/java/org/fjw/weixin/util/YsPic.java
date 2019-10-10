package org.fjw.weixin.util;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;

public class YsPic {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		try {
			sql_data db = new sql_data();
			String sql="select img1 from yqfbwx_face";
			ResultSet rs = db.executeQuery(sql);
			while (rs.next()) {
				String img1 = rs.getString(1);
				String filePath = "D:\\website\\yqrb\\Yqvod\\bmwj\\asp\\sxbook\\download3\\"+img1;
				FileByte fb = new FileByte();
				File file=new File(filePath);    
				if(!file.exists())    
				{    
				     
				}else if (fb.getFileByte(filePath)>0) {
					
			
					//mypic.compressPic("D:\\website\\yqrb\\Yqvod\\ms\\asp\\weixin\\UPloadfiles\\images\\", "D:\\website\\yqrb\\Yqvod\\ms\\images\\mobileszb\\", pic[0].replace("/weixin/UPloadfiles/images/", ""), "r1"+pic[0].replace("/weixin/UPloadfiles/images/", ""), 50, 50, true);    
					   
					try {
						ImageSizer.resize(new File("D:\\website\\yqrb\\Yqvod\\bmwj\\asp\\sxbook\\download3\\"+img1), new File("D:\\website\\yqrb\\Yqvod\\bmwj\\asp\\sxbook\\download3_simg\\"+"r1_"+img1), 320, "jpg");
					} catch (IOException e) {
						e.printStackTrace();
					}
					
				}   
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
         
	}

}
