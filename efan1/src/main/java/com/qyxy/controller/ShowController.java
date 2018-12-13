package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.ActiveManage;
import com.qyxy.domain.Show;
import com.qyxy.domain.Star;
import com.qyxy.domain.Upermission;
import com.qyxy.mapper.StarMapper;
import com.qyxy.service.ShowService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/1 0001.
 */
@Controller
@RequestMapping("/show")
public class ShowController {
    int x;
    @Resource
    private ShowService showService;
    @Resource
    private StarMapper starMapper;
    @RequestMapping("/findShowAll")
    @ResponseBody
    public String findShowAll(int status,String showperson,String demo,String content,int pStatus,int upStatus,int tStatus,int currentPage,int count,HttpServletRequest req){
       HttpSession session=req.getSession();
        session.setAttribute("demo",demo);
        System.out.println(demo+"+"+content+"+"+pStatus+"+"+upStatus+"+"+tStatus+"+"+currentPage+"+"+count);
        Map map=new HashMap();


        map.put("startRow",(currentPage-1)*count+1);
        map.put("endRow",currentPage*count);
        if(content!=null&&content.length()>0){
            if(demo.equals("演出编号")){
                map.put("SHOWID",demo);
            }
            if(demo.equals("演出名称")){
                map.put("SHOWTITLE",demo);
            }
            if(demo.equals("发布方")){
                map.put("SHOWPERSON",demo);
            }
            map.put("content",content);
        }
        map.put("pStatus",pStatus);
        map.put("upStatus",upStatus);
        map.put("tStatus",tStatus);
        map.put("status",status);
        map.put("fbr",showperson);
       List<Show> list=showService.findShowAll(map);
        return JSON.toJSONString(list);
    }
    @RequestMapping("/findShow")
        public String findShow(){
        return "show";
        }

    @RequestMapping("/findAll")
    @ResponseBody
    public String findAll(int status,String showperson,int currentPage,int count,HttpServletRequest req){
        HttpSession session=req.getSession();
        Map map=new HashMap();
        map.put("startRow",(currentPage-1)*count+1);
        map.put("endRow",currentPage*count);
        map.put("status",status);
        map.put("fbr",showperson);
        List<Show> list=showService.findAll(map);
        return JSON.toJSONString(list);

    }
    @RequestMapping("/addshowjsp")
    public String addshowjsp(HttpSession session){
        List<Star> list=starMapper.selectAll();
        session.setAttribute("AllStarlist",list);
        return "addShow";
    }

    @RequestMapping("/addshow")
    public String addshow(Show show, MultipartFile myFile, HttpSession session){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        show.setShowaddtime(df.format(new Date()));
       ActiveManage activeManage= (ActiveManage) session.getAttribute("activeUser");
        if(activeManage.getManagestatus()==1){
           show.setStatus(1);
        }else if(
            activeManage.getManagestatus()==2){
            show.setStatus(2);
        }

        showService.addshow(show,myFile);
        return "show";
    }
    //查看
    @RequestMapping("/viewShowDemo")
    public String viewShowDemo(String showid,HttpSession session){
        int id=Integer.parseInt(showid);
        Show show=showService.viewShow(id);
        session.setAttribute("show",show);
        return "viewShow";
    }
    @RequestMapping("/updateShowDemo")
    public String updateShowDemo(String showid,HttpSession session){
        int id=Integer.parseInt(showid);
        Show show=showService.viewShow(id);
        session.setAttribute("show1",show);
        session.setAttribute("id",id);
        return "editShow";
    }
    @RequestMapping("/updateShow")
    public String updateShow(Show show, MultipartFile myFile,HttpSession session){

        int id= (int) session.getAttribute("id");
        System.out.println(id+"====================");
        show.setShowid(id);
        showService.updateShow(show,myFile);
        return "show";
    }
    @RequestMapping("/updateShowUpStatus")
    public String updateShowUpStatus(String showid,String showshelf){
        int id=Integer.parseInt(showid);
        int shelf=Integer.parseInt(showshelf);

        showService.updateShowUpStatus(id,shelf);
        return "show";
    }
    @RequestMapping("/updateShowTStatus")
    public String updateShowTStatus(String showid,String showrecommend){
        int id=Integer.parseInt(showid);
        int recommend=Integer.parseInt(showrecommend);
        showService.updateShowTStatus(id,recommend);
        return "show";
    }
    @RequestMapping("/updateShowDelStatus")
    public String  updateShowDelStatus(String showid,String showstatus){
        int id=Integer.parseInt(showid);
        int status=Integer.parseInt(showstatus);
        showService.updateShowDelStatus(id,status);
        return "show";
    }
    @RequestMapping("/shenHe")
    public String  shenHe(String showid,HttpSession session){
        int shenHeid=Integer.parseInt(showid);
        Show show=showService.viewShow(shenHeid);
        session.setAttribute("show",show);
        session.setAttribute("shenHeid",shenHeid);
        return "viewShow";
    }
    @RequestMapping("/shenHeDemo")
    public String shenHeDemo(String userName,HttpSession session){
        int shenHeid= (int) session.getAttribute("shenHeid");
        showService.updateShowAuditstatus(userName,shenHeid);
        return "show";
    }
    @RequestMapping("/NoshenHeDemo")
    public String   NoshenHeDemo(String userName,String masterremar,HttpSession session){
        int shenHeid= (int) session.getAttribute("shenHeid");
        showService.NoupdateShowAuditstatus(userName,shenHeid);
        return "show";
    }

    /*前台首页查询一个最新的演出*/
    @RequestMapping("fontselectshow")
    @ResponseBody
    public String fontSelectShow(){

        List<Show> showList=showService.fontSelectShow();
        String show=JSON.toJSONString(showList);
        return show;
    }




}
