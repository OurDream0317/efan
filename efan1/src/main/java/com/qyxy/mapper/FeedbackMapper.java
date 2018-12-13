package com.qyxy.mapper;

import com.qyxy.domain.Feedback;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface FeedbackMapper {
    public List<Feedback> findAll(@Param("startRow")int startRow, @Param("endRow")int endRow, @Param("feedbackstatus")int feedbackstatus);


    public void update(int feedbackid);
}