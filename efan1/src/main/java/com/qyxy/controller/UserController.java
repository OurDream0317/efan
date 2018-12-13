package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.Master;
import com.qyxy.domain.User1;
import com.qyxy.service.MasterService;
import com.qyxy.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/8/31 0031.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @Resource
    private MasterService masterService;

   @RequestMapping("/updateMySelf")
   public String updateMySelf(User1 user1,String birthday) throws ParseException {
       System.out.println(birthday);
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//yyyy-mm-dd, 会出现时间不对, 因为小写的mm是代表: 秒
       Date userbirthday = sdf.parse(birthday);
       user1.setUserbirthday(userbirthday);
        userService.updataUser(user1);
          return "../../contact";
   }
    @RequestMapping("/selectByserch")
    public ModelAndView selectAllUser(String demo,String input,int currentpage,int count, User1 user1){
        Integer startRow=0;
        Integer endRow=5;

        //创建一个user1对象
        User1 user2=new User1();

        //判断传过来的数据是否为空 如果不为空存入对象中
        if(demo!=null&&demo!=""){
            if("昵称".equals(demo)){
                if(input!=null&&input!=""){
                    user2.setNickname(input);
                }
            }else {
                if(input!=null&&input!=""){
                    user2.setUserphone(input);
                }
            }
        }
        //判断性别是否为空，将值赋值给user2
        if(user1.getUsersex()!=null&&user1.getUsersex()!=""){
            user2.setUsersex(user1.getUsersex());
        }
        //判断地址是否为空，将值赋值给user2
        if (user1.getUseraddress()!=null&&user1.getUseraddress()!=""){
            user2.setUseraddress(user1.getUseraddress());
        }
        /*判断用户类型，将值赋值给user2*/
        if(user1.getUserstatus().equals(0)){
            user2.setUserstatus(4);
        }else {
            user2.setUserstatus(user1.getUserstatus());
        }
        String v2=currentpage+"";
        String v3=count+"";
        if(!"".equals(v2)&&!"".equals(v3)){
            startRow=(currentpage-1)*count+1;
            endRow=currentpage*count;
        }
        List<User1> user1List=userService.selectAllUser( startRow,endRow,user2);
        ModelAndView mv=new ModelAndView("emp/userList");
        mv.addObject("userList",user1List);
        return mv;
    }

    @RequestMapping("/selectAll")
    public ModelAndView selectAllUser(){
        User1 user1=new User1();
        Integer startRow=1;
        Integer endRow=5;
        user1.setUserstatus(4);
        List<User1> user1List=userService.selectAllUser( startRow,endRow,user1);
        ModelAndView mv=new ModelAndView("emp/userList");
        mv.addObject("userList",user1List);
        return mv;
    }

    @RequestMapping("/updatedisable")
    public String updatedisable(int userid,int userdisable){
        User1 user1=new User1();
        user1.setUserid(userid);
        if(userdisable==1){
            user1.setUserdisable(0);
        }else {
            user1.setUserdisable(1);
        }
        userService.updatedisable(user1);

        return "redirect:selectAll";
    }

    @RequestMapping("/selectuserbyid")
    public String selectUserById(int userid, Model model){
        System.out.println("=========="+userid);
        //通过用户名查询用户对象如果用户的状态为2代表是站长，为3 代表提交申请站长
        User1 user1=userService.selectUserById(userid);
        String user2= JSON.toJSONString(user1);
      model.addAttribute("user1",user2);
        //判断user1的状态是否为2站长或3提交申请状态
        if(user1.getUserstatus()==2||user1.getUserstatus()==3){
            //查询站长表，将站长的数据保存起来
            Master master=masterService.selectMasterById(userid);
          //  String master2=JSON.toJSONString(master);
            model.addAttribute("master",master);
        }else {
           /* Master master=new Master();
            master.setMastername("1234");

            String master2=JSON.toJSONString(master);
            model.addAttribute("master",master2);*/

        }

        return "emp/userdetail";

    }
    /*站长审核通过，后台接收userid改变userstatus状态为2*/
    @RequestMapping("/updateuserstatus")
    @ResponseBody
    public void updateUserStatus(int userid){
        System.out.println(userid);
        //站长审核通过，将status改为2
        userService.updateUserStatus(userid);

    }



    /*站长审核不通过通过，后台接收userid，和masterremar*/
    @RequestMapping("/updatemasterRemar")
    @ResponseBody
    public void updateMasterRemar(int userid,String masterremar){
        System.out.println(userid+"========="+masterremar);
        masterService.updateMasterRemar(userid,masterremar);

    }

    //后台前端用户的批量禁用
    @RequestMapping("/updateuserdisable")
    public String updateUserDisable(String valArr){
        //将获取到的userid字符串解析出来，保存到List中

        List<String> list=new ArrayList<String>();
        String[] str = valArr.split(",");
        for(int i = 0; i < str.length; i++){
            list.add(str[i]);
        }
        System.out.println(list);
        userService.updateUserDisable(list);

        return "redirect:selectAll";
    }


}
