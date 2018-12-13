package com.qyxy.domain;

import java.util.Date;

public class Slideshow {

    private Short slideid;


    private Short slidelocation;

    private Date solideaddtime;


    private String slideimg;


    private Short slideshelf;


    private Short slidestatus;

    public Short getIdentifier() {
        return identifier;
    }

    public void setIdentifier(Short identifier) {
        this.identifier = identifier;
    }

    private Short identifier;


    public Short getSlideid() {
        return slideid;
    }


    public void setSlideid(Short slideid) {
        this.slideid = slideid;
    }


    public Short getSlidelocation() {
        return slidelocation;
    }


    public void setSlidelocation(Short slidelocation) {
        this.slidelocation = slidelocation;
    }


    public Date getSolideaddtime() {
        return solideaddtime;
    }


    public void setSolideaddtime(Date solideaddtime) {
        this.solideaddtime = solideaddtime;
    }


    public String getSlideimg() {
        return slideimg;
    }


    public void setSlideimg(String slideimg) {
        this.slideimg = slideimg == null ? null : slideimg.trim();
    }


    public Short getSlideshelf() {
        return slideshelf;
    }


    public void setSlideshelf(Short slideshelf) {
        this.slideshelf = slideshelf;
    }


    public Short getSlidestatus() {
        return slidestatus;
    }


    public void setSlidestatus(Short slidestatus) {
        this.slidestatus = slidestatus;
    }
}