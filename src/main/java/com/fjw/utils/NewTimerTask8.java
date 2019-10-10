package com.fjw.utils;
import java.util.Random;
import java.util.TimerTask;

import org.liufeng.course.util.ZghTools;

/**
 * @author sandy
 * TimerTask类是一个抽象类
 */
public class NewTimerTask8 extends TimerTask {

    @Override
    public void run() {
        int id=73;
        ZghTools.zjPs(id);
        //createRandomNumber();
        //createRandomNumberFromMathRandom();
    }
    //用纯Math中的方法来随机生成1-10之间的随机数
    private void createRandomNumberFromMathRandom() {
        int j=(int)(Math.round(Math.random()*10+1));
        System.out.println("new8随机生成的数字为:"+j);

    }
    //用Random类的方式来随机生成1-10之间的随机数
    private void createRandomNumber(){
        Random random=new Random(System.currentTimeMillis());
        int value=random.nextInt();
        value=Math.abs(value);
        value=value%10+1;
        System.out.println("new8新生成的数字为:"+value);
    }
} 