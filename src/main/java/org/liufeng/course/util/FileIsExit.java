package org.liufeng.course.util;
import java.io.File;
import java.io.IOException;
//�ж��ļ������ļ����Ƿ����
public class FileIsExit {
	 public static void main(String[] args) {

	        File file = new File("d:\\test_file.txt");
	        System.out.println(FileIsExit.judeFileExists(file));

//	        File dir = new File("d:\\test_dir");
//	        FileIsExit.judeDirExists(dir);
	    }

	    // �ж��ļ��Ƿ����
	    public static boolean judeFileExists(File file) {
	    	
	    	boolean cz = false;

	        if (file.exists()) {
	            System.out.println("file exists");
	            cz=true;
	        } else {
	        	
	        	cz=false;
//	            System.out.println("file not exists, create it ...");
//	            try {
//	                file.createNewFile();
//	            } catch (IOException e) {
//	                // TODO Auto-generated catch block
//	                e.printStackTrace();
//	            }
	        }
	        
	        return cz;

	    }

	    // �ж��ļ����Ƿ����
	    public static void judeDirExists(File file) {

	        if (file.exists()) {
	            if (file.isDirectory()) {
	                System.out.println("dir exists");
	            } else {
	                System.out.println("the same name file exists, can not create dir");
	            }
	        } else {
	            System.out.println("dir not exists, create it ...");
	            file.mkdir();
	        }

	    }
}
