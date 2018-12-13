package com.qyxy.domain;

public class Master {

    private Integer masterid;
    private Integer userid;
    private String mastername;
    private String masterphone;
    private String masteridnumber;
    private String mastericon1;
    private String mastericon2;
    private String masterimg;
    private String masterstar;
    private String masterremar;
    private Short masterstatus;
    public Integer getMasterid() {
        return masterid;
    }

    public void setMasterid(Integer masterid) {
        this.masterid = masterid;
    }


    public Integer getUserid() {
        return userid;
    }


    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getMastername() {
        return mastername;
    }


    public void setMastername(String mastername) {
        this.mastername = mastername == null ? null : mastername.trim();
    }

    public String getMasterphone() {
        return masterphone;
    }


    public void setMasterphone(String masterphone) {
        this.masterphone = masterphone == null ? null : masterphone.trim();
    }

    public String getMasteridnumber() {
        return masteridnumber;
    }

    public void setMasteridnumber(String masteridnumber) {
        this.masteridnumber = masteridnumber == null ? null : masteridnumber.trim();
    }

    public String getMastericon1() {
        return mastericon1;
    }


    public void setMastericon1(String mastericon1) {
        this.mastericon1 = mastericon1 == null ? null : mastericon1.trim();
    }


    public String getMastericon2() {
        return mastericon2;
    }

    public void setMastericon2(String mastericon2) {
        this.mastericon2 = mastericon2 == null ? null : mastericon2.trim();
    }

    public String getMasterimg() {
        return masterimg;
    }


    public void setMasterimg(String masterimg) {
        this.masterimg = masterimg == null ? null : masterimg.trim();
    }


    public String getMasterstar() {
        return masterstar;
    }


    public void setMasterstar(String masterstar) {
        this.masterstar = masterstar == null ? null : masterstar.trim();
    }


    public String getMasterremar() {
        return masterremar;
    }

    public void setMasterremar(String masterremar) {
        this.masterremar = masterremar == null ? null : masterremar.trim();
    }


    public Short getMasterstatus() {
        return masterstatus;
    }


    public void setMasterstatus(Short masterstatus) {
        this.masterstatus = masterstatus;
    }
}