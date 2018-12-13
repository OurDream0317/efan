package com.qyxy.service.impl;

import com.qyxy.domain.Feedback;
import com.qyxy.mapper.FeedbackMapper;
import com.qyxy.service.FeedbackService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/9/7 0007.
 */
@Service(value = "feedbackservice")
public class FeedbackServiceImpl  implements FeedbackService{
   @Resource
   private FeedbackMapper feedbackMapper;

    @Override
    public List<Feedback> findAll(int startRow, int endRow, int feedbackstatus) {
        return feedbackMapper.findAll(startRow,endRow,feedbackstatus);
    }


    public void update(int feedbackid){
        feedbackMapper.update(feedbackid);
    }
}
