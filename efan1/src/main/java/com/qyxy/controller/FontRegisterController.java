
package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.User1;
import com.qyxy.service.FontRegisterService;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * Created by Administrator on 2018/8/7 0007.
 */

@Controller
@RequestMapping("/fontUser")
public class FontRegisterController {
    @Resource
    private FontRegisterService fontRegisterService;

    //注册
    @RequestMapping("/saveUser")
    public String saveUser(String username, String password , String userphone, User1 user, Model model) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        //查看用户是否注册过
        String r=fontRegisterService.userList(username,userphone);
        System.out.println(r);
        //未注册
        if(r.equals("true")) {

/* 进行加密，页面传过来的不是明文，是一个哈希值，对哈希再加密 */

           /* String newpassword= convertMD5(password);*/
            //添加用户
       /*     user.setUsername(username);
            user.setPassword(newpassword);
            user.setPhone(phone);
            user.setUserstatus(1);*/
            SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
           String ss=s.format(new Date());
        /*    user.setRegistTime(ss);*/
            fontRegisterService.saveUser(username,password,userphone);
            return "../../fontLogin";
        }
        //用户被注册过 重新注册
        model.addAttribute("msg111",r);
        return "../../fontRegister";
    }


/**
     * 加密解密算法 执行一次加密，两次解密
     */

    public static String convertMD5(String inStr){

        char[] a = inStr.toCharArray();
        for (int i = 0; i < a.length; i++){
            a[i] = (char) (a[i] ^ 't');
        }
        String s = new String(a);
        return s;
    }


/* @RequestMapping("/updateUser")
    public String saveUserIcon(String userId,String nickName,String userIcon){
        int userId1=Integer.parseInt(userId);
        fontRegisterService.saveUserIcon(userId1,nickName,userIcon);
        return "index1";
    }*/


    //登录
    @RequestMapping("/findUser")
    public String findUserName(String userphone, String password, Model model, HttpSession session){
        //查看用户是否存在
         String str=fontRegisterService.userList1(userphone);
        //用户存在
        if(!"true".equals(str)) {
            //获取用户的密码
            List<User1> d = fontRegisterService.findUserName(userphone);
            User1 ps =d.get(0);
            System.out.print(ps.getUserpassword()+"==S=====oinhpo");
            //对用户登录传过来的哈希密码先进行加密
           /* String newpassword=convertMD5(password);
            System.out.println(newpassword);*/
            //加密后，与数据库存储的密码进行比对
            //密码匹配
            if (ps.getUserpassword().equals(password)){
                System.out.println("--------" + userphone);
                //用户保存在session中
              /*  session.setAttribute("userName", username);*/
                //查看用户状态 0 禁用  1 可用
                User1 user = fontRegisterService.findStatus(userphone);
                System.out.println("------------"+user.getUserstatus());
                if (user.getUserstatus() == 1) {
                   List<User1> user2=fontRegisterService.findUserByName(userphone);
                   session.setAttribute("user",user2.get(0));
                    System.out.println("------------"+user2.get(0));
                    return "../../index3";
                } else {
                    model.addAttribute("msg", "你的账户已被禁用，请向管理员申请解禁");
                    return "../../fontLogin";
                }
            }
            //密码不正确
            model.addAttribute("msg", "密码不正确，请重新输入");
            return "../../fontLogin";
        }
        //用户不存在
        model.addAttribute("msg", "用户不存在");
        return "../../fontLogin";
    }
    //个人中心，通过用户名进行查询，返回用户的数据
    @RequestMapping("/findUserByName")
    @ResponseBody
    public String finduserByName(String username){
        System.out.println(username);
        List<User1> list=fontRegisterService.findUserByName(username);
        System.out.println(JSON.toJSONString(list));
        return JSON.toJSONString(list);
    }

    //用户个人中心修改个人信息
    @RequestMapping("updateUserByName.do")
    public String updateUser(String username, String password, String nickname, String phone, MultipartFile file, HttpServletRequest request){
        String userIcon = null;
        if(file.getOriginalFilename()!=null){
            String path=request.getServletContext().getRealPath("/images")+"/"+file.getOriginalFilename();
            System.out.println(request.getServletContext().getRealPath("/images")+"    "+path);
            String myfile="images/"+file.getOriginalFilename();
            File target=new File(path);

             userIcon=myfile;

            try {
                OutputStream output=new FileOutputStream(target);

                try{
                    IOUtils.copy(file.getInputStream(),output);

                }catch (IOException e){
                    e.printStackTrace();
                }

            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
        }

        fontRegisterService.updateUser(username,password, nickname,userIcon,phone);
        return "updateUser";
    }


}

