package com.qyxy;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;

/**
 * Created by Administrator on 2018/8/27 0027.
 */
public class TestMd5 {

    public static void main(String[] args) {
        //所需加密的参数  即  密码
        String source = "123456";
        //[盐] 一般为用户名 或 随机数
        String salt = "eteokues";
        //加密次数
        int hashIterations = 1;

      /*  String hash1 = new Md5Hash(source).toString(); //  202cb962ac59075b964b07152d234b70
        String hash2 =  new Md5Hash(hash1).toString();//   d9b1d7db4cd6e70935368a1efb10e377*/

        //调用 org.apache.shiro.crypto.hash.Md5Hash.Md5Hash(Object source, Object salt, int hashIterations)构造方法实现MD5盐值加密
        Md5Hash mh = new Md5Hash(source, salt, hashIterations);
        //打印最终结果
        System.out.println(mh.toString());

        /*调用org.apache.shiro.crypto.hash.SimpleHash.SimpleHash(String algorithmName, Object source, Object salt, int hashIterations)
        * 构造方法实现盐值加密  String algorithmName 为加密算法 支持md5 base64 等*/
        SimpleHash sh = new SimpleHash("md5", source, salt, hashIterations);
        //打印最终结果
        System.out.println(sh.toString());
    }

}
