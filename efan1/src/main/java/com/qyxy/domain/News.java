package com.qyxy.domain;

import java.util.List;
import java.util.List;

public class News {

    private Short newsid;


    private String newstitle;

    private String newstar;

    private String newstime;


    private Short newsrecomment;


    private Short newsshelf;


    private Short newsstatus;


    private Short readnumber;


    private Short clicknumber;


    private Short commentnumber;


    private String newscontent;

   private String newsimg;
    private String newsicon;
    private List<Comment> commentList;

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }
    private List<User1> user1List;

    public List<User1> getUser1List() {
        return user1List;
    }

    public void setUser1List(List<User1> user1List) {
        this.user1List = user1List;
    }

    public String getNewsimg() {
        return newsimg;
    }

    public void setNewsimg(String newsimg) {
        this.newsimg = newsimg;
    }

    public String getNewsicon() {
        return newsicon;
    }

    public void setNewsicon(String newsicon) {
        this.newsicon = newsicon;
    }

    public Short getNewsid() {
        return newsid;
    }


    public void setNewsid(Short newsid) {
        this.newsid = newsid;
    }


    public String getNewstitle() {
        return newstitle;
    }


    public void setNewstitle(String newstitle) {
        this.newstitle = newstitle == null ? null : newstitle.trim();
    }


    public String getNewstime() {
        return newstime;
    }


    public void setNewstime(String newstime) {
        this.newstime = newstime;
    }


    public Short getNewsrecomment() {
        return newsrecomment;
    }


    public void setNewsrecomment(Short newsrecomment) {
        this.newsrecomment = newsrecomment;
    }


    public Short getNewsshelf() {
        return newsshelf;
    }


    public void setNewsshelf(Short newsshelf) {
        this.newsshelf = newsshelf;
    }

    public Short getNewsstatus() {
        return newsstatus;
    }


    public void setNewsstatus(Short newsstatus) {
        this.newsstatus = newsstatus;
    }


    public Short getReadnumber() {
        return readnumber;
    }

    public void setReadnumber(Short readnumber) {
        this.readnumber = readnumber;
    }


    public Short getClicknumber() {
        return clicknumber;
    }


    public void setClicknumber(Short clicknumber) {
        this.clicknumber = clicknumber;
    }


    public Short getCommentnumber() {
        return commentnumber;
    }


    public void setCommentnumber(Short commentnumber) {
        this.commentnumber = commentnumber;
    }


    public String getNewscontent() {
        return newscontent;
    }


    public void setNewscontent(String newscontent) {
        this.newscontent = newscontent == null ? null : newscontent.trim();
    }
    public String getNewstar() {
        return newstar;
    }

    public void setNewstar(String newstar) {
        this.newstar = newstar;
    }
}