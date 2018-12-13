package com.qyxy.service;

import com.qyxy.domain.Feedback;

import java.util.List;

/**
 * Created by Administrator on 2018/9/7 0007.
 */
public interface FeedbackService {
    //分页条件查询
    public List<Feedback> findAll(int startRow, int endRow, int feedbackstatus);


    public void update(int feedbackid);
}
