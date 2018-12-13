package com.qyxy.service;

import com.qyxy.domain.User1;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/9/7 0007.
 */
public interface CommentService {
    public List see(int id);

    //新增评论的方法 评论内容，评论人id 评论关联的上商品或新闻id  评论的类型，商品订单0， 话题1，新闻2
    public void addComment(String commentcontent,Integer commentuserid,Integer whereid,Integer commenttyle);
}
