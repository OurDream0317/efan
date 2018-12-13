package com.qyxy.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Created by Administrator on 2018/9/15 0015.
 */
public class Email {

    //生成随机验证码

    public static String achieveCode(){
        String[] beforeShuffle=new String[]{ "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F",
                "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a",
                "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
                "w", "x", "y", "z" };
        List list= Arrays.asList(beforeShuffle);
       Collections.shuffle(list);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
        }
        String afterShuffle = sb.toString();
        String result = afterShuffle.substring(3, 9);
        System.out.print(result);
        return result;

    }

    public static String sendEamilCode(String eamil) {
        HtmlEmail send = new HtmlEmail();
// 获取随机验证码
        String resultCode = achieveCode();
        try {
            send.setHostName("smtp.qq.com");
            send.setSmtpPort(465);                                            //端口号
            send.setSSLOnConnect(true);                                   //开启SSL加密
            send.setCharset("utf-8");
            send.addTo(eamil);                                                  //接收者的QQEamil
            send.setFrom("1010954961@qq.com", "回眸");          //第一个参数是发送者的QQEamil   第二个参数是发送者QQ昵称
                    send.setAuthentication("1010954961@qq.com", "yszsozustfjsjaaj");  //第一个参数是发送者的QQEamil   第二个参数是刚刚获取的授权码
            send.setSubject(",小渣渣特给您送上验证码");            //Eamil的标题  第一个参数是我写的判断上下午，删掉即可
            send.setMsg("HelloWorld!欢迎大大光临，特此送上验证:   " + resultCode + "   请大大签收");   //Eamil的内容


            send.send();            //发送
        } catch (EmailException e) {
            e.printStackTrace();
        }
        return resultCode;        //同等验证码
    }

}
