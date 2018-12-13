package com.qyxy.domain;

import java.util.Date;

public class Star {

    private String starid;

    private String starname;


    private Short starfans;


    private String startime;


    private Short starshelf;


    private Short starstatus;


    private String staricom;


    private String starimg;


    private String starintroduce;
   private int rank;

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public String getStarid() {
        return starid;
    }


    public void setStarid(String starid) {
        this.starid = starid == null ? null : starid.trim();
    }


    public String getStarname() {
        return starname;
    }


    public void setStarname(String starname) {
        this.starname = starname == null ? null : starname.trim();
    }


    public Short getStarfans() {
        return starfans;
    }


    public void setStarfans(Short starfans) {
        this.starfans = starfans;
    }


    public String  getStartime() {
        return startime;
    }


    public void setStartime(String startime) {
        this.startime = startime;
    }


    public Short getStarshelf() {
        return starshelf;
    }


    public void setStarshelf(Short starshelf) {
        this.starshelf = starshelf;
    }


    public Short getStarstatus() {
        return starstatus;
    }


    public void setStarstatus(Short starstatus) {
        this.starstatus = starstatus;
    }


    public String getStaricom() {
        return staricom;
    }

    public void setStaricom(String staricom) {
        this.staricom = staricom == null ? null : staricom.trim();
    }


    public String getStarimg() {
        return starimg;
    }


    public void setStarimg(String starimg) {
        this.starimg = starimg == null ? null : starimg.trim();
    }


    public String getStarintroduce() {
        return starintroduce;
    }


    public void setStarintroduce(String starintroduce) {
        this.starintroduce = starintroduce == null ? null : starintroduce.trim();
    }
}