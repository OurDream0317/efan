package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.Star;
import com.qyxy.service.StarService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/9/4 0004.
 */
@Controller
@RequestMapping("/star")
public class StarController {
    @Resource private StarService starService;
    @RequestMapping("/demo")
    public String selectStar1(){
        return "star";
    }
    @RequestMapping("/first")
    @ResponseBody
    public String selectStar(int currentPage, int count){
        List<Star> starlist=starService.viewStar(currentPage,count);
        return JSON.toJSONString(starlist);
    }
    @RequestMapping("/addStar")
    public String addStar(){
        return "addStar";
    }
    @RequestMapping("/addStarDemo")
    public String addStarDemo(String starname,String starintroduce, MultipartFile file1,MultipartFile file2){

        starService.addStarDemo(starname,starintroduce,file1,file2);
        return "star";
    }
    @RequestMapping("/viewStarAll")
    public ModelAndView viewStarAll(int currentPage, int count, HttpServletRequest request){
        currentPage=(currentPage-1)*count+1;
        count=currentPage*count;
        List<Star> starlist=starService.viewStar(currentPage,count);
        ModelAndView mv=new ModelAndView("star");
        mv.addObject("starlist",starlist);
       return mv;

    }
    @RequestMapping("/selectStar")
    @ResponseBody
    public String selectStar(String starname,String content,int upStatus,int sort,int currentPage, int count){
       int currentPage1=(currentPage-1)*count+1;
      int  count1=currentPage*count;
        List<Star> starlist=starService.selectStar(starname,content,upStatus,sort,currentPage1,count1);
        System.out.println(JSON.toJSONString(starlist));
       return JSON.toJSONString(starlist);

    }
    @RequestMapping("/updateUpStatus")
    public String updateUpStatus(Integer showid,Integer starshelf){
        if(starshelf==0){
            starService.updateUpStatus(showid);
            return "star";
        }
        starService.NoupdateUpStatus(showid);
        return "star";
    }
    @RequestMapping("/updateDelStatus")
    public String updateUpStatus(Integer showid){

        starService.updateDelStatus(showid);
        return "star";
    }
    @RequestMapping("/viewStar")
    public String viewStar(Integer showid,HttpSession session){
        Star star=starService.viewStarDemo(showid);
        session.setAttribute("star",star);
        return "viewStar";
    }
    @RequestMapping("/editStar")
    public String editStar(String showid,HttpSession session){
        session.setAttribute("editStarId",showid);
        return "editStar";
    }
    @RequestMapping("/editStarDemo")
    public String editStarDemo(String starname,String starintroduce,MultipartFile file1,MultipartFile file2,HttpSession session){
        String starid= (String) session.getAttribute("editStarId");
        Star star=new Star();
        star.setStarid(starid);
        star.setStarname(starname);
        star.setStarintroduce(starintroduce);
        starService.editStarDemo(star, file1, file2);
        return "Stardemo";
    }

    /*前台首页查询4位人气最高的明星，*/
    @RequestMapping("/fontselecthot")
    @ResponseBody
    public String fontselecthot(){
        List<Star> starList=starService.fontselecthot();
        String star=JSON.toJSONString(starList);
        System.out.println(star);
        return star;
    }
       @RequestMapping("/deleteAll")
       public String deleteAll(String ids){
                  System.out.println(ids+"========+========");
              starService.deleteAll(ids);
           return "star";
              }

}
