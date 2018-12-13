package com.qyxy.util;

/**
 * Created by Administrator on 2018/9/13 0013.
 */

import jdk.nashorn.internal.objects.Global;
import org.apache.shiro.session.Session;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

/*import com.miaodiyun.httpApiDemo.common.Config;
import com.miaodiyun.httpApiDemo.common.HttpUtil;*/

/**
 * 验证码通知短信接口
 *
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
    private static String operation = "/industrySMS/sendSMS";

    private static String accountSid = Config.ACCOUNT_SID;
    private static String to = null;
   /* private String to="123";*/

    private static String code = smsCode();
    //  登录验证码：{1}，如非本人操作，请忽略此短信。
    //private static String smsContent = "【青云学院】您的验证码为："+code+"，请于3分钟内正确输入，如非本人操作，请忽略此短信。";
    private static String smsContent = "【齐锋娱乐】您的验证码为："+code+"，请于{2}分钟内正确输入，如非本人操作，请忽略此短信，秦齐锋提示您。";
//您的验证码为{1}，请于{2}分钟内正确输入，如非本人操作，请忽略此短信，秦齐锋提示您。
    /**您的验证码为{1}，请于{2}分钟内正确输入，如非本人操作，请忽略此短信。
     * 验证码通知短信
     */
    public static void execute(String str)
    {
        to=str;
        String tmpSmsContent = null;
        try{
            tmpSmsContent = URLEncoder.encode(smsContent, "UTF-8");
        }catch(Exception e){

        }
        String url = Config.BASE_URL + operation;
        String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + tmpSmsContent
                + HttpUtil.createCommonParam();

        // 提交请求
        String result = HttpUtil.post(url, body);
        System.out.println("result:" + System.lineSeparator() + result);
    }

    //创建验证码
    public static String smsCode(){
        String random=(int)((Math.random()*9+1)*100000)+"";
        System.out.println("验证码："+random);
        return random;
    }
}