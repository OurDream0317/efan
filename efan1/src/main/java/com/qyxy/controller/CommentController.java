package com.qyxy.controller;

import com.qyxy.domain.Comment;
import com.qyxy.domain.NewComment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/9/7 0007.
 */
@Controller
@RequestMapping(value = "comment")
public class CommentController {
    @RequestMapping(value = "first")
    public String first(int id, String img, String nikename, String commentcontent, String commenttime, HttpSession session){
        System.out.println(id+"==="+img+" === "+nikename+"===  "+commentcontent+" === "+commenttime);
        NewComment newComment=new NewComment();
        newComment.setCommenttime(commenttime);
        newComment.setCommentcontent(commentcontent);
        newComment.setNikename(nikename);
        newComment.setCommentimg(img);
        newComment.setCommentid(id);
        session.setAttribute("newComment",newComment);
        return "viewComment";
    }
}
