package com.fjw.utils;

import java.util.Timer;

/**
 *
 * @author sandy
 *
 */
public class TimerCallClient {

    public static void main(String[] args) {

        run();

    }

    private static void run() {

        Timer timer = new Timer();

        NewTimerTask timerTask = new NewTimerTask();
        //程序运行后立刻执行任务，每隔240000ms（4分钟）执行一次
        timer.schedule(timerTask, 0, 240000);

        NewTimerTask2 timerTask2 = new NewTimerTask2();
        //程序运行后立刻执行任务，每隔180000ms（3分钟）执行一次
        timer.schedule(timerTask2, 0, 180000);

        NewTimerTask3 timerTask3 = new NewTimerTask3();
        //程序运行后立刻执行任务，每隔240000ms（4分钟）执行一次
        timer.schedule(timerTask3, 0, 240000);


        NewTimerTask4 timerTask4 = new NewTimerTask4();
        //程序运行后立刻执行任务，每隔300000ms（5分钟）执行一次
        timer.schedule(timerTask4, 0, 300000);

        NewTimerTask5 timerTask5 = new NewTimerTask5();
        //程序运行后立刻执行任务，每隔240000ms（4分钟）执行一次
        timer.schedule(timerTask5, 0, 240000);

        NewTimerTask6 timerTask6 = new NewTimerTask6();
        //程序运行后立刻执行任务，每隔300000ms（5分钟）执行一次
        timer.schedule(timerTask6, 0, 300000);


        NewTimerTask7 timerTask7 = new NewTimerTask7();
        //程序运行后立刻执行任务，每隔5000ms执行一次
        timer.schedule(timerTask7, 0, 240000);

        NewTimerTask8 timerTask8 = new NewTimerTask8();
        //程序运行后立刻执行任务，每隔5000ms执行一次
        timer.schedule(timerTask8, 0, 180000);

        NewTimerTask9 timerTask9 = new NewTimerTask9();
        //程序运行后立刻执行任务，每隔5000ms执行一次
        timer.schedule(timerTask9, 0, 300000);

        NewTimerTask10 timerTask10 = new NewTimerTask10();
        //程序运行后立刻执行任务，每隔5000ms执行一次
        timer.schedule(timerTask10, 0, 300000);

    }

}