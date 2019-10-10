package org.liufeng.course.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fjw.utils.RenamePolicyCos;
import com.oreilly.servlet.MultipartRequest;

/**
 * 使用cos组件实现文件上传
 *
 * @author mingxue.zhang@163.com
 *
 */
public class CosUploadServlet extends HttpServlet {

	private static final long serialVersionUID = -9116026245071140150L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		File fileDir = new File(this.getServletContext()
				.getRealPath("/FileDir"));
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		// 设置上传文件的大小，超过这个大小 将抛出IOException异常，默认大小是1M。
		int inmaxPostSize = 10 * 1024 * 1024;
		MultipartRequest multirequest = null;
		// 上传文件重命名策略
		RenamePolicyCos myRenamePolicyCos = new RenamePolicyCos();
		try {
			// MultipartRequest()有8种构造函数！
			multirequest = new MultipartRequest(request, fileDir
					.getAbsolutePath(), inmaxPostSize, "UTF-8", myRenamePolicyCos); // utf-8中文编码模式上传文件
			String subject = multirequest.getParameter("subject");// 获取普通信息
			System.out.println(subject);
			Enumeration<String> filedFileNames = multirequest.getFileNames();
			String filedName = null;
			if (null != filedFileNames) {
				while (filedFileNames.hasMoreElements()) {
					filedName = filedFileNames.nextElement();// 文件文本框的名称
					// 获取该文件框中上传的文件，即对应到上传到服务器中的文件
					File uploadFile = multirequest.getFile(filedName);
					if (null != uploadFile && uploadFile.length() > 0) {
						System.out.println(uploadFile.getName());
						System.out.println(uploadFile.getPath());
						System.out.println(uploadFile.length());
					}
					// 获取未重命名的文件名称
					String Originalname = multirequest
							.getOriginalFileName(filedName);
					System.out.println(Originalname);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
}