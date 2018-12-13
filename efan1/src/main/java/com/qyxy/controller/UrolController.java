package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.Urole;
import com.qyxy.service.UrolService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/9/2 0002.
 */

@Controller
@RequestMapping("/urole")
public class UrolController {

    @Resource
    private UrolService uroleService;
    //增加一个角色
    @RequestMapping("/add")
    public String addurole(String uroleName){
        if(uroleName!=null) {
            uroleService.addUrole(uroleName);
        }
        return "redirect:/urole/findAll";
    }

    //删除角色
    @RequestMapping("/delete")
    public String deleteUrole(String uroleName){
        uroleService.deleteUrole(uroleName);
        return "redirect:/urole/findAll";
    }

    //展示角色
    @RequestMapping("/findAll")
    public String findAll(HttpSession httpSession){
        List<Urole> list=uroleService.findAll();
       /* ModelAndView mv=new ModelAndView("/urole");
        mv.addObject("findAll",list);*/
        httpSession.setAttribute("findAll",list);
        System.out.println(list.size());
        return "urole";
    }

    //展示角色
    @RequestMapping("/findAllRole")
    @ResponseBody
    public String findAllRole(){
        List<Urole> list=uroleService.findAll();
        System.out.println(list.size()+"1234567123456");
        return JSON.toJSONString(list);
    }

    @RequestMapping("/insert")
    public String insertUm(String upermissionid,String uroleid){
        uroleService.deleteAP(uroleid);
        String value=upermissionid;
        String [] result = value.split(",");

        for(int i = 0;i<result.length;i++){
            System.out.print(result[i]+"\t");
            uroleService.insertUp(result[i],uroleid);
        }
      /*  for(int i=0;i<upermissionid.length();i++){
            System.out.println(upermissionid+"=============");
        }*/
        return "redirect:/urole/findAll";
    }
/*
    @RequestMapping("/showAll")
    public String showAll(){

        return "";
    }*/


}
