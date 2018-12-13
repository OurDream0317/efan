package com.qyxy.domain;

public class Cattle {

    private Integer cattleid;
    private String cattlename;
    private String cattlephone;
    private String cattlepassword;
    private Integer cattlenumber;
    private String cattlesalt;
    private Integer cattlestatus;
    public Integer getCattleid() {
        return cattleid;
    }
    public void setCattleid(Integer cattleid) {
        this.cattleid = cattleid;
    }
    public String getCattlename() {
        return cattlename;
    }
    public void setCattlename(String cattlename) {
        this.cattlename = cattlename == null ? null : cattlename.trim();
    }

    public String getCattlephone() {
        return cattlephone;
    }
    public void setCattlephone(String cattlephone) {
        this.cattlephone = cattlephone == null ? null : cattlephone.trim();
    }

    public String getCattlepassword() {
        return cattlepassword;
    }

    public void setCattlepassword(String cattlepassword) {
        this.cattlepassword = cattlepassword == null ? null : cattlepassword.trim();
    }


    public Integer getCattlenumber() {
        return cattlenumber;
    }


    public void setCattlenumber(Integer cattlenumber) {
        this.cattlenumber = cattlenumber;
    }


    public String getCattlesalt() {
        return cattlesalt;
    }

    public void setCattlesalt(String cattlesalt) {
        this.cattlesalt = cattlesalt == null ? null : cattlesalt.trim();
    }

    public Integer getCattlestatus() {
        return cattlestatus;
    }


    public void setCattlestatus(Integer cattlestatus) {
        this.cattlestatus = cattlestatus;
    }
}