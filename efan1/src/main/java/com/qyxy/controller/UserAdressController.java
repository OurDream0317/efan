package com.qyxy.controller;

import com.qyxy.domain.UserAddress;
import com.qyxy.service.UserAdressService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/9/11 0011.
 */
@Controller
@RequestMapping(value = "adress")
public class UserAdressController {
    @Resource
    private UserAdressService userAdressService;

    //设置为默认地址
    @RequestMapping("/set")
    public String set(String addressid,String userid) {
        System.out.println(userid+addressid);
        userAdressService.set1(userid);
        userAdressService.set(addressid);
        return "redirect:/adress/insert1";
    }

    //编辑地址
    @RequestMapping("/update")
    public String update(String addressid,String username,String userphone,String address){
        userAdressService.update1(addressid,username,userphone,address);

        return "redirect:/adress/insert1";
    }

    //新增地址
    @RequestMapping("/add")
    public String add(String userid,String username,String userphone,String address,ModelAndView mv){
        System.out.println(userid+username+userphone+address);
      /*  if(username==null||username==""){
            mv.addObject("ad","用户名为空，请输入正确的值");
            return "../../adress";
        }*/
        userAdressService.set1(userid);
        userAdressService.add(userid,username,userphone,address);

        return "redirect:/adress/insert?userid="+userid;
    }

    //删除地址
    @RequestMapping("/delete")
    public String delete(String addressid,String userid){
        userAdressService.delete1(addressid);
        return "redirect:/adress/insert?userid="+userid;
    }

    //根据姓名id查询全部地址
    @RequestMapping("/insert")
    public ModelAndView select(String userid){
        List<UserAddress> list=userAdressService.select(userid);
        ModelAndView mv=new ModelAndView("../../adress");
        mv.addObject("adress",list);
        System.out.println(list.size()+"1111111111111111");
        return  mv;
    }
    //根据姓名id查询全部地址
    @RequestMapping("/insert1")
    public ModelAndView selectAll(String userid){
        List<UserAddress> list=userAdressService.selectAll(userid);
        ModelAndView mv=new ModelAndView("../../adress");
        mv.addObject("adress",list);
        System.out.println(list.size()+"1111111111111111");
        return  mv;
    }





}
