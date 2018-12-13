package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.Feedback;
import com.qyxy.domain.Manage;
import com.qyxy.service.FeedbackService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/9/7 0007.
 */
@Controller
@RequestMapping(value = "feedback")
public class FeedbackController {
   @Resource
    private FeedbackService feedbackService;


    @RequestMapping("/jsp")
    public String jsp(){
        return "feedback";
    }

    @RequestMapping("/showfeedList")
    @ResponseBody
    public String feedlist(int startRow, int endRow,int feedbackstatus ){
        List<Feedback> feedList=feedbackService.findAll(startRow,endRow,feedbackstatus);
        System.out.print("asfdddddddddddddd"+ JSON.toJSONString(feedList));
        return JSON.toJSONString(feedList);
    }

    //进行处理操作
    @RequestMapping("/update")
    public String update(int feedbackid){
        feedbackService.update(feedbackid);
        return "redirect:/feedback/jsp";
    }
}
