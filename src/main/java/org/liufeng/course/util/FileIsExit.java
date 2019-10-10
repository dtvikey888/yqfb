package org.liufeng.course.util;
import java.io.File;
import java.io.IOException;
//判断文件或者文件夹是否存在
public class FileIsExit {
	 public static void main(String[] args) {

	        File file = new File("d:\\test_file.txt");
	        System.out.println(FileIsExit.judeFileExists(file));

//	        File dir = new File("d:\\test_dir");
//	        FileIsExit.judeDirExists(dir);
	    }

	    // 判断文件是否存在
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

	    // 判断文件夹是否存在
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
