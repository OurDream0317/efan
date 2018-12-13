package com.qyxy.domain;

/**
 * Created by Administrator on 2018/9/7 0007.
 */
public class NewComment {
    private int commentid;

    private String commenttime;

    private String  commentimg;
private String phone;
    private String nikename;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNikename() {
        return nikename;
    }

    public void setNikename(String nikename) {
        this.nikename = nikename;
    }

    public String getCommentimg() {
        return commentimg;
    }

    public void setCommentimg(String commentimg) {
        this.commentimg = commentimg;
    }


    private String commentcontent;
    private int replys;


    public int getReplys() {
        return replys;
    }

    public void setReplys(int replys) {
        this.replys = replys;
    }

    public int getCommentid() {
        return commentid;
    }


    public void setCommentid(int commentid) {
        this.commentid = commentid;
    }


    public String  getCommenttime() {
        return commenttime;
    }


    public void setCommenttime(String commenttime) {
        this.commenttime = commenttime;
    }



    public String getCommentcontent() {
        return commentcontent;
    }


    public void setCommentcontent(String commentcontent) {
        this.commentcontent = commentcontent == null ? null : commentcontent.trim();
    }
    private User1 user1;
    private News news;

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
