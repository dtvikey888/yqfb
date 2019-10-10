package org.fjw.weixin.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;


public class FileByte {
	
public int getFileByte(String pt){
         File f = new File(pt); 
         int dd =0;
         try{
        	
           FileInputStream fis = new FileInputStream(f) ;
           
           try   { 
        	   dd =fis.available();
          // System.out.println(fis.available())   ;   
           }catch(IOException e1){   
           e1.printStackTrace();   
           }   
           }catch(FileNotFoundException e2){   
           e2.printStackTrace();   
           }
           
		return dd; 
           
          
     }


public static void main(String[] args)
{
	 String filePath = "D:\\ms\\images\\53531306072377546.jpg";

   FileByte fb = new FileByte();
   System.out.println(fb.getFileByte(filePath));
}

}