package com.qyxy;

import com.qyxy.util.Email;
import com.qyxy.util.IndustrySMS;

/**
 * Created by Administrator on 2018/9/12 0012.
 */
public class test {
    /*public static void main(String args[]){
        String i="";
        if(i==i+0){
            System.out.print("1234567");
        }

    }*/
    public static void main(String args[]){
        /*IndustrySMS.execute("15239920058");
        IndustrySMS.execute("15239920657");
        IndustrySMS.execute("18766819721");*/
      //  IndustrySMS.execute("15239937220");

        //调用发送邮箱验证码
        Email.sendEamilCode("1305817434@qq.com");
    }


}
