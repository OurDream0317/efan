package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.Slideshow;
import com.qyxy.service.SlideService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/9/6 0006.
 */
@Controller
@RequestMapping("/slide")
public class SlideController {
    @Resource
    private SlideService slideService;

     @RequestMapping("/addimg")
    public String adding(HttpSession httpSession){
         List<Slideshow> list=slideService.selectAll();
         System.out.println(list.size()+"=====");
         httpSession.setAttribute("slideAll",list);
         return "slideshow";
     }


    @RequestMapping("/addimg1")
    public String addimg(MultipartFile myFile, int slidelocation, int identifier, HttpServletRequest req){
        String path = req.getServletContext().getRealPath("/image") + "/" + myFile.getOriginalFilename();
        System.out.print(path);
        String file = "image/" + myFile.getOriginalFilename();
        //video.setVideoContent(file);
        File target = new File(path);
        try {
            OutputStream output = new FileOutputStream(target);
            IOUtils.copy(myFile.getInputStream(), output);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Date date=new Date(System.currentTimeMillis());

        slideService.addimg(slidelocation,date,identifier,file);
        return "redirect:/slide/addimg";
    }


    @RequestMapping("/delete")
    public String delete(int slideid){
        slideService.delete(slideid);
        return "redirect:/slide/addimg";
    }

//修改上下架状态
    @RequestMapping("/update")
    public String update(int slideshelf, int slideid, int slidelocation, Model mv){

        slideService.update(slideshelf,slideid,slidelocation,mv);
        return "redirect:/slide/addimg";
    }

    //前台首页查询轮播图,返回上架的五张图片,根据位置编号
    @RequestMapping("/fontselectslide")
    @ResponseBody
    public String fontselectslide(int slidelocation){
        List<Slideshow> slideshowList=slideService.fontselectslideshow(slidelocation);
       String slidelist= JSON.toJSONString(slideshowList);
        return slidelist;
    }




}
