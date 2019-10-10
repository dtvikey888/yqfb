package org.liufeng.course.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fjw.utils.RenamePolicyCos;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.ServletUtils;
/**
 * ʹ��cos���ʵ���ļ�����
 * 
 * @author mingxue.zhang@163.com
 * @date 2010-10-29
 */
public class CosDownloadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String filePath = "D:\\Tomcat\\apache-tomcat-6.0.26\\webapps\\CosUpload\\FileDir\\";
		String fileName = "2010��10�°���_2010_10_29_04_52_06_178.txt";
		String Originalname = "2010��10�°���.txt";
		String isofilename = new String(Originalname.getBytes("gb2312"),
				"ISO8859-1");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename="
				+ isofilename);
		ServletOutputStream out = null;
		try {
			out = response.getOutputStream();
			ServletUtils.returnFile(filePath + fileName, out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
	}

}