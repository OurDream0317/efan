package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.Cattle;
import com.qyxy.domain.Manage;
import com.qyxy.service.CattleService;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/3 0003.
 */
@Controller
@RequestMapping("/cattle")
public class CattleController {
    @Resource
    private CattleService cattleService;

/* *//*多条件分页查询黄牛*//*
public List<Cattle> SelectCattleAll(Map map);
    //通过账号查询 返回一个cattle对象
    public Cattle selectCattleByPhone( String manageacc);

    //新增一个cattle数据
    public void insertCattle(Manage manage);
    //更改黄牛的禁用状态
    public void updateCattleStatus(int manageid, int disable);*/

    @RequestMapping("/cattlelist")
    public String ChangeCattle(){
        return "emp/cattle";
    }
    @RequestMapping("selectCattleAll")
    @ResponseBody
    public String SelectCattleAll(String demo,String input,int disable,int currentpage,int count){
       System.out.println(demo+" === "+input+"=== "+disable+"---"+currentpage+"=="+count);
        //判断页面传过来的值是否为null
        Map map=new HashMap();
        if(demo.equals("黄牛名称")&&input!=null&&input!=""){

                map.put("nickname",input);
                map.put("manageacc", "");

        }else if(demo.equals("账号")&&input!=null&&input!=""){

                map.put("manageacc", input);
                map.put("nickname","");

        }else {
            map.put("manageacc","");
            map.put("nickname","");

        }

            map.put("disable",disable);
        Integer startRow=(currentpage-1)*count+1;
        Integer endRow=currentpage*count;
        map.put("startRow",startRow);
        map.put("endRow",endRow);

        List<Manage> cattleList=cattleService.SelectCattleAll(map);
       String v= JSON.toJSONString(cattleList);
        System.out.println(v);
        return v;
    }
    //新增黄牛
    @RequestMapping("/addcattle")
    @ResponseBody
    public String addCattle(String nickname,String manageacc,String managepassword){
       //先通过账号查询，如果数据库已存在这个账号，则新增失败，

        Manage manage=cattleService.selectCattleByPhone(manageacc);
        //判断对象是否有值，如果有值返回页面账户已存在
        if (manage!=null){
            return "false";
        }
        //如果账户不存在，将数据保存到Cattle对象中保存到数据库
        Manage manage1=new Manage();
        manage1.setNickname(nickname);
        manage1.setManageacc(manageacc);
        manage1.setManagesalt(manageacc);
        manage1.setAddtime(new Date());
        //所需加密的参数  即  密码
        //[盐] 一般为用户名 或 随机数
        String managesalt = manageacc;
        //加密次数
        int hashIterations = 1;
        Md5Hash mh = new Md5Hash(managepassword, managesalt, hashIterations);
        System.out.println(mh);
        manage1.setManagepassword(mh.toString());
        //调用方法保存到数据库
        cattleService.insertCattle(manage1);

        return "true";
    }
    /*黄牛管理的禁用设置*/
   /* @RequestMapping("/updatestatus")
    public String updateStatus(Integer cattleid,Integer cattlestatus){
        System.out.println(cattleid+"  黄牛controller  "+cattlestatus);
        if(cattlestatus==0){
            cattleService.updateStatus(cattleid,1);
        }else {
            cattleService.updateStatus(cattleid,0);
        }
        return "redirect:cattlelist";

    }*/
    /*黄牛管理的禁用设置*/
    @RequestMapping("/updatestatus")
    public String updateStatus(Integer manageid,Integer disable) {
        System.out.println(manageid + "  黄牛controller  " + disable);
        if (disable == 0) {
            cattleService.updateCattleStatus(manageid, 1);
        } else {
            cattleService.updateCattleStatus(manageid, 0);
        }
        return "redirect:cattlelist";
    }
}
