package top.wintp.crud.task;

import java.util.Date;

/**
 * 类描述： 任务类
 * <p>
 * 作者：  pyfysf
 * <p>
 * qq:  337081267
 * <p>
 * CSDN:    http://blog.csdn.net/pyfysf
 * <p>
 * 个人博客：    http://wintp.top
 * <p>
 * 邮箱：  pyfysf@163.com
 * <p>
 * 时间：2018/9/3
 */
public class MyTask {

    //定时任务执行的方法
    public void execute() {
        System.out.println("当前系统时间:" + new Date().toLocaleString());
    }

}