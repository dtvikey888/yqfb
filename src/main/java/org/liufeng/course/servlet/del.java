package org.liufeng.course.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fjw.weixin.util.AllValus;
import org.fjw.weixin.util.DeleteFileUtil;
import org.fjw.weixin.util.ImageDeal;
import org.fjw.weixin.util.MysqlDB;
import org.fjw.weixin.util.TimeString;
import org.liufeng.course.util.ZghTools;
public class del extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);						//��doPost������ͬ
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("GBK");				//����������ַ���
		String id=request.getParameter("id");
		int action=Integer.parseInt(request.getParameter("action"));
		String openid = request.getParameter("openid");
		
		
		System.out.println(action);
	
		switch (action) {
		case 1:
			try {
				//String msg = "��ϲ��ͨ���ɹ���";
				
				MysqlDB dBase=new MysqlDB();
				String delnews="update jg set yz=1 where id="+id+" ";	
			
				dBase.executeUpdate(delnews);
			
				
				//���÷����ĵ�����
				response.setContentType("text/html;charset=GBK");
				PrintWriter out = response.getWriter();
				//out.println("<script>history.back();window.location.href=document.referrer;</script>");
				out.println("<script>window.location.href='/yqfb/jg/List2.jsp'</script>");
				
			   
			    out.flush();
				out.close();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			break;
			
			
		case 2:
			try {
				//String msg = "��ϲ�����سɹ���";
				
				MysqlDB dBase=new MysqlDB();
				String delnews="update jg set yz=0 where id="+id+" ";	
			
				dBase.executeUpdate(delnews);
			
				
				//���÷����ĵ�����
				response.setContentType("text/html;charset=GBK");
				PrintWriter out = response.getWriter();
				//out.println("<script>history.back();window.location.href=document.referrer;</script>");
				out.println("<script>window.location.href='/yqfb/jg/List2.jsp'</script>");
				
			    out.flush();
				out.close();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			break;
			
			
		case 3:
			try {
				//String msg = "�ö�";
				MysqlDB db = new MysqlDB();
				String sql="update jg set istop=1 where id="+id;	
				String sql2="update jg set istop=0 where id<>"+id;	
				db.executeUpdate(sql);
				db.executeUpdate(sql2);

				
				//���÷����ĵ�����
				response.setContentType("text/html;charset=GBK");
				PrintWriter out = response.getWriter();
				//out.println("<script>history.back();window.location.href=document.referrer;</script>");
				//out.println("<script>history.back();window.location.href='mag_rwd167.jsp';</script>");
				 //this.getServletContext().getRequestDispatcher("/jg/List2.jsp").forward(request, response);
				out.println("<script>window.location.href='/yqfb/jg/List2.jsp'</script>");
				out.flush();
				out.close();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			break;	
			
		case 4:
			try {
				//String msg = "��ϲ��ɾ���ɹ���";
				String lb=request.getParameter("lb");
				
				MysqlDB db=new MysqlDB();
				String fromPicName = "";  //ѹ��·���ļ���
				String vi="";
				String sql = "select img1,video1 from jg where id="+id;
				ResultSet rs = db.executeQuery(sql);
				if (rs.next()) {
					if (rs.getString(1).equals("0")&&rs.getString(2).equals("0")) {
						
					}else {
						if(!rs.getString(1).equals("0")){
							fromPicName = AllValus.downloadpath3+rs.getString(1);
							DeleteFileUtil.deleteFile(fromPicName);//ɾ��
						}else if(!rs.getString(2).equals("0")){
							fromPicName = AllValus.downloadpath3+rs.getString(2);
							DeleteFileUtil.deleteFile(fromPicName);//ɾ��
						}
					}
				}
				
				String delnews="delete from jg where id="+id;	
			
				db.executeDelete(delnews);
				
				
				String delnews2="delete from jg_dz where jid="+id;	
				
				db.executeDelete(delnews2);
				
				System.out.println(delnews);
				System.out.println(delnews2);
			
			
				
				//���÷����ĵ�����
				response.setContentType("text/html;charset=GBK");
				PrintWriter out = response.getWriter();
				//out.println("<script>history.back();window.location.href=document.referrer;</script>");
				out.println("<script>window.location.href='/yqfb/jg/List.jsp?openid="+openid+"&lb="+lb+"'</script>");
				
			    out.flush();
				out.close();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			break;
			
			
		case 5:
			try {
				String uprl = request.getParameter("uprl");
				int lb=0;
				if (request.getParameter("lb")!=null) {
					lb=Integer.parseInt(request.getParameter("lb"));
				}
				
				//String msg = "��ϲ�����޳ɹ���";
				String nowDayMYD = TimeString.GetnowTimeYMD();
				MysqlDB db=new MysqlDB();
				int oid = ZghTools.GetOid(id);
				int zloid = ZghTools.GetZlOid(openid);
				String sql = "select date_format(fbsj, '%Y-%m-%d') as fbsj from jg_dz where jid="+id+" and zloid="+zloid+" order by id desc";
				
				ResultSet rs = db.executeQuery(sql);
				System.out.println(sql);
				if (rs.next()) {
					String fbsj = rs.getString("fbsj");
					System.out.println(fbsj);
					if (!fbsj.equals(nowDayMYD)) {
						
						String sql2 = "insert into jg_dz(jid,oid,zloid,fbsj,lb) values("+id+","+oid+","+zloid+",'"+TimeString.nowTime()+"',"+lb+")";
						db.executeInsert(sql2);
						System.out.println(sql2);
						
					}
				}else {
					
					String sql2 = "insert into jg_dz(jid,oid,zloid,fbsj,lb) values("+id+","+oid+","+zloid+",'"+TimeString.nowTime()+"',"+lb+")";
					db.executeInsert(sql2);
					System.out.println(sql2);
				}
				
				
				
				
				//���÷����ĵ�����
				response.setContentType("text/html;charset=GBK");
				PrintWriter out = response.getWriter();
				//out.println("<script>history.back();window.location.href=document.referrer;</script>");
				if(uprl.equals("index.jsp")){
					out.println("<script>window.location.href='/yqfb/jg/"+uprl+"?openid="+openid+"&lb="+lb+"'</script>");
				}else if(uprl.equals("List.jsp")){
					out.println("<script>window.location.href='/yqfb/jg/"+uprl+"?openid="+openid+"&lb="+lb+"'</script>");
					
				}else if(uprl.equals("pm.jsp")){
					out.println("<script>window.location.href='/yqfb/jg/"+uprl+"?openid="+openid+"&lb="+lb+"'</script>");
					
				}else{
					out.println("<script>window.location.href='/yqfb/jg/"+uprl+"?openid="+openid+"&lb="+lb+"'</script>");
				}
				
				
			    out.flush();
				out.close();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			break;
			
		case 6:
			try {
				int lb=0;
				if (request.getParameter("lb")!=null) {
					lb=Integer.parseInt(request.getParameter("lb"));
				}
				//String msg = "��ϲ�����޳ɹ���";
				String nowDayMYD = TimeString.GetnowTimeYMD();
				MysqlDB db=new MysqlDB();
				int oid = ZghTools.GetOid(id);
				int zloid = ZghTools.GetZlOid(openid);
				String sql = "select date_format(fbsj, '%Y-%m-%d') as fbsj from jg_dz where jid="+id+" and zloid="+zloid+" order by id desc";
				ResultSet rs = db.executeQuery(sql);
				if (rs.next()) {
					String fbsj = rs.getString("fbsj");
					System.out.println(fbsj);
					if (!fbsj.equals(nowDayMYD)) {
						
						String sql2 = "insert into jg_dz(jid,oid,zloid,fbsj,lb) values("+id+","+oid+","+zloid+",'"+TimeString.nowTime()+"',"+lb+")";
						db.executeInsert(sql2);
						
					}
				}else {
					
					String sql2 = "insert into jg_dz(jid,oid,zloid,fbsj,lb) values("+id+","+oid+","+zloid+",'"+TimeString.nowTime()+"',"+lb+")";
					db.executeInsert(sql2);
				}
				
				
				//���÷����ĵ�����
				response.setContentType("text/html;charset=GBK");
				PrintWriter out = response.getWriter();
				//out.println("<script>history.back();window.location.href=document.referrer;</script>");
				out.println("<script>window.location.href='/yqfb/jg/Pic1.jsp?bzlopenid="+openid+"&id="+id+"'</script>");
				
			    out.flush();
				out.close();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			break;
			
			
		case 7:
			try {
				
				int lb=0;
				if (request.getParameter("lb")!=null) {
					lb=Integer.parseInt(request.getParameter("lb"));
				}
				//String msg = "��ϲ�����޳ɹ���";
				String nowDayMYD = TimeString.GetnowTimeYMD();
				MysqlDB db=new MysqlDB();
				int oid = ZghTools.GetOid(id);
				int zloid = ZghTools.GetZlOid(openid);
				String sql = "select date_format(fbsj, '%Y-%m-%d') as fbsj from jg_dz where jid="+id+" and zloid="+zloid+" order by id desc";
				ResultSet rs = db.executeQuery(sql);
				if (rs.next()) {
					String fbsj = rs.getString("fbsj");
					System.out.println(fbsj);
					if (!fbsj.equals(nowDayMYD)) {
						
						String sql2 = "insert into jg_dz(jid,oid,zloid,fbsj,lb) values("+id+","+oid+","+zloid+",'"+TimeString.nowTime()+"',"+lb+")";
						db.executeInsert(sql2);
						
					}
				}else {
					
					String sql2 = "insert into jg_dz(jid,oid,zloid,fbsj,lb) values("+id+","+oid+","+zloid+",'"+TimeString.nowTime()+"',"+lb+")";
					db.executeInsert(sql2);
				}
				
				
				//���÷����ĵ�����
				response.setContentType("text/html;charset=GBK");
				PrintWriter out = response.getWriter();
				//out.println("<script>history.back();window.location.href=document.referrer;</script>");
				out.println("<script>window.location.href='/yqfb/jg/video.jsp?bzlopenid="+openid+"&id="+id+"'</script>");
				
			    out.flush();
				out.close();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			break;

		case 8:
			try {
				//String msg = "��ϲ��ɾ���ɹ���";
				
				String lb="";
				if (request.getParameter("lb")!="") {
					lb=request.getParameter("lb");
				}

				MysqlDB db=new MysqlDB();
				String fromPicName = "";  //ѹ��·���ļ���
				//String vi="";
				String sql = "select img1,video1 from jg where id="+id;
				ResultSet rs = db.executeQuery(sql);
				if (rs.next()) {
					if (rs.getString(1).equals("0")&&rs.getString(2).equals("0")) {
						
					}else {
						if(!rs.getString(1).equals("0")){
							fromPicName = AllValus.downloadpath3+rs.getString(1);
							DeleteFileUtil.deleteFile(fromPicName);//ɾ��
						}else if(!rs.getString(2).equals("0")){
							fromPicName = AllValus.downloadpath3+rs.getString(2);
							DeleteFileUtil.deleteFile(fromPicName);//ɾ��
						}
					}
				}
				
				String delnews="delete from jg where id="+id;	
			
				db.executeDelete(delnews);
				
				String delnews2="delete from jg_dz where jid="+id;	
				
				db.executeDelete(delnews2);
				
				System.out.println(delnews);
				System.out.println(delnews2);
			
				
				//���÷����ĵ�����
				response.setContentType("text/html;charset=GBK");
				PrintWriter out = response.getWriter();
				//out.println("<script>history.back();window.location.href=document.referrer;</script>");
				out.println("<script>window.location.href='/yqfb/jg/List2.jsp?openid="+openid+"&lb="+lb+"'</script>");
				
			    out.flush();
				out.close();
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			break;
			
		case 9:
			try {
				//String msg = "��ת90��";
				String img1path=ZghTools.getImg2(id);
				String imgfilename=ZghTools.GetFileNoHz(ZghTools.getImg3(id));
				String imghz = ZghTools.getHz(ZghTools.getImg3(id));
				System.out.println("11:"+img1path);
				System.out.println("22:"+AllValus.downloadpath5);
				System.out.println("33:"+ imgfilename);
				System.out.println("44:"+imghz);
				
				ImageDeal imageDeal = new ImageDeal(img1path, AllValus.downloadpath5, imgfilename, imghz);
				// ������ת
		        imageDeal.spin(90);
		         
				//���÷����ĵ�����
				response.setContentType("text/html;charset=GBK");
				PrintWriter out = response.getWriter();
				out.println("<script>window.location.href='/yqfb/jg/List2.jsp'</script>");
				out.flush();
				out.close();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			break;	
			
		default:
			break;
		
		}	
	}
	
	
	

}
