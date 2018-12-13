package com.qyxy.domain;

import java.util.Date;

public class Product {

    private Integer proid;
    private String proname;
    private Integer proprice;
    private Date protime;
    private Integer proshelf;
    private Integer prostatus;
    private String proicon;
    private Integer prosale;
    private Integer prostock;
    private String properson;
    private String prodetail;
    private String prostar;//关联明星

    public String getProstar() {
        return prostar;
    }

    public void setProstar(String prostar) {
        this.prostar = prostar;
    }

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname;
    }

    public Integer getProprice() {
        return proprice;
    }

    public void setProprice(Integer proprice) {
        this.proprice = proprice;
    }

    public Date getProtime() {
        return protime;
    }

    public void setProtime(Date protime) {
        this.protime = protime;
    }

    public Integer getProshelf() {
        return proshelf;
    }

    public void setProshelf(Integer proshelf) {
        this.proshelf = proshelf;
    }

    public Integer getProstatus() {
        return prostatus;
    }

    public void setProstatus(Integer prostatus) {
        this.prostatus = prostatus;
    }

    public String getProicon() {
        return proicon;
    }

    public void setProicon(String proicon) {
        this.proicon = proicon;
    }

    public Integer getProsale() {
        return prosale;
    }

    public void setProsale(Integer prosale) {
        this.prosale = prosale;
    }

    public Integer getProstock() {
        return prostock;
    }

    public void setProstock(Integer prostock) {
        this.prostock = prostock;
    }

    public String getProperson() {
        return properson;
    }

    public void setProperson(String properson) {
        this.properson = properson;
    }

    public String getProdetail() {
        return prodetail;
    }

    public void setProdetail(String prodetail) {
        this.prodetail = prodetail;
    }
}