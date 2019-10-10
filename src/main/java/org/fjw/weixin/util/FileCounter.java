/**
 * 获取文件夹下面的文件个数
 *
 * *
 */


package org.fjw.weixin.util;

import java.io.*;



public class FileCounter {
    public static void main( String[] args ) {

        int cc=  FileCounter.getFileC("D:/Tomcat/webapps/yqvodSite/uploadFiles/images");
        System.out.println("Number of file(s): " +cc);
    }

    public static int getFileC(String pathString){


        int count = 0;
        for( File file: new File(pathString).listFiles( ) )
            if( file.isFile( ) ) ++count;

        System.out.println( "Number of file(s): " + count );

        return count;

    }

}