package com.fjw.utils;

/**
 * @Author: dtvikey
 * @Date: 10/10/19 上午 09:09
 * @Version 1.0
 */
import java.sql.ResultSet;

import org.fjw.weixin.util.sql_data;
import org.liufeng.course.util.TimeString;

//调用数据接口展示类
public class InterfaceTools {
    //获取乐清网微信昨日新关注人数
    public static int newuser(){
        int ct=0;
        try {
            sql_data db = new sql_data();
            String sql="select * from wxinterface_yqfbwx_usersummary where ref_date='"+TimeString.GetnowTimeYMD2()+"' order by ref_date desc";
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {

                ct+=rs.getInt("new_user");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ct;
    }

    //获取乐清网微信昨日取消关注人数
    public static int canceluser(){
        int ct=0;
        try {
            sql_data db = new sql_data();
            String sql="select * from wxinterface_yqfbwx_usersummary where ref_date='"+TimeString.GetnowTimeYMD2()+"' order by ref_date desc";
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {

                ct+=rs.getInt("cancel_user");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ct;
    }

    //获取乐清网微信昨日净增关注人数
    public static int jzuser(){
        int ct=InterfaceTools.newuser()-InterfaceTools.canceluser();

        return ct;
    }


    //获取乐清网微信昨日累积关注人数
    public static int cumulateuser(){
        int ct=0;
        try {
            sql_data db = new sql_data();
            String sql="select * from wxinterface_yqfbwx_usercumulate where ref_date='"+TimeString.GetnowTimeYMD2()+"'";
            ResultSet rs = db.executeQuery(sql);
            if (rs.next()) {

                ct=rs.getInt("cumulate_user");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ct;
    }


    //获取乐清网微信昨日图文页阅读次数
    public static int newintpagecount(){
        int ct=0;
        try {
            sql_data db = new sql_data();
            String sql="select * from wxinterface_yqfbwx_userread where ref_date='"+TimeString.GetnowTimeYMD2()+"' order by ref_date desc";
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {

                ct+=rs.getInt("int_page_read_count");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ct;
    }


    //获取乐清网微信昨日原文阅读次数
    public static int neworipagecount(){
        int ct=0;
        try {
            sql_data db = new sql_data();
            String sql="select * from wxinterface_yqfbwx_userread where ref_date='"+TimeString.GetnowTimeYMD2()+"' order by ref_date desc";
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {

                ct+=rs.getInt("ori_page_read_count");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ct;
    }



    //获取乐清网微信昨日分享转发次数
    public static int sharecount(){
        int ct=0;
        try {
            sql_data db = new sql_data();
            String sql="select * from wxinterface_yqfbwx_userread where ref_date='"+TimeString.GetnowTimeYMD2()+"' order by ref_date desc";
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {

                ct+=rs.getInt("share_count");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ct;
    }


    //获取乐清网微信昨日微信收藏人数
    public static int addtofavuser(){
        int ct=0;
        try {
            sql_data db = new sql_data();
            String sql="select * from wxinterface_yqfbwx_userread where ref_date='"+TimeString.GetnowTimeYMD2()+"' order by ref_date desc";
            ResultSet rs = db.executeQuery(sql);
            while (rs.next()) {

                ct+=rs.getInt("add_to_fav_user");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ct;
    }



    //根据 fid 获取 wxinterface_yqcnwx_articletotal2的数据
    public static double GetDataByFid(String fid,int tj){
        double fhz=0;
        try {

            sql_data db = new sql_data();
            String sql ="select top 1 * from wxinterface_yqfbwx_articletotal2 where fid="+fid+"";
            ResultSet rs = db.executeQuery(sql);
            if (rs.next()) {
                switch (tj) {
                    case 1:
                        fhz=rs.getDouble("int_page_from_session_read_user");
                        break;
                    case 2:
                        fhz=rs.getDouble("int_page_from_hist_msg_read_user");
                        break;
                    case 3:
                        fhz=rs.getDouble("int_page_from_feed_read_user");
                        break;
                    case 4:
                        fhz=rs.getDouble("int_page_from_friends_read_user");
                        break;
                    case 5:
                        fhz=rs.getDouble("int_page_from_other_read_user");
                        break;
                    default:
                        break;
                }

            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return fhz;
    }



}