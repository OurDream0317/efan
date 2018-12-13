package com.qyxy.domain;

import java.util.Date;

public class Comment {
    private Short commentid;
    private String commenttime;
    private int commentuserid;
    private Integer whereid;
    private Integer commenttyle;
    private Integer commentstatus;
   private int commentnewsid;
    private String commentcontent;
    private int replys;

    private User1 user1;
    private News news;


    public int getCommentnewsid() {
        return commentnewsid;
    }

    public void setCommentnewsid(int commentnewsid) {
        this.commentnewsid = commentnewsid;
    }



    public int getCommentuserid() {
        return commentuserid;
    }

    public void setCommentuserid(int commentuserid) {
        this.commentuserid = commentuserid;
    }

    public int getReplys() {
        return replys;
    }

    public void setReplys(int replys) {
        this.replys = replys;
    }

    public Short getCommentid() {
        return commentid;
    }


    public void setCommentid(Short commentid) {
        this.commentid = commentid;
    }


    public String  getCommenttime() {
        return commenttime;
    }


    public void setCommenttime(String commenttime) {
        this.commenttime = commenttime;
    }


    public Integer getWhereid() {
        return whereid;
    }


    public void setWhereid(Integer whereid) {
        this.whereid = whereid;
    }

    public Integer getCommenttyle() {
        return commenttyle;
    }

    public void setCommenttyle(Integer commenttyle) {
        this.commenttyle = commenttyle;
    }


    public Integer getCommentstatus() {
        return commentstatus;
    }


    public void setCommentstatus(Integer commentstatus) {
        this.commentstatus = commentstatus;
    }


    public String getCommentcontent() {
        return commentcontent;
    }


    public void setCommentcontent(String commentcontent) {
        this.commentcontent = commentcontent == null ? null : commentcontent.trim();
    }


    public User1 getUser1() {
        return user1;
    }

    public void setUser1(User1 user1) {
        this.user1 = user1;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }
}