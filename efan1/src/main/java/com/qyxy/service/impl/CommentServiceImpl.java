package com.qyxy.service.impl;

import com.qyxy.domain.Comment;
import com.qyxy.mapper.CommentMapper;
import com.qyxy.service.CommentService;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/9/12 0012.
 */
@Service(value="commentService")
public class CommentServiceImpl implements CommentService {
    @Resource
    private CommentMapper commentMapper;
    @Override
    public List see(int id) {
        return commentMapper.see(id);

    }

    @Override
    public void addComment(String commentcontent, Integer commentuserid, Integer whereid, Integer commenttyle) {
        //创建一个comment对象
        Comment comment=new Comment();
        comment.setCommentcontent(commentcontent);
        comment.setCommentuserid(commentuserid);
        comment.setWhereid(whereid);
        comment.setCommenttyle(commenttyle);
        //将当前时间添加到数据库中
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String commenttime= formatter.format(currentTime);
        comment.setCommenttime(commenttime);
        comment.setCommentstatus(1);
        commentMapper.addcomment(comment);

    }
}
