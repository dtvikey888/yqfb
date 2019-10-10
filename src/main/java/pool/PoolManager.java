package pool;

//***************** PoolManager.java *********************
import java.sql.*;
import java.util.*;



/*** 连接池管理类 ***/
public class PoolManager {

    private static PoolManager instance;
    //存放所有连接池的集合
    private Hashtable<String, DBConnPool> pools = new Hashtable<String, DBConnPool>();

    public PoolManager() {
        //连接池名
        String poolname = "mydbconpool";
        //驱动程序名
        String drivername = "net.sourceforge.jtds.jdbc.Driver";
        //数据库标识
        String dbid = "jdbc:jtds:sqlserver://127.0.0.1:1433/yqcndata";
        //     String dbid = "jdbc:jtds:sqlserver://60.190.93.215:1314/yqcndata";
        //  String dbid = "jdbc:jtds:sqlserver://60.190.93.215:1314/fjw";

//        //数据库账号
        String username = "fjw";
//////        //数据库密码
        String passwd = "fjw61523012";
//
//          //数据库账号
        //        String username = "yqcndata";
////          //数据库密码
        //         String passwd = "yqcn123456";

        //最大连接数
        int maxconn = 100;

        //创建一个连接池
        createPool(poolname, drivername, dbid, username, passwd, maxconn);
    }

    /*** 获得连接池管理类实例 ***/
    public static synchronized PoolManager getInstance() {
        if (instance == null) {
            instance = new PoolManager();
        }
        return instance;
    }

    /*** 创建连接池 ***/
    private void createPool(String poolname, String drivername, String dbid,
                            String username, String passwd, int maxconn) {
        DBConnPool pool = new DBConnPool(poolname, drivername, dbid, username, passwd, maxconn);
        pools.put(poolname, pool);
    }

    /*** 返回指定连接池中实际使用的连接数 ***/
    public int getPoolinUse(String poolname) {
        DBConnPool pool = (DBConnPool) pools.get(poolname);
        return pool.inUse;
    }

    /*** 根据连接池名称返回其中一个连接对象 ***/
    public Connection getConnection(String poolname) {
        Connection con = null;
        DBConnPool pool = (DBConnPool) pools.get(poolname);
        if (pool != null) {
            con = pool.getConnection();
        }
        return con;
    }

    /*** 释放一个连接对象到指定连接池中 ***/
    public void releaseConnection(String poolname, Connection con) {
        DBConnPool pool = (DBConnPool) pools.get(poolname);
        if (pool != null) {
            pool.releaseConnection(con);
        }
    }

    /*** 关闭指定连接池中所有连接 ***/
    public void closeConn(String poolname) {
        DBConnPool pool = (DBConnPool) pools.get(poolname);
        if (pool != null) {
            pool.closeConn();
        }
    }

    public static void main(String[] args) {
        String sql="select top 10 * from zq_szb";
        PoolManager pb =new PoolManager();
        String poolname ="mydbconpool";
        Connection conn = pb.getConnection(poolname);
        Statement stmt;
        try {
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                System.out.println(rs.getInt(1));

            }
            pb.releaseConnection(poolname, conn);

        } catch (SQLException e) {

            e.printStackTrace();
        }



        //pb.closeConn(poolname);

        int inuser = pb.getPoolinUse(poolname);
        System.out.println(inuser);


    }

}
