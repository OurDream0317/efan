package com.qyxy.mapper;

import com.qyxy.domain.Comment;
import com.qyxy.domain.User1;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository(value = "commentMapper")
public interface CommentMapper {
    public List see(@Param("id") int id);

    //新增评论的方法
    public void addcomment(@Param("comment") Comment comment);
}