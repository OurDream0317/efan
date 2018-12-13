package com.qyxy.domain;

public class Show {

    private int showid;


    private String showtitle;


    private String showperson;


    private String showaddtime;

    private Short auditstatus;


    private Short showrecommend;


    private Short showshelf;


    private Short showstatus;


    private String showaddress;

    private String showtime;


    private Short showprice1;


    private Short shownumber1;

    private Short showprice2;


    private Short shownumber2;


    private String showicon;

    private String showstar;


    private Short showsale;


    private String showdetail;
    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getShowid() {
        return showid;
    }


    public void setShowid(int showid) {
        this.showid = showid;
    }

    public String getShowtitle() {
        return showtitle;
    }


    public void setShowtitle(String showtitle) {
        this.showtitle = showtitle == null ? null : showtitle.trim();
    }


    public String getShowperson() {
        return showperson;
    }


    public void setShowperson(String showperson) {
        this.showperson = showperson == null ? null : showperson.trim();
    }


    public String getShowaddtime() {
        return showaddtime;
    }


    public void setShowaddtime(String showaddtime) {
        this.showaddtime = showaddtime;
    }


    public Short getAuditstatus() {
        return auditstatus;
    }


    public void setAuditstatus(Short auditstatus) {
        this.auditstatus = auditstatus;
    }


    public Short getShowrecommend() {
        return showrecommend;
    }


    public void setShowrecommend(Short showrecommend) {
        this.showrecommend = showrecommend;
    }


    public Short getShowshelf() {
        return showshelf;
    }


    public void setShowshelf(Short showshelf) {
        this.showshelf = showshelf;
    }


    public Short getShowstatus() {
        return showstatus;
    }


    public void setShowstatus(Short showstatus) {
        this.showstatus = showstatus;
    }


    public String getShowaddress() {
        return showaddress;
    }


    public void setShowaddress(String showaddress) {
        this.showaddress = showaddress == null ? null : showaddress.trim();
    }


    public String getShowtime() {
        return showtime;
    }


    public void setShowtime(String showtime) {
        this.showtime = showtime == null ? null : showtime.trim();
    }


    public Short getShowprice1() {
        return showprice1;
    }


    public void setShowprice1(Short showprice1) {
        this.showprice1 = showprice1;
    }


    public Short getShownumber1() {
        return shownumber1;
    }


    public void setShownumber1(Short shownumber1) {
        this.shownumber1 = shownumber1;
    }


    public Short getShowprice2() {
        return showprice2;
    }


    public void setShowprice2(Short showprice2) {
        this.showprice2 = showprice2;
    }


    public Short getShownumber2() {
        return shownumber2;
    }

    public void setShownumber2(Short shownumber2) {
        this.shownumber2 = shownumber2;
    }


    public String getShowicon() {
        return showicon;
    }


    public void setShowicon(String showicon) {
        this.showicon = showicon == null ? null : showicon.trim();
    }


    public String getShowstar() {
        return showstar;
    }


    public void setShowstar(String showstar) {
        this.showstar = showstar == null ? null : showstar.trim();
    }

    public Short getShowsale() {
        return showsale;
    }


    public void setShowsale(Short showsale) {
        this.showsale = showsale;
    }

    public String getShowdetail() {
        return showdetail;
    }


    public void setShowdetail(String showdetail) {
        this.showdetail = showdetail == null ? null : showdetail.trim();
    }
}